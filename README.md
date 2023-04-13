# SWE645-Assignment-2-WebApp-K8-CI-CD
Containerized - Kubernetes Deployment - Complete CI/CD Pipline

# Objectives of this assignment:

• Containerize the Web application you developed in Homework 1 – Part 2, using
Docker container technology.

• Deploy the containerized application on the open source container orchestration
platform Kubernetes to enable scalability and resiliency of the application. Your
baseline configuration includes at least three pods running all the time. You can
use Rancher (https://rancher.com/docs) to setup Kubernetes cluster. You also have
an option to use managed Kubernetes services, such as EKS on Amazon Web
Services (AWS) or GKE on Google Cloud Platform (GCP).

• Establish a CI/CD pipeline that includes a Git source code repository at GitHub, and
Jenkins for automated build and for the automated deployment of your application
on Kubernetes


 

### Refer to the Instructions file for extended installation steps and supported screenshots.

### Demo Videos
#### Installation video
https://gmuedu-my.sharepoint.com/:v:/g/personal/psharm24_gmu_edu/EUOEQ5rCf8FPuqOZi__b_fsBcXzFEWY17IiIplys5i6xjg?e=eJkWib

#### Demo Video
https://gmuedu-my.sharepoint.com/:v:/g/personal/mraval_gmu_edu/EYuFnHbuHh1Bh1TjcyLDx0gBFrhUCOaczepkDZSus7MsFQ?e=f06jHq4

### Initial Setup

- Commit code for HW1 on a github repository. (https://github.com/anandsesha/SWE645-Assignment-1-HTML-AWS-S3)
- Create a repository on docker hub and push .war file (https://hub.docker.com/r/anandseshadrii/studentsurvey645)

---

### Ubuntu Server / Docker

- Start EC2 instance, with ubuntu AMI. (Rancher Dashboard: https://ec2-34-198-210-248.compute-1.amazonaws.com/dashboard/home)
- Install docker in it
- Run rancher on it
- Rancher started, can be checked by ‘sudo docker ps’
- Get dashboard at public DNS address of EC2.
- Create a ‘custom’ cluster.

---

### Kubernetes Registration, cluster creation and deployment.

- Create another EC2 instance, making sure it has enough space (Min. 25GB) having ubuntu AMI. (K8s server: ec2-54-147-49-153.compute-1.amazonaws.com)
- After installing docker on this, register the nodes for our cluster on this with the provided command. This instance will host our etcd, control panel and the worker nodes.
- Once this cluster is active, create two deployments (nodeport and loadbalancer)
- Download the KubeConfig file for cluster and save it.
- Provide the docker repo address for this deployment to pull the image and deploy.
- It ‘create’ and see the pods are created and status as ‘running’.
- Check the logs for the pod using ‘kubectl logs <pod_name>’ to see if .war file was successfully loaded.
- Should be able to access the ‘Student Servey’ form from the deploy services address.

---

### Automating build and release using Jenkins

- Create another EC2 instance for hosting Jenkins. (Jenkins: http://ec2-54-211-13-48.compute-1.amazonaws.com:8080)
- Install java on this instance and install jenkins. (https://pkg.jenkins.io/debian/)
- Create a directory /.kube and paste the contents of the file ‘KubeConfig‘ by creating file ‘config’
- Check the current_context (kubectl config current-context), and it returns  our cluster_name created in rancher.
- Create a jenkins pipeline and install necessary plugins. (CloudBees docker & Rancher). (https://docs.cloudbees.com/docs/admin-resources/latest/plugins/docker-workflow / https://plugins.jenkins.io/rancher/)
- Configure the pipeline, with source as the github repo. Polling the SCM every minute and provide access to JenkinsFile stored in github repo.
- Created and push ‘JenkinsFile’ consisting of stages which include, a. Build. b. Push to docker hub. c. Deploy on Rancher single node. d. Deploy on rancher
- Once the pipeline is successfully setup. Make any change to the code and push it to GitHub it keeps polling SCM and triggers a new build. Once all the steps are completed. See the new build is pushed to docker hub and the image in also updated in Rancher deployments, now hosting the newly created build.
Footer
© 2023 GitHub, Inc.
Footer navigation
Terms
Privacy
Security
Status
Docs
Contact GitHub
Pricing
API
Training
Blog
About
CS-645-Assignment/ReadMe.md at main · pranay-sharma793/CS-645-Assignment 
