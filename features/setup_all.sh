#!/bin/bash

# scan all setup.sh in sub dir

SHELL_DIR=$(dirname `readlink -f $0`)
ONLINE_LOG_DIR=/var/log/alarm

if [ ! -d ${ONLINE_LOG_DIR} ];
then
    mkdir ${ONLINE_LOG_DIR}
fi

cd ${SHELL_DIR}

ALL_SUB_DIRS=`find -maxdepth 1 -type d | grep -v "^\.$"`

LOOP=0
for sub_dir in $ALL_SUB_DIRS;
do
    FEATURE_ARRAY[$LOOP]=${sub_dir}
    LOOP=$(($LOOP+1))
done

get_selected()
{
	echo
	echo "功能列表："
	LOOP=0
	while [ $LOOP -lt ${#FEATURE_ARRAY[@]} ]
	do
	    echo "  $LOOP: ${FEATURE_ARRAY[$LOOP]}"
        LOOP=$(($LOOP+1))
	done
	
	echo
	echo "请选择您需要安装的功能编号(all为全部, quit为退出): "

    while true
    do 
		read x
        case "$x" in
            all | All | ALL )
            return 1;;

            quit | q | n | N | no | NO )
            return 0;;

            * )
                inputs=$x
                
                find=0
                #check input legality
                for var in $inputs
                do
					if [ $var -ge  ${#FEATURE_ARRAY[@]} ];
					then
                        echo "错误：没有此项功能，请确认编号是否正确！"
						find=0
						break
					fi
				done
                    
               find=1
                
                if [ $find -eq 1 ];
				then
                    SELECT_FEATURES=$x
                    return 1
                fi
                ;;
        esac
    done    
}

if get_selected
then
    echo "bye"
    exit
fi

# install all features
cd ${SHELL_DIR}

for each in ${SELECT_FEATURES}
do
    cd ${FEATURE_ARRAY[$each]}
    chmod +x setup.sh
    ./setup.sh
    cd ..
done

exit

