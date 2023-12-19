#!/usr/bin/env bash
# A Bash script that sets up your web servers for the deployment of web_static

sudo apt -y update
sudo apt -y install nginx

mkdir -p /data/web_static/releases/test/
mkdir -p /data/web_static/shared/

echo "<html>
  <head>
  </head>
  <body>
    Holberton School
  </body>
</html>" >/data/web_static/releases/test/index.html
ln -sf /data/web_static/releases/test/ /data/web_static/current

chown -R ubuntu:ubuntu /data/

sudo echo "server {
        listen 80 default_server;
        listen [::]:80 default_server;

        root /var/www/html;
        index index.html index.htm index.nginx-debian.html;

        add_header X-Served-By $HOSTNAME;
        server_name _;

        location /hbnb_static {
                alias /data/web_static/current/;
                index index.html index.htm;
        }

        location /redirect_me {
                return 301 https://www.youtube.com/watch?v=QH2-TGUlwu4;
        }

        location / {
                try_files \$uri \$uri/ =404;
        }

        error_page 404 /404.html;
        location = /404.html {
                root /var/www/html;
                internal;
        }
}" | sudo tee /etc/nginx/sites-enabled/default
sudo service nginx restart
