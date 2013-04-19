---
author: xhan
comments: true
date: 2009-11-02 21:10:37
layout: post
slug: osx-terminal-keyshort
title: OSX Terminal(终端) 使用快捷键
wordpress_id: 144
categories:
- Knowledge
tags:
- 快捷键
- 分享
- bash
- c
- 终端
- svn
- terminal
---

之前唯一会用的终端快捷键只有 up 和 down 。碰到长串命令中打错几个字母就很麻烦了，今天学到几个快捷键分享下。

首先勾选设置-》键盘-》使用 option 键作为 meta 键。

然后就可以使用如下快捷键了：



	
  * control + a / e    回到命令行头/尾

	
  * option + b / f     向前/后跳一个单词

	
  * control +u /k    删除光标前/后 所有单词

	
  * control + y       撤销上个操作


Enjoy It !

最后有个好玩的命令，查看最常用的10个命令（最近500个命令）

awk '{print $1}' ~/.bash_history | sort | uniq -c | sort -gr | head<!-- more -->

我的结果


> 100 ls
68 git
63 cd
54 svn
28 fq
20 find
18 open
18 curl
16 ssh
10 rm


终于不再全是 ls + cd 了。
