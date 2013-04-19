---
author: xhan
comments: true
date: 2011-11-25 20:29:31
layout: post
slug: applescript-to-update-adium-statu
title: 用AppleScript设置Adium的状态信息
wordpress_id: 674
categories:
- 奇巧淫技
tags:
- Adium
- AppleScript
---

找了下找到个比较挫的办法


> 

>     
>     tell application "Adium"
>     	go away with message "Busy"
>     end tell
> 
> 



但是必须指定鸭子的状态, 最后翻了下[文档](http://trac.adium.im/wiki/AppleScript_Support_1.2)自己写了段测试成功:


> 

>     
>     tell application "Adium"
>     	set the title of every status to "funny"
>     	set the status of every account whose status type is not offline to the first status whose title is "funny"
>     	#   也可以这么写
>     	#	repeat with state in every status
>     	#		set title of state to "come on baby"
>     	#	end repeat
>     end tell
> 
> 



也许下版本 LessDJ 会多个同步歌曲信息到 鸭子状态的功能 :D

对了 LessDJ 上线一周下载2000多次了, 但最近状态低迷, 需要些时间来添加新功能.
