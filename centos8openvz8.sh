# Tested and working on migrating CentOS8 without updates to OpenVZ/Virtuozzo 8 (Still under checks)
wget -O /etc/yum.repos.d/openvz8.repo https://raw.githubusercontent.com/taidos/openvz8/main/openvz8.repo;
mkdir ~/yum; 
mv /etc/yum.repos.d/CentOS* ~/yum;
yum -y remove centos-release;
yum -y install kernel-4.18.0-305.3.1.vz8.7.13.x86_64 epel-release;
yum -y update;
chmod go-r /etc/ssh/*
yum -y install nftables-devel spfs vzpkgenv414x64 python3-protobuf;
yum -y install ploop;
yum -y install *ez.noarch prlcrl vzpkg*;
yum -y install https://download.openvz.org/virtuozzo/factory8/x86_64/os/Packages/p/python3-criu-3.15.2.9-1.vz8.x86_64.rpm https://download.openvz.org/virtuozzo/factory8/x86_64/os/Packages/c/criu-3.15.2.9-1.vz8.x86_64.rpm;
yum -y install vzctl prlctl prl-disp-service *ploop* *ez.noarch python3-pip prl-vzvncserver;
yum -y module reset perl-IO-Socket-SSL perl-libwww-perl;
grubby --set-default-index=1;
systemctl enable vz;
modprobe ploop;
passwd root;
echo "After this you can reboot in the VZ kernel and start using it";
echo "Now after reboot please remember to put the modules on:";
echo "modprobe ploop";
echo "Change the default kernel to vz8 and not to vl8
echo "Execute then after reboot, now you can REBOOT :)";
echo "--------------------------------------";
