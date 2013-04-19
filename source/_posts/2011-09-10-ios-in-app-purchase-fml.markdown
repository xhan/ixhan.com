---
author: xhan
comments: true
date: 2011-09-10 18:36:39
layout: post
slug: ios-in-app-purchase-fml
title: '[iOS] In App Purchase 坑爹啊'
wordpress_id: 614
categories:
- iOS
tags:
- IAP
- in app purchase
---

原来计划几个小时内加个IAP功能，结果一天过去了，还没搞定。无奈的刷机中。

搜索了下IAP是个超级大坑，各种奇怪的问题，而且苹果没一份完整的文档解释可能出现的情况。于是有人根据回馈总结了这么个表格

To save you the pain of exhaustively searching the web for the cause of your error, here is a checklist of everything I have stumbled across that can cause an invalid product ID. Make sure you can answer “Yes” to each of these questions:



	
  * Have you enabled In-App Purchases for your App ID?

	
  * Have you checked Cleared for Sale for your product?

	
  * Have you submitted (and optionally rejected) your application binary?

	
  * Does your project’s .plist Bundle ID match your App ID?

	
  * Have you generated and installed a new provisioning profile for the new App ID?

	
  * Have you configured your project to code sign using this new provisioning profile?

	
  * Are you building for iPhone OS 3.0 or above?

	
  * Are you using the full product ID when when making an `SKProductRequest`?

	
  * Have you waited several hours since adding your product to iTunes Connect?

	
  * Are your bank details active on iTunes Connect?

	
  * Have you tried deleting the app from your device and reinstalling?

	
  * Is your device jailbroken? If so, you need to revert the jailbreak for IAP to work.


If you answered “No” to any one of these questions, there’s your problem.

[原文](http://troybrant.net/blog/2010/01/invalid-product-ids/)附录了一大堆**可能**提供解决方案的链接，如果你也有类似的问题可以尝试下。
当然stackoverflow也有大量关于IAP的离奇问题

－－－ 更新 －－－

刷玩最新的 4.3.5后，然后什么都没改动就突然能用了。

这里有篇写的不错的教程，希望对用IAP的人有帮助


# [In App Purchases: A Full Walkthrough](http://troybrant.net/blog/2010/01/in-app-purchases-a-full-walkthrough/)



