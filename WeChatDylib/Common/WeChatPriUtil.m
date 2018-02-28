//
//  WeChatPriUtil.m
//  WeChatPri
//
//  Created by Lorwy on 2017/8/4.
//  Copyright © 2017年 Lorwy. All rights reserved.
//

#import "WeChatPriUtil.h"
#import "WeChatPriConfigCenter.h"
#import "WeChatRedEnvelop.h"


@implementation WeChatPriUtil

+ (NSMutableArray * )filtMessageWrapArr:(NSMutableArray *)msgList
{
    NSMutableArray *msgListResult = [msgList mutableCopy];
    for (id msgWrap in msgList) {
        Ivar nsFromUsrIvar = class_getInstanceVariable(objc_getClass("CMessageWrap"), "m_nsFromUsr");
        NSString *m_nsFromUsr = object_getIvar(msgWrap, nsFromUsrIvar);
        if ([WeChatPriConfigCenter sharedInstance].chatIgnoreInfo[m_nsFromUsr].boolValue) {
            [msgListResult removeObject:msgWrap];
        }
    }
    return msgListResult;
}

+ (BOOL)compareColor:(UIColor *)color1 color2:(UIColor *)color2
{
    if (color1 == color2) {
        return YES;
    }
    CGFloat red1, red2, green1, green2, blue1, blue2;
    [color1 getRed:&red1 green:&green1 blue:&blue1 alpha:nil];
    [color2 getRed:&red2 green:&green2 blue:&blue2 alpha:nil];
    if (fabs(red1-red2)<0.1 && fabs(green1-green2)<0.1 && fabs(blue1-blue2)<0.1) {
        return YES;
    }
    return NO;
}

+ (void)updateColorOfView:(UIView *)view
{
    if ([view isKindOfClass:UILabel.class]) {
        UILabel *label = (UILabel *)view;
        [label setBackgroundColor:[UIColor clearColor]];
        label.textColor = nightTextColor;
        label.tintColor = nightTextColor;
    }
    else if ([view isKindOfClass:UIButton.class]) {
        UIButton *button = (UIButton *)view;
        button.tintColor = nightTextColor;
    }
    else {
        [view setBackgroundColor:[UIColor clearColor]];
        for (UIView *subview in view.subviews) {
            [WeChatPriUtil updateColorOfView:subview];
        }
    }
}

+ (UIView *)findSubView:(Class)targetViewClass fromView:(UIView *)superView {
    UIView *view = nil;
    for (UIView *subv in superView.subviews) {
        if([subv isKindOfClass:targetViewClass]) {
            view = subv;
        }
        else {
            view = [[self class] findSubView:targetViewClass fromView:subv];
        }
    }
    return view;
}

+ (CMessageWrap *)setDice:(CMessageWrap *)wrap point:(unsigned int) point {
    if (wrap.m_uiGameType == 2) {
        wrap.m_uiGameContent = point + 3;
    }
    return wrap;
}

+ (CMessageWrap *)setRPS:(CMessageWrap *)wrap type:(unsigned int) type {
    if (wrap.m_uiGameType == 1) {
        wrap.m_uiGameContent = type;
    }
    return wrap;
}

@end

