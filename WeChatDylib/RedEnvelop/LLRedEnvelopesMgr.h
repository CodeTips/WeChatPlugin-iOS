//
//  LLRedEnvelopesMgr.h
//  test
//
//  Created by fqb on 2017/12/12.
//  Copyright © 2017年 kevliule. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>
#import <UIKit/UIKit.h>
#import "WCRedEnvelopesHelper.h"

@class POIInfo;

@interface LLRedEnvelopesMgr : NSObject

@property (nonatomic, assign) BOOL haveNewRedEnvelopes; //是否有新的红包
@property (nonatomic, assign) BOOL isHiddenRedEnvelopesReceiveView; //是否隐藏红包接受页面
@property (nonatomic, assign) BOOL isHongBaoPush; //是否是红包push
@property (nonatomic, assign) BOOL isOpenRedEnvelopesHelper; //是否开启红包助手
@property (nonatomic, assign) BOOL isOpenSportHelper; //是否开启步数助手
@property (nonatomic, assign) BOOL isOpenBackgroundMode; //是否开启后台模式
@property (nonatomic, assign) BOOL isOpenRedEnvelopesAlert; //是否开启红包提醒
@property (nonatomic, assign) BOOL isOpenVirtualLocation; //是否打开虚拟定位
@property (nonatomic, assign) BOOL isOpenAutoReply; //是否打开自动回复
@property (nonatomic, assign) BOOL isOpenAutoLeaveMessage; //是否打开自动留言
@property (nonatomic, assign) BOOL isOpenKeywordFilter; //是否打开关键字过滤
@property (nonatomic, assign) BOOL isSnatchSelfRedEnvelopes; //是否抢自己的发的红包
@property (nonatomic, assign) BOOL isOpenAvoidRevokeMessage; //是否打开防止好友撤回消息
@property (nonatomic, assign) BOOL sportStepCountMode; //运动步数模式 true: 范围随机 false:固定步数
@property (nonatomic, assign) NSInteger sportStepCountUpperLimit; //运动步数上限
@property (nonatomic, assign) NSInteger sportStepCountLowerLimit; //运动步数下限
@property (nonatomic, copy)   NSString *keywordFilterText; //要过滤的关键字
@property (nonatomic, copy)   NSString *autoReplyText; //自动回复内容
@property (nonatomic, copy)   NSString *autoLeaveMessageText; //自动留言内容 
@property (nonatomic, assign) CGFloat openRedEnvelopesDelaySecond; //打开红包延迟时间
@property (nonatomic, assign) NSInteger wantSportStepCount; //想要的运动步数
@property (nonatomic, assign) UIBackgroundTaskIdentifier bgTaskIdentifier; //后台任务标识符
@property (nonatomic, strong) NSTimer *bgTaskTimer; //后台任务定时器
@property (nonatomic, strong) AVAudioPlayer *blankPlayer; //无声音频播放器
@property (nonatomic, strong) CMessageWrap *lastMsgWrap; //上一个消息model
@property (nonatomic, strong) CMessageWrap *msgWrap; //当前的消息model
@property (nonatomic, strong) BaseMsgContentLogicController *logicController;
@property (nonatomic, strong) NSMutableDictionary *filterRoomDic; //过滤群组字典
@property (nonatomic, strong) POIInfo *virtualLocation; //虚拟位置POIInfo

@property (nonatomic, copy) void(^openRedEnvelopesBlock)(void); //打开红包block

+ (LLRedEnvelopesMgr *)shared;

- (void)reset;

//保存用户设置
- (void)saveUserSetting;

//处理微信消息,过滤红包消息
- (void)handleMessageWithMessageWrap:(CMessageWrap *)msgWrap isBackground:(BOOL)isBackground;

//判断是否是我发送的消息
- (BOOL)isMySendMsgWithMsgWrap:(CMessageWrap *)msgWrap;

//判断是否抢红包
- (BOOL)isSnatchRedEnvelopes:(CMessageWrap *)msgWrap;

- (void)openRedEnvelopes:(NewMainFrameViewController *)mainVC;

- (void)handleRedEnvelopesPushVC:(BaseMsgContentViewController *)baseMsgVC;

- (void)successOpenRedEnvelopesNotification;

//程序进入后台处理
- (void)enterBackgroundHandler;

//保存虚拟位置POIInfo
- (void)saveVirtualLocation:(POIInfo *)virtualLocation;
//获取虚拟位置
- (CLLocation *)getVirutalLocationWithRealLocation:(CLLocation *)realLocation;

//处理运动步数
- (long)getSportStepCount;
- (void)openAvoidRevokeMessageSwitchHandler:(UISwitch *)openSwitch;
@end
