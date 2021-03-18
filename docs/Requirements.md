# Requirements

## Business Requirements
- The Application must serve **variable amount of traffic.** Most users are active during business hours. During big events and conferences the traﬃc could be 4 times more than typical. 
- The Customer takes **guarantee to preserve** your notes up to 3 years and recover it if needed. 
- The Customer **ensures continuity in service** in case of datacenter failures. 
- The **Service must be capable of being migrated to any regions** supported by the cloud provider **in case of emergency**. 
- The Customer is planning to have more than 100 developers to work in this project who want to roll out **multiple deployments** a day without **interruption / downtime.** 
- The Customer wants to provision s**eparated environments to support their development process for development**, testing, production in the near future. 
- The Customer wants to see **relevant metrics and logs from the infrastructure for quality assurance and security purposes**. 

## Cloud Migration Possibilities
![alt text](https://github.com/polganesh/nord/blob/main/docs/images/cloud-migration-strategies.jpg)

## Important Notes
Customer is expecting 
- Elasticity
- Disaster Recovery
- Monitoring, Alerting

## Assumptions
- Customer is not like to bind to the specific cloud provider
- Customer wants to re-architecture /re-engineer the application

## Mapping Business Requirements with  well architected framework
Following are mapping business requirements to a well-architected framework.
the motivation for this is from [this white paper](https://aws.amazon.com/blogs/apn/the-5-pillars-of-the-aws-well-architected-framework/ "this white paper")

![alt text](https://github.com/polganesh/nord/blob/main/docs/images/mapping-requirements.jpg)



