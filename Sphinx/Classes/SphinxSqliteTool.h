//
//  SphinxSqliteTool.h
//  Sphinx
//
//  Created by zengjing on 2017/4/23.
//  Copyright © 2017年 devzeng.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SphinxSqliteTool : NSObject

- (id)initWithDBPath:(NSString *)path;

- (NSArray *)tableNameList;

- (NSArray *)tableContentWithSQL:(NSString *)sql;

/**
 *  获取当前字符串的MD5值
 *
 *  @param sql sql语句
 *
 *  @return 查询结果
 */
- (id)executeSQL:(NSString *)sql;

@end
