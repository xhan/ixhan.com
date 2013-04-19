---
author: xhan
comments: true
date: 2009-10-13 11:03:37
layout: post
slug: iphone-app-send-email-with-image
title: 让iPhoneApp发送带图片附件的邮件
wordpress_id: 73
categories:
- Coding
tags:
- c
- email
- iOS
---

更新（Nov 9,2009）:

在3.0系统中，sdk 提供了 MFMailComposeViewController 来显示发件界面，并提供附件功能。


> if ([MFMailComposeViewController canSendMail])
{
MFMailComposeViewController *mcvc = [[[MFMailComposeViewController alloc] init] autorelease];
mcvc.mailComposeDelegate = self;
[mcvc setSubject:@"Here's a great photo!"];
NSString *body = @"<h1>Check this out</h1><p>I selected this image from the <code><b>UIImagePickerController</b></code>.</p>";
[mcvc setMessageBody:body isHTML:YES];
[mcvc addAttachmentData:UIImageJPEGRepresentation(image, 1.0f) mimeType:@"image/jpeg" fileName:@"pickerimage.jpg"];
[self presentModalViewController:mcvc animated:YES];
}


在程序中如何启动系统的Email程序并在内容中添加图片附件？
以下是代码：

[c]
- (NSString *) base64EncodingWithLineLength:(unsigned int) lineLength data:(NSData *)imgData {

static const char *encodingTable = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/";
const unsigned char *bytes = [imgData bytes];
NSMutableString *result = [NSMutableString stringWithCapacity:[imgData length]];
unsigned long ixtext = 0;
unsigned long lentext = [imgData length];
long ctremaining = 0;
unsigned char inbuf[3], outbuf[4];
short i = 0;
short charsonline = 0, ctcopy = 0;
unsigned long ix = 0;

while( YES ) {
ctremaining = lentext - ixtext;
if( ctremaining &lt;= 0 ) break;

for( i = 0; i &lt; 3; i++ ) {
ix = ixtext + i;
if( ix &lt; lentext ) inbuf[i] = bytes[ix]; 			else inbuf [i] = 0; 		} 		 		outbuf [0] = (inbuf [0] &amp; 0xFC) &gt;&gt; 2;
outbuf [1] = ((inbuf [0] &amp; 0x03) &lt;&lt; 4) | ((inbuf [1] &amp; 0xF0) &gt;&gt; 4);
outbuf [2] = ((inbuf [1] &amp; 0x0F) &lt;&lt; 2) | ((inbuf [2] &amp; 0xC0) &gt;&gt; 6);
outbuf [3] = inbuf [2] &amp; 0x3F;
ctcopy = 4;

switch( ctremaining ) {
case 1:
ctcopy = 2;
break;
case 2:
ctcopy = 3;
break;
}

for( i = 0; i &lt; ctcopy; i++ )
[result appendFormat:@"%c", encodingTable[outbuf[i]]];

for( i = ctcopy; i &lt; 4; i++ ) 			[result appendFormat:@"%c",'=']; 		 		ixtext += 3; 		charsonline += 4; 		 		if( lineLength &gt; 0 ) {
if (charsonline &gt;= lineLength) {
charsonline = 0;
[result appendString:@"\n"];
}
}
}

return result;
}
[/c]

[c]
- (void) emailButtonPressed:(id)sender {

NSString *body = @"";

NSData *imageData = nil ;
NSString* dataStr = nil ;
for (PhotoItem* item in _photoBoardView.itemsSelected) {
imageData = UIImageJPEGRepresentation(item.photo.image.image,0.9);
dataStr = [self base64EncodingWithLineLength:0 data:imageData];
body = [body stringByAppendingFormat:@"<strong><img src="data:image/jpg;base64,%@" alt=" image" /></strong>",dataStr];
}
body = [body stringByAppendingString:@""];

NSString *encoded = [body stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
NSString *atitle = [[@"" stringByAppendingFormat:@"title: %@", @"Image "] stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
NSString * urlString = [@"" stringByAppendingFormat:@"mailto:%@?subject=%@&amp;body=%@", @"",atitle, encoded];
[[UIApplication sharedApplication] openURL:[NSURL URLWithString:urlString]];
}
[/c]
