---
author: xhan
comments: true
date: 2012-10-08 00:45:50
layout: post
slug: memscan-ios-game-cheater
title: memscan - ios游戏内存修改工具
wordpress_id: 821
categories:
- iOS
- Project
tags:
- game cheater
- inject
- iOS
- memory search
---

**memscan** 是国庆期间计划的游戏修改器的调试模块，但因种种耽搁未能按期完成，便把这个小工具先施放出来。虽然简陋，但也能完成基本游戏的内存搜索和修改功能。

安装：添加cydia源 http://cydia.myrepospace.com/xhan/ 后就能找到 memscan 了。（另一款是我写的 [去广告插件](http://ixhan.com/2012/03/adblockpro-ios-in-app-ad-blocker/)）

使用方法：  

  * memscan为console程序，也就是没有UI，你需要连接上手机的shell(ssh,terminal等工具)后才能使用
  * 启动需要修改的软件/游戏，找到对应的pid值
  * 执行 memscan <pid>  (注，需要管理员权限)
  * 输入 help 就能看到命令列表了  
  
一个简单的游戏修改例子：(最近比较火的限免游戏 kindom rush )
	
  1. 启动memscan <pid> 后	
  2. s 730   # 730 是现在的金币数 	
  3. 买个东西后，金币变成了230	
  4. s 230   # 这时候出来只有一个结果了	
  5. set 0 88888   # 这句话是修改搜索结果中 第0个地址的值	
  6. 再购买个东西， 就能看到金币被修改了




