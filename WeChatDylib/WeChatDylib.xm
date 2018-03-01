// See http://iphonedevwiki.net/index.php/Logos

#import "WCRedEnvelopesHelper.h"
#import "LLRedEnvelopesMgr.h"
#import "LLSettingController.h"
#import "WCRedEnvelopesHelper.h"
#import "RemoteControlManager.h"
#import <AVFoundation/AVFoundation.h>
#import <UIKit/UIKit.h>
%hook WCDeviceStepObject

- (unsigned long)m7StepCount{
    if([LLRedEnvelopesMgr shared].isOpenSportHelper){
        return [[LLRedEnvelopesMgr shared] getSportStepCount]; // max value is 98800
    } else {
        return %orig;
    }
}

%end

%hook UINavigationController

- (void)PushViewController:(UIViewController *)controller animated:(BOOL)animated{
    if ([LLRedEnvelopesMgr shared].isOpenRedEnvelopesHelper && [LLRedEnvelopesMgr shared].isHongBaoPush && [controller isMemberOfClass:NSClassFromString(@"BaseMsgContentViewController")]) {
        [LLRedEnvelopesMgr shared].isHongBaoPush = NO;
        [[LLRedEnvelopesMgr shared] handleRedEnvelopesPushVC:(BaseMsgContentViewController *)controller];
    } else {
        %orig;
    }
}

%end

%hook UIViewController

- (void)presentViewController:(UIViewController *)viewControllerToPresent animated:(BOOL)flag completion:(void (^)(void))completion{
    LLRedEnvelopesMgr *manager = [LLRedEnvelopesMgr shared];
    if (manager.isOpenRedEnvelopesHelper && manager.isHiddenRedEnvelopesReceiveView && [viewControllerToPresent isKindOfClass:NSClassFromString(@"MMUINavigationController")]){
        manager.isHiddenRedEnvelopesReceiveView = NO;
        UINavigationController *navController = (UINavigationController *)viewControllerToPresent;
        if (navController.viewControllers.count > 0){
            if ([navController.viewControllers[0] isKindOfClass:NSClassFromString(@"WCRedEnvelopesRedEnvelopesDetailViewController")]){
                //模态红包详情视图
                if([manager isMySendMsgWithMsgWrap:manager.msgWrap]){
                    //领取的是自己发的红包,不自动回复和自动留言
                    return;
                }
                if(manager.isOpenAutoReply && [self isMemberOfClass:%c(BaseMsgContentViewController)]){
                    BaseMsgContentViewController *baseMsgVC = (BaseMsgContentViewController *)self;
                    [baseMsgVC AsyncSendMessage:manager.autoReplyText];
                }
                if(manager.isOpenAutoLeaveMessage){
                    WCRedEnvelopesReceiveControlLogic *redEnvelopeLogic = MSHookIvar<WCRedEnvelopesReceiveControlLogic *>(navController.viewControllers[0],"m_delegate");
                    [redEnvelopeLogic OnCommitWCRedEnvelopes:manager.autoLeaveMessageText];
                }
                return;
            }
        }
    }
    %orig;
}

%end

%hook CMessageMgr

- (void)MainThreadNotifyToExt:(NSDictionary *)ext{
    %orig;
    if([LLRedEnvelopesMgr shared].isOpenRedEnvelopesHelper){
        CMessageWrap *msgWrap = ext[@"3"];
        [[LLRedEnvelopesMgr shared] handleMessageWithMessageWrap:msgWrap isBackground:NO];
    }
}

- (void)onNewSyncShowPush:(NSDictionary *)message{
    %orig;
    if ([LLRedEnvelopesMgr shared].isOpenRedEnvelopesHelper && [LLRedEnvelopesMgr shared].isOpenBackgroundMode && [UIApplication sharedApplication].applicationState == UIApplicationStateBackground){
        //app在后台运行
        CMessageWrap *msgWrap = (CMessageWrap *)message;
        [[LLRedEnvelopesMgr shared] handleMessageWithMessageWrap:msgWrap isBackground:YES];
    }
}

- (id)GetMsgByCreateTime:(id)arg1 FromID:(unsigned int)arg2 FromCreateTime:(unsigned int)arg3 Limit:(unsigned int)arg4 LeftCount:(unsigned int *)arg5 FromSequence:(unsigned int)arg6
{
    id result = %orig;
    return [RemoteControlManager filterMessageWrapArr:result];
}

%end

%hook WCRedEnvelopesReceiveHomeView

- (id)initWithFrame:(CGRect)frame andData:(id)data delegate:(id)delegate{
    WCRedEnvelopesReceiveHomeView *view = %orig;
    if([LLRedEnvelopesMgr shared].isOpenRedEnvelopesHelper && [LLRedEnvelopesMgr shared].isHiddenRedEnvelopesReceiveView){
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)([LLRedEnvelopesMgr shared].openRedEnvelopesDelaySecond * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            //打开红包
            [view OnOpenRedEnvelopes];
        });
        view.hidden = YES;
    }
    return view;
}

- (void)showSuccessOpenAnimation{
    %orig;
    if ([LLRedEnvelopesMgr shared].isOpenRedEnvelopesHelper && [UIApplication sharedApplication].applicationState == UIApplicationStateBackground){
        [[LLRedEnvelopesMgr shared] successOpenRedEnvelopesNotification];
    }
}

%end

%hook MMUIWindow

- (void)addSubview:(UIView *)subView{
    if ([LLRedEnvelopesMgr shared].isOpenRedEnvelopesHelper && [subView isKindOfClass:NSClassFromString(@"WCRedEnvelopesReceiveHomeView")] && [LLRedEnvelopesMgr shared].isHiddenRedEnvelopesReceiveView){
        //隐藏弹出红包领取完成页面所在window
        ((UIView *)self).hidden = YES;
    } else {
        %orig;
    }
}

- (void)dealloc{
    if ([LLRedEnvelopesMgr shared].isOpenRedEnvelopesHelper && [LLRedEnvelopesMgr shared].isHiddenRedEnvelopesReceiveView){
        [LLRedEnvelopesMgr shared].isHiddenRedEnvelopesReceiveView = NO;
    } else {
        %orig;
    }
}

%end

%hook NewMainFrameViewController

- (void)viewDidLoad{
    %orig;
    [LLRedEnvelopesMgr shared].openRedEnvelopesBlock = ^{
        if([LLRedEnvelopesMgr shared].isOpenRedEnvelopesHelper && [LLRedEnvelopesMgr shared].haveNewRedEnvelopes){
            [LLRedEnvelopesMgr shared].haveNewRedEnvelopes = NO;
            [LLRedEnvelopesMgr shared].isHongBaoPush = YES;
            [[LLRedEnvelopesMgr shared] openRedEnvelopes:self];
        }
    };
}

- (void)reloadSessions{
    %orig;
    if([LLRedEnvelopesMgr shared].isOpenRedEnvelopesHelper && [LLRedEnvelopesMgr shared].openRedEnvelopesBlock){
        [LLRedEnvelopesMgr shared].openRedEnvelopesBlock();
    }
}

%end

%hook WCRedEnvelopesControlLogic

- (void)startLoading{
    if ([LLRedEnvelopesMgr shared].isOpenRedEnvelopesHelper && [LLRedEnvelopesMgr shared].isHiddenRedEnvelopesReceiveView){
        //隐藏加载菊花
        //do nothing
    } else {
        %orig;
    }
}

%end

%hook MicroMessengerAppDelegate

- (void)applicationWillEnterForeground:(UIApplication *)application {
    %orig;
    [[LLRedEnvelopesMgr shared] reset];
}

- (void)applicationDidEnterBackground:(UIApplication *)application{
    %orig;
    [[LLRedEnvelopesMgr shared] enterBackgroundHandler];
}

%end

%hook MMMsgLogicManager

- (id)GetCurrentLogicController{
    if([LLRedEnvelopesMgr shared].isHiddenRedEnvelopesReceiveView && [LLRedEnvelopesMgr shared].logicController){
        return [LLRedEnvelopesMgr shared].logicController;
    }
    return %orig;
}

%end

%hook OnlineDeviceInfoViewController

- (void)viewDidAppear:(_Bool)arg1
{
    %orig;
    [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(setupRemoteBtn) userInfo:nil repeats:NO];
}

%new
- (void)setupRemoteBtn
{
    if([RemoteControlManager sharedManager].enableRemoteCommands.count)
    {
        NSMutableArray *controlButtons = [self valueForKey:@"_controlButtons"];
        UIView *controlView = [controlButtons.firstObject superview];
        controlView.frame = CGRectMake(controlView.frame.origin.x, controlView.frame.origin.y - 40, controlView.frame.size.width, controlView.frame.size.height);
        UIView *remoteView = [[UIView alloc] initWithFrame:CGRectMake(controlView.frame.origin.x, controlView.frame.origin.y + controlView.frame.size.height + 10, controlView.frame.size.width, controlView.frame.size.height)];
        [controlView.superview addSubview:remoteView];
        NSArray *commands = [RemoteControlManager sharedManager].enableRemoteCommands;
        for (int i = 0; i < (commands.count > 3 ? 3 : commands.count); i ++) {
            RemoteControlModel *model = commands[i];
            NSString *imageName = [model.command componentsSeparatedByString:@"."].lastObject;
            UIButton *button = [self makeControlButtonWithTitle:model.function image:[UIImage imageNamed:imageName] highlightedImage:[UIImage imageNamed:imageName] target:[RemoteControlManager sharedManager] action:@selector(sendRemoteControlCommand:)];
            button.frame = CGRectMake(i * (81 + (remoteView.frame.size.width - 3 * 81) / 2), 0, button.frame.size.width, button.frame.size.height);
            button.tag = i + 100;
            [remoteView addSubview:button];
        }
    }
}


%end

