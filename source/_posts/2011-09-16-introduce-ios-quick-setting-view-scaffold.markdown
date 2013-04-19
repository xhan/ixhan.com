---
author: xhan
comments: true
date: 2011-09-16 19:18:52
layout: post
slug: introduce-ios-quick-setting-view-scaffold
title: '[iOS]设置界面快速生成脚手架介绍'
wordpress_id: 618
categories:
- iOS
---

写iOS程序最讨厌的就是写个如下图的设置界面 或 登陆（注册）界面了

![](https://github.com/escoz/QuickDialog/raw/master/other/quickdialog2.png)

这完全是体力活，没头脑，还得在cell里加入一大堆控件。同时由于tableview的重用机制，导致必须每次都得对各个控件设置属性，防止出现内容错误。

虽然iOS5中增加了新的静态tableview类型，可等它普及估计至少要半年，还是早些其他解决方法为妙。

目前有两个开源的代码能完成类似的功能


# InAppSettingsKit


原来是将苹果app外部的setting.bundle在程序内部显示用的开源库。现在也提供了快速搭建脚手架的功能

地址 https://github.com/futuretap/InAppSettingsKit


# QuickDialog


QuickDialog allows you to create HIG-compliant iOS forms for your apps without having to directly deal with UITableViews, delegates and data sources. Fast and efficient, you can create forms with multiple text fields, or with thousands of items with no sweat!

刚发现的，看起来比InAppSetting方便，未测试使用过～

地址 https://github.com/escoz/QuickDialog/
