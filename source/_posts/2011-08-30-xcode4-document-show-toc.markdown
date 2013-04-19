---
author: xhan
comments: true
date: 2011-08-30 22:50:23
layout: post
slug: xcode4-document-show-toc
title: XCode4 文档中激活文档目录功能
wordpress_id: 598
categories:
- 奇巧淫技
tags:
- document
- toc
- xcode4
---

在XCode3的文档中，我们可以方便的通过文档目录(Table of contents) 来迅速导航到需要的章节

![](http://i.stack.imgur.com/Md4Wa.png)

但是在xcode4中，居然去掉了这么重要的功能，而仅仅在文档顶部有个蹩脚的导航功能。

以下是重点，一句话恢复toc


> 

>     
>     
>     sudo egrep -lRZ "Prototype.Browser.Xcode4OrNewer=Prototype.Browser.XcodeVersion<1000;" /Library/Developer/Documentation/DocSets | xargs -0 -L % sudo sed -i '' -e 's/Prototype\.Browser\.Xcode4OrNewer\=Prototype\.Browser\.XcodeVersion\<1000\;/Prototype\.Browser\.Xcode4OrNewer\=false\;/g'
> 
> 



稍等片刻后目录便回来了，这下查阅文档方便不少。

[源地址](http://stackoverflow.com/questions/5408329/xcode-4-documentation-how-to-show-the-table-of-contents/5753222#5753222)
