---
author: xhan
comments: true
date: 2009-10-05 23:41:57
layout: post
slug: how-to-let-iphone-play-midi-file
title: '[iPhone]播放midi文件'
wordpress_id: 62
categories:
- Coding
tags:
- c
- iOS
- midi
- opensource
- sound
---

iPhone 默认不带播放MIDI的框架，所以播放MIDI还得寻求第3方的库帮忙。

这里使用的库就是大名鼎鼎的 [FMOD](http://www.fmod.org/) ,许多火爆游戏使用的都是这个库。开发者可以免费下载使用。

首先下载安装 FMOD API FOR IPHONE：
[http://www.fmod.org/index.php/release/version/fmodapi42607iphone-installer.dmg](http://www.fmod.org/index.php/release/version/fmodapi42607iphone-installer.dmg)

安装后可以在目录中看到不少示范代码，可惜没有MIDI。

自己写一个：）
感谢强大的api，写起来异常轻松。



	
  * 新建一个基于view项目

	
  * 修改项目属性，添加 Other Linker Flags 为 -lfmodexL_$PLATFORM_NAME

	
  * 添加 Header Search Paths ：/Developer/FMOD\ Programmers\ API\ iPhone/api/inc  （默认是这个位置，修改成自己FMOD安装的目录）

	
  * 添加 Library Search Paths ：/Developer/FMOD\ Programmers\ API\ iPhone/api/lib （同上）

	
  * 把 appDelegate 修改成 .mm 的后缀

	
  * MIDI 播放需要一个 DLS 文件， 在osx 下没找到，这里使用了xp 自带的 gm.dls 文件（3M 有点大～）,拷贝到项目中。

	
  * 修改ViewController 代码如下 ，随便在xib文件中链接两个按钮action上即可

	
  * 运行（真机有效）


主要源码：<!-- more -->



项目打包下载（懒人专用包）[PlayMidiDemo](http://ixhan.com/wp-content/uploads/2009/10/PlayMidiDemo.zip)
