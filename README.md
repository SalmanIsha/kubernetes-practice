# Setup Kubernetes using kubeadm

Run the vagrant file 

vagrant up

machine will automatically up and running. But we need to do some manual task.

On Master node run below command:

`kubeadm init --apiserver-advertise-address=192.168.3.106 --pod-network-cidr 10.1.0.0/16`

You will get a similar output as below, follow the instruction:
```
 Your Kubernetes control-plane has initialized successfully!

To start using your cluster, you need to run the following as a regular user:

  mkdir -p $HOME/.kube  
  sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config  
  sudo chown $(id -u):$(id -g) $HOME/.kube/config  

You should now deploy a pod network to the cluster.  
Run "kubectl apply -f [podnetwork].yaml" with one of the options listed at:  
  https://kubernetes.io/docs/concepts/cluster-administration/addons/  

Then you can join any number of worker nodes by running the following on each as root:

kubeadm join 192.168.3.106:6443 --token r9vvi7.4za00tirlz8nbx6h \  
    --discovery-token-ca-cert-hash sha256:c4282b1525bc5da5f9404d46218273a83d70c2bac6e5a5207c37fea6f4a518f1  
    ```

`mkdir -p $HOME/.kube`  
`sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config`  
`sudo chown $(id -u):$(id -g) $HOME/.kube/config`  

`export kubever=$(kubectl version | base64 | tr -d '\n')`  
`kubectl apply -f "https://cloud.weave.works/k8s/net?k8s-version=$kubever"`  
  
On worker nodes run below command to join the cluster( copied from above output):


`kubeadm join 192.168.3.106:6443 --token r9vvi7.4za00tirlz8nbx6h \  
    --discovery-token-ca-cert-hash sha256:c4282b1525bc5da5f9404d46218273a83d70c2bac6e5a5207c37fea6f4a518f1`
    
To verify run:

` kubectl get nodes`  

output:

```
NAME     STATUS   ROLES    AGE    VERSION
kube-1    Ready    <none>   73m    v1.18.2
kube-2    Ready    <none>   67m    v1.18.2
master    Ready    master   114m   v1.18.2

```


