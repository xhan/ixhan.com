---
author: xhan
comments: true
date: 2009-10-08 16:49:29
layout: post
slug: little-about-byte-order
title: 关于“字节序”
wordpress_id: 68
categories:
- Coding
- Knowledge
tags:
- byte order
- c
- work
---

昨天纠正了长达几年的关于字节序的错误理解。

受到移位操作符的影响，一直认为在内存中数字的保存方式和显示的一样，比如一个2直接的short 9 ，保存在内存中应该是：

00 09 这种形式，因为这样移位才说的通。 否则如果按照低字节优先的方法 09 00 右移位就会出乱子了～

结果昨天研究和服务器socket通讯的例子中 发现了个陌生函数 ：htonl  。

man （越来越喜欢命令行了）后发现是 host to network long(short) 的缩写 ，这下彻底困惑了。难道 c 在内存中的数据不是想象中的那样？

最后K大侠亲自上阵，示范了使用GDB debug ，也帮我验证了我多年的错误观点：

[c]

#include <stdio.h>

int main()
{
 int a = 8;
 char *p;
 p= (char*)&a;

 a = a>>1;
 char *k = &a;

 return 0;
}

[/c]



	
  * gcc -g test.c   # -g 添加调试

	
  * gdb test.out   # init

	
  * b main          # add breakpoint at main function

	
  * run                 # just run until breakPoint occured

	
  * n                    # next


逐次打印出 p 指针的值 p *(p++)   , 发现果然是地位在最前面的。
不过对于移位操作就困惑了，难道这个操作不是直接在内存操作的？难道是先转成高位优先然后移位再转回来？<!-- more -->

附一篇介绍比较详细的文章，[来源](http://www.blogjava.net/byterat/archive/2007/10/24/155471.html)


> BIG-ENDIAN（大字节序、高字节序）
LITTLE-ENDIAN（小字节序、低字节序）
主机字节序
网络字节顺序
JAVA字节序

1．BIG-ENDIAN、LITTLE-ENDIAN跟多字节类型的数据有关的比如int,short,long型，而对单字节数据byte却没有影 响。BIG-ENDIAN就是低位字节排放在内存的低端，高位字节排放在内存的高端。而LITTLE-ENDIAN正好相反。
比如 int a = 0x05060708
在BIG-ENDIAN的情况下存放为：
字节号 0 1 2 3
数据 05 06 07 08
在LITTLE-ENDIAN的情况下存放为：
字节号 0 1 2 3
数据 08 07 06 05

2．BIG-ENDIAN、LITTLE-ENDIAN、跟CPU有关的，每一种CPU不是BIG-ENDIAN就是LITTLE-ENDIAN、。IA 架构的CPU中是Little-Endian，而PowerPC 、SPARC和Motorola处理器。这其实就是所谓的主机字节序。而网络字节序是指数据在网络上传输时是大头还是小头的，在Internet的网络字 节序是BIG-ENDIAN。所谓的JAVA字节序指的是在JAVA虚拟机中多字节类型数据的存放顺序，JAVA字节序也是BIG-ENDIAN。

3．所以在用C/C++写通信程序时，在发送数据前务必用htonl和htons去把整型和短整型的数据进行从主机字节序到网络字节序的转换，而接收数据 后对于整型和短整型数据则必须调用ntohl和ntohs实现从网络字节序到主机字节序的转换。如果通信的一方是JAVA程序、一方是C/C++程序时， 则需要在C/C++一侧使用以上几个方法进行字节序的转换，而JAVA一侧，则不需要做任何处理，因为JAVA字节序与网络字节序都是BIG- ENDIAN，只要C/C++一侧能正确进行转换即可（发送前从主机序到网络序，接收时反变换）。如果通信的双方都是JAVA，则根本不用考虑字节序的问 题了。

4．如果网络上全部是PowerPC,SPARC和Motorola CPU的主机那么不会出现任何问题，但由于实际存在大量的IA架构的CPU，所以经常出现数据传输错误。

5．文章开头所提出的问题，就是因为程序运行在X86架构的PC SERVER上，发送数据的一端用C实现的，接收一端是用JAVA实现的，而发送端在发送数据前未进行从主机字节序到网络字节序的转换，这样接收端接收到 的是LITTLE-ENDIAN的数据，数据解释自然出错。
具体数据如下，实际发送的数据为23578
发送端发送数据： 1A 5C
接收端接收到数据后，按BIG-ENDIAN进行解释具体数据是多少？你们自己去计算并比较吧！

=============================================================================================== Big Endian and Little Endian

谈到字节序的问题，必然牵涉到两大CPU派系。那就是Motorola的PowerPC系列CPU和Intel的x86系列CPU。PowerPC系列采 用big endian方式存储数据，而x86系列则采用little endian方式存储数据。那么究竟什么是big endian，什么又是little endian呢？

其实big endian是指低地址存放最高有效字节（MSB），而little endian则是低地址存放最低有效字节（LSB），即常说的低位在先，高位在后。
用文字说明可能比较抽象，下面用图像加以说明。比如数字0x12345678在两种不同字节序CPU中的存储顺序如下所示：

Big Endian

低地址                           高地址
----------------------------------------->
+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
|     12     |      34    |     56      |     78    |
+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+

Little Endian

低地址                           高地址
----------------------------------------->
+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
|     78     |      56    |     34      |     12    |
+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+

从上面两图可以看出，采用big endian方式存储数据是符合我们人类的思维习惯的。而little endian，!@#$%^&*，见鬼去吧 -_-|||

