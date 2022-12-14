#!/bin/bash
#需求：实现一个每天对指定目录归档备份的脚本，输入一个目录名称（末尾不带/），
#将目录下所有文件按天归档保存，并将归档日期附加在归档文件名上，放在/root/archive 下。

#首先判断输入参数个数是否为1
if [ $# -ne 1 ]
then
	echo "参数个数错误！应该输入一个参数，作为归档目录名"
	exit
fi

#从参数中获取目录名称
if [ -d $1 ]
then
	echo
else
	echo
	echo "目录不存在！"
	echo
	exit
fi 

DIR_NAME=$(basename $1 )
DIR_PATH=$(cd $(dirname $1); pwd)

#获取当前日期
DATE=$(date +%y%m%d)

#定义生成的归档文件名称
FILE=archive_${DIR_NAME}_$DATE.tar.gz
DEST=/root/archive/$FILE

#开始归档目录文件

echo"开始归档..."
echo

tar -czf $DEST $DIR_PATH/$DIR_NAME

if [ $? -eq 0 ]
then
	echo
	echo "归档成功！"
	echo "归档文件为:$DEST"
	echo
else
	echo "归档出现问题！"
	echo
fi

exit
	


