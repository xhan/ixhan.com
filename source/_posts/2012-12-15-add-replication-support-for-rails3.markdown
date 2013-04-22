---
author: xhan
comments: true
date: 2012-12-15 15:31:43
layout: post
slug: add-replication-support-for-rails3
title: Rails3读写分离实现
wordpress_id: 850
categories:
- Rails
tags:
- 读写分离
- fabric
- mysql
- Rails3
- replication
---

8月份尝试过将系统的管理后台读写分离开，但ruby社区常常发生这样的情况，一个挺好的项目突然就没人维护了（比如rails2时代读写分离利器data_fabric）。或是一个项目基本没文档（这不举例了，直接机器生成的文档根本没法看啊）。所以当时搜寻后并最后选择了 octopus 这个gem，但简单尝试后发现配置未成功。也就放弃了。

这次迫于读写压力必须将读写分离实现，求教了闪总最后的选择还是 octopus ！一段摸索后终于成功！居然是官方教程的配置文件根本不对啊！！！简要操作步骤如下：

Gemfile 添加 gem
``` ruby 
'ar-octopus', :git => "git://github.com/tchandy/octopus.git", :require => "octopus"
```  
不选择master分支会和最新的Rails3.2冲突

然后是关键的slave服务器配置（默认的数据库配置就是master）

    
``` yaml
octopus:
  replicated: true
  octopus_enviroments:
    - development
    - production
  development:
    shards:
      slave1:
        adapter: mysql
        host: localhost
        database: octopus_replication_2
```


官方教程中少了 `shards:` 这个标签，所以导致配置没法正常使用。

官网地址 [Octopus](https://github.com/tchandy/octopus)
