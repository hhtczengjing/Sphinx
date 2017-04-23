//
//  SphinxSqliteTool.m
//  Sphinx
//
//  Created by zengjing on 2017/4/23.
//  Copyright © 2017年 devzeng.com. All rights reserved.
//

#import "SphinxSqliteTool.h"
#import <FMDB/FMDB.h>

@interface SphinxSqliteTool () {
    BOOL isDbOpening;
}

@property (nonatomic, strong) NSString *dbPath;
@property (nonatomic, strong) FMDatabaseQueue *queue;

@end

@implementation SphinxSqliteTool

- (id)initWithDBPath:(NSString *)path {
    if([super init]) {
        _dbPath = path;
        [self open];
    }
    return self;
}

- (id)executeSQL:(NSString *)sql {
    [self open];
    __block NSMutableArray *result = [[NSMutableArray alloc] init];
    [self.queue inDatabase:^(FMDatabase *db) {
        if(![[sql uppercaseString] hasPrefix:@"SELECT"]) {
            BOOL rs = [db executeUpdate:sql];
            [result addObject:@{@"result":@(rs)}];
        }
        else {
            FMResultSet *rs = [db executeQuery:sql];
            while ([rs next]) {
                [result addObject:[rs resultDictionary]];
            }
            [rs close];
        }
    }];
    id res = result;
    if(![[sql uppercaseString] hasPrefix:@"SELECT"]) {
        res = result[0];
    }
    [self close];
    return res;
}

- (NSArray *)tableNameList {
    [self open];
    __block NSMutableArray *tableNameArray = [[NSMutableArray alloc] init];
    [self.queue inDatabase:^(FMDatabase *db) {
        FMResultSet *s = [db executeQuery:@"SELECT name FROM sqlite_master WHERE type = 'table'"];
        while ([s next]) {
            [tableNameArray addObject:[s stringForColumn:@"name"]];
        }
    }];
    [self close];
    return tableNameArray;
}

- (NSArray *)tableContentWithSQL:(NSString *)sql {
    [self open];
    __block NSMutableArray *result = [[NSMutableArray alloc] init];
    [self.queue inDatabase:^(FMDatabase *db) {
        FMResultSet *s = [db executeQuery:sql];
        while ([s next]) {
            [result addObject:[s resultDictionary]];
        }
    }];
    [self close];
    return result;
}

- (void)open {
    if(isDbOpening) {
        return;
    }
    self.queue = [FMDatabaseQueue databaseQueueWithPath:self.dbPath];
    if (self.queue == nil) {
        isDbOpening = NO;
    }
    isDbOpening = YES;
}

- (void)close {
    if (isDbOpening) {
        [self.queue close];
        isDbOpening = NO;
    }
}

@end
