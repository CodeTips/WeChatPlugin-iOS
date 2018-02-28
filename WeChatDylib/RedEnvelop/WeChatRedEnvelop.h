#import <UIKit/UIKit.h>

@class CMessageWrap;

#pragma mark - Util

@interface WCBizUtil : NSObject

+ (id)dictionaryWithDecodedComponets:(id)arg1 separator:(id)arg2;

@end

@interface SKBuiltinBuffer_t : NSObject

@property(retain, nonatomic) NSData *buffer; // @dynamic buffer;

@end

#pragma mark - Manager

@interface MMNewSessionMgr : NSObject
- (unsigned int)GenSendMsgTime;
@end

#pragma mark - Message


@interface FriendAsistSessionMgr : NSObject
- (id)GetLastMessage:(id)arg1 HelloUser:(id)arg2 OnlyTo:(BOOL)arg3;
@end

@interface AutoSetRemarkMgr : NSObject
- (id)GetStrangerAttribute:(id)arg1 AttributeName:(int)arg2;
@end

@interface CMessageMgr : NSObject

- (id)GetMsg:(id)arg1 n64SvrID:(long long)arg2;
- (void)AsyncOnSpecialSession:(id)arg1 MsgList:(id)arg2;
- (id)GetHelloUsers:(id)arg1 Limit:(unsigned int)arg2 OnlyUnread:(BOOL)arg3;

- (void)DelMsg:(id)arg1 MsgList:(id)arg2 DelAll:(_Bool)arg3;
- (void)AddMsg:(id)arg1 MsgWrap:(id)arg2;
- (void)onRevokeMsg:(id)arg1;
- (id)GetMsgByCreateTime:(id)arg1 FromID:(unsigned int)arg2 FromCreateTime:(unsigned int)arg3 Limit:(unsigned int)arg4 LeftCount:(unsigned int *)arg5 FromSequence:(unsigned int)arg6;
- (void)AddLocalMsg:(id)arg1 MsgWrap:(id)arg2 fixTime:(_Bool)arg3 NewMsgArriveNotify:(_Bool)arg4;
- (void)AsyncOnAddMsg:(id)arg1 MsgWrap:(id)arg2;
- (void)MessageReturn:(unsigned int)arg1 MessageInfo:(id)arg2 Event:(unsigned int)arg3;
- (void)UpdateMessage:(id)arg1 MsgWrap:(id)arg2;
- (void)AddEmoticonMsg:(id)arg1 MsgWrap:(id)arg2;

// new
- (void)addAutoVerifyWithArray:(NSArray *)ary arrayType:(TKArrayTpye)type;
- (void)addAutoVerifyWithMessageInfo:(NSDictionary *)info;
- (void)autoReplyWithMessageWrap:(CMessageWrap *)wrap;
- (void)autoReplyChatRoomWithMessageWrap:(CMessageWrap *)wrap;
- (void)sendMsg:(NSString *)msg toContactUsrName:(NSString *)userName;
- (void)welcomeJoinChatRoomWithMessageWrap:(CMessageWrap *)wrap;
- (void)removeMemberWithMessageWrap:(CMessageWrap *)wrap;


@end

@interface CGroupMgr : NSObject
- (BOOL)SetChatRoomDesc:(id)arg1 Desc:(id)arg2 Flag:(unsigned int)arg3;
- (BOOL)CreateGroup:(id)arg1 withMemberList:(id)arg2;
- (_Bool)DeleteGroupMember:(id)arg1 withMemberList:(id)arg2 scene:(unsigned long long)arg3;
@end

@interface MMLanguageMgr: NSObject

- (id)getStringForCurLanguage:(id)arg1 defaultTo:(id)arg2;


@end

#pragma mark - RedEnvelop


@interface WCRedEnvelopesLogicMgr: NSObject

- (void)OpenRedEnvelopesRequest:(id)params;
- (void)ReceiverQueryRedEnvelopesRequest:(id)arg1;
- (void)GetHongbaoBusinessRequest:(id)arg1 CMDID:(unsigned int)arg2 OutputType:(unsigned int)arg3;
- (void)OnWCToHongbaoCommonResponse:(id)arg1 Request:(id)arg2;

/** Added Methods */
- (unsigned int)calculateDelaySeconds;

@end

@interface HongBaoRes : NSObject

@property(retain, nonatomic) SKBuiltinBuffer_t *retText; // @dynamic retText;
@property(nonatomic) int cgiCmdid; // @dynamic cgiCmdid;

@end

@interface HongBaoReq : NSObject

@property(retain, nonatomic) SKBuiltinBuffer_t *reqText; // @dynamic reqText;

@end

#pragma mark - Contact

@interface GroupMember : NSObject
@property(copy, nonatomic) NSString *m_nsNickName;; // @synthesize m_nsNickName;
@property(nonatomic) unsigned int m_uiMemberStatus; // @synthesize m_uiMemberStatus;
@property(copy, nonatomic) NSString *m_nsMemberName; // @synthesize m_nsMemberName;
@end

#pragma mark - QRCode

@interface ScanQRCodeLogicController: NSObject

@property(nonatomic) unsigned int fromScene;
- (id)initWithViewController:(id)arg1 CodeType:(int)arg2;
- (void)tryScanOnePicture:(id)arg1;
- (void)doScanQRCode:(id)arg1;
- (void)showScanResult;

@end

@interface NewQRCodeScanner: NSObject

- (id)initWithDelegate:(id)arg1 CodeType:(int)arg2;
- (void)notifyResult:(id)arg1 type:(id)arg2 version:(int)arg3;

@end

#pragma mark - MMTableView


@interface SettingUtil : NSObject
+ (id)getLocalUsrName:(unsigned int)arg1;
@end

@interface MMLoadingView : UIView

@property(retain, nonatomic) UILabel *m_label; // @synthesize m_label;
@property (assign, nonatomic) BOOL m_bIgnoringInteractionEventsWhenLoading; // @synthesize m_bIgnoringInteractionEventsWhenLoading;

- (void)setFitFrame:(long long)arg1;
- (void)startLoading;
- (void)stopLoading;
- (void)stopLoadingAndShowError:(id)arg1;
- (void)stopLoadingAndShowOK:(id)arg1;


@end

@interface MMTextView : UITextView
@property(retain, nonatomic) NSString *placeholder;
@end


@interface ContactSelectView : UIView

@property(nonatomic) unsigned int m_uiGroupScene; // @synthesize m_uiGroupScene;
@property(nonatomic) _Bool m_bMultiSelect; // @synthesize m_bMultiSelect;
@property(retain, nonatomic) NSMutableDictionary *m_dicMultiSelect; // @synthesize m_dicMultiSelect;

- (id)initWithFrame:(struct CGRect)arg1 delegate:(id)arg2;
- (void)initData:(unsigned int)arg1;
- (void)initView;
- (void)addSelect:(id)arg1;

@property(nonatomic) _Bool m_bShowHistoryGroup; // @synthesize m_bShowHistoryGroup;
@property(nonatomic) _Bool m_bShowRadarCreateRoom; // @synthesize m_bShowRadarCreateRoom;
@property(retain, nonatomic) NSDictionary *m_dicExistContact; // @synthesize m_dicExistContact;
- (void)initSearchBar;
- (void)makeGroupCell:(id)arg1 head:(id)arg2 title:(id)arg3;

@end

#pragma mark - Logic

@interface SayHelloDataLogic : NSObject
@property (nonatomic, strong) NSMutableArray *m_arrHellos;
- (void)loadData:(unsigned int)arg1;
+ (id)getContactFrom:(id)arg1;
- (id)getContactForIndex:(unsigned int)arg1;
- (void)onFriendAssistAddMsg:(NSArray *)arg1;
@end

@interface CContactVerifyLogic : NSObject
- (void)startWithVerifyContactWrap:(id)arg1
                            opCode:(unsigned int)arg2
                        parentView:(id)arg3
                      fromChatRoom:(BOOL)arg4;
@end

@interface SKBuiltinString_t : NSObject
// Remaining properties
@property(copy, nonatomic) NSString *string; // @dynamic string;
@end

@interface CreateChatRoomResponse : NSObject
@property(strong, nonatomic) SKBuiltinString_t *chatRoomName; // @dynamic chatRoomName;
@end



#pragma mark - UtilCategory

@interface NSMutableDictionary (SafeInsert)

- (void)safeSetObject:(id)arg1 forKey:(id)arg2;

@end

@interface NSDictionary (NSDictionary_SafeJSON)

- (id)arrayForKey:(id)arg1;
- (id)dictionaryForKey:(id)arg1;
- (double)doubleForKey:(id)arg1;
- (float)floatForKey:(id)arg1;
- (long long)int64ForKey:(id)arg1;
- (long long)integerForKey:(id)arg1;
- (id)stringForKey:(id)arg1;

@end

@interface NSString (NSString_SBJSON)

- (id)JSONArray;
- (id)JSONDictionary;
- (id)JSONValue;

@end


@protocol MultiSelectContactsViewControllerDelegate <NSObject>
- (void)onMultiSelectContactReturn:(NSArray *)arg1;

@optional
- (int)getFTSCommonScene;
- (void)onMultiSelectContactCancelForSns;
- (void)onMultiSelectContactReturnForSns:(NSArray *)arg1;
@end

@interface MultiSelectContactsViewController : UIViewController

@property(nonatomic) _Bool m_bKeepCurViewAfterSelect; // @synthesize m_bKeepCurViewAfterSelect=_m_bKeepCurViewAfterSelect;
@property(nonatomic) unsigned int m_uiGroupScene; // @synthesize m_uiGroupScene;

@property(nonatomic, weak) id <MultiSelectContactsViewControllerDelegate> m_delegate; // @synthesize m_delegate;

@end

