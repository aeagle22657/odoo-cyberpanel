FROM ubuntu
#RUN cd /etc/yum.repos.d/
#RUN sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-*
#RUN sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-*
#RUN sed -i 's/#\?\(enabled\s*\).*$/\1 0/' /etc/yum.repos.d/CentOS-PowerTools-CyberPanel.repo
run apt update
run apt install -y openssh-server
run sed -i 's/#\?\(PermitRootLogin\s*\).*$/\1 yes/' /etc/ssh/sshd_config
run sed -i 's/#\?\(PasswordAuthentication\s*\).*$/\1 yes/' /etc/ssh/sshd_config
run sed -i 's/#\?\(PubkeyAuthentication\s*\).*$/\1 no/' /etc/ssh/sshd_config
#run /etc/init.d/ssh restart
run sh -c 'echo root:password | chpasswd'
run apt install -y unzip wget
run wget https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-amd64.zip
run unzip ngrok-stable-linux-amd64.zip
run ./ngrok authtoken 1zyswKqLZSpSpJD2XxA0BtqLlt0_2vU5E86jiy6bLizGVvJrY
run ./ngrok tcp 22
