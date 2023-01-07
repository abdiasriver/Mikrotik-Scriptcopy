/tool netwatch
add down-script=":log debug "Starting ISP Test Script...";
    :local sysname [/system identity get name];
    :local ISP1 [/ip route get [find dst-address=77.88.8.1/32] comment]
    :local ISP2 [/ip route get [find dst-address=77.88.8.8/32] comment]
    :log debug "Sending information via Telegram...";
    /tool fetch  keep-result=no url="https://api.telegram.org/botXXX:YYY/sendMessage?chat_id=-ZZZ&text=$sysname $ISP1 is down"
    :log debug "ISP Test Complete!";" host=77.88.8.1 timeout=3s up-script=":log debug "Starting ISP Test Script...";
    :local sysname [/system identity get name];
    :local ISP1 [/ip route get [find dst-address=77.88.8.1/32] comment]
    :local ISP2 [/ip route get [find dst-address=77.88.8.8/32] comment]
    :log debug "Sending information via Telegram...";
    /tool fetch  keep-result=no url="https://api.telegram.org/botXXX:YYY/sendMessage?chat_id=-ZZZ&text=$sysname $ISP1 is up"
    :log debug "ISP Test Complete!";"