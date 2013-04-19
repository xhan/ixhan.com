---
author: xhan
comments: true
date: 2011-08-15 15:49:38
layout: post
slug: argument-error-on-application-controller
title: '[Rails]奇怪的 ArgumentError错误'
wordpress_id: 595
categories:
- Rails
tags:
- argumenterror
- keywords
- Rails
---

昨天抄起丢了多年的Rails折腾一个后台界面。

在routes里添加了如下两个新的操作

namespace do |admin|
admin.resources :reports, :collection => {:single=>:get, :process=>:post}
end

然后用rake routes 看了下没问题后便继续开始实现控制器中对应的代码。
但是却始终无法执行对应的操作,却提示错误:

ArgumentError (wrong number of arguments (2 for 0)):

甚至连之前能正常运行的方法也无法访问。

各种纠结搜索尝试一个多小时后终于发现，原来这次又撞到rails的关键字上了 Process 居然是关键字！！
换了个名字后果断欢快的跑了起来。
完。

附上万恶的[Rails+Ruby关键字列表地址](http://www.yup.com/articles/2007/01/31/no-reservations-about-keywords-in-ruby-on-rails)（非常多，以后有诡异情况记得先来这边查查）
