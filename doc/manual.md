## How to deploy
- Deploy a jump box to the vpc created
- note down the ssh key name (update ec2.tf with same key)
- terraform init/plan/apply changes
- connect to the ec2 instance in private subnet from the jump box
- config IIS on the ec2 instance in the private subnets
- test on the connection
- Request certs for domain davidli.site, update the CNAME on godaddy accordingly
- update the listener on ALB for HTTPS accordingly

## About domain
- [Domain management](https://account.godaddy.com/products)
- Use ACM to request a new certificate
- update the CNAME based on the requests
- [Associate an ACM SSL certificate with an ALB](https://aws.amazon.com/premiumsupport/knowledge-center/associate-acm-certificate-alb-nlb/)