//
//  RoutingHTTPServer+Sphinx.m
//  Sphinx
//
//  Created by zengjing on 2017/4/23.
//  Copyright © 2017年 devzeng.com. All rights reserved.
//

#import "RoutingHTTPServer+Sphinx.h"
#import "SphinxSqliteTool.h"
#import "SphinxJSONKit.h"

@implementation RoutingHTTPServer (Sphinx)

- (void)spx_registerSphinxServiceHandler:(NSString *)dbFilePath {
    SphinxSqliteTool *dbTool = [[SphinxSqliteTool alloc] initWithDBPath:dbFilePath];
    
    //获取所有的表
    [self handleMethod:@"GET" withPath:@"/tables" block:^(RouteRequest *request, RouteResponse *response) {
        NSArray *ary = [dbTool tableNameList];
        NSString *json = [ary JSONString];
        [response setHeader:@"Content-Type" value:@"application/json"];
        [response respondWithString:json];
    }];
    
    //获取表里面的全部数据
    [self handleMethod:@"GET" withPath:@"/table/:name" block:^(RouteRequest *request, RouteResponse *response) {
        NSString *tableName = [request param:@"name"];
        NSArray *ary = [dbTool tableContentWithSQL:[NSString stringWithFormat:@"SELECT * FROM %@", tableName]];
        NSString *json = [ary JSONString];
        [response setHeader:@"Content-Type" value:@"application/json"];
        [response respondWithString:json];
    }];
    
    //执行SQL语句
    [self handleMethod:@"POST" withPath:@"/execute" block:^(RouteRequest *request, RouteResponse *response) {
        NSString *sql = [request param:@"sql"];
        id res = [dbTool executeSQL:sql];
        NSString *json = [res JSONString];
        [response setHeader:@"Content-Type" value:@"application/json"];
        [response respondWithString:json];
    }];
}

@end
