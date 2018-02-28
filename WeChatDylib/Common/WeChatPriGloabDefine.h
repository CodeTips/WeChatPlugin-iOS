//
//  WeChatPriGloabDefine.h
//  WeChatPri
//
//  Created by Lorwy on 2017/8/4.
//  Copyright © 2017年 Lorwy. All rights reserved.
//

#ifndef WeChatPriGloabDefine_h
#define WeChatPriGloabDefine_h

#define UIColorFromRGB(rgbValue) \
[UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0x00FF00) >>  8))/255.0 \
blue:((float)((rgbValue & 0x0000FF) >>  0))/255.0 \
alpha:1.0]

#define nightBackgroundColor UIColorFromRGB(0x343434)
#define nightSeparatorColor  UIColorFromRGB(0x313131)
#define nightTextColor UIColorFromRGB(0xffffff)
#define nightTabBarColor UIColorFromRGB(0x444444)


#define VALID_STRING(string) ((string) && ([(string) isKindOfClass:[NSString class]]) && ([(string) length] > 0))
#define VALID_ARRAY(array) ((array) && ([(array) isKindOfClass:[NSArray class]]) && ([(array) count] > 0))
#define VALID_DICTIONARY(dictionary) ((dictionary) && ([(dictionary) isKindOfClass:[NSDictionary class]]) && ([(dictionary) count] > 0))

#define SCREEN_WIDTH ([UIScreen mainScreen].bounds.size.width)
#define SCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)
//适配IP6和6+的等比放大效果
#define FIX_SIZE(num) ((num) * SCREEN_WIDTH / 320.0)
#define FIX_FONT_SIZE(size) SCREEN_WIDTH < 375 ? ((size + 4.0) / 2.0) : SCREEN_WIDTH == 375 ? ((size + 8.0) / 2.0) : ((size + 12.0) / 2.0)
#define TKFont(size) [UIFont systemFontOfSize:FIX_FONT_SIZE(size)]
#define RGBA(r, g, b, a) [UIColor colorWithRed:(r) / 255.0 green:(g) / 255.0 blue:(b) / 255.0 alpha:(a)]
#define RGB(r, g, b) RGBA(r, g, b, 1)

// Notif
#define KweChatNewMessageNotification @"KweChatNewMessageNotification"

/*************↓快速序列化一个类***************/
#define LSERIALIZE_CODER_DECODER()     \
\
- (id)initWithCoder:(NSCoder *)coder    \
{   \
Class cls = [self class];   \
while (cls != [NSObject class]) {   \
BOOL bIsSelfClass = (cls == [self class]);  \
unsigned int iVarCount = 0; \
unsigned int propVarCount = 0;  \
unsigned int sharedVarCount = 0;    \
Ivar *ivarList = bIsSelfClass ? class_copyIvarList([cls class], &iVarCount) : NULL;  \
objc_property_t *propList = bIsSelfClass ? NULL : class_copyPropertyList(cls, &propVarCount);  \
sharedVarCount = bIsSelfClass ? iVarCount : propVarCount;   \
\
for (int i = 0; i < sharedVarCount; i++) {  \
const char *varName = bIsSelfClass ? ivar_getName(*(ivarList + i)) : property_getName(*(propList + i)); \
NSString *key = [NSString stringWithUTF8String:varName];   \
id varValue = [coder decodeObjectForKey:key];   \
NSArray *filters = @[@"superclass", @"description", @"debugDescription", @"hash"]; \
if (varValue && [filters containsObject:key] == NO) { \
[self setValue:varValue forKey:key];    \
}   \
}   \
free(ivarList); \
free(propList); \
cls = class_getSuperclass(cls); \
}   \
return self;    \
}   \
\
- (void)encodeWithCoder:(NSCoder *)coder    \
{   \
Class cls = [self class];   \
while (cls != [NSObject class]) {   \
BOOL bIsSelfClass = (cls == [self class]);  \
unsigned int iVarCount = 0; \
unsigned int propVarCount = 0;  \
unsigned int sharedVarCount = 0;    \
Ivar *ivarList = bIsSelfClass ? class_copyIvarList([cls class], &iVarCount) : NULL;  \
objc_property_t *propList = bIsSelfClass ? NULL : class_copyPropertyList(cls, &propVarCount); \
sharedVarCount = bIsSelfClass ? iVarCount : propVarCount;   \
\
for (int i = 0; i < sharedVarCount; i++) {  \
const char *varName = bIsSelfClass ? ivar_getName(*(ivarList + i)) : property_getName(*(propList + i)); \
NSString *key = [NSString stringWithUTF8String:varName];    \
id varValue = [self valueForKey:key];   \
NSArray *filters = @[@"superclass", @"description", @"debugDescription", @"hash"]; \
if (varValue && [filters containsObject:key] == NO) { \
[coder encodeObject:varValue forKey:key];   \
}   \
}   \
free(ivarList); \
free(propList); \
cls = class_getSuperclass(cls); \
}   \
}
/*************快速序列化一个类***************/

#endif /* WeChatPriGloabDefine_h */
