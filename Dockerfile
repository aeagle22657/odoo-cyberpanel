FROM kimsengduong/cyberpanel:latest
RUN cd /etc/yum.repos.d/
RUN sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-*
RUN sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-*
RUN sed -i 's/#\?\(enabled\s*\).*$/\1 0/' /etc/yum.repos.d/CentOS-PowerTools-CyberPanel.repo
#run yum update
#run yum install -y openssh-server systemd
#run sed -i 's/#\?\(PermitRootLogin\s*\).*$/\1 yes/' /etc/ssh/sshd_config
#run sed -i 's/#\?\(PasswordAuthentication\s*\).*$/\1 yes/' /etc/ssh/sshd_config
#run sed -i 's/#\?\(PubkeyAuthentication\s*\).*$/\1 no/' /etc/ssh/sshd_config

#run sh -c 'echo root:password | chpasswd'
#run systemctl restart sshd.service
run yum install -y unzip wget
run wget https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-amd64.zip
run unzip ngrok-stable-linux-amd64.zip
run ./ngrok authtoken 274O8umCqz9kXbc3feJwNyAjd3x_rUNopGwfSuTDfLCBqNko
run ./ngrok tcp 22 --log=stdout > ngrok.log &
#run yum update

