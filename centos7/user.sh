#!/usr/bin/env bash
groupadd  world_group
useradd   world_user -g world_group
echo 'world_user' | passwd es_user --stdin
su world_user

# ls -l /usr/bin/git 查看权限
# chmod 命令

#chgrp ［选项］ group filename
  #-c或–changes 效果类似”-v”参数，但仅回报更改的部分。
  #-f或–quiet或–silent 　不显示错误信息。
  #-h或–no-dereference 　只对符号连接的文件作修改，而不更动其他任何相关文件。
  #-R或–recursive 　递归处理，将指定目录下的所有文件及子目录一并处理。
  #-v或–verbose 　显示指令执行过程。
  #–help 　在线帮助。
  #–reference=&lt;参考文件或目录&gt; 　把指定文件或目录的所属群组全部设成和参考文件或目录的所属群组相同。
  #–version 　显示版本信息。
#chown ［选项］ 用户或组 文件
  #user : 新的档案拥有者的使用者 ID
  #group : 新的档案拥有者的使用者群体(group)
  #-c : 若该档案拥有者确实已经更改，才显示其更改动作
  #-f : 若该档案拥有者无法被更改也不要显示错误讯息
  #-h : 只对于连结(link)进行变更，而非该 link 真正指向的档案
  #-v : 显示拥有者变更的详细资料
  #-R : 对目前目录下的所有档案与子目录进行相同的拥有者变更(即以递回的方式逐个变更)
  #–help : 显示辅助说明
  #–version : 显示版本

#userdel -r world
#usermod 选项 用户名
#/etc/passwd /etc/group
