#!/bin/bash

dnf update -y
dnf install -y nginx

cat > /usr/share/nginx/html/index.html <<'EOF'
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>My First AWS VPC</title>
  <style>
    body {
      font-family: Arial, sans-serif;
      background: #0f172a;
      color: #e2e8f0;
      display: flex;
      align-items: center;
      justify-content: center;
      min-height: 100vh;
      margin: 0;
      text-align: center;
    }
    .card {
      background: #1e293b;
      padding: 2rem 3rem;
      border-radius: 12px;
    }
    h1 { color: #38bdf8; }
  </style>
</head>
<body>
  <div class="card">
    <h1>Hello from my custom VPC</h1>
    <p>This page is served by nginx on an EC2 instance.</p>
    <p>Built with Terraform.</p>
  </div>
</body>
</html>
EOF

systemctl enable nginx
systemctl start nginx
