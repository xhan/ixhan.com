---
author: xhan
comments: true
date: 2011-07-23 17:43:39
layout: post
slug: dynamically-add-button-to-uiactionsheet
title: '[iOS]UIActionSheet动态添加按钮'
wordpress_id: 589
categories:
- iOS
tags:
- iOS
- UIActionSheet
---

UIActionSheet 只提供了一个构造函数
[code lang="objc"]
- (id)initWithTitle:(NSString *)title delegate:(id&lt;UIActionSheetDelegate&gt;)delegate cancelButtonTitle:(NSString *)cancelButtonTitle destructiveButtonTitle:(NSString *)destructiveButtonTitle otherButtonTitles:(NSString *)otherButtonTitles, ...
[/code]
如果需要动态的添加按钮，就必须使用另外个函数：
[code lang="objc"]- (NSInteger)addButtonWithTitle:(NSString *)title;[/code]
但出现的诡异结果是新添加的内容均出现在 取消 按钮之下，非常讨厌。

解决方法直接看代码


[code lang="objc"]
//.....
    UIActionSheet* sheet = [[UIActionSheet alloc] initWithTitle:NSLocalizedString(@"请选择埋掉的原因", @"reason to bury")
                                                       delegate:self
                                              cancelButtonTitle:nil
                                         destructiveButtonTitle:nil
                                              otherButtonTitles:nil];
    [sheet addButtonWithTitle:@"btn1"];
    [sheet addButtonWithTitle:@"btn1"];
    [sheet addButtonWithTitle:@"btn1"];
    [sheet addButtonWithTitle:NSLocalizedString(@"取消", @"cancel button title")];
    sheet.cancelButtonIndex = sheet.numberOfButtons - 1;
//....
[/code]
