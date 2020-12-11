# infrademo

## you need:
- git:
  - git cli and a code repository storage machanism (eg github)
  - sourcetree (optional) to visualize git operations
  - do NOT put secret information like keys/passwords in the repo.
- a decent editor, ideally supporting version control (eg vscode)
- a password management mechanism, web and cloud services center around bearer tokens, oidc and secrets.
- a secrets management mechanism, eg azure keyvault / hashicorp vault
- a cloud provider, forget on-prem
- cli to the cloud provider's api, eg azurecli, aws cli
- proper administrative boundaries -> do not destroy the environment.
- terraform cli
  - a storage account or s3 bucket to store the state file !
- docker cli
- ansible cli

For Kubernetes:
- kubectl cli
- helm
- useful tools: kubens, kubetail,kubectx

## useful links at:
- ansible site (tutorials, module ref)
- terraform site (language & proider ref)
- microsoft azure documentation for aks & co
- do a tutorial on git

# steps

## 1-install and configure tools (10m)
available natively using package managers for macos, linux
windows: mostly available natively. Otherwise, use lsw in windows 10 or alternatively a vm
do not start testing without setting up a git repo. (you can use github or any other repo hoster)
## 2-deploy infrastructure (30m)
PUrpose: deploy azure objects. this demo deploys:
- a vnet with 3 subnets
- a managment vm including public ip for ssh access in the mgmt subnet
- 3 test vm's in the vm-subnet
- an empty subnet for aks

Used tool: terraform
variable-ize as much as possible.
## 3-provision vm's (30m)
connect to the managment vm, install ansible.
pull this repo to the management vm, work from the ansible folder.
deploy the vm settings in the script. It will install some packages on all vm's and install docker on two of them.

## 4-using aks
typically done using eg terraform.
- testing on your laptop: use minikube
- for learning, install using kubeadm
- for on-prem usage, install using kubeadm or a container-based solution with deployment solution like eg rancher labs
- for a managed control plane solution with full out-of-the-box cloud provider, deploy an AKS cluster.

Kubernetes operations out of scope for this demo.
Use the documentation at the kubernetes project + the aks documentation at Microsoft.
suggested steps:
- deploy an ingress controller, eg nginx-ingress (use helm)
  - also deploy a default backend
  - deploy an azure load balancer together with the ingress deployment, through the helm yaml.
- if not using a fully or partly managed solution (so eg when using kubeadm):
  - choose and deploy a CNI provider
  - deploy coredns
  - deploy the metric server (optional but recommended)
- create a namespace and:
  - deploy a workload (eg a 2-replica nginx deployment)
  - create a service to provide a stable network identity
  - create an ingress rule to provide upper-layer exposure to your workload.
- take it further: (not shown during the demo)
  - deploy an azure ACR registry to handle your docker images
    - re-tag and push the images to your acr registry
    - the cluster will be able to pull images in a secure way due to the usage of managed identities and acr integration in aks (if you set it up during cluster deployment)
    - pull images only from ACR
  - provision azurefiles storage in azure to be used in your workload
  - map the web server's data volume to an azurefiles share
  - add a tls secret to your ingress rule and redirect unencrypted traffic
  - use a configmap object as mounted volume in your workload to handle the nginx configuration.
  - limit access to the control plane through ip acl's:
    - you might us a private control plane
    - otherwise, add ip acl's to the CP's network rules.
  - operations to try:
    - kill a pod in a deployment, check the re-scheduling
    - scale up and scale down the wanted number of running replicas
    - perform a rolling, downtimeless upgrade
    - add a worker, reschedule pods, kill one worker.


- take it even further:
  - set up azure keyvault (or any other vault which has k8s secret integration possibility) and integrate it with your cluster
  - move your k8s secrets (eg the ingress tls certificate and private key, application passwords, database access credential, ...) to keyvault with pod identities.

- take it further still:
  - set up an automated ci/cd deployment pipeline:
    - use azure devops tools
    - use a tool like jenkins (you can deploy the jenkins server as a pod)

## 5-managing k8s
- monitoring: try prometheus/grafana
- logging: try elk


## 6-backups
Back up the data using cloud tools (eg azurefiles backup, managed sql backup)
do not back up the k8s workers, they do not hold data.
Do not try too much to bring failing workers online, just redeploy or scale.