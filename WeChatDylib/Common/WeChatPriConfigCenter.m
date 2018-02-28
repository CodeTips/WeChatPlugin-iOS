//
//  WeChatPriConfigCenter.m
//  WeChatPri
//
//  Created by Lorwy on 2017/8/4.
//  Copyright © 2017年 Lorwy. All rights reserved.
//

#import "WeChatPriConfigCenter.h"


@implementation WeChatPriConfigCenter

LSERIALIZE_CODER_DECODER()

+ (instancetype)sharedInstance
{
    static dispatch_once_t onceToken;
    static WeChatPriConfigCenter *instance;
    dispatch_once(&onceToken, ^{
        instance = [WeChatPriConfigCenter new];
    });
    return instance;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.chatIgnoreInfo = [NSMutableDictionary dictionary];
        self.customLocationArray = [NSMutableArray array];
    }
    return self;
}

- (NSMutableArray *)customLocationArray {
    if (!_customLocationArray) {
        _customLocationArray = [NSMutableArray array];
    }
    return _customLocationArray;
}

+ (void)saveConfigCenter {
    NSData *centerData = [NSKeyedArchiver archivedDataWithRootObject:[WeChatPriConfigCenter sharedInstance]];
    [[NSUserDefaults standardUserDefaults] setObject:centerData forKey:WeChatPriConfigCenterKey];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

+ (void)loadInstance:(WeChatPriConfigCenter *)instance {
    WeChatPriConfigCenter *center = [self sharedInstance];
    center.nightMode = instance.isNightMode;
    center.stepCount = instance.stepCount;
    center.stepAutoLike = instance.isStepAutoLike;
    center.showMsgInWebPage = instance.isShowMsgInWebPage;
    center.autoUpvote = instance.autoUpvote;
    center.chatIgnoreInfo = instance.chatIgnoreInfo;
    center.currentUserName = instance.currentUserName;
    center.lastChangeStepCountDate = instance.lastChangeStepCountDate;
    center.customLocation = instance.customLocation;
    center.customLocationArray = instance.customLocationArray;
    center.customStep = instance.customStep;
    center.customLat = instance.customLat;
    center.customLng = instance.customLng;
}

#pragma mark - Handle Events

- (void)handleNightMode:(UISwitch *)sender
{
    self.nightMode = sender.isOn;
    [[self viewControllerOfResponder:sender] viewWillAppear:NO];
}

- (void)handleStepAutoLike:(UISwitch *)sender {
    self.stepAutoLike = sender.isOn;
}

- (void)handleShowMsgInWebPage:(UISwitch *)sender {
    self.showMsgInWebPage = sender.isOn;
}

- (void)handleAutoUpvote:(UISwitch *)sender
{
    self.autoUpvote = sender.isOn;
}

- (void)handleStepCount:(UITextField *)sender
{
    self.stepCount = (unsigned int)sender.text.integerValue;
    self.lastChangeStepCountDate = [NSDate date];
}

- (void)handleIgnoreChatRoom:(UISwitch *)sender
{
    self.chatIgnoreInfo[self.currentUserName] = @(sender.isOn);
}

- (void)handleCustomLat:(UITextField *)sender {
    self.customLat = sender.text;
}

- (void)handleCustomLng:(UITextField *)sender {
    self.customLng = sender.text;
}

- (UIViewController *)viewControllerOfResponder:(UIResponder *)responder
{
    UIResponder *current = responder;
    while (current && ![current isKindOfClass:UIViewController.class]) {
        current = [current nextResponder];
    }
    return (UIViewController *)current;
}

@end
