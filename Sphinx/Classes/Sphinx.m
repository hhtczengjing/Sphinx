//
//  Sphinx.m
//  Sphinx
//
//  Created by zengjing on 2017/4/23.
//  Copyright © 2017年 devzeng.com. All rights reserved.
//

#import "Sphinx.h"
#import "SphinxServerTool.h"
#import "RoutingHTTPServer+Sphinx.h"

@interface Sphinx ()

@property (nonatomic, strong) SphinxServerTool *server;

@property (nonatomic, copy) NSString *dbFilePath; //!< 数据库文件存放路径
@property (nonatomic, assign) UInt32 serverPort; //!< 服务器端口

@end

@implementation Sphinx

+ (Sphinx *)sharedInstance {
    static Sphinx *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[self alloc] init];
    });
    return instance;
}
    
+ (void)open:(NSString *)dbPath complete:(SphinxServerStartCompleteBlock)complete {
    [self open:dbPath port:8080 complete:complete];
}

+ (void)open:(NSString *)dbPath port:(UInt32)port complete:(SphinxServerStartCompleteBlock)complete {
    Sphinx *instance = [self sharedInstance];
    instance.dbFilePath = dbPath;
    instance.serverPort = port;
    BOOL status = [instance start];
    NSString *url = [instance serviceURL];
    !complete ? : complete(status, url);
}

- (BOOL)start {
    NSString *root = [[NSBundle mainBundle] pathForResource:@"SphinxWeb.bundle" ofType:nil];
    UInt32 port = self.serverPort>0?self.serverPort:8080;
    BOOL result = [self.server start:root port:port handler:^(RoutingHTTPServer *server) {
        [server spx_registerSphinxServiceHandler:self.dbFilePath];
    }];
    return result;
}

+ (void)close {
    [[self sharedInstance].server stop];
}

- (NSString *)serviceURL {
    return [self.server serverURL];
}

- (SphinxServerTool *)server {
    if(!_server) {
        _server = [[SphinxServerTool alloc] init];
    }
    return _server;
}
    
@end
