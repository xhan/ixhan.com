---
author: admin
comments: true
date: 2009-10-02 22:47:55
layout: post
slug: incredible-of-bash-code
title: 命令行的伟大
wordpress_id: 30
categories:
- Coding
tags:
- bash
- c
- Ruby
---

曾经用Ruby 写了个脚本用来统计项目中文件行数，没事打发下时间顺便满足下小小的虚荣感。

发于cocoaChina论坛中（[http://cocoachina.com/bbs/read.php?tid-8266.html](http://cocoachina.com/bbs/read.php?tid-8266.html)）。

结果惨遭鄙视。

原来用 bash 一句话就可以搞定 ！（用Ruby还写了那么多代码～悲剧了～）

[bash]

find . -name '*.m' -exec cat {} \; | wc -l

find . -name '*.h' -exec cat {} \; | wc -l

find . -name "*.m"  |xargs wc -l

[/bash]

掌握一些常用命令还是很能提高工作效率的。学习中。
