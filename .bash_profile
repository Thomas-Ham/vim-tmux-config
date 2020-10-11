export PS1="[\A]\w$ "
PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\][\A]\w\[\033[00m\]$ '


source ~/.bashrc

# If we are text mode only, set my display variable
if ! xhost >& /dev/null ; then
  if [[ "$HOSTNAME" =~ "sbnd" ]] ; then
    export DISPLAY=localhost:20 ;
  fi
fi


#VNC stuff sbndgpvm01
VNCNUM=20 #CHANGE THIS NUMBER TO WHATEVER VNC SERVER NUMBER YOU PICKED
if [[ `hostname` == *"gpvm01"* ]] #only start VNC servers on the gpvms (i.e. not on the build machines)
then
  export DISPLAY=localhost:$VNCNUM #Export the display to point to the VNC server
	if [ `lsof -i -P -n | grep $(expr 5900 + ${VNCNUM}) | wc -l` -eq 0 -o `lsof -i -P -n | grep $(expr 6000 + ${VNCNUM}) | wc -l` -eq 0 ]
	then
		echo "vncserver :$VNCNUM not running.  Starting now...." 
		vncserver :$VNCNUM -localhost -bs    #Check if the VNC server is running and start it if not (-localhost mandatory!)
	else
		echo "vncserver :$VNCNUM already running (hopefully owned by you).  Not attempting to start the vncserver..." 
	fi
fi

#VNC stuff sbndgpvm02
VNCNUM=25 #CHANGE THIS NUMBER TO WHATEVER VNC SERVER NUMBER YOU PICKED
if [[ `hostname` == *"gpvm02"* ]] #only start VNC servers on the gpvms (i.e. not on the build machines)
then
  export DISPLAY=localhost:$VNCNUM #Export the display to point to the VNC server
	if [ `lsof -i -P -n | grep $(expr 5900 + ${VNCNUM}) | wc -l` -eq 0 -o `lsof -i -P -n | grep $(expr 6000 + ${VNCNUM}) | wc -l` -eq 0 ]
	then
		echo "vncserver :$VNCNUM not running.  Starting now...." 
		vncserver :$VNCNUM -localhost -bs    #Check if the VNC server is running and start it if not (-localhost mandatory!)
	else
		echo "vncserver :$VNCNUM already running (hopefully owned by you).  Not attempting to start the vncserver..." 
	fi
fi
