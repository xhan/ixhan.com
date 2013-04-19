---
author: xhan
comments: true
date: 2011-12-31 18:21:38
layout: post
slug: terminal-fast-switch-dir-to-finder-current-dictionar
title: '[Mac]终端中快速定位到Finder的当前路径'
wordpress_id: 689
categories:
- 奇巧淫技
tags:
- AppleScript
- mac
- terminal
---

平时工作会非常频繁的使用到命令行, 常见的场景是需要CD到Finder的当前路径操作, 或是打开命令行当前的路径.  后者通过 open .  即可打开. 而前者的操作就比较繁琐, 我需要先输入 cd[空格] ,然后将文件夹拖入到终端中.

在忍受了无数次拖拽后突然想到通过 AppleScript 来获取路径并传送到终端. 考虑过ruby,需要额外的gem支持.  考虑过用 objc 写个工具, 但随后发现个命令 osascript 能直接运行 AppleScript的代码 ,解脱!


> tell application "Finder" to set myname to POSIX path of (target of window 1 as alias)


这段代码能将当前的Finder的路径输出,  可以使用 osascript -e 'codes' 来测试结果.

编辑 ~/.profile  (没有就创建一个), 添加如下代码


> 

>     
>     function cdf() # cd to finder's front's window's path
>     {
>        path="`osascript -e 'tell application "Finder" to set myname to POSIX path of (target of window 1 as alias)' 2>/dev/null`"
>        if [ -n "$path" ]; then
>           echo "cd to $path"
>           cd "$path"
>        else
>           echo "no finder window finded"
>        fi  
>     }
> 
> 



然后source下此文件, 以后只要直接输入 cdf (cd-finder or cd-front 反正很好记) 即能切换到当前路径中.
