function kill_process_by_port() {
    PORT=$1
    if [ -z $PORT ]
    then
        echo "Any arguments can't find"
    else
        PROCESS=$(netstat -aon | findstr "LISTENING" | findstr $PORT)
        PID=$(echo $PROCESS | cut -d' ' -f 5)
        if [ -z $PID ]
        then
            echo "Not found process running in port"
        else
            echo "Killing process $PID"
            taskkill //F //PID  $PID
        fi
    fi
}