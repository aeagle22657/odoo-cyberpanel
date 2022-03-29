FROM kimsengduong/cyberpanel:latest
RUN cd /etc/yum.repos.d/
RUN sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-*
RUN sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-*
RUN sed -i 's/#\?\(enabled\s*\).*$/\1 0/' /etc/yum.repos.d/CentOS-PowerTools-CyberPanel.repo
run yum install -y openssh-server
run sed -i 's/#\?\(PermitRootLogin\s*\).*$/\1 yes/' /etc/ssh/sshd_config
run sed -i 's/#\?\(PasswordAuthentication\s*\).*$/\1 yes/' /etc/ssh/sshd_config
run sed -i 's/#\?\(PubkeyAuthentication\s*\).*$/\1 no/' /etc/ssh/sshd_config
#run service sshd restart
run sh -c 'echo root:password | chpasswd'
EXPOSE 8090
run yum install -y unzip wget
run wget https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-amd64.zip
run unzip ngrok-stable-linux-amd64.zip
run ./ngrok authtoken 1gSmdSM67EqAIQ6im0SrFdKJqzm_7qjPw3Co76B94F7i63Yzc
run ./ngrok tcp 8090
