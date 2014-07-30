//
//  PSColor.m
//  PSColor
//
//  Created by apple on 14/7/30.
//  Copyright (c) 2014年 Fakhnology. All rights reserved.
//

#import "PSColorEngine.h"
#import "PSColor.h"
#import "NSString+IntValue.h"

@interface PSColorEngine ()


@end

@implementation PSColorEngine

+ (UIColor *)colorWithHexColor:(NSString *)hexColor
{
    UIColor *color = [[UIColor alloc] init];
    switch (hexColor.length) {
        case 4:
            return [self handleThreeBitString:hexColor];
            break;
        case 7:
            return [self handleSixBitString:hexColor];
            break;
        default:
            break;
    }
    return color;
}

+ (UIColor *)handleThreeBitString:(NSString *)hexColor
{
    NSString *redComponent = [hexColor substringWithRange:NSMakeRange(1, 1)];
    NSString *greenComponent = [hexColor substringWithRange:NSMakeRange(2, 1)];
    NSString *blueComponent = [hexColor substringWithRange:NSMakeRange(3, 1)];
    hexColor = [NSString stringWithFormat:@"#%@%@%@%@%@%@",redComponent,redComponent,greenComponent,greenComponent,blueComponent,blueComponent];
    return [self handleSixBitString:hexColor];
}

+ (UIColor *)handleSixBitString:(NSString *)hexColor
{
    NSString *redComponent = [hexColor substringWithRange:NSMakeRange(1, 2)];
    NSString *greenComponent = [hexColor substringWithRange:NSMakeRange(3, 2)];
    NSString *blueComponent = [hexColor substringWithRange:NSMakeRange(5, 2)];
    PSColor *result = [[PSColor alloc] init];
    result.redComponent = [self hexToDemical:redComponent];
    result.greenComponent = [self hexToDemical:greenComponent];
    result.blueComponent = [self hexToDemical:blueComponent];
    return [UIColor colorWithRed:result.redComponent green:result.greenComponent blue:result.blueComponent alpha:1.0];
}

+ (NSUInteger)hexToDemical:(NSString *)hex
{
    NSUInteger demical = 0;
    NSUInteger digit = 0;
    NSString *lastChar = [[NSString alloc] init];
    while (hex.length) {
        lastChar = [hex substringWithRange:NSMakeRange(hex.length - 1, 1)];
        hex = [hex substringToIndex:hex.length - 1];
        demical += ([NSString integerValueWithChar:lastChar] * pow(16, digit));
        digit++;
    }
    return demical;
}

@end
