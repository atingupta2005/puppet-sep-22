IFS=','

while read line; do
    echo $line
    read -a strarr <<< "$line"
    MACHINE_IP="${strarr[0]}"
    USER_ID="${strarr[1]}"
    PASSWORD="${strarr[2]}"

    echo $MACHINE_IP $USER_ID $PASSWORD

    sshpass -p $PASSWORD ssh -o StrictHostKeychecking=no $USER_ID@$MACHINE_IP 'bash -s' <  puppet_agent_install.sh
done < nodes-inventory.txt
