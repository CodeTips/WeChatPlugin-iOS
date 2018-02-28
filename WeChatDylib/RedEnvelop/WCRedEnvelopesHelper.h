#import <CoreLocation/CoreLocation.h>

@interface WCPayInfoItem: NSObject
@property(nonatomic) unsigned int m_sceneId; // @synthesize m_sceneId;
@property(nonatomic) unsigned int m_uiPaySubType; // @synthesize m_uiPaySubType;
@property(retain, nonatomic) NSString *m_nsPayMsgID; // @synthesize m_nsPayMsgID;
@property(retain, nonatomic) NSString *m_c2cNativeUrl;
- (NSString *)m_nsPayMsgID;
@end

#pragma mark - Message

@interface CMessageWrap : NSObject

@property(nonatomic) unsigned int m_uiMessageType; // @synthesize m_uiMessageType;
@property(retain, nonatomic) NSString *m_nsContent; // @synthesize m_nsContent;
@property(nonatomic) long long m_n64MesSvrID; // @synthesize m_n64MesSvrID;
@property(nonatomic) unsigned int m_uiMesLocalID; // @synthesize m_uiMesLocalID;
@property(nonatomic) unsigned int m_uiCreateTime; // @synthesize m_uiCreateTime;
@property(retain, nonatomic) NSString *m_nsFromUsr; // @synthesize m_nsFromUsr;
@property(retain, nonatomic) NSString *m_nsToUsr; // @synthesize m_nsToUsr;
@property(retain, nonatomic) WCPayInfoItem *m_oWCPayInfoItem; // @dynamic m_oWCPayInfoItem;
@property(nonatomic) unsigned int m_uiAppMsgInnerType; // @dynamic m_uiAppMsgInnerType;
@property (assign, nonatomic) NSUInteger m_uiStatus;
@property (retain, nonatomic) NSString* m_nsRealChatUsr;        ///< 群消息的发信人，具体是群里的哪个人
@property (retain, nonatomic) NSString *m_nsDesc;
@property (retain, nonatomic) NSString *m_nsAppExtInfo;
@property (assign, nonatomic) NSUInteger m_uiAppDataSize;
@property (retain, nonatomic) NSString *m_nsShareOpenUrl;
@property (retain, nonatomic) NSString *m_nsShareOriginUrl;
@property (retain, nonatomic) NSString *m_nsJsAppId;
@property (retain, nonatomic) NSString *m_nsPrePublishId;
@property (retain, nonatomic) NSString *m_nsAppID;
@property (retain, nonatomic) NSString *m_nsAppName;
@property (retain, nonatomic) NSString *m_nsThumbUrl;
@property (retain, nonatomic) NSString *m_nsAppMediaUrl;
@property (retain, nonatomic) NSData *m_dtThumbnail;
@property (retain, nonatomic) NSString *m_nsTitle;
@property (retain, nonatomic) NSString *m_nsMsgSource;

@property (nonatomic, copy) NSString *m_nsLastDisplayContent;
@property (nonatomic, copy) NSString *m_nsPushContent;

@property(nonatomic) unsigned int m_uiGameType;     // 游戏类型
@property(nonatomic) unsigned int m_uiGameContent;  // 游戏内容

- (id)initWithMsgType:(long long)arg1;
- (WCPayInfoItem *)m_oWCPayInfoItem;
- (id)nativeUrl;
- (NSString *)wishingString;
- (BOOL)IsSendBySendMsg;
+ (BOOL)isSenderFromMsgWrap:(CMessageWrap *)msgWrap;

@end




@interface CBaseContact : NSObject

@property(retain, nonatomic) NSString *m_nsAliasName; // @synthesize m_nsAliasName;
@property(retain, nonatomic) NSString *m_nsUsrName; // @synthesize m_nsUsrName;
@property(nonatomic) unsigned int m_uiSex; // @synthesize m_uiSex;
@property(retain, nonatomic) NSString *m_nsHeadImgUrl; // @synthesize m_nsHeadImgUrl;
@property (nonatomic, copy) NSString *m_nsOwner;                        // 拥有者
@property (nonatomic, copy) NSString *m_nsMemberName;
@property (nonatomic, copy) NSString *m_nsEncodeUserName;                // 微信用户名转码
@property (nonatomic, assign) int m_uiFriendScene;                       // 是否是自己的好友(非订阅号、自己)
@property (nonatomic,assign) BOOL m_isPlugin;                            // 是否为微信插件

- (BOOL)isChatroom;
- (_Bool)isEqualToContact:(id)arg1;
- (id)getContactDisplayName;
- (id)getChatRoomMemberWithoutMyself:(id)arg1;
@end

@interface CContact: CBaseContact

@property (nonatomic, copy) NSString *m_nsNickName;                     // 用户昵称
@end

@interface CContactMgr: NSObject

- (id)getContactByName:(id)arg1;
- (id)getAllContactUserName;
- (id)getSelfContact;
- (id)getContactForSearchByName:(id)arg1;
- (_Bool)getContactsFromServer:(id)arg1;
- (_Bool)isInContactList:(id)arg1;
- (_Bool)addLocalContact:(id)arg1 listType:(unsigned int)arg2;
- (id)getContactList:(unsigned int)arg1 contactType:(unsigned int)arg2;

@end

@interface MMSessionInfo : NSObject

@property(retain, nonatomic) CMessageWrap *m_msgWrap; // @synthesize m_msgWrap;
@property(retain, nonatomic) CContact *m_contact; // @synthesize m_contact;

@end 

@interface UIViewController (ModalView)

- (void)PresentModalViewController:(id)arg1 animated:(_Bool)arg2;
- (void)DismissMyselfAnimated:(_Bool)arg1;

@end

@interface NewMainFrameViewController : UIViewController
{
	UITableView *m_tableView;
}

- (void)tableView:(id)arg1 didSelectRowAtIndexPath:(id)arg2;
- (void)openRedEnvelopes;

@end

@interface BaseMsgContentViewController : UIViewController

{
    UITableView *m_tableView;
}
- (id)tableView:(id)arg1 cellForRowAtIndexPath:(id)arg2;
- (long long)numberOfSectionsInTableView:(id)arg1;
- (void)tapAppNodeView:(id)arg1;
- (CContact *)getChatContact;
- (void)AsyncSendMessage:(NSString *)message;

- (id)GetContact;

- (void)backToWebViewController;

@end

@interface MMUINavigationController : UINavigationController

- (id)initWithRootViewController:(id)arg1;

@end

@interface UINavigationController (LogicController)

- (void)PushViewController:(id)arg1 animated:(_Bool)arg2;

@end

@interface WCRedEnvelopesReceiveControlLogic : NSObject

- (void)OnCommitWCRedEnvelopes:(NSString *)arg1;

@end

@interface WCRedEnvelopesReceiveHomeView : UIView

- (void)OnOpenRedEnvelopes;

@end

@protocol WCRedEnvelopesRedEnvelopesDetailViewControllerDelegate <NSObject>

- (void)OnCommitWCRedEnvelopes:(NSString *)arg1;

@end

@interface WCRedEnvelopesRedEnvelopesDetailViewController : UIViewController

@end

@interface MMTableView: UITableView

- (void)setTableHeaderView:(UIView *)view;

@end

@interface MMUIViewController : UIViewController

- (void)startLoadingBlocked;
- (void)startLoadingNonBlock;
- (void)startLoadingWithText:(NSString *)text;
- (void)stopLoading;
- (void)stopLoadingWithFailText:(NSString *)text;
- (void)stopLoadingWithOKText:(NSString *)text;

@end

@interface MMWindowViewController : MMUIViewController
@end

@interface OnlineDeviceInfoViewController : MMWindowViewController

- (id)makeControlButtonWithTitle:(id)arg1 image:(id)arg2 highlightedImage:(id)arg3 target:(id)arg4 action:(SEL)arg5;
- (void)setupRemoteBtn;

@end

@interface NewSettingViewController: MMUIViewController

- (void)reloadTableData;
- (void)setting;
- (void)simplifySetting;
- (void)groupSetting;

@end

@interface CPushContact : CContact
@property (nonatomic, copy) NSString *m_nsChatRoomUserName;
@property (nonatomic, copy) NSString *m_nsDes;
@property (nonatomic, copy) NSString *m_nsSource;
@property (nonatomic, copy) NSString *m_nsSourceNickName;
@property (nonatomic, copy) NSString *m_nsSourceUserName;
@property (nonatomic, copy) NSString *m_nsTicket;
- (BOOL)isMyContact;
@end

@interface CVerifyContactWrap : NSObject
@property (nonatomic, copy) NSString *m_nsChatRoomUserName;
@property (nonatomic, copy) NSString *m_nsOriginalUsrName;
@property (nonatomic, copy) NSString *m_nsSourceNickName;
@property (nonatomic, copy) NSString *m_nsSourceUserName;
@property (nonatomic, copy) NSString *m_nsTicket;
@property (nonatomic, copy) NSString *m_nsUsrName;
@property (nonatomic, strong) CContact *m_oVerifyContact;
@property (nonatomic, assign) unsigned int m_uiScene;
@property (nonatomic, assign) unsigned int m_uiWCFlag;
@end
@protocol ContactSelectViewDelegate <NSObject>

- (void)onSelectContact:(CContact *)arg1;

@end

@interface SayHelloViewController : UIViewController
@property (nonatomic, strong) SayHelloDataLogic *m_DataLogic;
- (void)OnSayHelloDataVerifyContactOK:(CPushContact *)arg1;
@end

@interface ContactInfoViewController : MMUIViewController

@property(retain, nonatomic) CContact *m_contact; // @synthesize m_contact;

@end

@interface MMTableViewInfo : NSObject

- (void)setDelegate:(id)delegate;
- (id)initWithFrame:(CGRect)frame style:(UITableViewStyle)style;
- (MMTableView *)getTableView;
- (void)clearAllSection;
- (void)addSection:(id)arg1;
- (void)insertSection:(id)arg1 At:(unsigned int)arg2;
- (id)getSectionAt:(int)arg1;

@property(nonatomic,assign) id delegate;

@end

@interface MMTableViewSectionInfo : NSObject

+ (id)sectionInfoDefaut;
- (void)addCell:(id)arg1;
- (void)setHeaderView:(UIView *)headerView;
- (void)setFHeaderHeight:(CGFloat)height;
+ (id)sectionInfoHeader:(id)arg1;
+ (id)sectionInfoHeader:(id)arg1 Footer:(id)arg2;

- (void)removeCellAt:(unsigned long long)arg1;
- (unsigned long long)getCellCount;

@end

@interface MMTableViewUserInfo : NSObject

- (id)getUserInfoValueForKey:(id)arg1;
- (void)addUserInfoValue:(id)arg1 forKey:(id)arg2;

@end

@interface MMTableViewCellInfo : MMTableViewUserInfo

+ (id)editorCellForSel:(SEL)arg1 target:(id)arg2 title:(id)arg3 margin:(double)arg4 tip:(id)arg5 focus:(_Bool)arg6 autoCorrect:(_Bool)arg7 text:(id)arg8 isFitIpadClassic:(_Bool)arg9;
+ (id)normalCellForSel:(SEL)arg1 target:(id)arg2 title:(id)arg3 accessoryType:(long long)arg4;
+ (id)switchCellForSel:(SEL)arg1 target:(id)arg2 title:(id)arg3 on:(_Bool)arg4;
+ (id)normalCellForSel:(SEL)arg1 target:(id)arg2 title:(id)arg3 rightValue:(id)arg4 accessoryType:(long long)arg5;
+ (id)normalCellForTitle:(id)arg1 rightValue:(id)arg2;
+ (id)urlCellForTitle:(id)arg1 url:(id)arg2;
+ (id)editorCellForSel:(SEL)arg1 target:(id)arg2 tip:(id)arg3 focus:(_Bool)arg4 text:(id)arg5;
@property(nonatomic) long long editStyle; // @synthesize editStyle=_editStyle;
@property(retain, nonatomic) id userInfo;

@end

@interface MMUICommonUtil : NSObject

+ (id)getBarButtonWithTitle:(id)arg1 target:(id)arg2 action:(SEL)arg3 style:(int)arg4;
+ (id)getBarButtonWithTitle:(id)arg1 target:(id)arg2 action:(SEL)arg3 style:(int)arg4 color:(id)arg6;
+ (id)getBarButtonWithImageName:(id)arg1 target:(id)arg2 action:(SEL)arg3 style:(int)arg4 accessibility:(id)arg5 useTemplateMode:(_Bool)arg6;

@end

@interface MMWebViewController : UIViewController

- (id)initWithURL:(NSURL *)url presentModal:(BOOL)presentModal extraInfo:(id)extraInfo delegate:(id)delegate;
- (id)initWithURL:(id)arg1 presentModal:(_Bool)arg2 extraInfo:(id)arg3;
-  (void)didReceiveNewMessage;
- (void)backToMsgContentViewController;

@end

@interface WCRedEnvelopesControlData: NSObject

@property(retain, nonatomic) CMessageWrap *m_oSelectedMessageWrap;
- (void)setM_oSelectedMessageWrap:(CMessageWrap *)msgWrap;

@end

@interface MMServiceCenter : NSObject

+ (id)defaultCenter;
- (id)getService:(Class)aClass;

@end

@interface WCRedEnvelopesControlMgr: NSObject 

- (void)startReceiveRedEnvelopesLogic:(UIViewController *)controller Data:(WCRedEnvelopesControlData *)data;
- (unsigned int)startReceiveGreetingRedEnvelopesLogic:(id)arg1 Data:(id)arg2;
- (unsigned int)startReceiveRedEnvelopesLogicByC2C:(id)arg1 Data:(id)arg2;

@end

@interface BaseMsgContentLogicController: NSObject

- (id)initWithLocalID:(unsigned int)arg1 CreateTime:(unsigned int)arg2 ContentViewDisshowStatus:(int)arg3;
- (BaseMsgContentViewController *)getViewController;
- (void)setM_contact:(CContact *)contact;
- (void)setM_dicExtraInfo:(id)info;
- (void)onWillEnterRoom;
- (id)getMsgContentViewController;

@end

@interface MemberDataLogic: NSObject

- (id)initWithMemberList:(id)arg1 admin:(id)arg2;
- (CContact *)getItemInSection:(unsigned long long)arg1 atRow:(unsigned long long)arg2;
- (unsigned long long)getSectionItemCount:(unsigned long long)arg1;
- (unsigned long long)getSectionCount;
- (unsigned long long)getTotalCount;

@end

@protocol ContactsDataLogicDelegate <NSObject>
- (_Bool)onFilterContactCandidate:(CContact *)arg1;
- (void)onContactsDataChange;

@optional
- (void)onContactAsynSearchSectionResultChanged:(NSArray *)arg1 sectionTitles:(NSDictionary *)arg2 sectionResults:(NSDictionary *)arg3;
- (void)onContactsDataNeedChange;
@end

@interface ContactsDataLogic: NSObject

@property(nonatomic) unsigned int m_uiScene; // @synthesize m_uiScene;

- (id)initWithScene:(unsigned int)arg1 delegate:(id)arg2 sort:(_Bool)arg3 extendChatRoom:(_Bool)arg4;
- (id)getChatRoomContacts;
- (id)getKeysArray;
- (BOOL)reloadContacts;
- (BOOL)hasHistoryGroupContacts;
- (id)getContactsArrayWith:(id)arg1;
- (id)initWithScene:(unsigned int)arg1 delegate:(id)arg2 sort:(BOOL)arg3;

@end

@interface MemberListViewController: UIViewController

@end

@interface ChatRoomListViewController: MemberListViewController

- (void)setMemberLogic:(MemberDataLogic *)logic;

@end

@interface LLFilterChatRoomController: ChatRoomListViewController

@property (nonatomic, strong) NSMutableDictionary *filterRoomDic; //过滤群组字典
@property (nonatomic, copy) void (^onConfirmSelectFilterRoom)(NSMutableDictionary *filterRoomDic);

- (void)setNavigationBar;
- (void)commonInit;
- (void)clickConfirmItem;
@end

@interface CAppViewControllerManager: NSObject

+ (UITabBarController *)getTabBarController;
+ (UINavigationController *)getCurrentNavigationController;

@end

@interface POIInfo : NSObject <NSCoding>

@property(retain, nonatomic) NSString *infoUrl; // @synthesize infoUrl=_infoUrl;
@property(retain, nonatomic) NSString *poiName; // @synthesize poiName=_poiName;
@property(retain, nonatomic) NSString *address; // @synthesize address=_address;
@property(retain, nonatomic) NSString *bid; // @synthesize bid=_bid;
@property(nonatomic) double scale; // @synthesize scale=_scale;
@property(nonatomic) struct CLLocationCoordinate2D coordinate; // @synthesize coordinate=_coordinate;

@end

@interface QMapView : UIView

@property(nonatomic) struct CLLocationCoordinate2D centerCoordinate;

@end

@protocol MMPickLocationViewControllerDelegate

@optional
- (UIBarButtonItem *)onGetRightBarButton;
- (void)onCancelSeletctedLocation;
@end

@interface MMPickLocationViewController : UIViewController

@property (nonatomic, weak) id <MMPickLocationViewControllerDelegate> delegate; // @synthesize delegate=_delegate;

- (id)initWithScene:(unsigned int)arg1 OnlyUseUserLocation:(_Bool)arg2;
- (id)getCurrentPOIInfo;
- (void)reportOnDone;

@end
@interface SettingBaseViewController : MMUIViewController

@end
@interface SettingDiscoverEntranceViewController : SettingBaseViewController

@end
