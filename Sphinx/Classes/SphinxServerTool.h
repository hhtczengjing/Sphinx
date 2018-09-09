//
//  SphinxServerTool.h
//  Sphinx
//
//  Created by zengjing on 2017/4/23.
//  Copyright © 2017年 devzeng.com. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RoutingHTTPServer.h"

@interface SphinxServerTool : NSObject

@property (nonatomic, strong, readonly) RoutingHTTPServer *httpServer;

- (BOOL)start:(NSString *)root port:(UInt16)port;

- (BOOL)start:(NSString *)root port:(UInt16)port handler:(void (^)(RoutingHTTPServer *server))handler;

- (void)stop;

- (NSString *)serverURL;

@end
