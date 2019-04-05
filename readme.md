## CQSDK Freebasic
----
本工程已经适配了酷Q SDK原始的接口， 可以参考[CoolQ SDK For VC++](https://github.com/CoolQ/cqsdk-vc/)来对等开发。

[FreeBasic编译器下载](https://www.freebasic.net/)

推荐使用[winFBE Suite](https://www.freebasic.net/forum/viewtopic.php?f=8&t=25215)，这个自带了一个IDE，并且包含了32位和64位Freebasic最近编译器。

本工程使用的IDE是[poseidonFB](https://www.freebasic.net/forum/viewtopic.php?f=8&t=23935)， 这个IDE是台湾人开发的，自带简体中文。

将本仓库clone到本地，然后用poseidonFB打开即可编译生成dll。

## 源文件说明

* appmain.bas &#160;&#160;&#160; dll的主文件，对应 Cool SDK For VC++仓库中的 appmain.cpp
* config.bas &#160;&#160;&#160;   这个文件示例了如何操作json文件，用的是[fbjson](https://github.com/StringEpsilon/fbJson)库。
* cqfbsdk.bas &#160;&#160;&#160;  这个文件简单的包装了一下cool sdk中的一些需要解码的函数，目前只实现了CQ_getGroupMemeberInfo
* log.bas  &#160;&#160;&#160;     忽略
* util.bas  &#160;&#160;&#160;    这个文件里面包含了两个重要函数， 
  1. CQRawStrToDWSTRING 从酷Q字节流（GB18030）编码转义到FB unicode编码（UTF-16）。
  2. DWSTRINGToCQRawStr 从FB unicode编码 转义到 酷Q的GB18030编码（ANSI）
  * 注意，在FB里操作中文请用dwstring或者wstring，不要直接使用string或zstring。
  * 注意，源码文件请保存来utf-8带Bom格式，以防中文乱码。

## 头文件说明

* appmain.bi &#160;&#160;&#160; 对应 Cool SDK For VC++仓库中的 appmain.h
* cqp.bi &#160;&#160;&#160; 对应 Cool SDK For VC++仓库中的 cqp.h


FreeBasic是一门强大的语言，可以说是C语言的Basic语法版。