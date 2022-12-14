//
//  UIColor+ZWHexColor.h
//  HexString
//
//  Created by 崔先生的MacBook Pro on 2022/10/7.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIColor (ZWHexColor)

+ (UIColor *)HexColor:(NSString *)color;
+ (UIColor *)HexColor:(NSString *)color Alpha:(CGFloat)alpha;

@end

NS_ASSUME_NONNULL_END
