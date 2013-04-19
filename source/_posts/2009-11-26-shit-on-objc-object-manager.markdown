---
author: xhan
comments: true
date: 2009-11-26 17:37:28
layout: post
slug: shit-on-objc-object-manager
title: 栽大了之Objc过度释放对象
wordpress_id: 196
categories:
- Coding
- iOS
tags:
- apple
- 决定
- 内存管理
- c
- iOS
- objective-c
---

事情是这样的,4个月前我写了份实现类似下拉框选择操作的界面.
一个月前,发现了这个View 在dealloc 会crash掉.
多次调试无果,上 devForum.apple.com 询问也无人问津.
今天决定再次调试下,还是没找到哪里出问题.
最后决定求助 cocoachina 上的现场观众
最后开始一行一行的注释代码做终极调试.

离谱的事情发现了,只要我创建一个名为 mainText 的 UILabel ,在dealloc 中程序就会crash ,改成其他名字无事.难道是apple的bug? 新写了个view测试了,还是没问题.

接着接着就发现了在dealloc方法中:
` [mainText release] ,mainText = nil;
//	NSLog(@"release %@",bgView);
[bgView release];
//	NSLog(@"release %@",originView);
[originView release];
//	NSLog(@"release %@",labelArray);
[labelArray release];
//	NSLog(@"release %@",mainText);
[mainText release];
`
该死的,不知道当时那根神经错了,居然释放了两次,当然出错咯.问题也解决了.

所以在确认释放对象的情况下一定要写成:
[instance release],instance = nil ;

个人经验是,对于objective-c的内存管理都是得经过磨练才出来的,前期多犯错误是好事情.
当然我认识一个朋友 ,他不释放任何对象,因为反正关闭iPhone后系统会处理的.这种觉悟不是大部分程序员有的,大家还是稳步前进咯.

