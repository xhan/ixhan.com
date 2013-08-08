---
layout: post
title: "template engine for objective-c"
date: 2013-08-08 13:24
comments: true
categories: 
---

web开发者对模板引擎会非常熟悉，最简单的例子：  
对于模板 ->
>  hello \{\{ name }},  
  you have just won \{\{ value }} !  
  please visit \{\{ site }} immediately.  

	



提供给定的 hash ->  
``` json
{
   "name":  "steve",
   "value": "$100000",
   "site":  "www.cheatyouforever.com"
}
```

然后就能生成最终文本 ->  
```
hello steve,
you have just won $100000 !
please visit www.cheatyouforever.com immediately.
```

如果文本足够简单，那直接用字符串替换即可。更复杂点的需求就需要方案来解决问题了。下面是找到的两个模板引擎，好像没有更多了？

[MGTemplateEngine](http://mattgemmell.com/2008/05/20/mgtemplateengine-templates-with-cocoa/) 
---------
MGTemplateEngine is a native Cocoa system for generating text output based on templates and data. It’s a close cousin of systems like Smarty, FreeMarker, Django’s template language, and so on.  

MG前缀就知道是objc前辈作品了，除了基本的模板功能，还提供 模板内运算，循环操作。并且插件支持。  

[Mustache](http://mustache.github.io/)
---------
Logic-less templates.  一句话介绍完。  

跨平台，除了objc还覆盖了目前主流和非主流的常见语言。模板不提供`if`之类的逻辑操作，但是提供了一套替代的语法标识，看起来很清爽，但学习稍微有些成本。  


[CCTemplate](https://github.com/xhan/CocoaTemplateEngine)
---------
本人写的只有一个头文件的超级轻量级模板引擎，功能只有一个，将占位符的文字替换！没从底层写起，直接用了NS的NSScanner类来做字符串扫描，所以代码量不多。   
``` objective-c
// pod 'CCTemplate'
#import "CCTemplate.h"
CCTemplate* engine    = [[CCTemplate alloc] init];
NSString*   template  = @"hello world {{name}}";
id    		dict      = @{@"name":@"xhan"};
NSString*result    = [engine scan:template dict:dict];
// or just call nsstring category method
result 			   = [template templateFromDict:dict];
```
