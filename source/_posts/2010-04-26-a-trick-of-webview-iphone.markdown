---
author: xhan
comments: true
date: 2010-04-26 15:55:38
layout: post
slug: a-trick-of-webview-iphone
title: WebView 小技巧
wordpress_id: 302
categories:
- iOS
tags:
- apple
- iOS
- javascript
- trick
- webview
---

apple 把 webview 封装的实在太简单了.

留给开发者只有寥寥几个api,甚至连scrollview的基本操作都没法完成.

不过下面这个方法


> stringByEvaluatingJavaScriptFromString:String


还是给了些希望.

搜索后发现果然javascript提供了一系列移动页面的操作



	
  * window.pageYOffset   获得当前页面的偏移

	
  * window.scrollTo(x,y) 将页面偏移到指定位置


这样我的需求就实现了.当然js能做的事情太多了,给webview换一套css也不是不可能的.

好像 Reeder 以及 便携百科ipad 就是这么做到的吧. 这两款软件都做得相当完美,体验上也无可挑剔.作者确实费了不少心血.

用心的产品才能引起共鸣.
