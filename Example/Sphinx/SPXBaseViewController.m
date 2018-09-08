//
//  SPXBaseViewController.m
//  Sphinx_Example
//
//  Created by zengjing on 2018/9/8.
//  Copyright © 2018年 devzeng.com. All rights reserved.
//

#import "SPXBaseViewController.h"

@interface SPXBaseViewController ()

@end

@implementation SPXBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.extendedLayoutIncludesOpaqueBars = NO;
    self.modalPresentationCapturesStatusBarAppearance = NO;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
