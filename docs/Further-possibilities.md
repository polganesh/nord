# Further Possible Improvements
- Operational Excellence
    - Monitoring Alerting
        - Recently AWS provided Prometheus and Grafana as **Preview**. We can integrate monitoring and alerting with these service and utilize benefit of **managed services.** 
    - CI-CD
        - Currently, we are deploying infrastructure and application from **local vm**, but we can run **Jenkins in separate k8s** cluster with **Job DSL plugin**.
    - Semantic Versioning
      - We can use ideas like semantic versioning for release pipeline.    
- Cost Optimization
    - We can segregate static content with the help of static website hosting (S3, Cloud front). This will save cost and reduce load on system (no need to have heavy worker nodes)
- Security
    - For improving code quality we can use Static Code Analysis tools like SonaeQube and integrate it in CI-CD pipeline.
    - For improving security **Dynamic Code Analysis** we can further use tools like **Zap**, Burp tools and integrate it in CI-CD pipeline.
    - Usage of tools like **Istio** can further improve security at K8s level
    - We can utilise feature like **image scanning at ECR level** for scanning docker images to be uploaded.
    - Currently, we are using Helm 2, but we can use Helm 3 as it provide better features.
    - We can enable traffic on Http**s**. currently, we are using simple HTTP communication.
    - To handle layer 7 attacks effectively we can integrate AWS firewall with Application load balancer.
- Reliability
    - Currently, we are using Autoscaling and Spot instances for cost optimization. we can use HPA and concept like virtual kubelet (running serverless inside K8s).
    
    