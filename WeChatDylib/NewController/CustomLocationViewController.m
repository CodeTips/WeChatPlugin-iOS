//
//  CustomLocationViewController.m
//  WeChatPri
//
//  Created by Lorwy on 2017/9/15.
//  Copyright © 2017年 Lorwy. All rights reserved.
//

#import "CustomLocationViewController.h"
#import <objc/objc-runtime.h>
#import "WeChatPriConfigCenter.h"
#import "WeChatRedEnvelop.h"
#import <CoreLocation/CoreLocation.h>

@interface CustomLocationViewController ()

@property (nonatomic, strong) MMTableViewInfo *tableViewInfo;
@property (nonatomic, strong) NSMutableArray *loactionArray;

@end

@implementation CustomLocationViewController

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        _tableViewInfo = [[objc_getClass("MMTableViewInfo") alloc] initWithFrame:[UIScreen mainScreen].bounds style:UITableViewStyleGrouped];
        _tableViewInfo.delegate = self;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    [self initData];
    [self initTitle];
    [self reloadTableData];
    
    MMTableView *tableView = [self.tableViewInfo getTableView];
    [self.view addSubview:tableView];
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    [self stopLoading];
}

- (void)initData {
    self.loactionArray = ({
        NSMutableArray *array = [[WeChatPriConfigCenter sharedInstance] customLocationArray];
        NSMutableArray *copyArray;
        if (array == nil) {
            copyArray = [NSMutableArray array];
        } else {
            copyArray = [NSMutableArray arrayWithArray:array];
        }
        
        copyArray;
    });
}

- (void)initTitle {
    self.title = @"自定义位置";
    self.navigationItem.leftBarButtonItem = [objc_getClass("MMUICommonUtil") getBarButtonWithTitle:@"返回" target:self action:@selector(onBack) style:3];
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSFontAttributeName: [UIFont boldSystemFontOfSize:18.0]}];
}

- (void)onBack {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)reloadTableData {
    [self.tableViewInfo clearAllSection];
    [self addLocationSettingSection];
    if (self.loactionArray.count > 0) {
        [self addLocationListSection];
    }
    MMTableView *tableView = [self.tableViewInfo getTableView];
    [tableView reloadData];
}


// MARK: 自定义经纬度的
- (void)addLocationSettingSection {
    MMTableViewSectionInfo *sectionInfo = [objc_getClass("MMTableViewSectionInfo") sectionInfoHeader:nil Footer:nil];
    
    [sectionInfo addCell:[self createLocationSwichCell]];
    [sectionInfo addCell:[self addLocationCell]];
    
    [self.tableViewInfo addSection:sectionInfo];
}

// 开启自定义位置功能开关
- (MMTableViewCellInfo *)createLocationSwichCell {
    return [objc_getClass("MMTableViewCellInfo") switchCellForSel:@selector(switchLocation:) target:self title:@"自定义位置" on:[WeChatPriConfigCenter sharedInstance].customLocation];
}

- (void)switchLocation:(UISwitch *)envelopSwitch {
    [WeChatPriConfigCenter sharedInstance].customLocation = envelopSwitch.on;
    [self reloadTableData];
}

- (MMTableViewCellInfo *)addLocationCell {
    MMTableViewCellInfo *addLocationCell = [objc_getClass("MMTableViewCellInfo") normalCellForSel:@selector(addLocation) target:self title:@"新增地点" accessoryType:1];
    return addLocationCell;
}

- (void)addLocation {
    // 弹出新增
    [self showSetLocationAlert];
}

// 位置列表
- (void)addLocationListSection {
    MMTableViewSectionInfo *sensitiveTextSection = [objc_getClass("MMTableViewSectionInfo") sectionInfoHeader:@"位置列表" Footer:nil];
    
    [self.loactionArray enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [sensitiveTextSection addCell:[self createLocationCellWithIndex:idx andText:obj]];
    }];
    
    [self.tableViewInfo addSection:sensitiveTextSection];
}

- (MMTableViewCellInfo *)createLocationCellWithIndex:(NSUInteger)index andText:(NSDictionary *)model {
    MMTableViewCellInfo *cellInfo = [objc_getClass("MMTableViewCellInfo")  normalCellForSel:@selector(selectLocation:) target:self title:model[@"name"] accessoryType:1];
    cellInfo.userInfo = @{@"index" : @(index),@"model":model};
    cellInfo.editStyle = UITableViewCellEditingStyleDelete;
    
    return cellInfo;
}

- (void)selectLocation:(MMTableViewCellInfo *)agr {
    NSDictionary * inModel = agr.userInfo[@"model"];
    [WeChatPriConfigCenter sharedInstance].customLat = inModel[@"lat"];
    [WeChatPriConfigCenter sharedInstance].customLng = inModel[@"lng"];
    [TKToast toast:[NSString stringWithFormat:@"成功设置位置为:%@",inModel[@"name"]] delay:2];
}

- (void)commitEditingForRowAtIndexPath:(NSIndexPath *)arg1 Cell:(MMTableViewCellInfo *)arg2 {
    [self.loactionArray removeObjectAtIndex:arg1.row];
    [WeChatPriConfigCenter saveConfigCenter];
    MMTableViewSectionInfo *locationListSection = [self.tableViewInfo getSectionAt:1];
    [locationListSection removeCellAt:arg1.row];
    [self reloadTableData];
}

#pragma mark - manual define functions
- (void)showSetLocationAlert {
    NSString *title = @"新增地点";
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:title message:nil preferredStyle:UIAlertControllerStyleAlert];
    
    //Latitude and longitude textField
    [alert addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        textField.placeholder = @"地点名称";
        textField.text = @"未知";
    }];
    [alert addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        textField.placeholder = @"经度";
        textField.text = @"35.707013";
    }];
    [alert addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        textField.placeholder = @"纬度";
        textField.text = @"139.730562";
    }];
    
    //Actions
    [alert addAction:[UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:nil]];
    __weak __typeof__(self) weakSelf = self;
    [alert addAction:[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        __strong __typeof__(weakSelf) strongSelf = weakSelf;
        NSString *name = alert.textFields[0].text;
        NSString *lat = alert.textFields[1].text;
        NSString *lng = alert.textFields[2].text;
        if ([name isEqualToString:@"未知"]) {
            // 开启定位获取位置
            [strongSelf startLoadingWithText:@"获取位置名称"];
            CLGeocoder *clGeoCoder = [[CLGeocoder alloc] init];
            CLLocation *newLocation = [[CLLocation alloc] initWithLatitude:lat.doubleValue longitude:lng.doubleValue];
            [clGeoCoder reverseGeocodeLocation:newLocation completionHandler: ^(NSArray *placemarks,NSError *error) {
                __strong __typeof__(weakSelf) strongSelf = weakSelf;
                NSMutableDictionary *inModel = [NSMutableDictionary new];
                [strongSelf stopLoading];
                if (!error) {
                    for (CLPlacemark *placeMark in placemarks)
                    {
                        NSDictionary *addressDic = placeMark.addressDictionary;
                        
                        NSArray *array = (NSArray *)[addressDic objectForKey:@"FormattedAddressLines"];
                        if (VALID_ARRAY(array)) {
                            NSString *address = [array firstObject];
                            [inModel setObject:address forKey:@"name"];
                            [inModel setObject:lat forKey:@"lat"];
                            [inModel setObject:lng forKey:@"lng"];
                        }
                    }
                }else {
                    [inModel setObject:name forKey:@"name"];
                    [inModel setObject:lat forKey:@"lat"];
                    [inModel setObject:lng forKey:@"lng"];
                }
                [strongSelf.loactionArray addObject:inModel];
                [[WeChatPriConfigCenter sharedInstance].customLocationArray addObject:inModel];
                [WeChatPriConfigCenter saveConfigCenter];
                [strongSelf reloadTableData];
            }];
            
        } else {
            NSMutableDictionary *inModel = [NSMutableDictionary new];
            [inModel setObject:name forKey:@"name"];
            [inModel setObject:lat forKey:@"lat"];
            [inModel setObject:lng forKey:@"lng"];
            [strongSelf.loactionArray addObject:inModel];
            [[WeChatPriConfigCenter sharedInstance].customLocationArray addObject:inModel];
            [WeChatPriConfigCenter saveConfigCenter];
            [strongSelf reloadTableData];
        }
    }]];
    
    [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:alert animated:YES completion:nil];
}




@end
