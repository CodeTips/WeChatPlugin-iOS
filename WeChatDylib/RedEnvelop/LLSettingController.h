//
//  LLSettingController.h
//  test
//
//  Created by fqb on 2017/12/15.
//  Copyright © 2017年 kevliule. All rights reserved.
//

#import <UIKit/UIKit.h>

@class POIInfo;

@interface LLSettingParam : NSObject

@property (nonatomic, assign) BOOL isOpenRedEnvelopesHelper; //是否开启红包助手
@property (nonatomic, assign) BOOL isOpenSportHelper; //是否开启步数助手
@property (nonatomic, assign) BOOL isOpenBackgroundMode; //是否开启后台模式
@property (nonatomic, assign) BOOL isOpenRedEnvelopesAlert; //是否打卡红包提醒
@property (nonatomic, assign) BOOL isOpenAutoReply; //是否打开自动回复
@property (nonatomic, assign) BOOL isOpenAutoLeaveMessage; //是否打开自动留言
@property (nonatomic, assign) BOOL isOpenKeywordFilter; //是否打开关键字过滤
@property (nonatomic, assign) BOOL isSnatchSelfRedEnvelopes; //是否抢自己的发的红包
@property (nonatomic, copy)   NSString *keywordFilterText; //要过滤的关键字
@property (nonatomic, copy)   NSString *autoReplyText; //自动回复内容
@property (nonatomic, copy)   NSString *autoLeaveMessageText; //自动留言内容
@property (nonatomic, assign) CGFloat openRedEnvelopesDelaySecond; //打开红包延迟时间
@property (nonatomic, strong) NSMutableDictionary *filterRoomDic; //过滤群组字典

@end

@interface LLSettingController : UIViewController

@end
