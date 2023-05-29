编码格式: chcp 936 处理 ansi编码文本;chcp 65001 处理 utf-8 编码文本

cls
:@echo off  每条显示命令
@echo off 不显示命令
echo  %1    打印第一个参数
call xx.cmd
start /b  打开应用,命令eg: start taskmgr (同 taskmgr)
start 打开应用,命令eg: start taskmgr (同 taskmgr)  新窗口

start cmd /k "cd E:\three.js&&node server.js"
