#! /bin/bash
/usr/bin/setxkbmap -layout br -variant abnt2 > /tmp/setxkbmap.log 2>&1
if ! mountpoint -q /media/root/GERSAT3/; then
    mount /media/root/GERSAT3/
fi
chmod -x /usr/local/bin/igraficaJava
chmod -x /usr/local/bin/dualmonitor_control-PDVJava
nohup recreate-user-rabbitmq.sh &
/Zanthus/Zeus/pdvJava/pdvJava2 &
sleep 30
nohup chromium-browser --disable-gpu --disable-pinch --test-type --no-sandbox --kiosk --no-context-menu --disable-translate file:////Zanthus/Zeus/Interface/index.html

