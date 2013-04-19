---
author: xhan
comments: true
date: 2010-03-25 01:27:44
layout: post
slug: tutorial-of-kissxml-iphone
title: Tutorial of  kissXML(iPhone)
wordpress_id: 289
categories:
- iOS
tags:
- c
- google
- iOS
- kissxml
- png
- Project
- tutorial
- work
- xml
---

KissXML is a good approach for parsing xml data, and the x-path function make it more powerful.


### Integrate With You Project And KissXML





	
  * Download source codes form [here](http://kissxml.googlecode.com/files/KissXML.zip)

	
  * Add all the files to your project (excluding DDXMLTesting)

	
  * Configure you project to work with libxml


click Project -> Edit Project Settings

You'll be adding this to your compiler instructions

OTHER_LDFLAGS = -lxml2

HEADER_SEARCH_PATHS = /usr/include/libxml2

![](http://www.deusty.com/blog/KissXML/XcodeSetup3.png)


### Using KissXML


Here is a quick demo to indicate you how it works.

For example, we need to get the SRC value of each media field from the target xml file.

[code lang="xml"]
<smil xmlns="http://www.w3.org/2000/SMIL20/CR/Language">
<head>
</head>
<body>
<par dur="120000ms" >
<text region="Text" src="att000.txt" />
</par>
<par dur="120000ms" >
<text region="Text" src="att010.txt" />
</par>
<par dur="10000ms" >
<img region="Image" src="att020.jpg"/>
</par>
<par dur="120000ms" >
<text region="Text" src="att040.txt" />
</par>

<par dur="10000ms" >
<img region="Image" src="att120.gif"/>
</par>
</body>
</smil>


[/code]

Here are the codes !

[code lang="objc"]
//hack to remove xmlns => avoid xpath search not works
 xmlStr = [xmlStr stringByReplacingOccurrencesOfString:@"xmlns" withString:@"noNSxml"];
 NSMutableArray* contents = [NSMutableArray array];

 NSError* error = nil;
 DDXMLDocument* xmlDoc = [[DDXMLDocument alloc] initWithXMLString:xmlStr options:0 error:&error];

 if (error) {
 NSLog(@"%@",[error localizedDescription]);
 return nil;
 }

 NSArray* resultNodes = nil;
 resultNodes = [xmlDoc nodesForXPath:@"//audio | //text | //image | //img" error:&error];

 if (error) {
 NSLog(@"%@",[error localizedDescription]);
 return nil;
 }

 for(DDXMLElement* resultElement in resultNodes)
 {
 NSString* name = [resultElement name];
 //audio , text or other media type
 NSString* fileName = [[resultElement attributeForName:@"src"] stringValue];
 // 0.txt
 }
[/code]

Note, I replaced the "xmlns" inside the xml file, because it weird xpath would failed if namespace available at a XML file(it might a bug)

And at last, have fun!
