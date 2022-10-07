//
//  UIColor+ZWHexColor.h
//  HexString
//
//  Created by 崔先生的MacBook Pro on 2022/10/7.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIColor (ZWHexColor)

+ (UIColor *)hexColor:(NSString *)color;
+ (UIColor *)hexColor:(NSString *)color alpha:(CGFloat)alpha;

@end

NS_ASSUME_NONNULL_END
