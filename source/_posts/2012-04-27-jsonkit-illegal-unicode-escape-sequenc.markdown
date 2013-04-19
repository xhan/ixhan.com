---
author: xhan
comments: true
date: 2012-04-27 16:27:30
layout: post
slug: jsonkit-illegal-unicode-escape-sequenc
title: JSONKit :Illegal \u Unicode escape sequence
wordpress_id: 790
categories:
- Coding
tags:
- JSONKit
---

When JSON string contains unicodes between u0000 and u001f, JSONKit parser fails to work properly. and throws a error as "Illegal \u Unicode escape sequence".

This is a known issue([link](https://github.com/johnezang/JSONKit/pull/26)) but seems like the author thought it's a fault caused by content provider and didn't intend to have any fix on this issue.


> In this particular case, these services are very clearly "in the wrong". [RFC 4627](http://tools.ietf.org/html/rfc4627) is unambiguous that characters < `0x20`are verboten. In cases like there, where something is clearly violating the standard, my default response is that "It's the other persons (web service) problem." The standard is the standard, and it is Right(tm), even its mistakes.


But in fact there are many JSON encoder may generates JSON string contains invalid characters < 0x20 including Python2.6, <not tested in Python2.7>, pre-rails3. We all love the clean codes but we need make things done first.

**SOLUTION:**

Edit JSONKit.m file:

    
     //GOTO Line 1462 or nearby
    //      remove this line
    //      if(JK_EXPECT_F(currentChar < 0x20UL)) { jk_error(parseState, @"Invalid character < 0x20 found in string: 0x%2.2x.", currentChar); stringState = JSONStringStateError; goto finishedParsing; }
    
    //      add following codes
            if(JK_EXPECT_F(currentChar < 0x20UL) && (parseState->parseOptionFlags & JKParseOptionLooseUnicode) == 0) {            
                jk_error(parseState, @"Invalid character < 0x20 found in string: 0x%2.2x.", currentChar); stringState = JSONStringStateError; goto finishedParsing;
            }
            else {	
                currentChar = 0xFFFDUL;
            }
