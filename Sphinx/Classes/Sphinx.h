//
//  Sphinx.h
//  Sphinx
//
//  Created by zengjing on 2017/4/23.
//  Copyright © 2017年 devzeng.com. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^SphinxServerStartCompleteBlock)(BOOL status, NSString *url);

@interface Sphinx : NSObject

/**
 * 打开指定的数据库(使用默认的端口号)
 *
 * @param dbPath 数据库路径地址
 * @param complete 启动服务完成的回调
 */
+ (void)open:(NSString *)dbPath complete:(SphinxServerStartCompleteBlock)complete;

/**
 * 打开指定的数据库(使用指定的端口号)
 *
 * @param dbPath 数据库路径地址
 * @param port 端口号
 * @param complete 启动服务完成的回调
 */
+ (void)open:(NSString *)dbPath port:(UInt32)port complete:(SphinxServerStartCompleteBlock)complete;

/**
 * 切换数据库路径
 *
 * @param dbPath 新的数据库路径地址
 * @param complete 切换完成的回调
 */
+ (void)switchDBLocation:(NSString *)dbPath complete:(SphinxServerStartCompleteBlock)complete;

/**
 * 重启服务
 *
 * @return 服务器状态
 */
+ (BOOL)restart;

/**
 * 停止服务器
 */
+ (void)stop;

@end
