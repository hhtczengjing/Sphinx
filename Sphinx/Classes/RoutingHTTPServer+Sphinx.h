//
//  RoutingHTTPServer+Sphinx.h
//  Sphinx
//
//  Created by zengjing on 2017/4/23.
//  Copyright © 2017年 devzeng.com. All rights reserved.
//

#import "RoutingHTTPServer.h"

@interface RoutingHTTPServer (Sphinx)

/**
 * 注册REST服务
 *
 * @param dbFilePath 数据库文件路径
 */
- (void)spx_registerSphinxServiceHandler:(NSString *)dbFilePath;

@end
