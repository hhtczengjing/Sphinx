//
//  NSString+Sphinx.h
//  Sphinx
//
//  Created by zengjing on 2017/4/23.
//  Copyright © 2017年 devzeng.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Sphinx)

/**
 *  将字符串转换成可用于URL中的字符串，主要是将一些特殊字符进行转换
 *
 *  @return 转换之后的字符串
 */
- (NSString *)spx_URLEncode;

/**
 *  将字符串进行URLDecode
 *
 *  @return 转换之后的字符串
 */
- (NSString*)spx_URLDecode;

/**
 *  获取当前字符串的MD5值
 *
 *  @return 字符串的MD5值
 */
- (NSString *)spx_MD5Encode;

@end
