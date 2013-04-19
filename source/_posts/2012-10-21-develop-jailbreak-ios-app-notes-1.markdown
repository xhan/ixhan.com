---
author: xhan
comments: true
date: 2012-10-21 00:21:23
layout: post
slug: develop-jailbreak-ios-app-notes-1
title: iPhone越狱软件开发小计1
wordpress_id: 827
categories:
- Coding
- iOS
tags:
- dpkg
- iOS
- iphone
- jailbreak
- theos
---

马上睡觉了，简单记录下研究结果。

现在有两个不错的开发框架支持加速iPhone越狱软件的开发（这里说的越狱开发值得是开发一款 1.输入法 2.内测修改 3.短信监控 等需要内核特殊权限的app）,分别是 theos 和 iosOpenDev

**theos** 是一堆makefile 和perl 写的脚本，支持多平台开发。
**iosOpenDev** 是在 theos的基础上，增加了对xcode IDE的支持，并提供了多套模板，使得用户通过xcode就能编写和编译 越狱项目。

但由于 iosOpenDev 封装程度比较高，所以本人没有仔细研究。个人项目中均使用 theos 来帮助开发。

**让 THEOS 支持 modern objective-c syntax **

由于跨平台性质 theos 默认编译器是 gcc/g++ ，自然不支持objc的新语法了。修改 /targets/darwin/iphone.mk 的 gcc/g++  为苹果的 clang/clang++ 即可

**让 THEOS 不因为 warning 报错**

虽然我的完美风格也让我没法面对项目中任何warning，但有是简单测试项目卡在warning as errors过不去就尴尬了。 在makefile 头部添加  GO_EASY_ON_ME = 1 即可pass。 如果觉得编译结果的提示还是看的难受，可以再添加个 flag ： INTERNAL_CFLAGS += -Wunused-variable 就可以很清静了

**程序报错 sign error 9 (无法运行)**

我的情况是签名工具坏了（iphone上直接通过bigboss recommand tools 安装的 ldid），后来改用网上下载的另一个ldid就正常了。(之所以说这个是我也是在网络上找到解决方法的，居然这么坑爹的事情也有！）

**换更好的THEOS**

原作者howett的版本比较简约，没提供private header，以及没法忍受的在文件夹根部生成大量临时文件。最近刚刚切换成rpetrich的分支版本感觉非常好用。（如果想检查下生成的deb包内容 可以到 .theos/_ 里查看）

**dpkg on mac**

最早是用brew 安装的dpkg，但由于缺少perl的依赖导致不少功能没法使用。 最后使用macport 重新安装了dpkg 后才解脱了（虽然brew不建议和macport一起使用，目前未发现问题）


