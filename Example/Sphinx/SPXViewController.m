//
//  SPXViewController.m
//  Sphinx
//
//  Created by zengjing on 04/23/2017.
//  Copyright (c) 2017 zengjing. All rights reserved.
//

#import "SPXViewController.h"
#import <Sphinx/Sphinx.h>

@interface SPXViewController ()

@end

@implementation SPXViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSString *dbPath = [[NSBundle mainBundle] pathForResource:@"example" ofType:@"db"];
    [Sphinx open:dbPath port:8888 complete:^(BOOL status, NSString *url) {
        NSLog(@"%@ %@", status?@"启动成功,访问地址是：":@"启动失败", url);
    }];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
