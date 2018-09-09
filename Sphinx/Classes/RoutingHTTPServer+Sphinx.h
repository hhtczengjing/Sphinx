//
//  RoutingHTTPServer+Sphinx.h
//  Sphinx
//
//  Created by zengjing on 2017/4/23.
//  Copyright © 2017年 devzeng.com. All rights reserved.
//

#import "RoutingHTTPServer.h"

@interface RoutingHTTPServer (Sphinx)

- (void)spx_registerSphinxServiceHandler:(NSString *)dbFilePath;

@end
