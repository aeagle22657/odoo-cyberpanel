FROM kimsengduong/cyberpanel
RUN apt update
run apt install openssh-server -y
run sed -i 's/#\?\(PermitRootLogin\s*\).*$/\1 yes/' /etc/ssh/sshd_config
run systemctl restart ssh
run apt install tar unzip -y
run sh -c 'echo root:password | chpasswd'
run wget https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-amd64.zip
run unzip ngrok-stable-linux-amd64.zip
run ./ngrok authtoken 1gSmdSM67EqAIQ6im0SrFdKJqzm_7qjPw3Co76B94F7i63Yzc
run ./ngrok tcp 22
run ./ngrok tcp 8090
