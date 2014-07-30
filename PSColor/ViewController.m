//
//  ViewController.m
//  PSColor
//
//  Created by apple on 14/7/30.
//  Copyright (c) 2014年 Fakhnology. All rights reserved.
//

#import "ViewController.h"
#import "PSColor.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [PSColor colorWithHexColor:@"#F00"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
