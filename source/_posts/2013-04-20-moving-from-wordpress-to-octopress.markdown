---
layout: post
title: "迁移至 octopress - Dreamhost版"
date: 2013-04-20 00:11
comments: true
categories: 
---
小学还是初中那会，我躲在楼上用 FrontPage 做网页。折腾了一晚上照着书本的教程建了个表格，插入了些文字和图片还能跳转到另一个页面。非常有充实感的夜晚。

然后就是各种动态语言的世界了，从一行行手写web应用开始到web框架盛行，然后突然的，各个公司开始去Rails化，回归到选择更轻量级的框架。博客界也开始返璞归真起来，静态内容+社交化交流插件(Disqus)反而更能专注内容，这点微信公众平台倒有些相似的地方。  

之前用 [Jekyll](http://jekyllrb.com/) (中文翻译: [变身怪医](http://movie.douban.com/subject/2161056/) ) 搭建了个糗事百科的 [Blog](http://qiushibaike.github.io/2013/03/19/we-are-hiring/) (我们在招人哦～) ，这几天又看到几个用 OctoPress 搭建的博客，默认主题真是舒服简约大气，还能直接内嵌高亮代码。当然最重要的字体足够大，这才能沉浸阅读嘛。  

尝试找了下类似的wordpress主题无果后，决定放手试试传说中的 OctoPress ，毕竟能用 markdown 写作也是期待许久。  

从此，这个博客不再有数据库。 哈哈哈。

迁移和配置
---------
尝试了好几个工具，[Exitwp](https://github.com/thomasf/exitwp) 效果是最满意的，唯一的缺点操作和依赖稍微麻烦点。但和几年博客数据顺利迁移比起来都是小问题了。 
> 注意，wordpress导出的xml文件肯定有些不正常的字符内容，用 xmllint 检查并手动修正即可。

然后是配置全新的 octopress 站点。将 url 格式还原到和老博客一致能少不少麻烦，毕竟我的空间提供商不提供自己修改http转发配置的。评论系统之前使用的就是Disqus，所以迁移起来完全无压力。话说什么时候Disqus 能支持国内的微博平台呢。

坑和问题
---------
***你还未掉到坑里，只是你还不够胖而已。摘自xhan语录第一集***   

* github.com默认的 Jekyll 依赖的 maruku gem 对中文markdown支持很差，不支持中文list [issue](https://github.com/bhollis/maruku/issues/78)   
* markdown 里url里带有中文字符也会直接报错，手动转码后解决(没来得及看哪里的问题)  
* post 和 page 生成的 `page.url` 结果不一致，导致 Disqus 在Page 里没法正常工作(暂时手动通过修改Disqus映射解决了) 刚提交的 [issue](https://github.com/imathis/octopress/issues/1235)  
* 由于是纯静态页面，所以也就没有了404页面。我的空间是apache，所以可以用 .htaccess 创建个 `ErrorDocument 404 /404.html` 来重定向  
* Case-sensitive! 这个问题迁移前没考虑到！也是折腾最长的问题了。若直接访问 [/LessDJ](/LessDJ)是会报404的，因为默认文件都是小写的。而且我的空间商不提供hcaccess的重定向功能！临时解决方法在下面。  
* 默认博客的/feed/不见了，将 atom 改个名字换过来即可
* 原始博客的图片附件等内容：通过 ln -s 做个乱链接即可

简单的忽略大小写的方法
---------
如果你的服务商直接支持请求转发，那网上就有太多解决方案了。否则可以试试这个
就是在404页面中加一段js :

``` html  如果请求地址存在大写字母则跳到全小写的地址
  <script> var myRoute = document.location + "";
     if (myRoute!=myRoute.toLowerCase())   document.location=myRouteLC;
  </script>
```

你可以修改模板自动将代码插入404.html的头部 通过 404.md 里添加一个定义 `header_top: blabla`，然后模板里调用 `{{ page.header_top}}` 就可以插入自定义内容了。  

但是对搜索引擎就不是那么友好了，所以只是个简单的解决方案。  


Octopress 初体验
---------
1. 其实就是在 Jekll 上增加了主题和一些常用插件  
2. 模板的设计过于碎片，个人不喜欢将页面拆解的如此零碎。特别对于设计师来说就是折磨。  
3. 坑还是蛮多的，目前也是临时补上。不少问题流程以后可以合并进rake tasks  
4. 纯静态文件，版本管理起来也同样方便了很多  
5. 发图或添加附件的流程不够轻便，全手动操作的还是比较麻烦


*这篇文章由 [Mou](http://mouapp.com/) (国产Markdown IDE) 编写*
	