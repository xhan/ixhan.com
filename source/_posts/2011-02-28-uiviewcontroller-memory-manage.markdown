---
author: xhan
comments: true
date: 2011-02-28 23:24:30
layout: post
slug: uiviewcontroller-memory-manage
title: UIViewController 的内存管理
wordpress_id: 503
categories:
- Coding
- iOS
tags:
- memory manage
- UIViewController
---

在iOS3.0后,UIViewController多了一个叫做viewDidUnLoad的方法.不少人都不清楚这个方法的具体意义,苹果的文档也就一句"Called when the controller’s view is released from memory"　简单的解释了下,并要求你把IBOutlet绑定的视图给清空,为什么呢?

先看下UIViewController从创建view到展示的流程的几个函数


> -init
-initWithNibName:bundle:


这两个方法都是初始化一个vc,但请注意view不是这时候载入的


> -loadView
-viewDidLoad


当一个视图准备展现时,vc首先会判断view是否已经创建,否则便通过之前指定的xib文件来初始化view,以及绑定其他关系(若没有指定xib文件,则默认会搜索和vc同名的xib,比如myNameViewController就会搜索 myNameViewController.xib文件)

若是没有xib文件,你就可以在loadview中自己手动创建这个viewControoler需要的视图.
接下来就是调用到 -viewDidLoad,许多人喜欢在这里做些其他事情,比如做个http请求,建立个数组啥的, 这里若不处理正确,　-viewDidUnload 激活时内存就容易泄露了,稍后提到.


> -view()appear
-view()disappear


这几个方法就不解释了


> -viewDidUnload


该方法在收到内存警告,同时该视图并不在当前界面显示时候会被调用,此时该controller的view已经被释放并赋值为nil.
接下来你要做的是



	
  1. 把实例变量的子视图释放(IBOulet的,以及自己添加的),.

	
  2. 其他实例变量,比如之前在-viewDidLoaded中实例的数据数组,http请求释放掉.


因为当该viewController再次被激活准备显示时(比如navigationControler返回到上一级),vc发现自己的view为空后会重复之前的流程直到把view给创建起来,若没将自己额外添加的子视图,各种类实例变量释放,这里便会重新再次创建.

于是,内存泄露了.
