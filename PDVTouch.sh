#! /bin/bash
/usr/bin/setxkbmap -layout br -variant abnt2 > /tmp/setxkbmap.log 2>&1
if ! mountpoint -q /media/root/GERSAT3/; then
    mount /media/root/GERSAT3/
fi
chmod -x /usr/local/bin/igraficaJava
chmod -x /usr/local/bin/dualmonitor_control-PDVJava

cd /Zanthus/Zeus/pdvJava/GERAL/SINCRO/WEB/moduloPHPPDV/
rm -rf cmp_error
sleep 5
docker start modulophppdv_moduloPHPPDV_1
sleep 5

nohup recreate-user-rabbitmq.sh &
/Zanthus/Zeus/pdvJava/pdvJava2 &
sleep 30
nohup chromium-browser --disable-gpu --disable-pinch --test-type --no-sandbox --kiosk --no-context-menu --disable-translate file:////Zanthus/Zeus/Interface/index.html

