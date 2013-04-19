---
author: xhan
comments: true
date: 2012-02-20 14:34:17
layout: post
slug: apple-llvm-4-0-new-features-on-objectivec
title: Apple LLVM 4.0 带给ObjC的新语法
wordpress_id: 751
categories:
- 奇巧淫技
- Coding
tags:
- llvm4.0
- objc
- objectivec
- xcode4.4
---

下载了Xcode4.4 Preview版本, 里面有段介绍:


> Xcode now includes the Apple LLVM Compiler version 4.0, including the following newObjective-C language features:

> 
> 
	
>   * Default @synthesize: automatically synthesizes an @property when unimplemented
> 
	
>   * Objective-C literals: create literals for NSArray, NSDictionary, and NSNumber, just the same as the literals for NSString
> 
	
>   * Objective-C container subscripting: use '[]' syntax to access containers such asNSArray and NSDictionary
> 




一和三很好理解, 第二条没看懂. 搜索了下立马爽歪了. 这几个新特性真可以加快不少开发速度!


## Objective-C literals


**NSArray Literals**

_Previously:_

    
    array = [NSArray arrayWithObjects:a, b, c, nil];


_Now:_

    
    array = @[ a, b, c ];


**NSDictionary Literals**

_Previously:_

    
    dict = [NSDictionary dictionaryWithObjects:@[o1, o2, o3]
    					forKeys:@[k1, k2, k3]];


_Now:_

    
    dict = @{ k1 : o1, k2 : o2, k3 : o3 };


**NSNumber Literals**

_Previously:_

    
    NSNumber *number;
    number = [NSNumber numberWithChar:'X'];
    number = [NSNumber numberWithInt:12345];
    number = [NSNumber numberWithUnsignedLong:12345ul];
    number = [NSNumber numberWithLongLong:12345ll];
    number = [NSNumber numberWithFloat:123.45f];
    number = [NSNumber numberWithDouble:123.45];
    number = [NSNumber numberWithBool:YES];


_Now:_

    
    NSNumber *number;
    number = @'X';
    number = @12345;
    number = @12345ul;
    number = @12345ll;
    number = @123.45f;
    number = @123.45;
    number = @YES;


[原文Link](http://cocoaheads.tumblr.com/post/17757846453/objective-c-literals-for-nsdictionary-nsarray-and)
