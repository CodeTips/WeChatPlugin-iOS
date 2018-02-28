//
//  LLRedEnvelopesMgr.m
//  test
//
//  Created by fqb on 2017/12/12.
//  Copyright © 2017年 kevliule. All rights reserved.
//

#import "LLRedEnvelopesMgr.h"

#define kArchiverLocationFilePath [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0] stringByAppendingPathComponent:@"LLVirutalLocationPOIInfomation"]

static NSString * const isOpenRedEnvelopesHelperKey = @"isOpenRedEnvelopesHelperKey";
static NSString * const isOpenSportHelperKey = @"isOpenSportHelperKey";
static NSString * const isOpenBackgroundModeKey = @"isOpenBackgroundModeKey";
static NSString * const isOpenRedEnvelopesAlertKey = @"isOpenRedEnvelopesAlertKey";
static NSString * const isOpenVirtualLocationKey = @"isOpenVirtualLocationKey";
static NSString * const isOpenAutoReplyKey = @"isOpenAutoReplyKey";
static NSString * const isOpenAutoLeaveMessageKey = @"isOpenAutoLeaveMessageKey";
static NSString * const isOpenKeywordFilterKey = @"isOpenKeywordFilterKey";
static NSString * const isSnatchSelfRedEnvelopesKey = @"isSnatchSelfRedEnvelopesKey";
static NSString * const isOpenAvoidRevokeMessageKey = @"isOpenAvoidRevokeMessageKey";
static NSString * const sportStepCountModeKey = @"sportStepCountModeKey";
static NSString * const sportStepCountUpperLimitKey = @"sportStepCountUpperLimitKey";
static NSString * const sportStepCountLowerLimitkey = @"sportStepCountLowerLimitkey";
static NSString * const keywordFilterTextKey = @"keywordFilterTextKey";
static NSString * const autoReplyTextKey = @"autoReplyTextKey";
static NSString * const autoLeaveMessageTextKey = @"autoLeaveMessageTextKey";
static NSString * const openRedEnvelopesDelaySecondKey = @"openRedEnvelopesDelaySecondKey";
static NSString * const wantSportStepCountKey = @"wantSportStepCountKey"; 
static NSString * const filterRoomDicKey = @"filterRoomDicKey";

@implementation LLRedEnvelopesMgr

+ (LLRedEnvelopesMgr *)shared{
    static LLRedEnvelopesMgr *manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[LLRedEnvelopesMgr alloc] init];
    });
    return manager;
}

- (id)init{
    if(self = [super init]){
        NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
        _isOpenRedEnvelopesHelper = [userDefaults boolForKey:isOpenRedEnvelopesHelperKey];
        _isOpenSportHelper = [userDefaults boolForKey:isOpenSportHelperKey];
        _isOpenBackgroundMode = [userDefaults boolForKey:isOpenBackgroundModeKey];
        _isOpenRedEnvelopesAlert = [userDefaults boolForKey:isOpenRedEnvelopesAlertKey];
        _isOpenVirtualLocation = [userDefaults boolForKey:isOpenVirtualLocationKey];
        _isOpenAutoReply = [userDefaults boolForKey:isOpenAutoReplyKey];
        _isOpenAutoLeaveMessage = [userDefaults boolForKey:isOpenAutoLeaveMessageKey];
        _isOpenKeywordFilter = [userDefaults boolForKey:isOpenKeywordFilterKey];
        _isSnatchSelfRedEnvelopes = [userDefaults boolForKey:isSnatchSelfRedEnvelopesKey];
        _isOpenAvoidRevokeMessage = [userDefaults boolForKey:isOpenAvoidRevokeMessageKey];
        _sportStepCountMode = [userDefaults boolForKey:sportStepCountModeKey];
        _sportStepCountUpperLimit = [userDefaults integerForKey:sportStepCountUpperLimitKey];
        _sportStepCountLowerLimit = [userDefaults integerForKey:sportStepCountLowerLimitkey];
        _keywordFilterText = [userDefaults objectForKey:keywordFilterTextKey];
        _autoReplyText = [userDefaults objectForKey:autoReplyTextKey];
        _autoLeaveMessageText = [userDefaults objectForKey:autoLeaveMessageTextKey];
        _openRedEnvelopesDelaySecond = [userDefaults floatForKey:openRedEnvelopesDelaySecondKey];
        _wantSportStepCount = [userDefaults integerForKey:wantSportStepCountKey];
        _filterRoomDic = [userDefaults objectForKey:filterRoomDicKey];

        NSData *data = [NSData dataWithContentsOfFile:kArchiverLocationFilePath];
        if(data){
            @try{
                self.virtualLocation = [NSKeyedUnarchiver unarchiveObjectWithData:data];
            }  @catch (NSException *exception) {
                return self;
            }
        }
    }
    return self;
}

- (void)reset{
    _haveNewRedEnvelopes = NO;
    _isHiddenRedEnvelopesReceiveView = NO;
    _isHongBaoPush = NO;
}

#pragma mark SET GET METHOD

- (void)setHaveNewRedEnvelopes:(BOOL)haveNewRedEnvelopes{
    _haveNewRedEnvelopes = haveNewRedEnvelopes;
}

- (void)setIsHongBaoPush:(BOOL)isHongBaoPush{
    _isHongBaoPush = isHongBaoPush;
}

- (void)setIsHiddenRedEnvelopesReceiveView:(BOOL)isHiddenRedEnvelopesReceiveView{
    _isHiddenRedEnvelopesReceiveView = isHiddenRedEnvelopesReceiveView;
}

- (void)setBgTaskIdentifier:(UIBackgroundTaskIdentifier)bgTaskIdentifier{
    _bgTaskIdentifier = bgTaskIdentifier;
}

- (void)setBgTaskTimer:(NSTimer *)bgTaskTimer{
    _bgTaskTimer = bgTaskTimer;
}

- (void)setOpenRedEnvelopesBlock:(void (^)(void))openRedEnvelopesBlock{
    _openRedEnvelopesBlock = [openRedEnvelopesBlock copy];
}

//保存用户设置
- (void)saveUserSetting{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setBool:_isOpenRedEnvelopesHelper forKey:isOpenRedEnvelopesHelperKey];
    [userDefaults setBool:_isOpenSportHelper forKey:isOpenSportHelperKey];
    [userDefaults setBool:_isOpenBackgroundMode forKey:isOpenBackgroundModeKey];
    [userDefaults setBool:_isOpenRedEnvelopesAlert forKey:isOpenRedEnvelopesAlertKey];
    [userDefaults setBool:_isOpenVirtualLocation forKey:isOpenVirtualLocationKey];
    [userDefaults setBool:_isOpenAutoReply forKey:isOpenAutoReplyKey];
    [userDefaults setBool:_isOpenAutoLeaveMessage forKey:isOpenAutoLeaveMessageKey];
    [userDefaults setBool:_isOpenKeywordFilter forKey:isOpenKeywordFilterKey];
    [userDefaults setBool:_isSnatchSelfRedEnvelopes forKey:isSnatchSelfRedEnvelopesKey];
    [userDefaults setBool:_sportStepCountMode forKey:sportStepCountModeKey];
    [userDefaults setInteger:_sportStepCountUpperLimit forKey:sportStepCountUpperLimitKey];
    [userDefaults setInteger:_sportStepCountLowerLimit forKey:sportStepCountLowerLimitkey];
    [userDefaults setObject:_keywordFilterText forKey:keywordFilterTextKey];
    [userDefaults setObject:_autoReplyText forKey:autoReplyTextKey];
    [userDefaults setObject:_autoLeaveMessageText forKey:autoLeaveMessageTextKey];
    [userDefaults setFloat:_openRedEnvelopesDelaySecond forKey:openRedEnvelopesDelaySecondKey];
    [userDefaults setInteger:_wantSportStepCount forKey:wantSportStepCountKey];
    [userDefaults setObject:_filterRoomDic forKey:filterRoomDicKey];
    [userDefaults synchronize];
}

- (void)openAvoidRevokeMessageSwitchHandler:(UISwitch *)openSwitch
{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    _isOpenAvoidRevokeMessage = openSwitch.on;
    [userDefaults setBool:_isOpenAvoidRevokeMessage forKey:isOpenAvoidRevokeMessageKey];
    [userDefaults synchronize];
}
/*
- (void)setIsOpenRedEnvelopesHelper:(BOOL)isOpenRedEnvelopesHelper{
    _isOpenRedEnvelopesHelper = isOpenRedEnvelopesHelper;
}

- (void)setIsOpenSportHelper:(BOOL)isOpenSportHelper{
    _isOpenSportHelper = isOpenSportHelper;
}

- (void)setIsOpenBackgroundMode:(BOOL)isOpenBackgroundMode{
    _isOpenBackgroundMode = isOpenBackgroundMode;
}

- (void)setIsOpenRedEnvelopesAlert:(BOOL)isOpenRedEnvelopesAlert{
    _isOpenRedEnvelopesAlert = isOpenRedEnvelopesAlert;
}

- (void)setIsOpenVirtualLocation:(BOOL)isOpenVirtualLocation{
    _isOpenVirtualLocation = isOpenVirtualLocation;
}

- (void)setIsOpenAutoReply:(BOOL)isOpenAutoReply{
    _isOpenAutoReply = isOpenAutoReply;
}

- (void)setIsOpenAutoLeaveMessage:(BOOL)isOpenAutoLeaveMessage{
    _isOpenAutoLeaveMessage = isOpenAutoLeaveMessage;
}

- (void)setAutoReplyText:(NSString *)autoReplyText{
    _autoReplyText = [autoReplyText copy];
}

- (void)setAutoLeaveMessageText:(NSString *)autoLeaveMessageText{
    _autoLeaveMessageText = [autoLeaveMessageText copy];
}

- (void)setOpenRedEnvelopesDelaySecond:(CGFloat)openRedEnvelopesDelaySecond{
    _openRedEnvelopesDelaySecond = openRedEnvelopesDelaySecond;
}

- (void)setWantSportStepCount:(NSInteger)wantSportStepCount{
    _wantSportStepCount = wantSportStepCount;
}

- (void)setFilterRoomDic:(NSMutableDictionary *)filterRoomDic{
    _filterRoomDic = filterRoomDic;
}

- (void)setVirtualLocation:(POIInfo *)virtualLocation{
    _virtualLocation = [virtualLocation retain];
}
*/

//处理微信消息,过滤红包消息
- (void)handleMessageWithMessageWrap:(CMessageWrap *)msgWrap isBackground:(BOOL)isBackground{
    if (msgWrap && msgWrap.m_uiMessageType == 49 && [self isSnatchRedEnvelopes:msgWrap]){
        //红包消息
        self.lastMsgWrap = self.msgWrap;
        self.msgWrap = msgWrap;
        self.haveNewRedEnvelopes = YES;
        if(isBackground && self.openRedEnvelopesBlock){
            self.openRedEnvelopesBlock();
        }
    }
}

//判断是否是我发送的消息
- (BOOL)isMySendMsgWithMsgWrap:(CMessageWrap *)msgWrap{
    CContactMgr *contactMgr = [[NSClassFromString(@"MMServiceCenter") defaultCenter] getService:NSClassFromString(@"CContactMgr")];
    CContact *selfContact = [contactMgr getSelfContact];
    CContact *senderContact = [contactMgr getContactByName:msgWrap.m_nsFromUsr];
    return [selfContact isEqualToContact:senderContact];
}

//判断是否抢红包
- (BOOL)isSnatchRedEnvelopes:(CMessageWrap *)msgWrap{
    unsigned int appMsgInnerType = msgWrap.m_uiAppMsgInnerType;
    if(appMsgInnerType == 0x1 || appMsgInnerType == 0xa){
        return NO;
    }
    if(!(appMsgInnerType != 0x7d0 || msgWrap.m_oWCPayInfoItem.m_uiPaySubType >= 0xb)){
        return NO;
    }
    if(appMsgInnerType != 0x7d1 || msgWrap.m_oWCPayInfoItem.m_sceneId != 0x3ea){
        return NO;
    }
    if(!((msgWrap.m_n64MesSvrID == 0 && msgWrap.m_oWCPayInfoItem.m_nsPayMsgID != self.lastMsgWrap.m_oWCPayInfoItem.m_nsPayMsgID) || msgWrap.m_n64MesSvrID != self.lastMsgWrap.m_n64MesSvrID)){
        return NO; //过滤领取红包消息
    }
    if([self isMySendMsgWithMsgWrap:msgWrap]){
        return _isSnatchSelfRedEnvelopes;
    }
    if(_filterRoomDic && _filterRoomDic[msgWrap.m_nsFromUsr]){
        return NO; //过滤群组
    }
    if(_isOpenKeywordFilter){
        NSString *wishing = [msgWrap wishingString];
        NSArray *keywords = [_keywordFilterText componentsSeparatedByString:@","];
        for (NSString *keyword in keywords) {
            if ([wishing containsString:keyword]) {
                return NO; //过滤关键字
            }
        }
    }
    return YES;
}

#pragma mark HANDLER METHOD

- (void)openRedEnvelopes:(NewMainFrameViewController *)mainVC{
    NSArray *controllers = mainVC.navigationController.viewControllers;
    UIViewController *msgContentVC = nil;
    for (UIViewController *aController in controllers) {
        if ([aController isMemberOfClass:NSClassFromString(@"BaseMsgContentViewController")]) {
            msgContentVC = aController;
            break;
        }
    }
    if (msgContentVC) {
        [mainVC.navigationController PushViewController:msgContentVC animated:YES];
    } else {
        [mainVC tableView:[mainVC valueForKey:@"m_tableView"] didSelectRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:1]];
    }
}

- (void)handleRedEnvelopesPushVC:(BaseMsgContentViewController *)baseMsgVC{
    //红包push
    if(![[self.msgWrap nativeUrl] containsString:@"weixin://openNativeUrl/weixinHB/startreceivebizhbrequest?"]){
        CContactMgr *contactMgr = [[NSClassFromString(@"MMServiceCenter") defaultCenter] getService:NSClassFromString(@"CContactMgr")];
        CContact *fromContact = [contactMgr getContactByName:self.msgWrap.m_nsFromUsr];
        BOOL isMySendMsg = [self isMySendMsgWithMsgWrap:self.msgWrap];
        if(!isMySendMsg && ![[baseMsgVC getChatContact] isEqualToContact:fromContact]){
            BaseMsgContentLogicController *logicController = [[NSClassFromString(@"BaseMsgContentLogicController") alloc] initWithLocalID:self.msgWrap.m_uiMesLocalID CreateTime:self.msgWrap.m_uiCreateTime ContentViewDisshowStatus:0x4];
            [logicController setM_contact:fromContact];
            [logicController setM_dicExtraInfo:nil];
            [logicController onWillEnterRoom];
            self.logicController = logicController;
            baseMsgVC = [logicController getMsgContentViewController];
        } else {
            self.logicController = nil;
        }
        WCRedEnvelopesControlData *data = [[NSClassFromString(@"WCRedEnvelopesControlData") alloc] init];
        [data setM_oSelectedMessageWrap:self.msgWrap];
        WCRedEnvelopesControlMgr *controlMgr = [[NSClassFromString(@"MMServiceCenter") defaultCenter] getService:NSClassFromString(@"WCRedEnvelopesControlMgr")];
        self.isHiddenRedEnvelopesReceiveView = YES;
        [controlMgr startReceiveRedEnvelopesLogic:baseMsgVC Data:data];
    }
}

- (void)successOpenRedEnvelopesNotification{
    if(self.isOpenRedEnvelopesAlert){
        UILocalNotification *localNotification = [[UILocalNotification alloc] init];
        localNotification.alertBody = @"帮您领了一个大红包！快去查看吧~";
        localNotification.soundName = UILocalNotificationDefaultSoundName;
        [[UIApplication sharedApplication] presentLocalNotificationNow:localNotification];
        [self playCashReceivedAudio];
    }
}

//程序进入后台处理
- (void)enterBackgroundHandler{
    if(!self.isOpenBackgroundMode){
        return;
    }
    UIApplication *app = [UIApplication sharedApplication];
    self.bgTaskIdentifier = [app beginBackgroundTaskWithExpirationHandler:^{
        [app endBackgroundTask:self.bgTaskIdentifier];
        self.bgTaskIdentifier = UIBackgroundTaskInvalid;
    }];
    self.bgTaskTimer = [NSTimer scheduledTimerWithTimeInterval:10.0 target:self selector:@selector(requestMoreTime) userInfo:nil repeats:YES];
    [self.bgTaskTimer fire];
}

- (void)requestMoreTime{
    if ([UIApplication sharedApplication].backgroundTimeRemaining < 30) {
    	[self playBlankAudio];
        [[UIApplication sharedApplication] endBackgroundTask:self.bgTaskIdentifier];
        self.bgTaskIdentifier = [[UIApplication sharedApplication] beginBackgroundTaskWithExpirationHandler:^{
            [[UIApplication sharedApplication] endBackgroundTask:self.bgTaskIdentifier];
            self.bgTaskIdentifier = UIBackgroundTaskInvalid;
        }];
    }
}

//播放收到红包音频
- (void)playCashReceivedAudio{
    [self playAudioForResource:@"cash_received" ofType:@"caf"];
}

//播放无声音频
- (void)playBlankAudio{
    [self playAudioForResource:@"blank" ofType:@"caf"];
}

//开始播放音频
- (void)playAudioForResource:(NSString *)resource ofType:(NSString *)ofType{
    NSError *setCategoryErr = nil;
    NSError *activationErr  = nil;
    [[AVAudioSession sharedInstance]
     setCategory: AVAudioSessionCategoryPlayback
     withOptions: AVAudioSessionCategoryOptionMixWithOthers
     error: &setCategoryErr];
    [[AVAudioSession sharedInstance]
     setActive: YES
     error: &activationErr];
    NSURL *blankSoundURL = [[NSURL alloc]initWithString:[[NSBundle mainBundle] pathForResource:resource ofType:ofType]];
    if(blankSoundURL){
        self.blankPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:blankSoundURL error:nil];
        [self.blankPlayer play];
    }
}

//保存虚拟位置POIInfo
- (void)saveVirtualLocation:(POIInfo *)virtualLocation{
    self.virtualLocation = virtualLocation;
    if ([[NSFileManager defaultManager] fileExistsAtPath:kArchiverLocationFilePath]) {
        NSError *error = nil;
        [[NSFileManager defaultManager] removeItemAtPath:kArchiverLocationFilePath error:&error];
        if (error) {
            //[self showMessage:[NSString stringWithFormat:@"%@",error] completion:nil];
            return;
        }
    }
    NSData *data = [NSKeyedArchiver archivedDataWithRootObject:virtualLocation];
    if(data){
        [data writeToFile:kArchiverLocationFilePath atomically:YES];
    }
}

//获取虚拟位置
- (CLLocation *)getVirutalLocationWithRealLocation:(CLLocation *)realLocation{
    return _virtualLocation ? [[CLLocation alloc] initWithCoordinate:_virtualLocation.coordinate altitude:realLocation.altitude horizontalAccuracy: realLocation.horizontalAccuracy verticalAccuracy:realLocation.verticalAccuracy course:realLocation.course speed:realLocation.speed timestamp:realLocation.timestamp] : realLocation;
}

//处理运动步数
- (long)getSportStepCount{
    if(_sportStepCountMode){
        return [self genRandomNumberFrom:_sportStepCountUpperLimit to:_sportStepCountLowerLimit];
    } else {
        return _wantSportStepCount;
    }
}

//在指定范围生成随机数
- (long)genRandomNumberFrom:(long)from to:(long)to{  
    return (long)(from + (arc4random() % (to - from + 1)));  
}  

@end
