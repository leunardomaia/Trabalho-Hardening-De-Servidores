    # Atualizar o sistema operacional
    apt-get update
    apt-get upgrade -y
    
    # Instalar o apache
    apt-get install -y apache2

    # Ação de hardening: desabilitar o ping
    echo 1 | sudo tee /proc/sys/net/ipv4/icmp_echo_ignore_all  

    # Configuurar firewall
    iptables -P INPUT DROP
    iptables -A INPUT -p tcp --dport 80 -j ACCEPT
    iptables -A INPUT -p tcp --dport 22 -j ACCEPT
    iptables -A INPUT -p tcp --dport 443 -j ACCEPT
    
    # Remove serviços e pacotes desnecessários
    apt-get remove -y nmap
    apt-get remove -y mysql-server

    # Reinicia o servidor para aplicar as alterações
    sudo reboot

    # Desabilita o serviço de impressão caso exista
    sudo systemctl disable cups

    # Desabilita o serviço de FTP caso exista
    sudo systemctl disable vsftpd

    # Desabilitar a exibição dos detalhes do Apache
    sudo cp /vagrant/apache/security.conf /etc/apache2/conf-available/security.conf
    sudo systemctl restart apache2
