---
author: xhan
comments: true
date: 2009-10-29 09:54:53
layout: post
slug: ubuntu-910-sources-list
title: Ubuntu 9.10(karmic) 升级源(sources.list)
wordpress_id: 138
categories:
- Knowledge
tags:
- '9.10'
- c
- karmic
- list
- sources
- ubuntu
---

### 备份软件源:


`sudo cp /etc/apt/sources.list /etc/apt/sources.list_backup`


### 编辑软件源:


`sudo gedit /etc/apt/sources.list`


### 更新软件源:


`sudo apt-get update`

#----- contents of sources.list  ---------------------------------------------------------------#

#传说中的中国科技大学 5M/s
deb http://debian.ustc.edu.cn/ubuntu/ karmic main restricted universe multiverse
deb http://debian.ustc.edu.cn/ubuntu/ karmic-backports restricted universe multiverse
deb http://debian.ustc.edu.cn/ubuntu/ karmic-proposed main restricted universe multiverse
deb http://debian.ustc.edu.cn/ubuntu/ karmic-security main restricted universe multiverse<!-- more -->
deb http://debian.ustc.edu.cn/ubuntu/ karmic-updates main restricted universe multiverse
deb-src http://debian.ustc.edu.cn/ubuntu/ karmic main restricted universe multiverse
deb-src http://debian.ustc.edu.cn/ubuntu/ karmic-backports main restricted universe multiverse
deb-src http://debian.ustc.edu.cn/ubuntu/ karmic-proposed main restricted ukarmicniverse multiverse
deb-src http://debian.ustc.edu.cn/ubuntu/ karmic-security main restricted universe multiverse
deb-src http://debian.ustc.edu.cn/ubuntu/ karmic-updates main restricted universe multiverse
#传说中的北京交大 速度 2M/s
deb http://mirror.bjtu.edu.cn/ubuntu/ karmic main restricted universe multiverse
deb http://mirror.bjtu.edu.cn/ubuntu/ karmic-backports restricted universe multiverse
deb http://mirror.bjtu.edu.cn/ubuntu/ karmic-proposed main restricted universe multiverse
deb http://mirror.bjtu.edu.cn/ubuntu/ karmic-security main restricted universe multiverse
deb http://mirror.bjtu.edu.cn/ubuntu/ karmic-updates main restricted universe multiverse
deb-src http://mirror.bjtu.edu.cn/ubuntu/ karmic main restricted universe multiverse
deb-src http://mirror.bjtu.edu.cn/ubuntu/ karmic-backports main restricted universe multiverse
deb-src http://mirror.bjtu.edu.cn/ubuntu/ karmic-proposed main restricted universe multiverse
deb-src http://mirror.bjtu.edu.cn/ubuntu/ karmic-security main restricted universe multiverse
deb-src http://mirror.bjtu.edu.cn/ubuntu/ karmic-updates main restricted universe multiverse
#传说中的上海交通大学，最热门的源之一
deb http://ftp.sjtu.edu.cn/ubuntu/ karmic main multiverse restricted universe
deb http://ftp.sjtu.edu.cn/ubuntu/ karmic-backports main multiverse restricted universe
deb http://ftp.sjtu.edu.cn/ubuntu/ karmic-proposed main multiverse restricted universe
deb http://ftp.sjtu.edu.cn/ubuntu/ karmic-security main multiverse restricted universe
deb http://ftp.sjtu.edu.cn/ubuntu/ karmic-updates main multiverse restricted universe
deb http://ftp.sjtu.edu.cn/ubuntu-cn/ karmic main multiverse restricted universe
deb-src http://ftp.sjtu.edu.cn/ubuntu/ karmic main multiverse restricted universe
deb-src http://ftp.sjtu.edu.cn/ubuntu/ karmic-backports main multiverse restricted universe
deb-src http://ftp.sjtu.edu.cn/ubuntu/ karmic-proposed main multiverse restricted universe
deb-src http://ftp.sjtu.edu.cn/ubuntu/ karmic-security main multiverse restricted universe
deb-src http://ftp.sjtu.edu.cn/ubuntu/ karmic-updates main multiverse restricted universe
#传说中的清华大学ubuntu源 300k/s
deb ftp://ftp3.tsinghua.edu.cn/mirror/ubuntu/ubuntu/ karmic main restricted universe multiverse
deb ftp://ftp3.tsinghua.edu.cn/mirror/ubuntu/ubuntu/ karmic-backports restricted universe multiverse
deb ftp://ftp3.tsinghua.edu.cn/mirror/ubuntu/ubuntu/ karmic-proposed main restricted universe multiverse
deb ftp://ftp3.tsinghua.edu.cn/mirror/ubuntu/ubuntu/ karmic-security main restricted universe multiverse
deb ftp://ftp3.tsinghua.edu.cn/mirror/ubuntu/ubuntu/ karmic-updates main restricted universe multiverse
deb-src ftp://ftp3.tsinghua.edu.cn/mirror/ubuntu/ubuntu/ karmic main restricted universe multiverse
deb-src ftp://ftp3.tsinghua.edu.cn/mirror/ubuntu/ubuntu/ karmic-backports main restricted universe multiverse
deb-src ftp://ftp3.tsinghua.edu.cn/mirror/ubuntu/ubuntu/ karmic-proposed main restricted universe multiverse
deb-src ftp://ftp3.tsinghua.edu.cn/mirror/ubuntu/ubuntu/ karmic-security main restricted universe multiverse
deb-src ftp://ftp3.tsinghua.edu.cn/mirror/ubuntu/ubuntu/ karmic-updates main restricted universe multiverse
#传说中的兰州大学 260k/s
deb ftp://mirror.lzu.edu.cn/ubuntu/ karmic main restricted universe multiverse
deb ftp://mirror.lzu.edu.cn/ubuntu/ karmic-backports restricted universe multiverse
deb ftp://mirror.lzu.edu.cn/ubuntu/ karmic-proposed main restricted universe multiverse
deb ftp://mirror.lzu.edu.cn/ubuntu/ karmic-security main restricted universe multiverse
deb ftp://mirror.lzu.edu.cn/ubuntu/ karmic-updates main restricted universe multiverse
deb-src ftp://mirror.lzu.edu.cn/ubuntu/ karmic main restricted universe multiverse
deb-src ftp://mirror.lzu.edu.cn/ubuntu/ karmic-backports main restricted universe multiverse
deb-src ftp://mirror.lzu.edu.cn/ubuntu/ karmic-proposed main restricted universe multiverse
deb-src ftp://mirror.lzu.edu.cn/ubuntu/ karmic-security main restricted universe multiverse
deb-src ftp://mirror.lzu.edu.cn/ubuntu/ karmic-updates main restricted universe multiverse
#传说中的台湾大学 中国电信adsl 150k/s
deb http://ubuntu.csie.ntu.edu.tw/ubuntu/ karmic main restricted universe multiverse
deb http://ubuntu.csie.ntu.edu.tw/ubuntu/ karmic-backports restricted universe multiverse
deb http://ubuntu.csie.ntu.edu.tw/ubuntu/ karmic-proposed main restricted universe multiverse
deb http://ubuntu.csie.ntu.edu.tw/ubuntu/ karmic-security main restricted universe multiverse
deb http://ubuntu.csie.ntu.edu.tw/ubuntu/ karmic-updates main restricted universe multiverse
deb-src http://ubuntu.csie.ntu.edu.tw/ubuntu/ karmic main restricted universe multiverse
deb-src http://ubuntu.csie.ntu.edu.tw/ubuntu/ karmic-backports main restricted universe multiverse
deb-src http://ubuntu.csie.ntu.edu.tw/ubuntu/ karmic-proposed main restricted universe multiverse
deb-src http://ubuntu.csie.ntu.edu.tw/ubuntu/ karmic-security main restricted universe multiverse
deb-src http://ubuntu.csie.ntu.edu.tw/ubuntu/ karmic-updates main restricted universe multiverse
#传说中的电子科大
deb http://ubuntu.uestc.edu.cn/ubuntu karmic main restricted universe multiverse
deb http://ubuntu.uestc.edu.cn/ubuntu karmic-backports main restricted universe multiverse
deb http://ubuntu.uestc.edu.cn/ubuntu karmic-proposed main restricted universe multiverse
deb http://ubuntu.uestc.edu.cn/ubuntu karmic-security main restricted universe multiverse
deb http://ubuntu.uestc.edu.cn/ubuntu karmic-updates main restricted universe multiverse
deb-src http://ubuntu.uestc.edu.cn/ubuntu karmic main restricted universe multiverse
deb-src http://ubuntu.uestc.edu.cn/ubuntu karmic-backports main restricted universe multiverse
deb-src http://ubuntu.uestc.edu.cn/ubuntu karmic-proposed main restricted universe multiverse
deb-src http://ubuntu.uestc.edu.cn/ubuntu karmic-security main restricted universe multiverse
deb-src http://ubuntu.uestc.edu.cn/ubuntu karmic-updates main restricted universe multiverse
deb http://ubuntu.uestc.edu.cn/ubuntu-cn karmic main restricted universe multiverse
deb http://ubuntu.uestc.edu.cn/ubuntustudio karmic main
#传说中的清华，,但不是清华大学的官方域名
deb http://mirror9.net9.org/ubuntu/ karmic main multiverse restricted universe
deb http://mirror9.net9.org/ubuntu/ karmic-backports main multiverse restricted universe
deb http://mirror9.net9.org/ubuntu/ karmic-proposed main multiverse restricted universe
deb http://mirror9.net9.org/ubuntu/ karmic-security main multiverse restricted universe
deb http://mirror9.net9.org/ubuntu/ karmic-updates main multiverse restricted universe
deb-src http://mirror9.net9.org/ubuntu/ karmic main multiverse restricted universe
deb-src http://mirror9.net9.org/ubuntu/ karmic-backports main multiverse restricted universe
deb-src http://mirror9.net9.org/ubuntu/ karmic-proposed main multiverse restricted universe
deb-src http://mirror9.net9.org/ubuntu/ karmic-security main multiverse restricted universe
deb-src http://mirror9.net9.org/ubuntu/ karmic-updates main multiverse restricted universe
deb http://mirror9.net9.org/ubuntu-cn/ karmic main multiverse restricted universe
#传说中的电子科大,但不是uestc的官方域名
deb http://ubuntu.dormforce.net/ubuntu karmic main restricted universe multiverse
deb http://ubuntu.dormforce.net/ubuntu karmic-backports main restricted universe multiverse
deb http://ubuntu.dormforce.net/ubuntu karmic-proposed main restricted universe multiverse
deb http://ubuntu.dormforce.net/ubuntu karmic-security main restricted universe multiverse
deb http://ubuntu.dormforce.net/ubuntu karmic-updates main restricted universe multiverse
deb-src http://ubuntu.dormforce.net/ubuntu karmic main restricted universe multiverse
deb-src http://ubuntu.dormforce.net/ubuntu karmic-backports main restricted universe multiverse
deb-src http://ubuntu.dormforce.net/ubuntu karmic-proposed main restricted universe multiverse
deb-src http://ubuntu.dormforce.net/ubuntu karmic-security main restricted universe multiverse
deb-src http://ubuntu.dormforce.net/ubuntu karmic-updates main restricted universe multiverse
#传说中的东北大学更新服务器：
deb ftp://ftp.neu.edu.cn/mirror/archive.ubuntu.com/ubuntu/ karmic main multiverse restricted universe
deb ftp://ftp.neu.edu.cn/mirror/archive.ubuntu.com/ubuntu/ karmic-backports main multiverse restricted universe
deb ftp://ftp.neu.edu.cn/mirror/archive.ubuntu.com/ubuntu/ karmic-proposed main multiverse restricted universe
deb ftp://ftp.neu.edu.cn/mirror/archive.ubuntu.com/ubuntu/ karmic-security main multiverse restricted universe
deb ftp://ftp.neu.edu.cn/mirror/archive.ubuntu.com/ubuntu/ karmic-updates main multiverse restricted universe
deb-src ftp://ftp.neu.edu.cn/mirror/archive.ubuntu.com/ubuntu/ karmic main multiverse restricted universe
deb-src ftp://ftp.neu.edu.cn/mirror/archive.ubuntu.com/ubuntu/ karmic-backports main multiverse restricted universe
deb-src ftp://ftp.neu.edu.cn/mirror/archive.ubuntu.com/ubuntu/ karmic-proposed main multiverse restricted universe
deb-src ftp://ftp.neu.edu.cn/mirror/archive.ubuntu.com/ubuntu/ karmic-security main multiverse restricted universe
deb-src ftp://ftp.neu.edu.cn/mirror/archive.ubuntu.com/ubuntu/ karmic-updates main multiverse restricted universe
#传说中的厦门大学
deb ftp://ubuntu.realss.cn/ubuntu/ karmic main restricted universe multiverse
deb ftp://ubuntu.realss.cn/ubuntu/ karmic-backports restricted universe multiverse
deb ftp://ubuntu.realss.cn/ubuntu/ karmic-proposed main restricted universe multiverse
deb ftp://ubuntu.realss.cn/ubuntu/ karmic-security main restricted universe multiverse
deb ftp://ubuntu.realss.cn/ubuntu/ karmic-updates main restricted universe multiverse
deb-src ftp://ubuntu.realss.cn/ubuntu/ karmic main restricted universe multiverse
deb-src ftp://ubuntu.realss.cn/ubuntu/ karmic-backports main restricted universe multiverse
deb-src ftp://ubuntu.realss.cn/ubuntu/ karmic-proposed main restricted universe multiverse
deb-src ftp://ubuntu.realss.cn/ubuntu/ karmic-security main restricted universe multiverse
deb-src ftp://ubuntu.realss.cn/ubuntu/ karmic-updates main restricted universe multiverse
#传说中的西南财经大学
deb http://ftp.swufe.edu.cn/mirror/ubuntu/ karmic main restricted universe multiverse
deb http://ftp.swufe.edu.cn/mirror/ubuntu/ karmic-backports restricted universe multiverse
deb http://ftp.swufe.edu.cn/mirror/ubuntu/ karmic-proposed main restricted universe multiverse
deb http://ftp.swufe.edu.cn/mirror/ubuntu/ karmic-security main restricted universe multiverse
deb http://ftp.swufe.edu.cn/mirror/ubuntu/ karmic-updates main restricted universe multiverse
deb-src http://ftp.swufe.edu.cn/mirror/ubuntu/ karmic main restricted universe multiverse
deb-src http://ftp.swufe.edu.cn/mirror/ubuntu/ karmic-backports main restricted universe multiverse
deb-src http://ftp.swufe.edu.cn/mirror/ubuntu/ karmic-proposed main restricted universe multiverse
deb-src http://ftp.swufe.edu.cn/mirror/ubuntu/ karmic-security main restricted universe multiverse
deb-src http://ftp.swufe.edu.cn/mirror/ubuntu/ karmic-updates main restricted universe multiverse
