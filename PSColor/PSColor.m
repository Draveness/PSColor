//
//  PSColor.m
//  PSColor
//
//  Created by apple on 14/7/30.
//  Copyright (c) 2014年 Fakhnology. All rights reserved.
//

#import "PSColor.h"
#import "PSColorComponent.h"
#import "NSString+IntValue.h"

@interface PSColor ()


@end

@implementation PSColor

+ (UIColor *)colorWithHex:(NSString *)hexColor
{
    switch (hexColor.length) {
        case 3:
            return [self handleThreeBitString:hexColor];
            break;
        case 4:
            return [self handleFourBitString:hexColor];
            break;
        case 6:
            return [self handleSixBitString:hexColor];
            break;
        case 7:
            return [self handleSevenBitString:hexColor];
            break;
        default:
            break;
    }
    return [UIColor whiteColor];
}

+ (UIColor *)handleThreeBitString:(NSString *)hexColor
{
    NSString *redComponent = [hexColor substringWithRange:NSMakeRange(0, 1)];
    NSString *greenComponent = [hexColor substringWithRange:NSMakeRange(1, 1)];
    NSString *blueComponent = [hexColor substringWithRange:NSMakeRange(2, 1)];
    hexColor = [NSString stringWithFormat:@"#%@%@%@%@%@%@",redComponent,redComponent,greenComponent,greenComponent,blueComponent,blueComponent];
    return [self handleSevenBitString:hexColor];
}

+ (UIColor *)handleSixBitString:(NSString *)hexColor
{
    NSString *redComponent = [hexColor substringWithRange:NSMakeRange(0, 2)];
    NSString *greenComponent = [hexColor substringWithRange:NSMakeRange(2, 2)];
    NSString *blueComponent = [hexColor substringWithRange:NSMakeRange(4, 2)];
    hexColor = [NSString stringWithFormat:@"#%@%@%@",redComponent,greenComponent,blueComponent];
    return [self handleSevenBitString:hexColor];
}

+ (UIColor *)handleFourBitString:(NSString *)hexColor
{
    NSString *redComponent = [hexColor substringWithRange:NSMakeRange(1, 1)];
    NSString *greenComponent = [hexColor substringWithRange:NSMakeRange(2, 1)];
    NSString *blueComponent = [hexColor substringWithRange:NSMakeRange(3, 1)];
    hexColor = [NSString stringWithFormat:@"#%@%@%@%@%@%@",redComponent,redComponent,greenComponent,greenComponent,blueComponent,blueComponent];
    return [self handleSevenBitString:hexColor];
}

+ (UIColor *)handleSevenBitString:(NSString *)hexColor
{
    NSString *redComponent = [hexColor substringWithRange:NSMakeRange(1, 2)];
    NSString *greenComponent = [hexColor substringWithRange:NSMakeRange(3, 2)];
    NSString *blueComponent = [hexColor substringWithRange:NSMakeRange(5, 2)];
    PSColorComponent *result = [[PSColorComponent alloc] init];
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
