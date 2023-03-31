#!/bin/bash
yum install -y httpd php
curl -f -o /tmp/web-role.tar.gz http://materials.example.com/heat/resources/web-role.tar.gz
cd /tmp; tar zxvf web-role.tar.gz
cd /tmp/web-role/; cp -rf index.html about.html /var/www/html
touch /var/www/html/index.php
cat << EOF > /var/www/html/index.php
<html>
<head>
  <title>Example Application</title>
</head>
<body>
  <hr>
    <a href=http://$web_public_ip/index.html>Homepage</a>
    <a href=http://$web_public_ip/about.html>About</a>
  </hr>
  <h2>Hello, World!</h2>
  <h2>This web server was configured using OpenStack</h2>
</body>
</html>
EOF
systemctl restart httpd; systemctl enable httpd
