#!/bin/bash
cd /config/www/tt-rss/ && /config/www/tt-rss/update.php --feeds >> /config/log/tt-rss-update.log 2>&1
