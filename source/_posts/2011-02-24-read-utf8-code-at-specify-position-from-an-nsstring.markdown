---
author: xhan
comments: true
date: 2011-02-24 22:19:48
layout: post
slug: read-utf8-code-at-specify-position-from-an-nsstring
title: Read UTF8 code at specify position from an NSString
wordpress_id: 493
categories:
- Coding
tags:
- 字符编码
- NSString
---

如何获取nsstring制定某个位置的utf８编码的字符呢?

我也不知道,所以在[stackoverflow](http://stackoverflow.com/questions/5100030/read-utf8-character-in-specify-position-from-a-nsstring)问了下.

很快就有人回复了解决方案.

在贴代码之前写介绍下几个编码格式:

UTF8 和 UTF16均为字符编码方式.  
UTF-8使用一至四個[位元組](http://zh.wikipedia.org/wiki/%E5%AD%97%E8%8A%82)為每個字符編碼：


  1. 128個US-ASCII字符只需一個位元組編碼（Unicode範圍由U+0000至U+007F）。	
  2. 帶有[附加符号](http://zh.wikipedia.org/wiki/%E9%99%84%E5%8A%A0%E7%AC%A6%E5%8F%B7)的[拉丁文](http://zh.wikipedia.org/wiki/%E6%8B%89%E4%B8%81%E6%96%87)、[希臘文](http://zh.wikipedia.org/wiki/%E5%B8%8C%E8%87%98%E6%96%87)、[西里爾字母](http://zh.wikipedia.org/wiki/%E8%A5%BF%E9%87%8C%E7%88%BE%E5%AD%97%E6%AF%8D)、[亞美尼亞語](http://zh.wikipedia.org/wiki/%E4%BA%9E%E7%BE%8E%E5%B0%BC%E4%BA%9E%E8%AA%9E)、[希伯來文](http://zh.wikipedia.org/wiki/%E5%B8%8C%E4%BC%AF%E4%BE%86%E6%96%87)、[阿拉伯文](http://zh.wikipedia.org/wiki/%E9%98%BF%E6%8B%89%E4%BC%AF%E6%96%87)、[敘利亞文](http://zh.wikipedia.org/wiki/%E5%8F%99%E5%88%A9%E4%BA%9A%E6%96%87)及[它拿字母](http://zh.wikipedia.org/wiki/%E5%AE%83%E6%8B%BF%E5%AD%97%E6%AF%8D)則需要二個位元組編碼（Unicode範圍由U+0080至U+07FF）。
  3. 其他[基本多文種平面](http://zh.wikipedia.org/wiki/%E5%9F%BA%E6%9C%AC%E5%A4%9A%E6%96%87%E7%A8%AE%E5%B9%B3%E9%9D%A2)（BMP）中的字元（這包含了大部分常用字）使用三個位元組編碼。
  4. 其他極少使用的Unicode [輔助平面](http://zh.wikipedia.org/wiki/%E8%BC%94%E5%8A%A9%E5%B9%B3%E9%9D%A2)的字元使用四位元組編碼。

**UTF-16**是[Unicode](http://zh.wikipedia.org/wiki/Unicode)的其中一個使用方式。UTF是_Unicode/UCS Transformation Format_，即把Unicode轉做某種格式的意思。

其編碼方法是：

1. 如果字符編碼U小於0x10000，也就是十進制的0到65535之內，則直接使用兩字節表示；
2. 如果字符編碼U大於0x10000，由於UNICODE編碼範圍最大為0x10FFFF，從0x10000到0x10FFFF之間 共有0xFFFFF個編碼，也就是需要20個bit就可以標示這些編碼。用U'表示從0-0xFFFFF之間的值，將其前 10 bit作為高位和16 bit的數值0xD800進行 邏輯or 操作，將後10 bit作為低位和0xDC00做 邏輯or 操作，這樣組成的 4個byte就構成了U的編碼。

而NSString使用的就是unicode存储的,　唯一一个获取unichar的方法叫做 -characterAtIndex: ,　但是问题是 unichar 其实是个 unsigned short,也就是２个字节,所以它并不能展现所有的字符.

终极解决方法:

``` objectivec NSString_Read_UTF8
@interface NSString (UTF8) 

- (NSRange) rangeOfUTFCodePoint:(NSUInteger)number;

@end

@implementation NSString (UTF8)

- (NSRange) rangeOfUTFCodePoint:(NSUInteger)number
{
    if (number >= [self length]) {
        return NSMakeRange(NSNotFound, NSNotFound);
    }
    
    NSUInteger codeUnit = 0;
    NSRange result;
    for(NSUInteger ix = 0; ix <= number; ix++)
    {
        result = [self rangeOfComposedCharacterSequenceAtIndex:codeUnit];
        codeUnit += result.length;
    }
    return result;
}

@end
```
