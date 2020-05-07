# Disable selinux & swap, add host entry

sudo bash -c 'setenforce 0'
sudo bash -c 'sed -i --follow-symlinks 's/SELINUX=permissive/SELINUX=disabled/g' /etc/sysconfig/selinux'
sudo bash -c 'echo "192.168.3.106  master" >> /etc/hosts'
sudo bash -c 'echo "192.168.3.101  worker1" >> /etc/hosts'
sudo bash -c 'echo "192.168.3.101  worker2" >> /etc/hosts'
sudo bash -c 'echo '1' > /proc/sys/net/bridge/bridge-nf-call-iptables'
sudo bash -c 'swapoff -a'



# Configure Kubernetes Repository

sudo cat <<EOF > /etc/yum.repos.d/kubernetes.repo
[kubernetes]
name=Kubernetes
baseurl=https://packages.cloud.google.com/yum/repos/kubernetes-el7-x86_64
enabled=1
gpgcheck=1
repo_gpgcheck=1
gpgkey=https://packages.cloud.google.com/yum/doc/yum-key.gpg
       https://packages.cloud.google.com/yum/doc/rpm-package-key.gpg
EOF

# Install Kubeadm and Docker

sudo yum install kubeadm docker -y
sudo systemctl restart docker && systemctl enable docker
sudo systemctl restart kubelet && systemctl enable kubelet
