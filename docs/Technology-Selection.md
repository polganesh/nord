# Technology Selection

![alt text](https://github.com/polganesh/nord/blob/main/docs/images/technology-selection.jpg)

- Cloud - AWS
  - We selected AWS due to the following reasons
    - It is a market leader
    - provide a wide range of services
- Infrastructure as a Code (IaaC) - Terraform
  - Less learning curve same concepts can be used for other cloud providers
  - Provide infrastructure automation for all major cloud providers
  - Vendor-neutral    
- Computing - Kubernetes
  - Why Kubernetes?
    - Not tightly bind to AWS cloud.
    - One can use the same orchestration tool for other major cloud providers.
    - Possibility to provision on the local machine as well with minor changes.  
    - migration to other cloud providers possible with minor modifications like
      - Load Balancers
      - persistent volume
    - Possibility to run serverless in the cluster.  
  - Why not ECS?
    - tightly coupled with AWS cloud.
  - Why not just serverless?
    - Serverless becomes costly for a system that has more transactions.
    - Long running transaction got throttled after 15 minutes.
- Persistence layer - Aurora Serverless
  - Aurora Serverless **is not part of this POC but it can be considered in real life implementation** due to following benefits
    - handle connection pooling effectively
    - backup restore handle effectively
    - elasticity