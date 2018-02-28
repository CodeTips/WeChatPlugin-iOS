#import "WCRedEnvelopesHelper.h"
%subclass LLFilterChatRoomController : ChatRoomListViewController

%property (nonatomic, retain) NSMutableDictionary *filterRoomDic;

- (void)viewDidLoad{
	%orig;

	[self setNavigationBar];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.25 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self commonInit];
    });
}

- (void)initSearchBar{
	
}

%new
- (void)commonInit{
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

%new
- (void)setNavigationBar{
    self.title = @"过滤群聊设置";
    
    UIBarButtonItem *confirmItem = [NSClassFromString(@"MMUICommonUtil") getBarButtonWithTitle:@"确定" target:self action:@selector(clickConfirmItem) style:0 color:[UIColor whiteColor]];
    self.navigationItem.rightBarButtonItem = confirmItem;
}

%new
- (void)clickConfirmItem{
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

- (void)didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
	
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath{
    return NO;
}

- (long)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath{
    return UITableViewCellEditingStyleDelete | UITableViewCellEditingStyleInsert;
}

- (BOOL)shouldAutorotate
{
    return NO;
}

-(UIInterfaceOrientationMask)supportedInterfaceOrientations
{
    return UIInterfaceOrientationMaskPortrait;
}

%end
