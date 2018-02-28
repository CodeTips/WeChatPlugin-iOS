#line 1 "/Users/timeaside/Desktop/WeChatPlugin-iOS/WeChatDylib/HookProtected.xm"
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


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

@class WWKBaseObject; @class ManualAuthAesReqData; @class ClientCheckMgr; 
static void (*_logos_orig$_ungrouped$ClientCheckMgr$registerAddImageCallBack)(_LOGOS_SELF_TYPE_NORMAL ClientCheckMgr* _LOGOS_SELF_CONST, SEL); static void _logos_method$_ungrouped$ClientCheckMgr$registerAddImageCallBack(_LOGOS_SELF_TYPE_NORMAL ClientCheckMgr* _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$_ungrouped$ClientCheckMgr$checkHookWithSeq$)(_LOGOS_SELF_TYPE_NORMAL ClientCheckMgr* _LOGOS_SELF_CONST, SEL, unsigned int); static void _logos_method$_ungrouped$ClientCheckMgr$checkHookWithSeq$(_LOGOS_SELF_TYPE_NORMAL ClientCheckMgr* _LOGOS_SELF_CONST, SEL, unsigned int); static void (*_logos_orig$_ungrouped$ClientCheckMgr$checkHook$)(_LOGOS_SELF_TYPE_NORMAL ClientCheckMgr* _LOGOS_SELF_CONST, SEL, id); static void _logos_method$_ungrouped$ClientCheckMgr$checkHook$(_LOGOS_SELF_TYPE_NORMAL ClientCheckMgr* _LOGOS_SELF_CONST, SEL, id); static void (*_logos_orig$_ungrouped$ClientCheckMgr$checkConsistency$)(_LOGOS_SELF_TYPE_NORMAL ClientCheckMgr* _LOGOS_SELF_CONST, SEL, id); static void _logos_method$_ungrouped$ClientCheckMgr$checkConsistency$(_LOGOS_SELF_TYPE_NORMAL ClientCheckMgr* _LOGOS_SELF_CONST, SEL, id); static NSString * (*_logos_orig$_ungrouped$ManualAuthAesReqData$bundleId)(_LOGOS_SELF_TYPE_NORMAL ManualAuthAesReqData* _LOGOS_SELF_CONST, SEL); static NSString * _logos_method$_ungrouped$ManualAuthAesReqData$bundleId(_LOGOS_SELF_TYPE_NORMAL ManualAuthAesReqData* _LOGOS_SELF_CONST, SEL); static NSString * (*_logos_orig$_ungrouped$WWKBaseObject$bundleID)(_LOGOS_SELF_TYPE_NORMAL WWKBaseObject* _LOGOS_SELF_CONST, SEL); static NSString * _logos_method$_ungrouped$WWKBaseObject$bundleID(_LOGOS_SELF_TYPE_NORMAL WWKBaseObject* _LOGOS_SELF_CONST, SEL); 

#line 4 "/Users/timeaside/Desktop/WeChatPlugin-iOS/WeChatDylib/HookProtected.xm"


static void _logos_method$_ungrouped$ClientCheckMgr$registerAddImageCallBack(_LOGOS_SELF_TYPE_NORMAL ClientCheckMgr* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
}


static void _logos_method$_ungrouped$ClientCheckMgr$checkHookWithSeq$(_LOGOS_SELF_TYPE_NORMAL ClientCheckMgr* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, unsigned int arg1) {
}


static void _logos_method$_ungrouped$ClientCheckMgr$checkHook$(_LOGOS_SELF_TYPE_NORMAL ClientCheckMgr* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1) {
}


static void _logos_method$_ungrouped$ClientCheckMgr$checkConsistency$(_LOGOS_SELF_TYPE_NORMAL ClientCheckMgr* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1) {
}






static NSString * _logos_method$_ungrouped$ManualAuthAesReqData$bundleId(_LOGOS_SELF_TYPE_NORMAL ManualAuthAesReqData* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    return @"com.tencent.xin";
}






static NSString * _logos_method$_ungrouped$WWKBaseObject$bundleID(_LOGOS_SELF_TYPE_NORMAL WWKBaseObject* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    return @"com.tencent.xin";
}




static __attribute__((constructor)) void _logosLocalInit() {
{Class _logos_class$_ungrouped$ClientCheckMgr = objc_getClass("ClientCheckMgr"); MSHookMessageEx(_logos_class$_ungrouped$ClientCheckMgr, @selector(registerAddImageCallBack), (IMP)&_logos_method$_ungrouped$ClientCheckMgr$registerAddImageCallBack, (IMP*)&_logos_orig$_ungrouped$ClientCheckMgr$registerAddImageCallBack);MSHookMessageEx(_logos_class$_ungrouped$ClientCheckMgr, @selector(checkHookWithSeq:), (IMP)&_logos_method$_ungrouped$ClientCheckMgr$checkHookWithSeq$, (IMP*)&_logos_orig$_ungrouped$ClientCheckMgr$checkHookWithSeq$);MSHookMessageEx(_logos_class$_ungrouped$ClientCheckMgr, @selector(checkHook:), (IMP)&_logos_method$_ungrouped$ClientCheckMgr$checkHook$, (IMP*)&_logos_orig$_ungrouped$ClientCheckMgr$checkHook$);MSHookMessageEx(_logos_class$_ungrouped$ClientCheckMgr, @selector(checkConsistency:), (IMP)&_logos_method$_ungrouped$ClientCheckMgr$checkConsistency$, (IMP*)&_logos_orig$_ungrouped$ClientCheckMgr$checkConsistency$);Class _logos_class$_ungrouped$ManualAuthAesReqData = objc_getClass("ManualAuthAesReqData"); MSHookMessageEx(_logos_class$_ungrouped$ManualAuthAesReqData, @selector(bundleId), (IMP)&_logos_method$_ungrouped$ManualAuthAesReqData$bundleId, (IMP*)&_logos_orig$_ungrouped$ManualAuthAesReqData$bundleId);Class _logos_class$_ungrouped$WWKBaseObject = objc_getClass("WWKBaseObject"); MSHookMessageEx(_logos_class$_ungrouped$WWKBaseObject, @selector(bundleID), (IMP)&_logos_method$_ungrouped$WWKBaseObject$bundleID, (IMP*)&_logos_orig$_ungrouped$WWKBaseObject$bundleID);} }
#line 42 "/Users/timeaside/Desktop/WeChatPlugin-iOS/WeChatDylib/HookProtected.xm"
