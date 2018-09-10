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
#import "NSString+Sphinx.h"

@implementation RoutingHTTPServer (Sphinx)

- (void)spx_registerSphinxServiceHandler:(NSString *)dbFilePath {
    SphinxSqliteTool *dbTool = [[SphinxSqliteTool alloc] initWithDBPath:dbFilePath];
    
    //获取所有的表
    [self spx_regAllTables:dbTool];
    
    //获取表里面的全部数据
    [self spx_regTableDetail:dbTool];
    
    //执行SQL语句
    [self spx_regExecuteSQL:dbTool];
    
    //下载数据库文件
    [self spx_regDownload:dbFilePath];
}

#pragma mark - Private Methods

- (void)spx_regDownload:(NSString *)dbPath {
    [self handleMethod:@"GET" withPath:@"/download" block:^(RouteRequest *request, RouteResponse *response) {
        [self spx_setServiceSupportAccessControl:response];
        [response setHeader:@"Content-Type" value:@"application/octet-stream"];
        [response setHeader:@"Content-Disposition" value:[NSString stringWithFormat:@"attachment;filename=%@", [dbPath lastPathComponent]]];
        NSData *data = [NSData dataWithContentsOfFile:dbPath];
        [response respondWithData:data];
    }];
}

- (void)spx_regAllTables:(SphinxSqliteTool *)dbTool {
    [self handleMethod:@"GET" withPath:@"/tables" block:^(RouteRequest *request, RouteResponse *response) {
        NSArray *ary = [dbTool tableNameList];
        NSMutableDictionary *result = [[NSMutableDictionary alloc] init];
        [result setObject:@"1" forKey:@"result"];
        [result setObject:@[@{@"prop":@"spx_index", @"label":@"序号"}, @{@"prop":@"name", @"label":@"表名"}] forKey:@"column"];
        [result setObject:ary forKey:@"data"];
        NSString *json = [result spx_JSONString];
        [self spx_setServiceSupportAccessControl:response];
        [response setHeader:@"Content-Type" value:@"application/json"];
        [response respondWithString:json];
    }];
}

- (void)spx_regTableDetail:(SphinxSqliteTool *)dbTool  {
    [self handleMethod:@"GET" withPath:@"/table/:name" block:^(RouteRequest *request, RouteResponse *response) {
        NSString *tableName = [request param:@"name"];
        NSArray *ary = [dbTool tableContentWithSQL:[NSString stringWithFormat:@"SELECT * FROM %@", tableName]];
        
        NSMutableDictionary *result = [[NSMutableDictionary alloc] init];
        [result setObject:@"1" forKey:@"result"];
        
        //表头
        NSMutableArray *columnAry = [[NSMutableArray alloc] init];
        if(ary && ary.count > 0) {
            NSDictionary *row = [ary objectAtIndex:0];
            NSArray *rowKeys = [row allKeys];
            for (int i = 0; i < rowKeys.count; i++) {
                [columnAry addObject:@{@"prop":rowKeys[i], @"label":rowKeys[i]}];
            }
        }
        [result setObject:columnAry forKey:@"column"];
        
        //数据
        NSMutableArray *dataAry = [[NSMutableArray alloc] init];
        for (int i = 0; i < ary.count; i++) {
            NSMutableDictionary *rowDict = [[NSMutableDictionary alloc] init];
            [rowDict addEntriesFromDictionary:ary[i]];
            [rowDict setObject:@(i+1) forKey:@"spx_index"];
            [dataAry addObject:rowDict];
        }
        [result setObject:dataAry forKey:@"data"];
        
        NSString *json = [result spx_JSONString];
        
        [self spx_setServiceSupportAccessControl:response];
        [response setHeader:@"Content-Type" value:@"application/json"];
        [response respondWithString:json];
    }];
}

- (void)spx_regExecuteSQL:(SphinxSqliteTool *)dbTool {
    [self handleMethod:@"POST" withPath:@"/execute" block:^(RouteRequest *request, RouteResponse *response) {
        NSString *sql = [[NSString alloc] initWithData:[request body] encoding:NSUTF8StringEncoding];
        NSArray *ary = [sql componentsSeparatedByString:@"="];
        NSString *json = @"";
        if(ary && ary.count == 2) {
            NSString *sqlStr = [ary[1] spx_URLDecode];
            if([[sqlStr uppercaseString] hasPrefix:@"SELECT"]) {
                NSArray *res = [dbTool executeSQL:sqlStr] ;
                
                NSMutableDictionary *result = [[NSMutableDictionary alloc] init];
                [result setObject:@"1" forKey:@"type"];
                NSMutableArray *columnAry = [[NSMutableArray alloc] init];
                if(res && res.count > 0) {
                    NSDictionary *row = [res objectAtIndex:0];
                    NSArray *rowKeys = [row allKeys];
                    for (int i = 0; i < rowKeys.count; i++) {
                        [columnAry addObject:@{@"prop":rowKeys[i], @"label":rowKeys[i]}];
                    }
                }
                [result setObject:columnAry forKey:@"column"];
                
                //数据
                NSMutableArray *dataAry = [[NSMutableArray alloc] init];
                for (int i = 0; i < res.count; i++) {
                    NSMutableDictionary *rowDict = [[NSMutableDictionary alloc] init];
                    [rowDict addEntriesFromDictionary:res[i]];
                    [rowDict setObject:@(i+1) forKey:@"spx_index"];
                    [dataAry addObject:rowDict];
                }
                [result setObject:dataAry forKey:@"data"];
                json = [result spx_JSONString];
            }
            else {
                NSDictionary *res = [dbTool executeSQL:sqlStr] ;
                
                NSMutableDictionary *result = [[NSMutableDictionary alloc] init];
                [result setObject:@"2" forKey:@"type"];
                [result addEntriesFromDictionary:res];
                
                json = [result spx_JSONString];
            }
        }
        else {
            json = [@{@"result":@(0)} spx_JSONString];
        }
        [self spx_setServiceSupportAccessControl:response];
        [response setHeader:@"Content-Type" value:@"application/json"];
        [response respondWithString:json];
    }];
}

- (void)spx_setServiceSupportAccessControl:(RouteResponse *)response {
    [response setHeader:@"Access-Control-Allow-Credentials" value:@"true"];
    [response setHeader:@"Access-Control-Allow-Headers" value:@"origin, content-type, accept, authorization"];
    [response setHeader:@"Access-Control-Allow-Methods" value:@"GET, POST, PUT, DELETE, OPTIONS, HEAD"];
    [response setHeader:@"Access-Control-Allow-Origin" value:@"*"];
    [response setHeader:@"Access-Control-Max-Age" value:@"1209600"];
}

@end
