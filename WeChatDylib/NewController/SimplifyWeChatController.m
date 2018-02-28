//
//  SimplifyWeChatController.m
//  WeChatPri
//
//  Created by Lorwy on 2017/8/7.
//  Copyright © 2017年 Lorwy. All rights reserved.
//

#import "SimplifyWeChatController.h"
#import <objc/objc-runtime.h>
#import "WBMultiSelectGroupsViewController.h"
#import "WeChatPriConfigCenter.h"
#import "WeChatRedEnvelop.h"
#import "CustomLocationViewController.h"
#import "RemoteControlManager.h"
#import "LLRedEnvelopesMgr.h"

@interface SimplifyWeChatController ()

@property (nonatomic, strong) MMTableViewInfo *tableViewInfo;

@end

@implementation SimplifyWeChatController

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        _tableViewInfo = [[objc_getClass("MMTableViewInfo") alloc] initWithFrame:[self viewFrame] style:UITableViewStyleGrouped];
    }
    return self;
}

- (CGRect)viewFrame {
    CGRect f = [UIScreen mainScreen].bounds;
    f.size.height -= 34;
    return f;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    [self initTitle];
    [self reloadTableData];
    
    MMTableView *tableView = [self.tableViewInfo getTableView];
    [self.view addSubview:tableView];
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    
    [self stopLoading];
}

- (void)initTitle {
    self.title = @"功能开关";
    
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSFontAttributeName: [UIFont boldSystemFontOfSize:18.0]}];
}

- (void)reloadTableData {
    [self.tableViewInfo clearAllSection];
    [self addNiubilitySection];
    [self addStepSection];
    
    MMTableView *tableView = [self.tableViewInfo getTableView];
    [tableView reloadData];
}

#pragma mark -  碎片功能
- (void)addNiubilitySection {
    MMTableViewSectionInfo *sectionInfo = [objc_getClass("MMTableViewSectionInfo") sectionInfoHeader:@"小功能" Footer:nil];
    // 选择位置的cell
    MMTableViewCellInfo *setLoactionCell = [objc_getClass("MMTableViewCellInfo") normalCellForSel:@selector(setLoaction) target:self title:@"自定义位置" accessoryType:1];
    [sectionInfo addCell:setLoactionCell];
    // 加一个开启夜间模式的cell
//    MMTableViewCellInfo *nightCellInfo = [objc_getClass("MMTableViewCellInfo") switchCellForSel:@selector(handleNightMode:) target:[WeChatPriConfigCenter sharedInstance] title:@"夜间模式" on:[WeChatPriConfigCenter sharedInstance].isNightMode];
//    [sectionInfo addCell:nightCellInfo];
    
    MMTableViewCellInfo *remoteCellInfo = [objc_getClass("MMTableViewCellInfo") switchCellForSel:@selector(handleRemoteControl:) target:[RemoteControlManager sharedManager] title:@"远程控制" on:[RemoteControlManager sharedManager].isEnableRemoteControl];
    [sectionInfo addCell:remoteCellInfo];
    // 加一个开启步数排行榜页面自动点赞开关的cell
    MMTableViewCellInfo *autoLikeCellInfo = [objc_getClass("MMTableViewCellInfo") switchCellForSel:@selector(handleStepAutoLike:) target:[WeChatPriConfigCenter sharedInstance] title:@"步数排行榜浏览自动点赞" on:[WeChatPriConfigCenter sharedInstance].isStepAutoLike];
    [sectionInfo addCell:autoLikeCellInfo];
    
    // 加一个消息撤回
    MMTableViewCellInfo *revokeMessageCellInfo = [objc_getClass("MMTableViewCellInfo") switchCellForSel:@selector(openAvoidRevokeMessageSwitchHandler:) target:[LLRedEnvelopesMgr shared] title:@"防止好友撤回消息" on:[LLRedEnvelopesMgr shared].isOpenAvoidRevokeMessage];
    [sectionInfo addCell:revokeMessageCellInfo];
    // 加一个开启webpage消息提醒的开关
    MMTableViewCellInfo *showMsgInWebPageCellInfo = [objc_getClass("MMTableViewCellInfo") switchCellForSel:@selector(handleShowMsgInWebPage:) target:[WeChatPriConfigCenter sharedInstance] title:@"聊天网页无缝切换" on:[WeChatPriConfigCenter sharedInstance].isShowMsgInWebPage];
    [sectionInfo addCell:showMsgInWebPageCellInfo];
    
    // 加一个朋友圈自动点赞
    MMTableViewCellInfo *autoUpvoteCellInfo = [objc_getClass("MMTableViewCellInfo") switchCellForSel:@selector(handleAutoUpvote:) target:[WeChatPriConfigCenter sharedInstance] title:@"朋友圈点赞" on:[WeChatPriConfigCenter sharedInstance].isAutoUpvote];
    [sectionInfo addCell:autoUpvoteCellInfo];
    
    [self.tableViewInfo addSection:sectionInfo];
}


#pragma mark - 自定义步数
- (void)addStepSection {
    MMTableViewSectionInfo *sectionInfo = [objc_getClass("MMTableViewSectionInfo") sectionInfoHeader:@"自定义运动步数" Footer:nil];
    [sectionInfo addCell:[self createStepSwichCell]];
    if ([WeChatPriConfigCenter sharedInstance].customStep) {
        [sectionInfo addCell:[self createStepTextFieldCell]];
    }
    [self.tableViewInfo addSection:sectionInfo];
}

- (MMTableViewCellInfo *)createStepSwichCell {
    return [objc_getClass("MMTableViewCellInfo") switchCellForSel:@selector(switchStep:) target:self title:@"自定义步数" on:[WeChatPriConfigCenter sharedInstance].customStep];
}

- (void)switchStep:(UISwitch *)switchSender {
    [WeChatPriConfigCenter sharedInstance].customStep = switchSender.on;
    [self reloadTableData];
}

- (MMTableViewCellInfo *)createStepTextFieldCell {
    // 加一个输入步数的cell
    MMTableViewCellInfo *stepcountCellInfo = [objc_getClass("MMTableViewCellInfo") editorCellForSel:@selector(handleStepCount:)
                                                                                             target:[WeChatPriConfigCenter sharedInstance]
                                                                                                tip:@"请输入步数"
                                                                                              focus:NO
                                                                                               text:[NSString stringWithFormat:@"%ld", (long)[WeChatPriConfigCenter sharedInstance].stepCount]];
    return stepcountCellInfo;
}
#pragma mark - 自定义经纬度的
- (void)addLocationSettingSection {
    MMTableViewSectionInfo *sectionInfo = [objc_getClass("MMTableViewSectionInfo") sectionInfoHeader:@"自定义位置(输入完成需要点键盘上的完成按钮)" Footer:nil];
    [sectionInfo addCell:[self createLocationSwichCell]];
    if ([WeChatPriConfigCenter sharedInstance].customLocation) {
        [sectionInfo addCell:[self createLocationLatSwichCell]];
        [sectionInfo addCell:[self createLocationLngSwichCell]];
    }
    [self.tableViewInfo addSection:sectionInfo];
}

- (MMTableViewCellInfo *)createLocationSwichCell {
    return [objc_getClass("MMTableViewCellInfo") switchCellForSel:@selector(switchLocation:) target:self title:@"自定义位置" on:[WeChatPriConfigCenter sharedInstance].customLocation];
}

- (void)switchLocation:(UISwitch *)envelopSwitch {
    [WeChatPriConfigCenter sharedInstance].customLocation = envelopSwitch.on;
    [self reloadTableData];
}

- (MMTableViewCellInfo *)createLocationLatSwichCell {
    MMTableViewCellInfo *latCellInfo = [objc_getClass("MMTableViewCellInfo") editorCellForSel:@selector(handleCustomLat:) target:[WeChatPriConfigCenter sharedInstance] tip:@"经度" focus:NO text:[WeChatPriConfigCenter sharedInstance].customLat];
    return latCellInfo;
}

- (MMTableViewCellInfo *)createLocationLngSwichCell {
    MMTableViewCellInfo *lngCellInfo = [objc_getClass("MMTableViewCellInfo") editorCellForSel:@selector(handleCustomLng:) target:[WeChatPriConfigCenter sharedInstance] tip:@"纬度" focus:NO text:[WeChatPriConfigCenter sharedInstance].customLng];
    return lngCellInfo;
}

- (void)setLoaction {
    CustomLocationViewController *customVC = [CustomLocationViewController new];
    [self.navigationController pushViewController:customVC animated:YES];
}

@end
