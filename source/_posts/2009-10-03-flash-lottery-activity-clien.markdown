---
author: xhan
comments: true
date: 2009-10-03 09:35:45
layout: post
slug: flash-lottery-activity-clien
title: '[Flash]转盘抽奖系统客户端'
wordpress_id: 40
categories:
- Project
tags:
- c
- 转盘
- Flash
- Flex
- png
- 抽奖
---

[caption id="attachment_38" align="aligncenter" width="480" caption="展示界面"][![展示界面](http://ixhan.com/wp-content/uploads/2009/10/Screen-shot-2009-10-03-at-9.59.20-AM.png)](http://ixhan.com/wp-content/uploads/2009/10/Screen-shot-2009-10-03-at-9.59.20-AM.png)[/caption]

[caption id="attachment_39" align="aligncenter" width="300" caption="全站外貌"][![全站外貌](http://ixhan.com/wp-content/uploads/2009/10/Screen-shot-2009-10-03-at-9.58.51-AM-300x200.png)](http://ixhan.com/wp-content/uploads/2009/10/Screen-shot-2009-10-03-at-9.58.51-AM.png)[/caption]

版权关系只提供 Flash 端代码。

写这个东西设计上出了点漏洞，回顾代码整个项目只有一frame 。所以浪费了很多代码控制各个组件 visible 属性。

还有在如何控制指针缓慢停下到最后位置的设计也有点赶巧，一开始为了节约设计时间直接凑了几个数字做时间关键字。结果效果不理想，调整了很久才勉强看起来自然点。如果一开始就用物理方法计算估计效率会高很多。

附源码，有debug模式，单机也可以玩玩～

开发环境： Flex3(代码) + Flash10(界面)

项目时间：2009年3月20日

开发时间：一周（服务端和客户端）<!-- more -->

[flash-lottery-src](http://ixhan.com/wp-content/uploads/2009/10/src.zip)
