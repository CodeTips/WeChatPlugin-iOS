//
//  UILabel+AutoResize.h
//  SLTC
//
//  Created by Lorwy on 2017/2/10.
//  Copyright © 2017年 KM. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (AutoResize)

- (CGFloat)autoResizeHeightWithHoriPadding:(float)horiPadding;
- (CGFloat)autoResizeWidthWithHeight:(CGFloat)height;

+ (CGFloat)autoResizeHeightWithFont:(UIFont *)font
                           andWidth:(CGFloat)width
                         textString:(NSString *)text;

+ (CGFloat)autoResizeWidthWithFont:(UIFont *)font
                         andHeight:(CGFloat)height
                        textString:(NSString *)text;

+ (CGSize)getTextHeightWithText:(NSString *)text
                           font:(UIFont *)font
                           size:(CGSize)size
                      lineSpace:(NSInteger)lineSpace;

@end
