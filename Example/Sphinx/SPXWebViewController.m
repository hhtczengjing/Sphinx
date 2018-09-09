//
//  SPXWebViewController.m
//  Sphinx_Example
//
//  Created by zengjing on 2018/9/9.
//  Copyright © 2018年 zengjing. All rights reserved.
//

#import "SPXWebViewController.h"
#import <WebKit/WebKit.h>

@interface SPXWebViewController ()

@property (nonatomic, strong) WKWebView *myWebView;
    
@end

@implementation SPXWebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"预览";
    
    [self spx_addSubViews];
    
    [self spx_requestData];
}

- (void)spx_addSubViews {
    self.myWebView = [[WKWebView alloc] init];
    [self.view addSubview:self.myWebView];
    
    [self.myWebView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
}

- (void)spx_requestData {
    [self.myWebView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:self.url]]];
}

@end
