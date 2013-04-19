---
author: xhan
comments: true
date: 2012-10-31 13:39:13
layout: post
slug: host-your-own-cydia-repository
title: 搭建自己的Cydia源(OSX版)
wordpress_id: 839
categories:
- Coding
- iOS
tags:
- Cydia
- dpkg
- iOS
- jailbreak
- repository
---

> 用了半年多 myrepospace.com 来托管自己的越狱软件，最近发现网络实在糟糕，逼不得已自己搭建了一个，下面是教程。


**教程**

[http://www.saurik.com/id/7
](http://www.saurik.com/id/7)[http://www.graci.org/?p=11](http://www.graci.org/?p=118)

写的非常仔细，不翻译了。但是通过上面的教程不一定能成功搭建，下面写的是注意事项：

**Dpkg 依赖**

上文提到如何安装dpkg，也就是通过macport来安装dpkg。（这也是为嘛我之前软件要托管的原因，折腾很久没用brew安装成功dpkg和perl依赖）

**修改 dpkg-scanpackages 脚本**

vim /opt/local/bin/dpkg-scanpackages (macport安装的dpkg应该是这个目录)

1. 添加 @fieldpri 里最后的 Name 字段
2. 替换md5sum 为 md5

**发布**

把生成好的文件丢到服务器即可，Cydia 添加 http://apt.ixhan.com 试试？
