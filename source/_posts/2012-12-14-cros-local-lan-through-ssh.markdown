---
author: xhan
comments: true
date: 2012-12-14 17:50:05
layout: post
slug: cros-local-lan-through-ssh
title: 通过SSH穿梭内网
wordpress_id: 847
categories:
- Knowledge
tags:
- 小道盒子
- ssh
- ssh -R
---

买了个小道盒子却怎么也没法正常使用。

和客服联系后需要对方ssh到路由上检查，但对方又以安全理由要求必须本人操作。我们小区是个大型局域网根本没有外网IP，怎么解决呢？

网上搜索了下，原来SSH本身就提供了类似功能：

首先你需要有一台有外网地址的机器。我们叫做BRIDGE吧。内网机器叫做LOCAL

LOCAL->BRIDGE  从本地连接到跳板机器上 ssh -R 22222:localhost:22 BRIDGE
(也就是将所有发往BRIDGE端口2222的数据都转发到LOCAL的22端口上)

TARGET->BRIDGE 常规ssh连接

BRIDGE->LOCAL  ssh name@localhost -p 22222

这样就成功能从任何一台机器穿梭到内网上。当然，也成功搞定了小道盒子的问题。希望接下来能稳定工作，别逼我贡出退货大招了。:D

-- updated at 22APR2013 --  
如果还对小道盒子有点兴趣的同学，奉劝不如自己动手折腾。盒子在正常使用2周后然后又瘫痪了。  
客服再三也联系不上(QQ,邮箱，电话），所以彻底死了这条心就当花了500快钱认清了这个小破机构。   
在这盒子上浪费的时间足够自己搭建个自己的翻墙wifi了。（当然我们后来的选择是pac+ssh全局代理)  