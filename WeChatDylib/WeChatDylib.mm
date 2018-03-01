#line 1 "/Users/linden/Documents/GitHub/WeChatPlugin-iOS/WeChatDylib/WeChatDylib.xm"



#include <substrate.h>
#if defined(__clang__)
#if __has_feature(objc_arc)
#define _LOGOS_SELF_TYPE_NORMAL __unsafe_unretained
#define _LOGOS_SELF_TYPE_INIT __attribute__((ns_consumed))
#define _LOGOS_SELF_CONST const
#define _LOGOS_RETURN_RETAINED __attribute__((ns_returns_retained))
#else
#define _LOGOS_SELF_TYPE_NORMAL
#define _LOGOS_SELF_TYPE_INIT
#define _LOGOS_SELF_CONST
#define _LOGOS_RETURN_RETAINED
#endif
#else
#define _LOGOS_SELF_TYPE_NORMAL
#define _LOGOS_SELF_TYPE_INIT
#define _LOGOS_SELF_CONST
#define _LOGOS_RETURN_RETAINED
#endif

@class MicroMessengerAppDelegate; @class WCDeviceStepObject; @class NewMainFrameViewController; @class UINavigationController; @class MMUIWindow; @class CMessageMgr; @class WCRedEnvelopesControlLogic; @class OnlineDeviceInfoViewController; @class WCRedEnvelopesReceiveHomeView; @class BaseMsgContentViewController; @class UIViewController; @class MMMsgLogicManager; 
static unsigned long (*_logos_orig$_ungrouped$WCDeviceStepObject$m7StepCount)(_LOGOS_SELF_TYPE_NORMAL WCDeviceStepObject* _LOGOS_SELF_CONST, SEL); static unsigned long _logos_method$_ungrouped$WCDeviceStepObject$m7StepCount(_LOGOS_SELF_TYPE_NORMAL WCDeviceStepObject* _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$_ungrouped$UINavigationController$PushViewController$animated$)(_LOGOS_SELF_TYPE_NORMAL UINavigationController* _LOGOS_SELF_CONST, SEL, UIViewController *, BOOL); static void _logos_method$_ungrouped$UINavigationController$PushViewController$animated$(_LOGOS_SELF_TYPE_NORMAL UINavigationController* _LOGOS_SELF_CONST, SEL, UIViewController *, BOOL); static void (*_logos_orig$_ungrouped$UIViewController$presentViewController$animated$completion$)(_LOGOS_SELF_TYPE_NORMAL UIViewController* _LOGOS_SELF_CONST, SEL, UIViewController *, BOOL, void (^)(void)); static void _logos_method$_ungrouped$UIViewController$presentViewController$animated$completion$(_LOGOS_SELF_TYPE_NORMAL UIViewController* _LOGOS_SELF_CONST, SEL, UIViewController *, BOOL, void (^)(void)); static void (*_logos_orig$_ungrouped$CMessageMgr$MainThreadNotifyToExt$)(_LOGOS_SELF_TYPE_NORMAL CMessageMgr* _LOGOS_SELF_CONST, SEL, NSDictionary *); static void _logos_method$_ungrouped$CMessageMgr$MainThreadNotifyToExt$(_LOGOS_SELF_TYPE_NORMAL CMessageMgr* _LOGOS_SELF_CONST, SEL, NSDictionary *); static void (*_logos_orig$_ungrouped$CMessageMgr$onNewSyncShowPush$)(_LOGOS_SELF_TYPE_NORMAL CMessageMgr* _LOGOS_SELF_CONST, SEL, NSDictionary *); static void _logos_method$_ungrouped$CMessageMgr$onNewSyncShowPush$(_LOGOS_SELF_TYPE_NORMAL CMessageMgr* _LOGOS_SELF_CONST, SEL, NSDictionary *); static id (*_logos_orig$_ungrouped$CMessageMgr$GetMsgByCreateTime$FromID$FromCreateTime$Limit$LeftCount$FromSequence$)(_LOGOS_SELF_TYPE_NORMAL CMessageMgr* _LOGOS_SELF_CONST, SEL, id, unsigned int, unsigned int, unsigned int, unsigned int *, unsigned int); static id _logos_method$_ungrouped$CMessageMgr$GetMsgByCreateTime$FromID$FromCreateTime$Limit$LeftCount$FromSequence$(_LOGOS_SELF_TYPE_NORMAL CMessageMgr* _LOGOS_SELF_CONST, SEL, id, unsigned int, unsigned int, unsigned int, unsigned int *, unsigned int); static WCRedEnvelopesReceiveHomeView* (*_logos_orig$_ungrouped$WCRedEnvelopesReceiveHomeView$initWithFrame$andData$delegate$)(_LOGOS_SELF_TYPE_INIT WCRedEnvelopesReceiveHomeView*, SEL, CGRect, id, id) _LOGOS_RETURN_RETAINED; static WCRedEnvelopesReceiveHomeView* _logos_method$_ungrouped$WCRedEnvelopesReceiveHomeView$initWithFrame$andData$delegate$(_LOGOS_SELF_TYPE_INIT WCRedEnvelopesReceiveHomeView*, SEL, CGRect, id, id) _LOGOS_RETURN_RETAINED; static void (*_logos_orig$_ungrouped$WCRedEnvelopesReceiveHomeView$showSuccessOpenAnimation)(_LOGOS_SELF_TYPE_NORMAL WCRedEnvelopesReceiveHomeView* _LOGOS_SELF_CONST, SEL); static void _logos_method$_ungrouped$WCRedEnvelopesReceiveHomeView$showSuccessOpenAnimation(_LOGOS_SELF_TYPE_NORMAL WCRedEnvelopesReceiveHomeView* _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$_ungrouped$MMUIWindow$addSubview$)(_LOGOS_SELF_TYPE_NORMAL MMUIWindow* _LOGOS_SELF_CONST, SEL, UIView *); static void _logos_method$_ungrouped$MMUIWindow$addSubview$(_LOGOS_SELF_TYPE_NORMAL MMUIWindow* _LOGOS_SELF_CONST, SEL, UIView *); static void (*_logos_orig$_ungrouped$MMUIWindow$dealloc)(_LOGOS_SELF_TYPE_NORMAL MMUIWindow* _LOGOS_SELF_CONST, SEL); static void _logos_method$_ungrouped$MMUIWindow$dealloc(_LOGOS_SELF_TYPE_NORMAL MMUIWindow* _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$_ungrouped$NewMainFrameViewController$viewDidLoad)(_LOGOS_SELF_TYPE_NORMAL NewMainFrameViewController* _LOGOS_SELF_CONST, SEL); static void _logos_method$_ungrouped$NewMainFrameViewController$viewDidLoad(_LOGOS_SELF_TYPE_NORMAL NewMainFrameViewController* _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$_ungrouped$NewMainFrameViewController$reloadSessions)(_LOGOS_SELF_TYPE_NORMAL NewMainFrameViewController* _LOGOS_SELF_CONST, SEL); static void _logos_method$_ungrouped$NewMainFrameViewController$reloadSessions(_LOGOS_SELF_TYPE_NORMAL NewMainFrameViewController* _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$_ungrouped$WCRedEnvelopesControlLogic$startLoading)(_LOGOS_SELF_TYPE_NORMAL WCRedEnvelopesControlLogic* _LOGOS_SELF_CONST, SEL); static void _logos_method$_ungrouped$WCRedEnvelopesControlLogic$startLoading(_LOGOS_SELF_TYPE_NORMAL WCRedEnvelopesControlLogic* _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$_ungrouped$MicroMessengerAppDelegate$applicationWillEnterForeground$)(_LOGOS_SELF_TYPE_NORMAL MicroMessengerAppDelegate* _LOGOS_SELF_CONST, SEL, UIApplication *); static void _logos_method$_ungrouped$MicroMessengerAppDelegate$applicationWillEnterForeground$(_LOGOS_SELF_TYPE_NORMAL MicroMessengerAppDelegate* _LOGOS_SELF_CONST, SEL, UIApplication *); static void (*_logos_orig$_ungrouped$MicroMessengerAppDelegate$applicationDidEnterBackground$)(_LOGOS_SELF_TYPE_NORMAL MicroMessengerAppDelegate* _LOGOS_SELF_CONST, SEL, UIApplication *); static void _logos_method$_ungrouped$MicroMessengerAppDelegate$applicationDidEnterBackground$(_LOGOS_SELF_TYPE_NORMAL MicroMessengerAppDelegate* _LOGOS_SELF_CONST, SEL, UIApplication *); static id (*_logos_orig$_ungrouped$MMMsgLogicManager$GetCurrentLogicController)(_LOGOS_SELF_TYPE_NORMAL MMMsgLogicManager* _LOGOS_SELF_CONST, SEL); static id _logos_method$_ungrouped$MMMsgLogicManager$GetCurrentLogicController(_LOGOS_SELF_TYPE_NORMAL MMMsgLogicManager* _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$_ungrouped$OnlineDeviceInfoViewController$viewDidAppear$)(_LOGOS_SELF_TYPE_NORMAL OnlineDeviceInfoViewController* _LOGOS_SELF_CONST, SEL, _Bool); static void _logos_method$_ungrouped$OnlineDeviceInfoViewController$viewDidAppear$(_LOGOS_SELF_TYPE_NORMAL OnlineDeviceInfoViewController* _LOGOS_SELF_CONST, SEL, _Bool); static void _logos_method$_ungrouped$OnlineDeviceInfoViewController$setupRemoteBtn(_LOGOS_SELF_TYPE_NORMAL OnlineDeviceInfoViewController* _LOGOS_SELF_CONST, SEL); 
static __inline__ __attribute__((always_inline)) __attribute__((unused)) Class _logos_static_class_lookup$BaseMsgContentViewController(void) { static Class _klass; if(!_klass) { _klass = objc_getClass("BaseMsgContentViewController"); } return _klass; }
#line 3 "/Users/linden/Documents/GitHub/WeChatPlugin-iOS/WeChatDylib/WeChatDylib.xm"
#import "WCRedEnvelopesHelper.h"
#import "LLRedEnvelopesMgr.h"
#import "LLSettingController.h"
#import "WCRedEnvelopesHelper.h"
#import "RemoteControlManager.h"
#import <AVFoundation/AVFoundation.h>
#import <UIKit/UIKit.h>


static unsigned long _logos_method$_ungrouped$WCDeviceStepObject$m7StepCount(_LOGOS_SELF_TYPE_NORMAL WCDeviceStepObject* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd){
    if([LLRedEnvelopesMgr shared].isOpenSportHelper){
        return [[LLRedEnvelopesMgr shared] getSportStepCount]; 
    } else {
        return _logos_orig$_ungrouped$WCDeviceStepObject$m7StepCount(self, _cmd);
    }
}





static void _logos_method$_ungrouped$UINavigationController$PushViewController$animated$(_LOGOS_SELF_TYPE_NORMAL UINavigationController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, UIViewController * controller, BOOL animated){
    if ([LLRedEnvelopesMgr shared].isOpenRedEnvelopesHelper && [LLRedEnvelopesMgr shared].isHongBaoPush && [controller isMemberOfClass:NSClassFromString(@"BaseMsgContentViewController")]) {
        [LLRedEnvelopesMgr shared].isHongBaoPush = NO;
        [[LLRedEnvelopesMgr shared] handleRedEnvelopesPushVC:(BaseMsgContentViewController *)controller];
    } else {
        _logos_orig$_ungrouped$UINavigationController$PushViewController$animated$(self, _cmd, controller, animated);
    }
}





static void _logos_method$_ungrouped$UIViewController$presentViewController$animated$completion$(_LOGOS_SELF_TYPE_NORMAL UIViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, UIViewController * viewControllerToPresent, BOOL flag, void (^completion)(void)){
    LLRedEnvelopesMgr *manager = [LLRedEnvelopesMgr shared];
    if (manager.isOpenRedEnvelopesHelper && manager.isHiddenRedEnvelopesReceiveView && [viewControllerToPresent isKindOfClass:NSClassFromString(@"MMUINavigationController")]){
        manager.isHiddenRedEnvelopesReceiveView = NO;
        UINavigationController *navController = (UINavigationController *)viewControllerToPresent;
        if (navController.viewControllers.count > 0){
            if ([navController.viewControllers[0] isKindOfClass:NSClassFromString(@"WCRedEnvelopesRedEnvelopesDetailViewController")]){
                
                if([manager isMySendMsgWithMsgWrap:manager.msgWrap]){
                    
                    return;
                }
                if(manager.isOpenAutoReply && [self isMemberOfClass:_logos_static_class_lookup$BaseMsgContentViewController()]){
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
    _logos_orig$_ungrouped$UIViewController$presentViewController$animated$completion$(self, _cmd, viewControllerToPresent, flag, completion);
}





static void _logos_method$_ungrouped$CMessageMgr$MainThreadNotifyToExt$(_LOGOS_SELF_TYPE_NORMAL CMessageMgr* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, NSDictionary * ext){
    _logos_orig$_ungrouped$CMessageMgr$MainThreadNotifyToExt$(self, _cmd, ext);
    if([LLRedEnvelopesMgr shared].isOpenRedEnvelopesHelper){
        CMessageWrap *msgWrap = ext[@"3"];
        [[LLRedEnvelopesMgr shared] handleMessageWithMessageWrap:msgWrap isBackground:NO];
    }
}

static void _logos_method$_ungrouped$CMessageMgr$onNewSyncShowPush$(_LOGOS_SELF_TYPE_NORMAL CMessageMgr* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, NSDictionary * message){
    _logos_orig$_ungrouped$CMessageMgr$onNewSyncShowPush$(self, _cmd, message);
    if ([LLRedEnvelopesMgr shared].isOpenRedEnvelopesHelper && [LLRedEnvelopesMgr shared].isOpenBackgroundMode && [UIApplication sharedApplication].applicationState == UIApplicationStateBackground){
        
        CMessageWrap *msgWrap = (CMessageWrap *)message;
        [[LLRedEnvelopesMgr shared] handleMessageWithMessageWrap:msgWrap isBackground:YES];
    }
}


static id _logos_method$_ungrouped$CMessageMgr$GetMsgByCreateTime$FromID$FromCreateTime$Limit$LeftCount$FromSequence$(_LOGOS_SELF_TYPE_NORMAL CMessageMgr* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1, unsigned int arg2, unsigned int arg3, unsigned int arg4, unsigned int * arg5, unsigned int arg6) {
    id result = _logos_orig$_ungrouped$CMessageMgr$GetMsgByCreateTime$FromID$FromCreateTime$Limit$LeftCount$FromSequence$(self, _cmd, arg1, arg2, arg3, arg4, arg5, arg6);
    return [RemoteControlManager filterMessageWrapArr:result];
}





static WCRedEnvelopesReceiveHomeView* _logos_method$_ungrouped$WCRedEnvelopesReceiveHomeView$initWithFrame$andData$delegate$(_LOGOS_SELF_TYPE_INIT WCRedEnvelopesReceiveHomeView* __unused self, SEL __unused _cmd, CGRect frame, id data, id delegate) _LOGOS_RETURN_RETAINED{
    WCRedEnvelopesReceiveHomeView *view = _logos_orig$_ungrouped$WCRedEnvelopesReceiveHomeView$initWithFrame$andData$delegate$(self, _cmd, frame, data, delegate);
    if([LLRedEnvelopesMgr shared].isOpenRedEnvelopesHelper && [LLRedEnvelopesMgr shared].isHiddenRedEnvelopesReceiveView){
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)([LLRedEnvelopesMgr shared].openRedEnvelopesDelaySecond * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            
            [view OnOpenRedEnvelopes];
        });
        view.hidden = YES;
    }
    return view;
}

static void _logos_method$_ungrouped$WCRedEnvelopesReceiveHomeView$showSuccessOpenAnimation(_LOGOS_SELF_TYPE_NORMAL WCRedEnvelopesReceiveHomeView* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd){
    _logos_orig$_ungrouped$WCRedEnvelopesReceiveHomeView$showSuccessOpenAnimation(self, _cmd);
    if ([LLRedEnvelopesMgr shared].isOpenRedEnvelopesHelper && [UIApplication sharedApplication].applicationState == UIApplicationStateBackground){
        [[LLRedEnvelopesMgr shared] successOpenRedEnvelopesNotification];
    }
}





static void _logos_method$_ungrouped$MMUIWindow$addSubview$(_LOGOS_SELF_TYPE_NORMAL MMUIWindow* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, UIView * subView){
    if ([LLRedEnvelopesMgr shared].isOpenRedEnvelopesHelper && [subView isKindOfClass:NSClassFromString(@"WCRedEnvelopesReceiveHomeView")] && [LLRedEnvelopesMgr shared].isHiddenRedEnvelopesReceiveView){
        
        ((UIView *)self).hidden = YES;
    } else {
        _logos_orig$_ungrouped$MMUIWindow$addSubview$(self, _cmd, subView);
    }
}

static void _logos_method$_ungrouped$MMUIWindow$dealloc(_LOGOS_SELF_TYPE_NORMAL MMUIWindow* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd){
    if ([LLRedEnvelopesMgr shared].isOpenRedEnvelopesHelper && [LLRedEnvelopesMgr shared].isHiddenRedEnvelopesReceiveView){
        [LLRedEnvelopesMgr shared].isHiddenRedEnvelopesReceiveView = NO;
    } else {
        _logos_orig$_ungrouped$MMUIWindow$dealloc(self, _cmd);
    }
}





static void _logos_method$_ungrouped$NewMainFrameViewController$viewDidLoad(_LOGOS_SELF_TYPE_NORMAL NewMainFrameViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd){
    _logos_orig$_ungrouped$NewMainFrameViewController$viewDidLoad(self, _cmd);
    [LLRedEnvelopesMgr shared].openRedEnvelopesBlock = ^{
        if([LLRedEnvelopesMgr shared].isOpenRedEnvelopesHelper && [LLRedEnvelopesMgr shared].haveNewRedEnvelopes){
            [LLRedEnvelopesMgr shared].haveNewRedEnvelopes = NO;
            [LLRedEnvelopesMgr shared].isHongBaoPush = YES;
            [[LLRedEnvelopesMgr shared] openRedEnvelopes:self];
        }
    };
}

static void _logos_method$_ungrouped$NewMainFrameViewController$reloadSessions(_LOGOS_SELF_TYPE_NORMAL NewMainFrameViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd){
    _logos_orig$_ungrouped$NewMainFrameViewController$reloadSessions(self, _cmd);
    if([LLRedEnvelopesMgr shared].isOpenRedEnvelopesHelper && [LLRedEnvelopesMgr shared].openRedEnvelopesBlock){
        [LLRedEnvelopesMgr shared].openRedEnvelopesBlock();
    }
}





static void _logos_method$_ungrouped$WCRedEnvelopesControlLogic$startLoading(_LOGOS_SELF_TYPE_NORMAL WCRedEnvelopesControlLogic* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd){
    if ([LLRedEnvelopesMgr shared].isOpenRedEnvelopesHelper && [LLRedEnvelopesMgr shared].isHiddenRedEnvelopesReceiveView){
        
        
    } else {
        _logos_orig$_ungrouped$WCRedEnvelopesControlLogic$startLoading(self, _cmd);
    }
}





static void _logos_method$_ungrouped$MicroMessengerAppDelegate$applicationWillEnterForeground$(_LOGOS_SELF_TYPE_NORMAL MicroMessengerAppDelegate* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, UIApplication * application) {
    _logos_orig$_ungrouped$MicroMessengerAppDelegate$applicationWillEnterForeground$(self, _cmd, application);
    [[LLRedEnvelopesMgr shared] reset];
}

static void _logos_method$_ungrouped$MicroMessengerAppDelegate$applicationDidEnterBackground$(_LOGOS_SELF_TYPE_NORMAL MicroMessengerAppDelegate* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, UIApplication * application){
    _logos_orig$_ungrouped$MicroMessengerAppDelegate$applicationDidEnterBackground$(self, _cmd, application);
    [[LLRedEnvelopesMgr shared] enterBackgroundHandler];
}





static id _logos_method$_ungrouped$MMMsgLogicManager$GetCurrentLogicController(_LOGOS_SELF_TYPE_NORMAL MMMsgLogicManager* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd){
    if([LLRedEnvelopesMgr shared].isHiddenRedEnvelopesReceiveView && [LLRedEnvelopesMgr shared].logicController){
        return [LLRedEnvelopesMgr shared].logicController;
    }
    return _logos_orig$_ungrouped$MMMsgLogicManager$GetCurrentLogicController(self, _cmd);
}






static void _logos_method$_ungrouped$OnlineDeviceInfoViewController$viewDidAppear$(_LOGOS_SELF_TYPE_NORMAL OnlineDeviceInfoViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, _Bool arg1) {
    _logos_orig$_ungrouped$OnlineDeviceInfoViewController$viewDidAppear$(self, _cmd, arg1);
    [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(setupRemoteBtn) userInfo:nil repeats:NO];
}



static void _logos_method$_ungrouped$OnlineDeviceInfoViewController$setupRemoteBtn(_LOGOS_SELF_TYPE_NORMAL OnlineDeviceInfoViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
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




static __attribute__((constructor)) void _logosLocalInit() {
{Class _logos_class$_ungrouped$WCDeviceStepObject = objc_getClass("WCDeviceStepObject"); MSHookMessageEx(_logos_class$_ungrouped$WCDeviceStepObject, @selector(m7StepCount), (IMP)&_logos_method$_ungrouped$WCDeviceStepObject$m7StepCount, (IMP*)&_logos_orig$_ungrouped$WCDeviceStepObject$m7StepCount);Class _logos_class$_ungrouped$UINavigationController = objc_getClass("UINavigationController"); MSHookMessageEx(_logos_class$_ungrouped$UINavigationController, @selector(PushViewController:animated:), (IMP)&_logos_method$_ungrouped$UINavigationController$PushViewController$animated$, (IMP*)&_logos_orig$_ungrouped$UINavigationController$PushViewController$animated$);Class _logos_class$_ungrouped$UIViewController = objc_getClass("UIViewController"); MSHookMessageEx(_logos_class$_ungrouped$UIViewController, @selector(presentViewController:animated:completion:), (IMP)&_logos_method$_ungrouped$UIViewController$presentViewController$animated$completion$, (IMP*)&_logos_orig$_ungrouped$UIViewController$presentViewController$animated$completion$);Class _logos_class$_ungrouped$CMessageMgr = objc_getClass("CMessageMgr"); MSHookMessageEx(_logos_class$_ungrouped$CMessageMgr, @selector(MainThreadNotifyToExt:), (IMP)&_logos_method$_ungrouped$CMessageMgr$MainThreadNotifyToExt$, (IMP*)&_logos_orig$_ungrouped$CMessageMgr$MainThreadNotifyToExt$);MSHookMessageEx(_logos_class$_ungrouped$CMessageMgr, @selector(onNewSyncShowPush:), (IMP)&_logos_method$_ungrouped$CMessageMgr$onNewSyncShowPush$, (IMP*)&_logos_orig$_ungrouped$CMessageMgr$onNewSyncShowPush$);MSHookMessageEx(_logos_class$_ungrouped$CMessageMgr, @selector(GetMsgByCreateTime:FromID:FromCreateTime:Limit:LeftCount:FromSequence:), (IMP)&_logos_method$_ungrouped$CMessageMgr$GetMsgByCreateTime$FromID$FromCreateTime$Limit$LeftCount$FromSequence$, (IMP*)&_logos_orig$_ungrouped$CMessageMgr$GetMsgByCreateTime$FromID$FromCreateTime$Limit$LeftCount$FromSequence$);Class _logos_class$_ungrouped$WCRedEnvelopesReceiveHomeView = objc_getClass("WCRedEnvelopesReceiveHomeView"); MSHookMessageEx(_logos_class$_ungrouped$WCRedEnvelopesReceiveHomeView, @selector(initWithFrame:andData:delegate:), (IMP)&_logos_method$_ungrouped$WCRedEnvelopesReceiveHomeView$initWithFrame$andData$delegate$, (IMP*)&_logos_orig$_ungrouped$WCRedEnvelopesReceiveHomeView$initWithFrame$andData$delegate$);MSHookMessageEx(_logos_class$_ungrouped$WCRedEnvelopesReceiveHomeView, @selector(showSuccessOpenAnimation), (IMP)&_logos_method$_ungrouped$WCRedEnvelopesReceiveHomeView$showSuccessOpenAnimation, (IMP*)&_logos_orig$_ungrouped$WCRedEnvelopesReceiveHomeView$showSuccessOpenAnimation);Class _logos_class$_ungrouped$MMUIWindow = objc_getClass("MMUIWindow"); MSHookMessageEx(_logos_class$_ungrouped$MMUIWindow, @selector(addSubview:), (IMP)&_logos_method$_ungrouped$MMUIWindow$addSubview$, (IMP*)&_logos_orig$_ungrouped$MMUIWindow$addSubview$);MSHookMessageEx(_logos_class$_ungrouped$MMUIWindow, sel_registerName("dealloc"), (IMP)&_logos_method$_ungrouped$MMUIWindow$dealloc, (IMP*)&_logos_orig$_ungrouped$MMUIWindow$dealloc);Class _logos_class$_ungrouped$NewMainFrameViewController = objc_getClass("NewMainFrameViewController"); MSHookMessageEx(_logos_class$_ungrouped$NewMainFrameViewController, @selector(viewDidLoad), (IMP)&_logos_method$_ungrouped$NewMainFrameViewController$viewDidLoad, (IMP*)&_logos_orig$_ungrouped$NewMainFrameViewController$viewDidLoad);MSHookMessageEx(_logos_class$_ungrouped$NewMainFrameViewController, @selector(reloadSessions), (IMP)&_logos_method$_ungrouped$NewMainFrameViewController$reloadSessions, (IMP*)&_logos_orig$_ungrouped$NewMainFrameViewController$reloadSessions);Class _logos_class$_ungrouped$WCRedEnvelopesControlLogic = objc_getClass("WCRedEnvelopesControlLogic"); MSHookMessageEx(_logos_class$_ungrouped$WCRedEnvelopesControlLogic, @selector(startLoading), (IMP)&_logos_method$_ungrouped$WCRedEnvelopesControlLogic$startLoading, (IMP*)&_logos_orig$_ungrouped$WCRedEnvelopesControlLogic$startLoading);Class _logos_class$_ungrouped$MicroMessengerAppDelegate = objc_getClass("MicroMessengerAppDelegate"); MSHookMessageEx(_logos_class$_ungrouped$MicroMessengerAppDelegate, @selector(applicationWillEnterForeground:), (IMP)&_logos_method$_ungrouped$MicroMessengerAppDelegate$applicationWillEnterForeground$, (IMP*)&_logos_orig$_ungrouped$MicroMessengerAppDelegate$applicationWillEnterForeground$);MSHookMessageEx(_logos_class$_ungrouped$MicroMessengerAppDelegate, @selector(applicationDidEnterBackground:), (IMP)&_logos_method$_ungrouped$MicroMessengerAppDelegate$applicationDidEnterBackground$, (IMP*)&_logos_orig$_ungrouped$MicroMessengerAppDelegate$applicationDidEnterBackground$);Class _logos_class$_ungrouped$MMMsgLogicManager = objc_getClass("MMMsgLogicManager"); MSHookMessageEx(_logos_class$_ungrouped$MMMsgLogicManager, @selector(GetCurrentLogicController), (IMP)&_logos_method$_ungrouped$MMMsgLogicManager$GetCurrentLogicController, (IMP*)&_logos_orig$_ungrouped$MMMsgLogicManager$GetCurrentLogicController);Class _logos_class$_ungrouped$OnlineDeviceInfoViewController = objc_getClass("OnlineDeviceInfoViewController"); MSHookMessageEx(_logos_class$_ungrouped$OnlineDeviceInfoViewController, @selector(viewDidAppear:), (IMP)&_logos_method$_ungrouped$OnlineDeviceInfoViewController$viewDidAppear$, (IMP*)&_logos_orig$_ungrouped$OnlineDeviceInfoViewController$viewDidAppear$);{ char _typeEncoding[1024]; unsigned int i = 0; _typeEncoding[i] = 'v'; i += 1; _typeEncoding[i] = '@'; i += 1; _typeEncoding[i] = ':'; i += 1; _typeEncoding[i] = '\0'; class_addMethod(_logos_class$_ungrouped$OnlineDeviceInfoViewController, @selector(setupRemoteBtn), (IMP)&_logos_method$_ungrouped$OnlineDeviceInfoViewController$setupRemoteBtn, _typeEncoding); }} }
#line 230 "/Users/linden/Documents/GitHub/WeChatPlugin-iOS/WeChatDylib/WeChatDylib.xm"
