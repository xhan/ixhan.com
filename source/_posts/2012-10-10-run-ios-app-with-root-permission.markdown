---
author: xhan
comments: true
date: 2012-10-10 20:04:24
layout: post
slug: run-ios-app-with-root-permission
title: 用root权限运行你的ios程序
wordpress_id: 823
categories:
- iOS
tags:
- iOS
- jailbreak
- postinst
- root
- root permission
- theos
---

不管手机是否越狱，你的程序都是以 mobile 用户运行的。非越狱应用 /var/mobile/application* 有沙盒限制，系统和越狱应用 /application/* 有全局的文件访问权限，但是在 mobile 用户的限制下还是有不少限制。

用root权限运行程序会承受额外的风险，但我们可以享受到[额外的无尽的快乐](http://ixhan.com/2012/10/memscan-ios-game-cheater/)。

在这之前简单介绍下Linux权限， 文件权限由（用户，组，所有人）组成， 每个类别又分别是（读4，写2，运行1）的多选。所以文件的默认状态 644 意味着属性是他人只读，自己享有写入权限。（用户组的概念此处不说了，用不到，需要自己查阅，推荐看下[鸟哥的linux私房菜](http://vbird.dic.ksu.edu.tw)）

但我最近才了解到的是，linux中还有个不常用的权限标记，比如 0666 ,4666 里的第一位数字。第0位标记意义如下：
0 :  正常权限
2 :  gid共享可执行，也就是运行此程序后，会继承到文件group owner的权限
4 :  sid 共享可执行，会继承到文件owner的权限

你可以编写个 sudo whoami 的脚本，修改权限和owner后用普通账户运行下看看效果。

回到iOS 程序上，用这个技巧就能简单的让程序以root权限跑起来。（代码在尾部）

还有最后个问题，文件从安装包拷贝到ios设备上后，会导致文件权限发生变化。这个可以用 deb包的部署脚本搞定。

demo.deb/
-> /Applications/demo.app
-> /DEBIAN/(control,postinst,preinst , prerm, postrm)

这是个基本越狱app的安装包结构。 contrl记录的是包信息，包括作者，依赖，包名等。

其他4个脚步分别会在包安装前，安装后，卸载前，卸载后被执行到。由于继承了 Cydia 的 root权限。在这些脚本中我们可以简单的将软件包的权限修正。

[Demo地址(需要theos) https://github.com/xhan/jailbreak-app-with-root-permission](https://github.com/xhan/jailbreak-app-with-root-permission)
