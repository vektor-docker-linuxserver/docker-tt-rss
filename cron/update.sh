#!/bin/bash
cd /config/www/tt-rss/ && /config/www/tt-rss/update.php --feeds > /tmp/tt-rss-update.log 2>&1
logger -f /tmp/tt-rss-update.log
