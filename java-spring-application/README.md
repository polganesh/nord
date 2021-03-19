# Readme

## Introduction
This is simple _spring java project_ highlight steps for running it on _k8s_ cluster. 

## Capabilities of this 
- Spring application deployed as a _K8s Deployment_ in K8s cluster
- Utilize Helm chart for custom application. It Provides facility to 
  - Deploy application as single unit in k8s cluster
  - Rollback to earlier version 

## Further Possible Improvements
- replace persistence layer to managed RDS service in AWS like Aurora serverless.

## Important Notes
This documentation  mainly concentrated on how to deploy application on AWS EKS,but similar steps can be taken for other cloud providers like Azure, GCP....

## Prerequisite
- Required
  - Git client :- to clone this project on local development environment.
  - Java 8 or above :- for application development, compilation and build as jar file
  - Maven :- build tool for this project. 
  - Docker :- for creating docker image
  - Helm :- helm client for deploying this application as a helm chart.
  - k8s cluster - for a current scenario we are using EKS from Amazon.
- Optional
  - if using AWS EKS 
    - AWS account
    - AWS CLI :- to push docker image to AWS ECR
    - EKS cluster :- AWS k8s   
    - AWS IAM authenticator :- required for connecting AWS EKS cluster from local machine
    
## Steps
### Build java project
from same directory execute following commands
```
mvn clean install -DskipTests
```
It will create jar (named **spring-0.0.1-SNAPSHOT.jar**) file in the _target_ folder of this project 

### Build Docker image

```
docker build -t $USER/poc:dev .
```
- It will create docker image based on _Dockerfile_ present in this directory.
- I have created docker image with name poc and tagged it as dev. you are free to use other names and tags

### Push docker image to AWS ECR (optional)
- This step is optional and required only if you are using AWS ECR to store docker images. 
- In our case we are using AWS EKS for deploying our application hence it is needed .
- steps for pushing docker image to ECR are available in AWS web console. for more information [refer](https://docs.aws.amazon.com/AmazonECR/latest/userguide/docker-push-ecr-image.html)

### create default helm chart (optional)
- This step is required if we are using helm chart for deploying our application  as helm chart.
- Go to helm chart folder of this project and execute following command. Please note in following case our chart name is __springk8s__. we can provide any other name if needed.
```
helm create springk8s
```
- it will create default helm chart for our use case.

### override values.yaml in helm (required if we are using helm chart)
- for docker image
  - in following case we are 
	- pointing to our docker image present in AWS ECR
	- for testing purpose we are using pullPolicy as _Always_
```
image:
  repository: 283117477011.dkr.ecr.eu-central-1.amazonaws.com/poc
  tag: latest
  pullPolicy: Always
```
- for service and ingress
```
service:
#  type: LoadBalancer
  port: 8080

ingress:
  enabled: true
  annotations:
    kubernetes.io/ingress.class: nginx
  hosts:
    - host: nordcloud.demo.polganesh.de
      paths: ["/"]
```


# How to deploy this application as a helm chart to k8s cluster ?
- Please execute following command from the root location of this project.
- If needed we need to change image tag defined in values.yaml of this project.
```
helm upgrade --install springk8s helm-chart/springk8s
```



