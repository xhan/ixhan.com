---
author: xhan
comments: true
date: 2013-03-24 17:09:45
layout: post
slug: fix-wifi-issues-on-mountain-lion
title: 解决Mountain Lion下wifi各种问题综合帖（网络共享）
wordpress_id: 861
categories:
- 奇巧淫技
tags:
- 网络共享
- wifi
---

无力吐槽苹果的系统，越做问题越多。今天尝试了下苹果的电话客服，结果打了10分钟得不到任何有建设性的解决方案后，客服建议稍等会儿，让我别挂机。继续等了10分钟后，对方没任何提示就挂了电话。回头想投诉发现苹果没有客服ID什么的，唉算了大苹果也是惹不起的。

最近碰到了WIFI图标上有个惊叹号，但是不影响使用可以正常上网！（坑爹的bug）
- 解决方法：网络设置/地点location/添加个新地点，并应用。 然后就正常了，估计哪个配置文件突然坑爹了。
出处：【WiFi Bug Fixes (Mac OS X 10.8 Mountain Lion)】 https://it.uoregon.edu/node/3342


10.8网络共享无法分配ip地址(dhcp)问题：
自从没有以太网线口后已经好久没用过网络共享这个功能（估计苹果开发和qa也是），公司购置了台mini准备做网络共享发现死活也没法提供正确的ip地址。一开始以为机器配置问题（安装了server软件），后用自己的rMBP测试同样dhcp服务根本不起作用，客户端分配到的ip地址都是 169.254 开头的（传说中的fakeip)。 各种方案折腾了2个小时（包括打什么也不懂的客服电话)后，终于解决：

> 删除一下文件，然后重启
/Library/Preferences/SystemConfiguration/com.apple.nat.plist /Library/Preferences/SystemConfiguration/NetworkInterfaces.plist /Library/Preferences/SystemConfiguration/com.apple.airport.preferences.plist
参考链接： 
【Internet Sharing and Self-Assigned IP】 https://discussions.apple.com/thread/2108373
【Lion won't give out DHCP addresses with Internet Sharing】 http://apple.stackexchange.com/questions/39623/lion-wont-give-out-dhcp-addresses-with-internet-sharing

