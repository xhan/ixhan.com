---
author: xhan
comments: true
date: 2011-04-18 23:05:54
layout: post
slug: crazytext-my-first-macruby-app
title: CrazyText - My First MacRuby App
wordpress_id: 539
categories:
- Coding
- Project
tags:
- crazy text
- MacRuby
- opensource
---

前不久听说MacRuby 0.10 发布,并支持了Mac App Store 的发布.

于是边学习Ruby边学习MacRuby边学习cocoa 写了这么一个东西.

A MacOSX app written in Macruby to create some funny  effects for your texts.

[![](http://ixhan.com/wp-content/uploads/2011/04/crazy_text_screenshot1.jpg)](http://ixhan.com/wp-content/uploads/2011/04/crazy_text_screenshot1.jpg)

提交时候提示MacRuby.framework内的几个link位置不对. 忘记什么提示了,需要手动修复几个link文件的地址.

对了1 :源码请移步 github-> [https://github.com/xhan/CrazyText](https://github.com/xhan/CrazyText)

对了2:

[![](https://developer.apple.com/appstore/images/available-on-mac-app-store.png)](http://itunes.apple.com/us/app/crazy-text/id431122700?mt=12) 可以在[appstore](http://itunes.apple.com/us/app/crazy-text/id431122700?mt=12)下载哦

部分UI仍然使用 objc编写(有些类和方法实在不知道如何用ruby实现)

个人感觉macruby 的学习曲线还真蛮高的,会cocoa,会ruby,还得会MacRuby,非常坑人,而且调试也非常又难度.
