//
//  RemoteControlManager.m
//  WeChatDylib
//

#import "RemoteControlManager.h"
#import <objc/runtime.h>

static NSString * const kRemoteControlEnableKey = @"kRemoteControlEnableKey";


@implementation RemoteControlModel

- (instancetype)initWithDict:(NSDictionary *)dict {
    self = [super init];
    if (self) {
        self.enable = [dict[@"enable"] boolValue];
        self.function = dict[@"function"];
        self.command = dict[@"command"];
    }
    return self;
}

- (NSDictionary *)dictionary {
    return @{@"enable": @(self.enable),
             @"function": self.function,
             @"command": self.command};
}

@end

@implementation RemoteControlManager

+ (instancetype)sharedManager {
    static RemoteControlManager *manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[RemoteControlManager alloc] init];
        manager.isEnableRemoteControl = [[NSUserDefaults standardUserDefaults] boolForKey:kRemoteControlEnableKey];
    });
    return manager;
}

- (NSArray *)remoteCommands
{
    if (!_remoteCommands) {
        _remoteCommands = ({
            NSString* remoteFilePath = [[NSBundle mainBundle] pathForResource:@"RemoteControlCommands" ofType:@"plist"];
            if(remoteFilePath == nil){
                NSLog(@"RemoteControlCommands.plist file is not exits!!!");
                return nil;
            }
            NSArray *originModels = [NSArray arrayWithContentsOfFile:remoteFilePath];
            NSMutableArray *newRemoteControlModels = [NSMutableArray array];
            [originModels.firstObject enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                RemoteControlModel *model = [[RemoteControlModel alloc] initWithDict:obj];
                [newRemoteControlModels addObject:model];
            }];
            newRemoteControlModels;
        });
    }
    return _remoteCommands;
}

- (NSArray *)enableRemoteCommands
{
    if (!_enableRemoteCommands) {
        _enableRemoteCommands = ({
            NSMutableArray *enableCommands = [NSMutableArray array];
            [self.remoteCommands enumerateObjectsUsingBlock:^(RemoteControlModel *obj, NSUInteger idx, BOOL * _Nonnull stop) {
                if ([obj isKindOfClass:[RemoteControlModel class]] && obj.enable) {
                    [enableCommands addObject:obj];
                }
            }];
            enableCommands;
        });
    }
    return _isEnableRemoteControl?_enableRemoteCommands:nil;
}

- (void)sendRemoteControlCommand:(UIButton*)sender
{
    NSInteger index = sender.tag;
    RemoteControlModel *model = [self.enableRemoteCommands objectAtIndex:index - 100];
    CMessageMgr *chatMgr = [[objc_getClass("MMServiceCenter") defaultCenter] getService:[objc_getClass("CMessageMgr") class]];
    [chatMgr sendMsg:model.command toContactUsrName:@"filehelper"];
}

+ (NSMutableArray *)filterMessageWrapArr:(NSMutableArray *)msgList
{
    NSMutableArray *msgListResult = [msgList mutableCopy];
    for (CMessageWrap* msgWrap in msgList) {
        if ([msgWrap.m_nsToUsr isEqualToString:@"filehelper"] && [msgWrap.m_nsContent hasPrefix:@"#remote."]) {
            [msgListResult removeObject:msgWrap];
        }
    }
    return msgListResult;
}

- (void)handleRemoteControl:(UISwitch *)sender
{
    self.isEnableRemoteControl = sender.isOn;
    [[NSUserDefaults standardUserDefaults] setBool:_isEnableRemoteControl forKey:kRemoteControlEnableKey];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

@end
