#!/bin/bash

# 克隆源码
git clone https://github.com/openssl/openssl.git
cd openssl

# 配置安装路径及调试支持（macOS M1/ARM架构）
./Configure darwin64-arm64-cc --debug --prefix=/usr/local/openssl

# 编译，利用所有核心
make -j$(sysctl -n hw.ncpu)

# 安装到指定路径（会要求输入密码）
sudo make install