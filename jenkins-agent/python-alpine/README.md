# JNLP Jenkins Slave Apine Agent with Python 3.6.3

## Uploadnig to Kubernetes cluster

> Useless information for restricted restricted Kubernetes whitch does not have any acccess from outside except SSH

```bash
./build.sh
docker save python-jira-slave:3.6.3-alpine -o python-jira-slave.tar
gzip python-jira-slave.tar
scp ./python-jira-slave.tar.gz master.node:~
ssh master.node
sudo docker load --input python-jira-slave.tar.gz
for node in {node1, node2, ..., node(N-1) node(N)}; do scp -i key python-jira-slave.tar.gz ${node}:~;done
for node in {node1, node2, ..., node(N-1) node(N)}; do ssh -i keys ${node} 'sudo docker load --input python-jira-slave.tar.gz';done
```

## In Jennkins config

```jenkins
Pod Name: python-jira-slave
Pod Labels: python-jira-slave
Container Name: jnlp
Docker image: python-jira-slave:3.6.3-alpine
Working directory: /home/jenkins
Arguments to pass to the comman: ${computer.jnlpmac} ${computer.name}

```

## In Jenkins build

```jenkins
node ("python-jira-slave"){
    sh  "python3 --version"
    sh  "pip3 --version"
}
```
