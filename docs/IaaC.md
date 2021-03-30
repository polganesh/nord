# Infrascture as a Code

## Introduction
This section try to highlight thought process for designing IaaC. main focus is on
- Designing Loosely coupled  IaaC
- Clean Code
- SOLID

## Code Structure

![alt text](https://github.com/polganesh/nord/blob/main/docs/images/iaac.PNG)

- All Infrastucture as a Code follow this folder structure.
- in real life it should be present in **different git repository** (which provide single responsibility) instead of writing all code in single repository. 
- Although following explanation is related to AWS but similar ideas can be followed for other cloud providers
- This approach also supports following benefits
    - single responsibility terraform scripts
    - loosely coupled scripts
    - helpful for upgrading scripts to higher version.
    - core terraform scripts can  further focus on (for more information refer following diagram)
        - performance
        - security
        - maintenance

![alt text](https://github.com/polganesh/nord/blob/main/docs/images/layered-cloud-infra.jpg)    
    
## Installation steps
These steps helpful for provisioning vpc ,k8s infrastructure.

 ### Create VPC with Terraform
 - Please visit `infrastructure-as-a-code/terraform/common/tfs_vpc`
 - Execute  `terraform apply `
 - More information about this script and various variables can be found [at](https://github.com/polganesh/terraform-aws-vpc) 

 ### Create EKS with Terraform 
 - Please visit `infrastructure-as-a-code/terraform/app`
 - Execute  `terraform apply `
 - Please note -to execute this script VPC with specific naming conventions must be present. it helps to create worker nodes in private subnets and load balancers in public subnet.
 - More information about this script can be found [at](https://github.com/polganesh/terraform-aws-eks-cluster)

### Post EKS installation
These are **one time activities**
#### config
- Run `terraform output` command from `infrastructure-as-a-code/terraform/app`
- it will provide value for __kubeconfig__
- Copy this to __home directory__/.kube
#### apply config-map
- Get yaml output of config_map_aws_auth from `terraform output` command
- put content of config_map_aws_auth in file and run kubectl apply -f {this config map file}
- once we execute it then nodes got allocated in EKS cluster.
![alt text](https://github.com/polganesh/nord/blob/main/docs/images/kubectl-get-nodes.PNG)

#### Install Helm chart in cluster
```
kubectl -n kube-system create serviceaccount tiller
kubectl create clusterrolebinding tiller --clusterrole=cluster-admin --serviceaccount=kube-system:tiller
helm init --service-account tiller
```

#### Install K8s Dashboard
[Refer](https://docs.aws.amazon.com/eks/latest/userguide/dashboard-tutorial.html) 

#### Install load balancer configure domain etc  
for more information refer Readme for external-app Refer (https://github.com/polganesh/nord/tree/main/external-applications)

#### Configure Load Balancer 
This will enable multiple subdomains to use same. (e.g. api.demo.polganesh.de)
![alt text](https://github.com/polganesh/nord/blob/main/docs/images/route53-config.PNG "Route 53")




