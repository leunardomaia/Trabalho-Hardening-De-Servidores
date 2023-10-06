    # Atualizar o sistema operacional
    apt-get update
    apt-get upgrade -y

    # Instalar o NGINX
    apt-get install -y nginx

    # Desativar a exibição das informações de versão do NGINX
    sudo sed -i 's/# server_tokens off;/server_tokens off;/' /etc/nginx/nginx.conf
    sudo systemctl restart nginx

    # Ação de hardening: desabilitar o ping
    echo 1 | sudo tee /proc/sys/net/ipv4/icmp_echo_ignore_all

    # Configuurar firewall
    iptables -P INPUT DROP
    iptables -A INPUT -p tcp --dport 80 -j ACCEPT
    iptables -A INPUT -p tcp --dport 22 -j ACCEPT
    iptables -A INPUT -p tcp --dport 443 -j ACCEPT

    # Remove serviços e pacotes desnecessários
    apt-get remove -y apache2
    apt-get remove -y mysql-server

    # Desabilita o serviço de impressão caso exista
    sudo systemctl disable cups

    # Desabilita o serviço de FTP caso exista
    sudo systemctl disable vsftpd

    # Reinicia o servidor para aplicar as alterações
    sudo reboot
