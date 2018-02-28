//
//  WeChatNewsMsgManager.h
//  WeChatPri
//
//  Created by Lorwy on 2017/8/28.
//  Copyright © 2017年 Lorwy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface WeChatNewsMsgManager : NSObject

@property (nonatomic,strong) NSString *username;
@property (nonatomic,strong) NSString *content;
@property (nonatomic,strong) NSString *fromUserName;
@property (nonatomic,strong) NSArray *webViewViewControllers;

+ (instancetype)sharedInstance;

+ (void)receiveNewMsg:(NSString *)userName
              content:(NSString *)content
         fromUserName:(NSString *)fromUserName;

+ (UIButton *)showHUDInView:(UIView *) superView
                 text:(NSString *)text
               target:(id)target
               action:(SEL)action;

+ (BOOL)showed;

@end
