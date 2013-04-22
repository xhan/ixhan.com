---
author: xhan
comments: true
date: 2011-12-08 21:52:58
layout: post
slug: high-efficiency-xcode
title: Xcode4 作战效率提升手册
wordpress_id: 684
categories:
- 奇巧淫技
tags:
- 工作效率
- 快捷键
- xcode4
---


		

> 周一参加了 iOS Tech Talk Bejing 有个session中演示了一招加快debug效率的方式, 觉得非常好. 在此也分享下我常用的技巧方便提升大家的工作效率



基础篇
----------------
	
  * control +command + arrow up / down            切换 当前文件头文件和实现文件
  * control + command + arrow left/right             切换历史上/下一个文件
  * command B/R                                               编译 / 运行
  * command +  left click   on word                      可以在 方法的声明/实现, 变量的定义, 类的定义中跳转
  * option  + left click  on word                            对当前内容做 快速帮助
  * shift + command + Y                                     显示 debug工作区
  * command + f   / option + command + f           搜索/替换  (搜索后 command + G 可以跳到下一个结果)
  * shift + command + F                                      是全局搜索,非常方便
  * (esc)                                                             自动完成菜单

PS. 还有几个OSX系统通用的命令也很有效率
	
  * option + arrow left / right                以单词为单位移动光标	
  * command + arrow left /right             移动光标到行头,行尾 

进阶篇
-----

  * shift + command + o            快速定位文件	
  * shift + command + j             在项目导航中显示当前文件 (在大项目中尤其好用,推荐!)
  * option + click 项目导航中的文件      可以在辅助编辑器里打开该文件, 方便同时查看多个源文件 (默认的辅助编辑器功能很弱,这样基本能找回xcode3的 split screen功能了)
  * command  + L                      定为到文件的指定行
  * shift + command +L              跳到光标所在位置 (当然更多时候我比较喜欢点下箭头来定位)
  * control + i                             对选中文字 重新格式化缩进

Debug篇
------

> Xcode4 启用一体化IDE后, 调试程序有时候变得非常讨厌, 有同感的同学请继续往下看吧. (此内容学习至 ios tech talk ! )

	
  1. 新建一个tab(cmd + t) 双击tab名修改名字为 CONSOLE     #不知道tab可以改名吧! 这弱爆的体验呐	
  2. 调整 CONSOLE tab为你喜欢的调试外观, 我喜欢有个大大的log窗口(shift+cmd+c), 左边显示debug栏,不显示右侧栏 , 留一点空间给编辑器, 方便断点时候跟踪 , 最后效果附图
  3. 可以将console tab关闭了 (xcode会自动记忆此tab的设置, 这下应该明白你调试时候经常有时候有log窗口,有时候又需要自己打开的原因了吧 )
  4. 在设置中打开 behavior 这选项
  5. 选择 run start , 只勾选 `show tab CONSOLE` 和 `show navigator Debug`
  6. 把 run complete 里的选项全关了.   # 这样调试结束我们还能继续看log,而不是默认的log也被关闭
  7. 完成, 运行 !  如果你有多个屏幕, 还可将console tab 拖出放置,效果更好!


[![](http://ixhan.com/wp-content/uploads/2011/12/xcode4_console.jpg)](http://ixhan.com/wp-content/uploads/2011/12/xcode4_console.jpg)

