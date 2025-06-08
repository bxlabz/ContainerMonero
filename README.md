# ContainerMonero
This is an experiment in mining the crypto currency monero using MicroK8s (https://microk8s.io/docs), Xmirig (https://github.com/xmrig/xmrig) and the Monero Ocean mining Pool (https://moneroocean.stream/).
Use the dockerfile to create an image (my wallet ID is hardcoded). 
Use pi.yaml to deploy the image in MicroK8s.
A local insecure registry was used to store the images. (https://microk8s.io/docs/registry-built-in)
Daemon.json & hosts.toml will need to be updated with your nodes IP addresses on each node in your cluster prior to deployment. 
Use at your own risk. 


Install directions for Main Node
1. bx@AMD9:~/k8$ sudo snap install microk8s --classic
2. bx@AMD9:~/k8$ sudo microk8s add-node
    use the above output to add each node. Each node needs its own unique link, so if you have 2 additonal nodes, you need to
    run the above command 2 times
3. bx@AMD9:~/k8$ sudo microk8s kubectl get no
    NAME       STATUS   ROLES    AGE     VERSION
    amd9       Ready    <none>   84s     v1.32.3
    gmubuntu   Ready    <none>   27m     v1.32.3
    lt2i7      Ready    <none>   2m      v1.32.3
    lti5       Ready    <none>   3m29s   v1.32.3
    lti7       Ready    <none>   2m      v1.32.3

4. bx@AMD9:~/crypto/ContainerMonero$ sudo apt install docker.io -y
    Enable MicroK8s registry to host images locally
5. bx@AMD9:~$ sudo microk8s enable registry
    Pull code that contains essential files
6. bx@AMD9:~$ git clone https://github.com/bxlabz/ContainerMonero.git
    Move into folder containing dockerfile
7. cd ContainerMoner
    Build the image from the dockerfile
8. bx@AMD9:~/crypto/ContainerMonero$ sudo docker build -t k8miner
    Check that Image was created
9. bx@AMD9:~/crypto/ContainerMonero$ sudo docker images
        REPOSITORY   TAG       IMAGE ID       CREATED         SIZE
        k8miner      latest    401c97f7cde5   5 minutes ago   592MB
        ubuntu       latest    bf16bdcff9c9   10 days ago     78.1MB
    Tag Image
10. bx@AMD9:~/crypto/ContainerMonero$ sudo docker tag k8miner:latest 192.168.1.45:32000/k8miner:registry
    Push Image
11. bx@AMD9:~/crypto/ContainerMonero$ sudo docker push 192.168.1.45:32000/k8miner:registry
    The push refers to repository [192.168.1.45:32000/k8miner]
        30be4f4d8890: Pushed
        f715a028cf59: Pushed
        2818ec346ef7: Pushed
        a8346d259389: Pushed
        registry: digest: sha256:14ac1eaf59e6489a4a5910d9c9eb3ef082dc1db887c34eb2562ad16464bc7b1a size: 1160

12. 