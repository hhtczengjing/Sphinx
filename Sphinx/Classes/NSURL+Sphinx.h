//
//  NSURL+Sphinx.h
//  Sphinx
//
//  Created by zengjing on 2017/4/23.
//  Copyright © 2017年 devzeng.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSURL (Sphinx)

- (NSDictionary *)spx_parameters;

- (NSString *)spx_valueForParameter:(NSString *)parameterKey;

@end
