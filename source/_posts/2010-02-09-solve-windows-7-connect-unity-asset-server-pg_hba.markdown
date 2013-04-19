---
author: xhan
comments: true
date: 2010-02-09 20:13:38
layout: post
slug: solve-windows-7-connect-unity-asset-server-pg_hba
title: 解决windows 7 连接 unity asset server 出现 no pg_hba.conf entry for host 的错误
wordpress_id: 281
categories:
- Knowledge
tags:
- 3D
- asset server
- c
- unity
---

出现错误的原因是 unity3d asset server 使用了 PostgreSQL

而在配置文件中没有对IPV6做白名单操作。

    
    #                   PostgreSQL HOST ACCESS CONTROL FILE
    #
    
    local  all                                          trust
    host   all        127.0.0.1      255.255.255.255    trust
    host   booktown   192.168.1.3    255.255.255.255    ident    sales
    host   all        192.168.1.4    255.255.255.255    ident    audit
    当然最简单的做法，只要在网络连接中将 ipv6 关闭就能连接了。
