---
author: xhan
comments: true
date: 2011-03-27 00:21:44
layout: post
slug: using-hamachi-to-remote-control-macs-anywhere
title: 使用Hamachi和Screen Share远程管理你的Mac
wordpress_id: 516
categories:
- Knowledge
tags:
- mac
- remote control
---

这年头越来越多的同学有了一台以上的Mac电脑,这时候各种数据的同步就显的尤为重要了.

文档同步我使用的是 [EverNote](http://www.evernote.com/) ,从09年使用至今,非常好用,备忘录,便携帖,代办实现,文字同步皆可搞定.而且支持图片中的文字识别搜索.

文件同步我使用的是 DropBox ,前不久被墙了一段时间,现在仍然无法打开主页但可正常使用. 如果你翻越长城可点击这个链接注册 [http://db.tt/7egLc0l](http://db.tt/7egLc0l) ,同时会带给我250M额外的空间 :D

远程控制就不需要额外的软件了,苹果系统中内嵌了了Screen Share程序. 屏幕共享可以在网络比较差的情况下仍然保持着顺畅的连接,你可以使用它来:



	
  * 远程操作Mac

	
  * 在公司监视家中电脑下载小片片的进度

	
  * 远程玩游戏,看电影

	
  * 在远程机器上启动PhotoBooth 做远程监视器


屏幕共享还有两个很赞的功能

	
  * 支持两个机器间的复制/粘贴!!! 非常方便工作的同学

	
  * 支持大部分快捷键,甚至包括截图,程序切换


你可以在目标机器(需要被远程控制的机器)的控制面板的共享中找到"屏幕共享"选项(本人英文版的系统,勉强看下了)

![Preference-Sharing](http://ixhan.com/wp-content/uploads/2011/03/%e8%8d%89%e5%8e%9fPreference-Sharing.png)

激活屏幕共享,然后添加常用的用户(比如你当前用户),当然你还可以在电脑设定里面增加连接时需要额外的密码确认.

**连接远程Mac**



	
  * 局域网


在局域网下你应该能在Finder侧面的共享里看到另一台电脑,选中,点击屏幕共享就可以连接上了.

![Finder-Shared](http://ixhan.com/wp-content/uploads/2011/03/Finder-Shared.png)

如果无法在共享中看到机器(比如局域网过大,比如偶公司的超级局域网,比如RP问题),可以在Finder的菜单中 选择/前往/服务器 Command+K

输入 vnc://远程机器的ip地址 进行访问



	
  * 非同一个网段(比如某机器在公司,某机器在家里)


对于没有外网的机器来说就无法使用屏幕共享连接了,但是有了Hamachi这个虚拟局域网软件,可以模拟任何电脑在一个局域网中(类似浩方游戏对战平台的实现).

首先下载 [Hamachi 免费版](https://secure.logmein.com/products/hamachi2/), 官方已经提供了中文版服务 ,应该很容易下载并安装了.

在两个机器上分别安装Hamachi后在其中一台机器上选择创建网络,另一电脑上选择加入网络. 这时候你的虚拟局域网就搭建完成了.

[当然你也可以选择和logmein的账号绑定起来,以后管理更方便]

成功后的截图,可以看到当前机器是air,远程机器是iMac. 绿点就表示链接成功啦

![Hamachi-success](http://ixhan.com/wp-content/uploads/2011/03/Hamachi-success.png)

接下来要做的和局域网的步骤一致,在Finder上找到机器或直接输入IP地址!

附上远程机器截图一张,还开了个虚拟xp系统.嘿嘿Enjoy!!!

![Screen-Sharing-Demo](http://ixhan.com/wp-content/uploads/2011/03/Screen-Sharing-Demo.png)

最后,如果大家觉得Dock上一直有个蘑菇头的图标很不舒服,可以使用如下方法去掉:



	
  * 进入/Application/文件夹, 点击Hamachi右键,选择显示包内详情.

	
  * 找到content/info.plist 文件,打开

	
  * 添加一行内容 key LSUIElement, type : Boolean, Value: YES

	
  * 重新允许程序!!


