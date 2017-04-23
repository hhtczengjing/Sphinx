//
//  SphinxJSONKit.h
//  Sphinx
//
//  Created by zengjing on 2017/4/23.
//  Copyright © 2017年 devzeng.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (SphinxJSONKitSerializing)

- (id)objectFromJSONString;

@end

@interface NSData (SphinxJSONKitSerializing)

- (id)objectFromJSONData;

@end


@interface NSDictionary (SphinxJSONKitSerializing)

- (NSString *)JSONString;

@end

@interface NSArray (SphinxJSONKitSerializing)

- (NSString *)JSONString;

@end
