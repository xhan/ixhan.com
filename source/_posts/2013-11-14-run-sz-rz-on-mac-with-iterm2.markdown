---
layout: post
title: "Run SZ RZ on Mac with iTerm2"
date: 2013-11-14 13:39
comments: true
categories: 
---
`rz sz` 是通过 *ZModem* 协议在远程服务器和终端机器间上传下载文件的利器，win下终端软件 *SecureCRT* 就自带了这个协议，所以经常看到在 SecureCRT 下敲个命令就能方便的导文件了。  

之前以为此命令为win系统独家设计所以也未曾多想，安心的用scp直到刚刚忍不住搜索了一把！答案如下：  

1. 安装 lrzsz  : `brew install lrzsz` (不知道brew的搜索 homebrew)
2. iTerm2
3. https://github.com/mmastrac/iterm2-zmodem

10.9 Mavericks 测试通过。目前发现的小问题是：中文名的文件传递会出错。