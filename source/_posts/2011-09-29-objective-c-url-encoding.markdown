---
author: xhan
comments: true
date: 2011-09-29 18:30:00
layout: post
slug: objective-c-url-encoding
title: ObjC中URL编码
wordpress_id: 638
categories:
- Coding
tags:
- NSString
- URL encoding
---

NSString类已经中提供了现成的API：

``` objectivec NSString.h
/* Adds all percent escapes necessary to convert the receiver in to a legal URL string.
  Uses the given encoding to determine the correct percent escapes (returning nil if 
the given encoding cannot encode a particular character).  See 
CFURLCreateStringByAddingPercentEscapes in CFURL.h for more complex transformations 
*/
- (NSString *)stringByAddingPercentEscapesUsingEncoding:(NSStringEncoding)enc;
[/code]
```

但是非常重要的一点苹果没注明：该API并不会将"& + -"等需要转义的字符编码。  
如若将需要传递的某个param的内容通过该API来转义就可能坑爹了！！你内容中的&=不会被转义，服务端就会把原来的内容根据&和=拆开成一片一片了！！ 

解决方法是使用介绍中提到的 `CFURLCreateStringByAddingPercentEscapes`

``` objectivec NSString_URLEscaped.h
@implementation NSString (URLEscaped)
- (NSString *)URLEscaped {
	CFStringRef escaped = CFURLCreateStringByAddingPercentEscapes(NULL, (CFStringRef)self, NULL, (CFStringRef)@"!*'();:@&=+$,/?%#[]",
			 kCFStringEncodingUTF8);
	NSString *out = [NSString stringWithString:(NSString *)escaped];
	CFRelease(escaped);
	return [[out copy] autorelease];
}
```

需要注意的是不能将这个函数用来 encode 整个URL，而是params的内容  


> 写这篇文章是因为自己也掉了这个大坑，而且半年后才注意到。惨吖，不知道收集的10多w条数据中有多少是内容破坏的 - -
