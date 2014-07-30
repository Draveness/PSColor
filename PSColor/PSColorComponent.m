//
//  PSColorComponent.m
//  PSColor
//
//  Created by apple on 14/7/30.
//  Copyright (c) 2014年 Fakhnology. All rights reserved.
//

#import "PSColorComponent.h"

@implementation PSColorComponent

- (id)init
{
    self = [super init];
    if (self) {
        self.redComponent = 0;
        self.greenComponent = 0;
        self.blueComponent = 0;
    }
    return self;
}

- (void)setRedComponent:(CGFloat)redComponent
{
    _redComponent = (CGFloat)redComponent / 256.0;
}

- (void)setGreenComponent:(CGFloat)greenComponent
{
    _greenComponent = (CGFloat)greenComponent / 256.0;
}

- (void)setBlueComponent:(CGFloat)blueComponent
{
    _blueComponent = (CGFloat)blueComponent / 256.0;
}

@end
