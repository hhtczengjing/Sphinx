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
    
+ (void)open:(NSString *)dbPath complete:(SphinxServerStartCompleteBlock)complete;

+ (void)open:(NSString *)dbPath port:(UInt32)port complete:(SphinxServerStartCompleteBlock)complete;

+ (void)close;

@end
