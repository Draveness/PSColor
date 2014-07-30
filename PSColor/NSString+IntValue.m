//
//  NSString+IntValue.m
//  PSColor
//
//  Created by apple on 14/7/30.
//  Copyright (c) 2014年 Fakhnology. All rights reserved.
//

#import "NSString+IntValue.h"

@implementation NSString (IntValue)

+ (NSInteger)integerValueWithChar:(NSString *)string
{

    if ([string isEqualToString:@"A"]) {
        return 10;
    } else if ([string isEqualToString:@"B"]) {
        return 11;
    } else if ([string isEqualToString:@"C"]) {
        return 12;
    } else if ([string isEqualToString:@"D"]) {
        return 13;
    } else if ([string isEqualToString:@"E"]) {
        return 14;
    } else if ([string isEqualToString:@"F"]) {
        return 15;
    }
    return string.integerValue;
}

@end
