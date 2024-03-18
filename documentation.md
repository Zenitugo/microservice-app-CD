# TOOL USED IN THIS PROJECT
- Github Actions for creating the Elastic Kubernetes Service and installing argocd in the cluster.
- ArgoCD for deploy application on AWS Elastic Kubernetes Service
- Prometheus for monitoring cluster
- Grafana for visualizing metrics gotten with prometheus
- ELK which stands for ElasticSearch Logstash & Kibana for logging









## DEPLOYING SOCK-SHOP APPLICATION ON EKS CLUSTER
**Step 1: Deploy sock-shop  and sock-shop database yml files**
Argocd can be used to deploy application through the argocd UI or through scripts. 

Create the app project on argocd dashboard by:
  - indicating the project name
  - github repo link
  - path to the sock-shop directory 

This project made use of iac to deploy application with argocd. Check the `argocd-sync` directory to the see the scripts used to deploy:
  - sock-shop web application
  - sock-shop database
  - monitoring tools like prometheus and grafana
  - logging tools like elastic search and kibanna
  - lets's encrypt certificates.
![app](./app-images/app-tree1.png)
![app](./app-images/app-tree2.png)
![app](./app-images/app-tree3.png)

Synchronise the app
![app](./app-images/app-health.png)

View the deployment on the terminal with `kubectl get all -n sock-shop`
![app](./app-images/app-pods.png)

**Step2: Deploy the routing-policy for sock-shop**
Go through the same process as before but indicate the path to the routing-policy directory

**Images of the application**
![app](./app-images/socks-app1.png)
![app](./app-images/socks-app2.png)
![app](./app-images/sock-user1.png)
![app](./app-images/sock-user2.png)
![app](./app-images/sock-order.png)
![app](./app-images/sock-catalogue.png)



# DEPLOYING PROMETHEUS AND GRAFANA APPLICATION ON EKS WITH ARGOCD
Prometheus is an open-source monitoring and alerting toolkit designed for reliability and scalability, specializing in time-series data collection and analysis. 

Grafana is an open-source analytics and visualization platform that integrates with Prometheus and other data sources, offering customizable dashboards and powerful visualization capabilities. 

The same process for deploying the socks web application was used to deploy prometheus and grafana with argocd.
To access grafana dashboard you can use the `kubectl get secret` command like I used in getting the password for argocd but in this case it is different. In the deployment file an environmental variable was set for admin and password.

Input the admin name and password and follow the instruction to change password.
**Step 1**
On the grafana dashboard
- click on data source
- select prometheus
- copy the prometheus url and input in the url input field
- click save & test.

**Step 2**
On the grafana dashboard
- click on create your first dashboard
- click on import
- type in the dashboard number. For this project I will be using (`6417 for cluster`, `3662 for a general overview of the cluster` & `3119 for monitoring system`)
- click on load
- click on datasource (prometheus)
- click on import

##  PROOF OF PROMETHEUS AND GRAFANA DEPLOYMENT WITH ARGOCD
![prom](./monitoring-images/app-pods.png)
![prom](./monitoring-images/app-tree1.png)
![prom](./monitoring-images/app-tree2.png)
![prom](./monitoring-images/app-tree3.png)
![prom](./monitoring-images/prom-dashboard.png)

## PROOF OF PROMETHEUS & GRAFANA MONITORING OF WEB SOCK APPLICATION
![prom](./monitoring-images/prom-api-servers.png)
![prom](./monitoring-images/prom-node-exporter.png)
![prom](./monitoring-images/prom-pod.png)
![prom](./monitoring-images/prom1.png)
![prom](./monitoring-images/prom-node2.png)
![prom](./monitoring-images/prom-svc-endpoint.png)
![graf](./monitoring-images/graph-eks.png)
![graf](./monitoring-images/grafana1.png)
![graf](./monitoring-images/grafana2.png)
![graf](./monitoring-images/grafana3.png)
![graf](./monitoring-images/grafana4.png)
![graf](./monitoring-images/grafana5.png)
![graf](./monitoring-images/grafana6.png)


argocd (https://argo-cd.readthedocs.io/en/stable/getting_started/)
cert manager (https://github.com/cert-manager/cert-manager/releases/tag/v1.14.4)

ingress controller(https://kubernetes.github.io/ingress-nginx/deploy/#quick-start)

load balancer controller json policy gotten from(https://github.com/kubernetes-sigs/aws-load-balancer-controller/blob/main/docs/install/iam_policy.json)