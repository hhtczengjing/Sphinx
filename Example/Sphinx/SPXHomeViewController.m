//
//  SPXHomeViewController.m
//  Sphinx
//
//  Created by zengjing on 04/23/2017.
//  Copyright (c) 2017 devzeng.com. All rights reserved.
//

#import "SPXHomeViewController.h"
#import <Masonry/Masonry.h>
#ifdef DEBUG
#import <Sphinx/Sphinx.h>
#endif

@interface SPXHomeViewController ()

@property (nonatomic, strong) UILabel *textLabel;

@end

@implementation SPXHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"示例";
    
    [self spx_addSubViews];
    
    [self spx_requestData];
}

- (void)spx_addSubViews {
    self.textLabel = [[UILabel alloc] init];
    self.textLabel.numberOfLines = 0;
    self.textLabel.font = [UIFont systemFontOfSize:17.0];
    self.textLabel.textColor = [UIColor blackColor];
    [self.view addSubview:self.textLabel];
    
    [self.textLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).offset(10);
        make.right.equalTo(self.view).offset(-10);
        make.top.equalTo(self.view).offset(10);
        make.height.equalTo(@(120));
    }];
}

- (void)spx_requestData {
#ifdef DEBUG
    NSString *dbPath = [[NSBundle mainBundle] pathForResource:@"example.db" ofType:nil];
    [Sphinx open:dbPath port:8888 complete:^(BOOL status, NSString *url) {
        NSString *message = status? [NSString stringWithFormat:@"启动成功,访问地址是：%@", url] : @"启动失败";
        self.textLabel.text = message;
        NSLog(@"%@", message);
    }];
#endif
}

@end
