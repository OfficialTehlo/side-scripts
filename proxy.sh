echo "What is the domain + subdomain you want to use?"
read ccdomain

echo "What is the domain or IP address you want to proxy? (Service IP and Port)"
read ccip

echo " server {
        server_name $ccdomain;
        listen 80;
        listen [::]:80;
        access_log /var/log/nginx/reverse-access.log;
        error_log /var/log/nginx/reverse-error.log;
        location / {
                    proxy_pass https://$ccip;
  }
} " > /etc/nginx/sites-available/$ccdomain.conf

ln -s /etc/nginx/sites-available/$ccdomain.conf /etc/nginx/sites-enabled/$ccdomain.conf

certbot --nginx

echo "Done! :)"
