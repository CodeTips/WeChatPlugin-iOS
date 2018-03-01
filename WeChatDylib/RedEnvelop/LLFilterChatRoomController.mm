#line 1 "/Users/linden/Documents/GitHub/WeChatPlugin-iOS/WeChatDylib/RedEnvelop/LLFilterChatRoomController.xm"

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

@class LLFilterChatRoomController; @class ChatRoomListViewController; 
static void (*_logos_orig$_ungrouped$LLFilterChatRoomController$viewDidLoad)(_LOGOS_SELF_TYPE_NORMAL LLFilterChatRoomController* _LOGOS_SELF_CONST, SEL); static void _logos_method$_ungrouped$LLFilterChatRoomController$viewDidLoad(_LOGOS_SELF_TYPE_NORMAL LLFilterChatRoomController* _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$_ungrouped$LLFilterChatRoomController$initSearchBar)(_LOGOS_SELF_TYPE_NORMAL LLFilterChatRoomController* _LOGOS_SELF_CONST, SEL); static void _logos_method$_ungrouped$LLFilterChatRoomController$initSearchBar(_LOGOS_SELF_TYPE_NORMAL LLFilterChatRoomController* _LOGOS_SELF_CONST, SEL); static void _logos_method$_ungrouped$LLFilterChatRoomController$commonInit(_LOGOS_SELF_TYPE_NORMAL LLFilterChatRoomController* _LOGOS_SELF_CONST, SEL); static void _logos_method$_ungrouped$LLFilterChatRoomController$setNavigationBar(_LOGOS_SELF_TYPE_NORMAL LLFilterChatRoomController* _LOGOS_SELF_CONST, SEL); static void _logos_method$_ungrouped$LLFilterChatRoomController$clickConfirmItem(_LOGOS_SELF_TYPE_NORMAL LLFilterChatRoomController* _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$_ungrouped$LLFilterChatRoomController$didSelectRowAtIndexPath$)(_LOGOS_SELF_TYPE_NORMAL LLFilterChatRoomController* _LOGOS_SELF_CONST, SEL, NSIndexPath *); static void _logos_method$_ungrouped$LLFilterChatRoomController$didSelectRowAtIndexPath$(_LOGOS_SELF_TYPE_NORMAL LLFilterChatRoomController* _LOGOS_SELF_CONST, SEL, NSIndexPath *); static BOOL (*_logos_orig$_ungrouped$LLFilterChatRoomController$tableView$canEditRowAtIndexPath$)(_LOGOS_SELF_TYPE_NORMAL LLFilterChatRoomController* _LOGOS_SELF_CONST, SEL, UITableView *, NSIndexPath *); static BOOL _logos_method$_ungrouped$LLFilterChatRoomController$tableView$canEditRowAtIndexPath$(_LOGOS_SELF_TYPE_NORMAL LLFilterChatRoomController* _LOGOS_SELF_CONST, SEL, UITableView *, NSIndexPath *); static long (*_logos_orig$_ungrouped$LLFilterChatRoomController$tableView$editingStyleForRowAtIndexPath$)(_LOGOS_SELF_TYPE_NORMAL LLFilterChatRoomController* _LOGOS_SELF_CONST, SEL, UITableView *, NSIndexPath *); static long _logos_method$_ungrouped$LLFilterChatRoomController$tableView$editingStyleForRowAtIndexPath$(_LOGOS_SELF_TYPE_NORMAL LLFilterChatRoomController* _LOGOS_SELF_CONST, SEL, UITableView *, NSIndexPath *); static BOOL (*_logos_orig$_ungrouped$LLFilterChatRoomController$shouldAutorotate)(_LOGOS_SELF_TYPE_NORMAL LLFilterChatRoomController* _LOGOS_SELF_CONST, SEL); static BOOL _logos_method$_ungrouped$LLFilterChatRoomController$shouldAutorotate(_LOGOS_SELF_TYPE_NORMAL LLFilterChatRoomController* _LOGOS_SELF_CONST, SEL); static UIInterfaceOrientationMask (*_logos_orig$_ungrouped$LLFilterChatRoomController$supportedInterfaceOrientations)(_LOGOS_SELF_TYPE_NORMAL LLFilterChatRoomController* _LOGOS_SELF_CONST, SEL); static UIInterfaceOrientationMask _logos_method$_ungrouped$LLFilterChatRoomController$supportedInterfaceOrientations(_LOGOS_SELF_TYPE_NORMAL LLFilterChatRoomController* _LOGOS_SELF_CONST, SEL); 

#line 1 "/Users/linden/Documents/GitHub/WeChatPlugin-iOS/WeChatDylib/RedEnvelop/LLFilterChatRoomController.xm"
#import "WCRedEnvelopesHelper.h"


static char _logos_property_key$_ungrouped$LLFilterChatRoomController$filterRoomDic;__attribute__((used)) static NSMutableDictionary * _logos_method$_ungrouped$LLFilterChatRoomController$filterRoomDic$(LLFilterChatRoomController* __unused self, SEL __unused _cmd){ return objc_getAssociatedObject(self, &_logos_property_key$_ungrouped$LLFilterChatRoomController$filterRoomDic); }__attribute__((used)) static void _logos_method$_ungrouped$LLFilterChatRoomController$setFilterRoomDic$(LLFilterChatRoomController* __unused self, SEL __unused _cmd, NSMutableDictionary * arg){ objc_setAssociatedObject(self, &_logos_property_key$_ungrouped$LLFilterChatRoomController$filterRoomDic, arg, OBJC_ASSOCIATION_RETAIN_NONATOMIC); }

static void _logos_method$_ungrouped$LLFilterChatRoomController$viewDidLoad(_LOGOS_SELF_TYPE_NORMAL LLFilterChatRoomController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd){
	_logos_orig$_ungrouped$LLFilterChatRoomController$viewDidLoad(self, _cmd);

	[self setNavigationBar];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.25 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self commonInit];
    });
}

static void _logos_method$_ungrouped$LLFilterChatRoomController$initSearchBar(_LOGOS_SELF_TYPE_NORMAL LLFilterChatRoomController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd){
	
}


static void _logos_method$_ungrouped$LLFilterChatRoomController$commonInit(_LOGOS_SELF_TYPE_NORMAL LLFilterChatRoomController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd){
	MMTableView *tableView = MSHookIvar<MMTableView *>(self,"m_tableView");
	[tableView setEditing:YES animated:YES];

	MemberDataLogic *memberData = MSHookIvar<MemberDataLogic *>(self,"m_memberData");
	NSUInteger sectionCount = [memberData getSectionCount];
	[self.filterRoomDic enumerateKeysAndObjectsUsingBlock:^(NSString *  _Nonnull usrName, NSString *  _Nonnull aliasName, BOOL * _Nonnull stop) {
        BOOL isBreak = NO;
    	for(int i = 0; i < sectionCount; i++){
    		NSUInteger rowCount = [memberData getSectionItemCount:i];
    		for(int j = 0; j < rowCount; j++){
    			CContact *contact = [memberData getItemInSection:i atRow:j];
    			if([contact.m_nsUsrName isEqualToString:usrName]){
                    isBreak = YES;
    				[tableView selectRowAtIndexPath:[NSIndexPath indexPathForRow:j inSection:i] animated:YES scrollPosition:UITableViewScrollPositionNone];
                    break;
    			}
    		}
            if(isBreak){
                break;
            }
    	}
    }];
}


static void _logos_method$_ungrouped$LLFilterChatRoomController$setNavigationBar(_LOGOS_SELF_TYPE_NORMAL LLFilterChatRoomController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd){
    self.title = @"过滤群聊设置";
    
    UIBarButtonItem *confirmItem = [NSClassFromString(@"MMUICommonUtil") getBarButtonWithTitle:@"确定" target:self action:@selector(clickConfirmItem) style:0 color:[UIColor whiteColor]];
    self.navigationItem.rightBarButtonItem = confirmItem;
}


static void _logos_method$_ungrouped$LLFilterChatRoomController$clickConfirmItem(_LOGOS_SELF_TYPE_NORMAL LLFilterChatRoomController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd){
	MMTableView *tableView = MSHookIvar<MMTableView *>(self,"m_tableView");
	MemberDataLogic *memberData = MSHookIvar<MemberDataLogic *>(self,"m_memberData");
	NSMutableDictionary *filterRoomDic = [NSMutableDictionary dictionary];
	[[tableView indexPathsForSelectedRows] enumerateObjectsUsingBlock:^(NSIndexPath * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
		CContact *contact = [memberData getItemInSection:obj.section atRow:obj.row];
        if(contact.m_nsUsrName){
        	[filterRoomDic setObject:contact.m_nsAliasName?:@"alias" forKey:contact.m_nsUsrName];
        }
    }];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"kConfirmFilterChatRoomNotification" object:filterRoomDic];
    [self.navigationController popViewControllerAnimated:YES];
}

static void _logos_method$_ungrouped$LLFilterChatRoomController$didSelectRowAtIndexPath$(_LOGOS_SELF_TYPE_NORMAL LLFilterChatRoomController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, NSIndexPath * indexPath){
	
}

static BOOL _logos_method$_ungrouped$LLFilterChatRoomController$tableView$canEditRowAtIndexPath$(_LOGOS_SELF_TYPE_NORMAL LLFilterChatRoomController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, UITableView * tableView, NSIndexPath * indexPath){
    return NO;
}

static long _logos_method$_ungrouped$LLFilterChatRoomController$tableView$editingStyleForRowAtIndexPath$(_LOGOS_SELF_TYPE_NORMAL LLFilterChatRoomController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, UITableView * tableView, NSIndexPath * indexPath){
    return UITableViewCellEditingStyleDelete | UITableViewCellEditingStyleInsert;
}


static BOOL _logos_method$_ungrouped$LLFilterChatRoomController$shouldAutorotate(_LOGOS_SELF_TYPE_NORMAL LLFilterChatRoomController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    return NO;
}


static UIInterfaceOrientationMask _logos_method$_ungrouped$LLFilterChatRoomController$supportedInterfaceOrientations(_LOGOS_SELF_TYPE_NORMAL LLFilterChatRoomController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    return UIInterfaceOrientationMaskPortrait;
}


static __attribute__((constructor)) void _logosLocalInit() {
{Class _logos_class$_ungrouped$ChatRoomListViewController = objc_getClass("ChatRoomListViewController"); { Class _logos_class$_ungrouped$LLFilterChatRoomController = objc_allocateClassPair(_logos_class$_ungrouped$ChatRoomListViewController, "LLFilterChatRoomController", 0); objc_registerClassPair(_logos_class$_ungrouped$LLFilterChatRoomController); MSHookMessageEx(_logos_class$_ungrouped$LLFilterChatRoomController, @selector(viewDidLoad), (IMP)&_logos_method$_ungrouped$LLFilterChatRoomController$viewDidLoad, (IMP*)&_logos_orig$_ungrouped$LLFilterChatRoomController$viewDidLoad);MSHookMessageEx(_logos_class$_ungrouped$LLFilterChatRoomController, @selector(initSearchBar), (IMP)&_logos_method$_ungrouped$LLFilterChatRoomController$initSearchBar, (IMP*)&_logos_orig$_ungrouped$LLFilterChatRoomController$initSearchBar);{ char _typeEncoding[1024]; unsigned int i = 0; _typeEncoding[i] = 'v'; i += 1; _typeEncoding[i] = '@'; i += 1; _typeEncoding[i] = ':'; i += 1; _typeEncoding[i] = '\0'; class_addMethod(_logos_class$_ungrouped$LLFilterChatRoomController, @selector(commonInit), (IMP)&_logos_method$_ungrouped$LLFilterChatRoomController$commonInit, _typeEncoding); }{ char _typeEncoding[1024]; unsigned int i = 0; _typeEncoding[i] = 'v'; i += 1; _typeEncoding[i] = '@'; i += 1; _typeEncoding[i] = ':'; i += 1; _typeEncoding[i] = '\0'; class_addMethod(_logos_class$_ungrouped$LLFilterChatRoomController, @selector(setNavigationBar), (IMP)&_logos_method$_ungrouped$LLFilterChatRoomController$setNavigationBar, _typeEncoding); }{ char _typeEncoding[1024]; unsigned int i = 0; _typeEncoding[i] = 'v'; i += 1; _typeEncoding[i] = '@'; i += 1; _typeEncoding[i] = ':'; i += 1; _typeEncoding[i] = '\0'; class_addMethod(_logos_class$_ungrouped$LLFilterChatRoomController, @selector(clickConfirmItem), (IMP)&_logos_method$_ungrouped$LLFilterChatRoomController$clickConfirmItem, _typeEncoding); }MSHookMessageEx(_logos_class$_ungrouped$LLFilterChatRoomController, @selector(didSelectRowAtIndexPath:), (IMP)&_logos_method$_ungrouped$LLFilterChatRoomController$didSelectRowAtIndexPath$, (IMP*)&_logos_orig$_ungrouped$LLFilterChatRoomController$didSelectRowAtIndexPath$);MSHookMessageEx(_logos_class$_ungrouped$LLFilterChatRoomController, @selector(tableView:canEditRowAtIndexPath:), (IMP)&_logos_method$_ungrouped$LLFilterChatRoomController$tableView$canEditRowAtIndexPath$, (IMP*)&_logos_orig$_ungrouped$LLFilterChatRoomController$tableView$canEditRowAtIndexPath$);MSHookMessageEx(_logos_class$_ungrouped$LLFilterChatRoomController, @selector(tableView:editingStyleForRowAtIndexPath:), (IMP)&_logos_method$_ungrouped$LLFilterChatRoomController$tableView$editingStyleForRowAtIndexPath$, (IMP*)&_logos_orig$_ungrouped$LLFilterChatRoomController$tableView$editingStyleForRowAtIndexPath$);MSHookMessageEx(_logos_class$_ungrouped$LLFilterChatRoomController, @selector(shouldAutorotate), (IMP)&_logos_method$_ungrouped$LLFilterChatRoomController$shouldAutorotate, (IMP*)&_logos_orig$_ungrouped$LLFilterChatRoomController$shouldAutorotate);MSHookMessageEx(_logos_class$_ungrouped$LLFilterChatRoomController, @selector(supportedInterfaceOrientations), (IMP)&_logos_method$_ungrouped$LLFilterChatRoomController$supportedInterfaceOrientations, (IMP*)&_logos_orig$_ungrouped$LLFilterChatRoomController$supportedInterfaceOrientations);{ class_addMethod(_logos_class$_ungrouped$LLFilterChatRoomController, @selector(filterRoomDic), (IMP)&_logos_method$_ungrouped$LLFilterChatRoomController$filterRoomDic$, [[NSString stringWithFormat:@"%s@:", @encode(NSMutableDictionary *)] UTF8String]);class_addMethod(_logos_class$_ungrouped$LLFilterChatRoomController, @selector(setFilterRoomDic:), (IMP)&_logos_method$_ungrouped$LLFilterChatRoomController$setFilterRoomDic$, [[NSString stringWithFormat:@"v@:%s", @encode(NSMutableDictionary *)] UTF8String]);}  }} }
#line 91 "/Users/linden/Documents/GitHub/WeChatPlugin-iOS/WeChatDylib/RedEnvelop/LLFilterChatRoomController.xm"
