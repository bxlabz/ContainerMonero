# ContainerMonero
This is an experiment in mining the crypto currency monero using MicroK8s (https://microk8s.io/docs) & Xmirig (https://github.com/xmrig/xmrig).
Use the dockerfile to create an image (my wallet ID is hardcoded). 
Use pi.yaml to deploy the image in MicroK8s.
A local insecure registry was used to store the images. (https://microk8s.io/docs/registry-built-in)
Daemon.json & hosts.toml will need to be updated with your nodes IP addresses on each node in your cluster prior to deployment. 
Use at your own risk. 
