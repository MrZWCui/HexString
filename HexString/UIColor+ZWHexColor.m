//
//  UIColor+HexColor.m
//  HexString
//
//  Created by 崔先生的MacBook Pro on 2022/10/7.
//

#import "UIColor+ZWHexColor.h"

@implementation UIColor (ZWHexColor)

+ (UIColor *)HexColor:(NSString *)color {
    return [UIColor HexColor:color Alpha:1];
}

+ (UIColor *)HexColor:(NSString *)color Alpha:(CGFloat)alpha {
    /*
     删除字符串中的空格
     stringByTrimmingCharactersInSet作用：去掉特殊字符
     whitespaceCharacterSet 去掉收尾的空格(注：只能去掉收尾的空格)
     */
    NSString *cString = [[color stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    // String should be 6 or 8 characters
    if (cString.length < 6) {
        return [UIColor clearColor];
    }
    
    /*判断前缀*/
    //如果是0x开头的，那么截取字符串，字符串从索引为2的位置开始，一直到末尾
    if ([cString hasPrefix:@"0x"] || [cString hasPrefix:@"0X"]) {
        cString = [cString substringFromIndex:2];
    }
    //如果是#开头的，那么截取字符串，字符串从索引为1的位置开始，一直到末尾
    if ([cString hasPrefix:@"#"]) {
        cString = [cString substringFromIndex:1];
    }
    if (cString.length != 6) {
        return [UIColor clearColor];
    }
    
    // 从六位数值中找到RGB对应的位数并转换
    NSRange range;
    range.location = 0;
    range.length = 2;
    //R G B
    NSString *rString = [cString substringWithRange:range];
    range.location = 2;
    NSString *gString = [cString substringWithRange:range];
    range.location = 4;
    NSString *bString = [cString substringWithRange:range];
    
    // Scan values,unsigned int表示无符号的整数,int可以为负数
    unsigned int r, g, b;
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    
    return [UIColor colorWithRed:(float)r / 255.0 green:(float)g / 255.0 blue:(float)b /255.0 alpha:alpha];
}

@end
