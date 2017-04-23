//
//  SphinxServerTool.m
//  Sphinx
//
//  Created by zengjing on 2017/4/23.
//  Copyright © 2017年 devzeng.com. All rights reserved.
//

#import "SphinxServerTool.h"
#import <ifaddrs.h>
#import <arpa/inet.h>

@implementation SphinxServerTool

- (BOOL)start:(NSString *)root port:(UInt16)port handler:(void (^)(RoutingHTTPServer *server))handler {
    _httpServer = [[RoutingHTTPServer alloc] init];
    [_httpServer setPort:port];
    [_httpServer setDefaultHeader:@"Server" value:@"Sphinx/1.0"];
    [_httpServer setDocumentRoot:root];
    
    !handler ? : handler(_httpServer);
    
    NSError *error;
    BOOL status = [_httpServer start:&error];
    if(error) {
        status = NO;
    }
    return status;
}

- (BOOL)start:(NSString *)root port:(UInt16)port {
    return [self start:root port:port handler:NULL];
}

- (void)stop {
    [_httpServer stop];
}

- (NSString *)serverURL {
    if(_httpServer.isRunning) {
        return [NSString stringWithFormat:@"http://%@:%@", [self getIPAddress], @(self.httpServer.port)];
    }
    return nil;
}

- (NSString *)getIPAddress {
    NSString *address = @"error";
    struct ifaddrs *interfaces = NULL;
    struct ifaddrs *temp_addr = NULL;
    int success = 0;
    success = getifaddrs(&interfaces);
    if (success == 0) {
        temp_addr = interfaces;
        while(temp_addr != NULL) {
            if(temp_addr->ifa_addr->sa_family == AF_INET) {
                if([[NSString stringWithUTF8String:temp_addr->ifa_name] isEqualToString:@"en0"]) {
                    address = [NSString stringWithUTF8String:inet_ntoa(((struct sockaddr_in *)temp_addr->ifa_addr)->sin_addr)];
                }
            }
            temp_addr = temp_addr->ifa_next;
        }
    }
    freeifaddrs(interfaces);
    return address;
}

@end
