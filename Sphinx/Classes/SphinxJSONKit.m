//
//  SphinxJSONKit.m
//  Sphinx
//
//  Created by zengjing on 2017/4/23.
//  Copyright © 2017年 devzeng.com. All rights reserved.
//

#import "SphinxJSONKit.h"

@implementation NSString (SphinxJSONKitSerializing)

- (id)spx_objectFromJSONString {
    NSData *data = [self dataUsingEncoding:NSUTF8StringEncoding];
    return [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
}

@end

@implementation NSData (SphinxJSONKitSerializing)

- (id)spx_objectFromJSONData {
    NSData *data = [NSJSONSerialization dataWithJSONObject:self options:NSJSONWritingPrettyPrinted error:nil];
    NSString *result = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding] ;
    return result;
}

@end

@implementation NSDictionary (SphinxJSONKitSerializing)

- (NSString *)spx_JSONString {
    NSData *data = [NSJSONSerialization dataWithJSONObject:self options:NSJSONWritingPrettyPrinted error:nil];
    NSString *str = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding] ;
    return str;
}

@end

@implementation NSArray (SphinxJSONKitSerializing)

- (NSString *)spx_JSONString {
    NSData *data = [NSJSONSerialization dataWithJSONObject:self options:NSJSONWritingPrettyPrinted error:nil];
    NSString *str = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding] ;
    return str;
}

@end
