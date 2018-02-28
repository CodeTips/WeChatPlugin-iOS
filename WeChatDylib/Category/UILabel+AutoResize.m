//
//  UILabel+AutoResize.m
//  SLTC
//
//  Created by Lorwy on 2017/2/10.
//  Copyright © 2017年 KM. All rights reserved.
//

#import "UILabel+AutoResize.h"

@implementation UILabel (AutoResize)

- (CGFloat)autoResizeHeightWithHoriPadding:(float)horiPadding
{
    CGFloat height = 0;
    
    NSString *text = self.text;
    if (text.length > 0){
        CGFloat width = self.frame.size.width - horiPadding * 2;
        UIFont *font = self.font;
        NSAttributedString *attributedText = [[NSAttributedString alloc] initWithString:text
                                                                             attributes:@{NSFontAttributeName: font}];
        
        CGRect rect = [attributedText boundingRectWithSize:(CGSize){width, CGFLOAT_MAX}
                                                   options:NSStringDrawingUsesLineFragmentOrigin
                                                   context:nil];
        CGSize size = rect.size;
        size.height = ceilf(size.height);
        size.width  = ceilf(size.width);
        height = size.height + 2;
        height = round(height);
    }
    
    return height;
}

- (CGFloat)autoResizeWidthWithHeight:(CGFloat)height
{
    CGFloat width = 0;
    
    NSString *text = self.text;
    if (text.length > 0){
        UIFont *font = self.font;
        NSAttributedString *attributedText = [[NSAttributedString alloc] initWithString:text
                                                                             attributes:@{NSFontAttributeName: font}];
        
        CGRect rect = [attributedText boundingRectWithSize:(CGSize){CGFLOAT_MAX, height}
                                                   options:NSStringDrawingUsesLineFragmentOrigin
                                                   context:nil];
        CGSize size = rect.size;
        size.height = ceilf(size.height);
        size.width  = ceilf(size.width);
        width = size.width + 2;
        width = round(width);
    }
    
    return width;
}

+ (CGFloat)autoResizeHeightWithFont:(UIFont *)font
                           andWidth:(CGFloat)width
                         textString:(NSString *)text
{
    CGFloat height = 0;
    
    if (text.length > 0)
    {
        NSAttributedString *attributedText = [[NSAttributedString alloc] initWithString:text
                                                                             attributes:@{NSFontAttributeName: font}];
        
        CGRect rect = [attributedText boundingRectWithSize:(CGSize){width, CGFLOAT_MAX}
                                                   options:NSStringDrawingUsesLineFragmentOrigin
                                                   context:nil];
        CGSize size = rect.size;
        size.height = ceilf(size.height);
        size.width  = ceilf(size.width);
        height = size.height;
        height = round(height);
        if ([[[UIDevice currentDevice] systemVersion] floatValue] < 9.0f)
        {
            //a solution for iOS 8 or older version
            height += 2;
        }
    }
    
    return height;
}

+ (CGFloat)autoResizeWidthWithFont:(UIFont *)font
                         andHeight:(CGFloat)height
                        textString:(NSString *)text
{
    CGFloat width = 0;
    
    if (text.length > 0)
    {
        NSAttributedString *attributedText = [[NSAttributedString alloc] initWithString:text
                                                                             attributes:@{NSFontAttributeName: font}];
        
        CGRect rect = [attributedText boundingRectWithSize:(CGSize){CGFLOAT_MAX, height}
                                                   options:NSStringDrawingUsesLineFragmentOrigin
                                                   context:nil];
        CGSize size = rect.size;
        size.height = ceilf(size.height);
        size.width  = ceilf(size.width);
        width = size.width + 2;
        width = round(width);
    }
    
    return width;
}

+ (CGSize)getTextHeightWithText:(NSString *)text
                           font:(UIFont *)font
                           size:(CGSize)size
                      lineSpace:(NSInteger)lineSpace
{
    NSMutableDictionary *mutableDictionary = [NSMutableDictionary dictionaryWithCapacity:0];
    
    [mutableDictionary setObject:font forKey:NSFontAttributeName];
    NSMutableParagraphStyle *style = [[NSMutableParagraphStyle alloc] init];
    [style setLineSpacing:lineSpace];
    [mutableDictionary setObject:style forKey:NSParagraphStyleAttributeName];
    
    CGRect rect = [text boundingRectWithSize:size
                                     options:(NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading)
                                  attributes:mutableDictionary
                                     context:nil];
    return rect.size;
}

@end
