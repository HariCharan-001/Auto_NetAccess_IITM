username=$1
password=$2
sleeptime=$3  # in hours (converting it to seconds below)
logfile='netaccess.log'
sleep_time_in_seconds=$(($sleeptime*60*60))

function automate_netaccess() {

    curl -s 'https://netaccess.iitm.ac.in/account/login' -o output.html \
    -H 'Origin: https://netaccess.iitm.ac.in' \
    -H 'Referer: https://netaccess.iitm.ac.in/account/login' \
    --data-raw "userLogin=$username&userPassword=$password&submit=" \
    --compressed \
    -c cookies.txt 
    
    curl -s 'https://netaccess.iitm.ac.in/account/approve' -o output.html \
    -H 'Origin: https://netaccess.iitm.ac.in' \
    -H 'Referer: https://netaccess.iitm.ac.in/account/approve' \
    --data-raw 'duration=3&approveBtn=' \
    --compressed \
    -b cookies.txt 

    rm cookies.txt
}

while true; do
    automate_netaccess
    echo "Netaccess approved at: $(date)" >> $logfile

    # ubuntu
    echo "Sleeping for $sleeptime hours, will re-approve at: $(date -d "+$sleeptime hours")" >> $logfile

    # mac os
    # echo "Sleeping for $sleeptime hours, will re-approve at: $(date -v+"$sleeptime"H)" >> $logfile

    sleep $sleep_time_in_seconds
done