#!/bin/bash
# 1. ()
(ls; ls) #命令组,新shell,内部变量,分号隔开;无空格
$(xxx) #执行,获取标准输出
a=(b c) # 初始化数组
# echo
echo $( [ 1 == 2 ]; echo $? )
echo $( [ 1 == 2 ] ) $?
echo $(( 0 || 0 )) # 逻辑运算,输出 0
# 2. (()), 数字运算
a=$((1+2)) #等同 a=`expr 1 + 1`; 表达式结果; 普通 c=$a+$b

echo $((1+1)) $(( 1==1 )) $(( 1==0 )) # $(("aa"+"dd")) 不支持字符串
$(($n+10))
$($n+10) # bug
#2.1
((0+0));echo $?   #算数表达式,结果0,退出码1;
((1+1));echo $?   #算数表达式,结果0,退出码1;
((1==1));echo $?  #逻辑表达式,真为1
((1==0));echo $?  #逻辑表达式,真为1
#2.2
(($c++)) #定义变量值; 初始为0
#2.3  #括号内可以取消$ ??  省略$进行运算
((n=$n1+10));echo $n

# 3. []
#[ 与 test 命令等同 ; 退出状态码;真,退出状态0; ]标识结束
#运算符 == !=; 数字 -lt 等; -a -o; -e 等,测试文件存在等
#空格隔开
#字符范围
#数组下标
[ "aa" = "bb" ] && echo 1 # 空格


#4. [[]]
#[[ 关键字; 空格隔开; bool运算;退出状态码; $符号不能省略
[[ hello == hell? ]] # 字符串模式匹配
[[ "aa" = "bb" ]] && echo 1 # 空格
[ a = $n ] && echo 1 # $n 不存在报错
[[ a = $n ]] && echo 1 # $n 不存在正常
[[ $n1 = $n2 ]] && echo 1 # 两个都不存在, 有输出;

#5. {}
${a}b #标识变量范围
#字符串赋值,替换,匹配

################
#条件表达式
# []  test
test 1 -gt 3 ; echo $?
[ 3 -gt 8 ] ; echo $?

# if for
if ($i<5) ; then echo 1;fi
if [ $i -lt 5 ] ; then echo 1;fi
if [ $i -lt 5 -a $i -lt 5 ] ; then echo 1;fi
if [ $i -lt 5 ] && [ $i -lt 5 ] ; then echo 1;fi
if [[ $i <5 &&  $i <5 ]] ; then echo 1;fi

for i in {1..5} ; do echo $i;done
for i in $(seq 0 4) ; do echo $i;done
for i in `seq 0 4` ; do echo $i;done
for i in ((i=0;i<5;i++)) ; do echo $i;done

# 异常直接退出
set -e
#测试语法 if while break return exit 异常

#c=`expr ${a} + ${b}` # expr

# 函数
function add() {

}

sub(){

}