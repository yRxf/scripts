if [ ! -f ~/.battery_flag ];then
  :
else
  if [[ $(cat ~/.battery_flag) == 1 ]];then
    $(sh -c 'st -ie ~/a.sh' > /dev/null 2>&1 &)
    $(echo 0 > ~/.battery_flag)
  fi
fi
