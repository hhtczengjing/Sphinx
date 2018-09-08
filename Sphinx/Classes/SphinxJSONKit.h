//
//  SphinxJSONKit.h
//  Sphinx
//
//  Created by zengjing on 2017/4/23.
//  Copyright © 2017年 devzeng.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (SphinxJSONKitSerializing)

- (id)spx_objectFromJSONString;

@end

@interface NSData (SphinxJSONKitSerializing)

- (id)spx_objectFromJSONData;

@end


@interface NSDictionary (SphinxJSONKitSerializing)

- (NSString *)spx_JSONString;

@end

@interface NSArray (SphinxJSONKitSerializing)

- (NSString *)spx_JSONString;

@end
