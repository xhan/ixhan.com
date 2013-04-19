---
author: xhan
comments: true
date: 2013-03-14 13:24:00
layout: post
slug: startsll-not-regonized-by-firefo
title: startssl + nginx 搭建https服务
wordpress_id: 858
categories:
- 奇巧淫技
tags:
- https
- nginx
- startssl
---

配置个nginx下的https服务比想想中的容易，startssl支持免费提供一个二级域名（仅，需要多个二级域名请花钱）一年的授权，当然过期后再续就可以了。

教程：申请startssl证书
http://www.chinaz.com/free/2010/1111/142581.shtml

教程：如何配置nginx https server
http://nginx.org/en/docs/http/configuring_https_servers.html

解决startssl申请的https证书在firefox下不可信任
原因是缺少根证书的问题，去官网下载两个文件合并即可
wget http://www.startssl.com/certs/ca.pem
wget http://www.startssl.com/certs/sub.class1.server.ca.pem
cat ssl.crt.bak ca.pem sub.class1.server.ca.pem > ssl.crt  
注意备份原证书，cat后可能会丢失换行，可以自行编辑下。
当然这个方案也是网上找的，出处页面不小心被关了，就不发地址了
