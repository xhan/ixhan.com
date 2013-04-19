---
author: xhan
comments: true
date: 2009-10-22 14:11:02
layout: post
slug: redmine-images-manager-system
title: 用 Redmine 管理iPhone项目中过多的图片文件
wordpress_id: 110
categories:
- Rails
tags:
- c
- 项目管理
- iOS
- png
- redmine
- svn
---

XCode 项目管理估计是人见人恨，如果是一堆人一起做一个项目。真会被项目文件整疯的。

而如果项目中有大量图片（数百张级别），并且频繁更新。那你完了。

之前的流程是这样的：美工更新了图片到服务器共享文件夹，然后程序部再取下来更新项目中对应的图片或添加。步骤繁琐，而且更新不及时，非常影响程序部的效率。

然后计划给美工找个 osx 下简单好用的svn管理工具，找了多款也不满意。最后就诞生了这个简单的基于redmine的小插件。

[caption id="attachment_115" align="aligncenter" width="300" caption="Redmine Image SVN plugin"][![Redmine Image SVN plugin](http://ixhan.com/wp-content/uploads/2009/10/ImageSVNCommitPlugin-300x259.png)](http://ixhan.com/wp-content/uploads/2009/10/ImageSVNCommitPlugin.png)[/caption]

<!-- more -->-------------- 分割线  ----------------------

**功能**：同步项目中大量图片。
**流程**：按照正常方式更新图片，然后进入redmine进入图片提交系统，将改动提交到svn版本库。然后程序部更新项目文件，移除图片文件夹的引用，再重新将文件夹拖进去，更新项目管理配置文件。完成。
**原理介绍**：由于图片在svn中均被识别成bin文件，所以不会出现冲突情况，这样处理起来就非常简单了。只有3个状态：新建，修改和删除。

注1：本服务器使用的是freeBSD，无法支持中文命令，所以加了个判断是否是中文的条件。
注2：本项目中所有图片，文件夹都没有空格。如果存在请修改_ line.split ' ' _这句话。
注3：该代码很简单，没有太多纠错功能和提示。但是至少效果很好。
注4：使用前记得给www用户提供访问该svn文件夹的权限(i.e chmod -R 777 folderName ;chown -R www:www folderName)。

源代码：([`gist`](http://gist.github.com/215777))

