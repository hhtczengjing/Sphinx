//
//  NSURL+Sphinx.m
//  Sphinx
//
//  Created by zengjing on 2017/4/23.
//  Copyright © 2017年 devzeng.com. All rights reserved.
//

#import "NSURL+Sphinx.h"

@implementation NSURL (Sphinx)

- (NSDictionary *)spx_parameters {
    NSString *q = [self.query stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSMutableDictionary * parametersDictionary = [NSMutableDictionary dictionary];
    NSArray * queryComponents = [q componentsSeparatedByString:@"&"];
    for (NSString * queryComponent in queryComponents) {
        NSString * key = [queryComponent componentsSeparatedByString:@"="].firstObject;
        NSString * value = [queryComponent substringFromIndex:(key.length + 1)];
        [parametersDictionary setObject:value forKey:key];
    }
    return parametersDictionary;
}

- (NSString *)spx_valueForParameter:(NSString *)parameterKey {
    return [[self spx_parameters] objectForKey:parameterKey];
}

@end
