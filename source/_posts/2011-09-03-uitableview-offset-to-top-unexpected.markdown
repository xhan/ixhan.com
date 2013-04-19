---
author: xhan
comments: true
date: 2011-09-03 11:29:57
layout: post
slug: uitableview-offset-to-top-unexpected
title: UITableView 离奇滚动到顶部的问题
wordpress_id: 603
categories:
- iOS
tags:
- iOS
- memory manage
- uitableview
- viewDidUnload
---

你是否有过类似的经验，从一个TableView push到另一个视图后，然后pull back, 这时候有可能会发现tableView的contentOffset 已经滚动到顶部了，而且时有时无，所以也就没深入探讨下去了？

举个很简单的例子，现在有个附件位置聊天工具叫 陌陌， 我就喜欢在列表页面一直向下滑动找各种美女看PP，可是在看完美女资料返回列表后经常发现居然又滚回视图的顶部了，悲痛之余，又得话费很久时间重新滚动到下面，继续看美女。然后又被离奇的滚动到顶部。。。。

其实这个问题在 [这篇文章](/2011/02/uiviewcontroller-memory-manage/) 里提到过，没错还是 -viewDidUnload 导致的问题。首先我们来快速重现下这个bug



	
  1. 新建一个iOS项目，模板使用 Navigation-base App

	
  2. 在默认的tableViewController里


	
    1. - viewDidLoad 设置下 self.title=@"table"

	
    2. - numberOfRows 设置为 200 个cell

	
    3. 给每个cell添加点文字，当前的indexPath.row 的值就很好

	
    4. - didSelectRow 里随便push到个新的 ViewController

	
    5. - viewDidUnload 加个NSLog，方便跟踪消息


	
  3. 向下滚动些cell,然后点击进入第二个vc的视图

	
  4. 选择模拟器的菜单 Hardware->Simulate Memory warning , 你应该能在console里看到2行log，第二行log应该是来自于你的 -viewDidUnload  方法

	
  5. 返回tableView，你会发现bug重现，tableView的y偏移位已经变回0 !


其原因很容易解释，在接收到内存警报的通知后，非当前用户可见的视图控制器(vc)会接收到额外的通知，并将它的view给释放掉节约内存占用。然后当该vc的视图即将重新被用户可见时（比如被pullBack)，vc会调用 -loadView , - viewDidLoad 这些方法重新将view创造出来， 但是偏移位却没有被保存下来，所以就发生这个Bug了。

写到这里应该已经知道如何解决这个问题了吧，增加一个变量记录来记录当前tableView.contentOffset.y 的数值，然后 - viewDidLoad 里面将tableview的偏移位给恢复即刻。

**番外篇**

iOS 中内存问题会导致各种奇怪的现象，在 - viewDidUnload被执行后会导致下次 - loadView, - viewDidLoad 被重新执行，所以一定要在 -viewDidUnload 中把其他retain的东西给释放掉。

每次通过模拟器的菜单来模拟内存警告比较麻烦，这里提供一个特殊的类来实现自动内存警报功能，将你的视图控制器从该类继承下来，这里以UIViewController为例子。当视图不可见时，该控制器便会自动接收到内存警告并释放掉自己的视图。这样子调试起来就方便了。有木有！！！

[code lang="objc"]
@interface MotherUIViewController : UIViewController
- (void)simulateMemoryWarning;
@end

@implementation MotherUIViewController

- (void)viewDidDisappear:(BOOL)animated{
	[super viewDidDisappear:animated];
	[self simulateMemoryWarning];
}

- (void)simulateMemoryWarning
{
#if TARGET_IPHONE_SIMULATOR
#ifdef DEBUG
	CFNotificationCenterPostNotification(CFNotificationCenterGetDarwinNotifyCenter(), (CFStringRef)@"UISimulatedMemoryWarningNotification", NULL, NULL, true);
#endif
#endif
}
@end
[/code]
