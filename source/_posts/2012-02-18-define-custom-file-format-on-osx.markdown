---
author: xhan
comments: true
date: 2012-02-18 20:20:37
layout: post
slug: define-custom-file-format-on-osx
title: OSX下自定义文件类型和QuickLook
wordpress_id: 743
categories:
- Coding
- Knowledge
tags:
- Cocoa
- osx
- QuickLook
- xcode
---

研究了几个小时如何自定义文件类型和自定义的QuickLook, 怕以后忘记怎么操作了. 总结下流程和写下简单的教程.


如果








	
  * 你想让你的程序支持自定义的文件类型

	
  * 让自定义的文件支持苹果的 Quick Look (大致就是选中文件按下空格后的预览图)




请继续看 -->







测试的例子是 Single Window Application + Custom bundle file type








	
  1. 不只是文档程序,单窗口程序也能支持响应自定义的文件类型

	
  2. Bundle 简单的说就是个文件夹, OSX系统可以将bundle识别单独的文件: 比如你的app就是个bundle. bundle在OSX下有许多作用,甚至还能对现有的app提供插件支持.




我们的目标是让 <name>.xxx 文件夹(里面有个叫xxx.jpg的图片)





	
  * 被识别成bundle

	
  * 有个独立的图标

	
  * 能被 app 打开并在窗口显示 xxx.jpg

	
  * 能提供Preview并显示 xxx.jpg




> 

> 
> 马上开始,为了节约时间略了些细节和图片描述, 请自行补充,无需100%按部就班




### Part I


**创建自定义文件:**  新建个 name.xxx 的文件夹并丢入一照片命名为 xxx.jpg

**Xcode中新建一个App:** 在MainMenu里的view中拖入一个ImageView 并绑定到 AppDelegate 的imageView属性.

**给App加个ICON:** 拖入图标后,在info.plist里的图标选项里补充上名字

**App注册自定义文件: **在info.plist 里添加新字段 UTExportedTypeDeclarations (自动补全后应该是array内容) 编辑内容如下:
[![](http://ixhan.com/wp-content/uploads/2012/02/Exported-Type-UTIs.png)](http://ixhan.com/wp-content/uploads/2012/02/Exported-Type-UTIs.png)
UTTypeConformsTo 是指我们自定义文件的类型,  identifier和filename-extension是至次自定义文件的标识和后缀.

**App注册文档文件: **只有注册指定的UTI(上步骤)为documentType, 才能使用此App打开该类型的文件. plist里添加新key,如图操作
[![](http://ixhan.com/wp-content/uploads/2012/02/Document-types.png)](http://ixhan.com/wp-content/uploads/2012/02/Document-types.png)

每个key内容就不解释了,自己查阅文档 :D

编译运行App,然后关闭.  你应该可以看到 name.xxx 文件夹已经显示为一个带着你指定图标的文件了. 当然还是可以通过点右键-> Show Package Contents 来查看包内的内容.


### Part II


目前双击 name.xxx 已可以成功打开我们的App, 但是有个"无法打开***"的错误提示.

**添加app文件打开处理:** 在AppDelegate.m 里添加如下代码

    
    - (BOOL)application:(NSApplication *)sender openFile:(NSString *)filename
    {
        NSString*path = [filename stringByAppendingPathComponent:@"xxx.jpg"];
        NSImage* img = [[NSImage alloc] initWithContentsOfFile:path];
        if (img) {
            _imageview.image = img;
            return YES;
        }else{
            return NO;
        }
    }


现在已经可以成功处理打开自定义文件了 Wowowow! (测试中有个问题,返回NO也没出现 出错提示, 看来需要自己判断文件有效性 并弹出错误提示了 )  ,接下来就是非常好玩的 Quick Look 了!!!


### Part III


选中 name.xxx , 按下空格后出现的放大的图标. 看起来还不错? NO, 必须得能够显示包内的图片才够完美啊.


> PS. 其实让Package 文件支持Preview是非常容易的, 在包内新建 QuickLook 文件夹, 并放入 Preview.jpg 即可. 不过此方法不够灵活,  我就蛋疼的演示下写个自己的 Quick Look 插件.


Quick Look 插件是后缀为 .qlgenerator 的bundle, 有3处地方可以放置此插件



	
  * /Library/QuickLook       <系统级别的,安装iWork后里面就有个给iWork文档提供preview的插件>

	
  * ~/Library/QuickLook       <用户级别的>

	
  * <name>.app/content/Library/QuickLook   <App级别的>




我们这里选择方案3 <App级别> 开始:







**App 工程新建Target:** 选择 System PlugIns / QuickLook Plug-In




目录中生成了3个文件, 根据提示咱们不要改动main.c 文件, 将其他两个.c文件修改为.m , 由于对于CoreFoundation的函数实在没好感, 修改为.m 后方便继续使用高级别的API进行操作.







**给此Target添加framework:** cocoa.framework  (选中项目,右边的target, build parses / Linked With Libraries 里添加)







修改 GeneratePreviewForURL.m 里的同名方法如下 :



    
    OSStatus GeneratePreviewForURL(void *thisInterface, QLPreviewRequestRef preview, CFURLRef url, CFStringRef contentTypeUTI, CFDictionaryRef options)
    {
        NSAutoreleasePool *pool;
        pool = [[NSAutoreleasePool alloc] init];
    
        NSURL*imgurl = [(NSURL*)url URLByAppendingPathComponent:@"oo.jpg"];
        NSLog(@"!xxx get path %@",imgurl);
        NSImage* img = [[NSImage alloc] initWithContentsOfURL:imgurl];
    
        if (img) {
            NSSize size = img.size;
            CGContextRef cgContext = QLPreviewRequestCreateContext(preview, *(CGSize *)&size, true, NULL);
            if (cgContext) {
                NSGraphicsContext* context = [NSGraphicsContext graphicsContextWithGraphicsPort:(void *)cgContext flipped:YES];
                if (context) {
                    [NSGraphicsContext saveGraphicsState];
                    [NSGraphicsContext setCurrentContext:context];
                    [img drawAtPoint:NSMakePoint(0, 0)
                            fromRect:NSMakeRect(0, 0, 0, 0)
                           operation:NSCompositeCopy
                            fraction:1];
                    [NSGraphicsContext restoreGraphicsState];
    
                    QLPreviewRequestFlushContext(preview, cgContext);
                    CFRelease(cgContext);
                }
            }
            [img release];
        }
    
        [pool release];
        return noErr;
    }


贴的代码有点多, 简单说下步骤



	
  * 根据传过来的url 生成 NSImage

	
  * 获取到 Preview的上下文, 并转换成 NS* 的上下文

	
  * 将图片绘制进当前的上下文

	
  * 然后刷新 Preview 显示内容




**注意2点**: 由于使用了foundation, 所以需要加入Autorelease pool.  由于plugin不好调试, 可以使用NSLog打入消息, 然后在 console 里 filter 来查看状况. 







最后一步, 回到App的项目设置里, 新建一个 copy 的 Build Phases, 设置如下 : 




[![](http://ixhan.com/wp-content/uploads/2012/02/copy-build-phase.png)](http://ixhan.com/wp-content/uploads/2012/02/copy-build-phase.png)


再次编译运行App后, 测试下是否成功!!!!!


DONE
