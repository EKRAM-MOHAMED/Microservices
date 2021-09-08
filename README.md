

[![CircleCI](https://circleci.com/gh/EKRAM-MOHAMED/Microservices/tree/master.svg?style=svg)](https://circleci.com/gh/EKRAM-MOHAMED/Microservices/tree/master)

## Project Overview

In this project, you will apply the skills you have acquired in this course to operationalize a Machine Learning Microservice API. 

You are given a pre-trained, `sklearn` model that has been trained to predict housing prices in Boston according to several features, such as average rooms in a home and data about highway access, teacher-to-pupil ratios, and so on. You can read more about the data, which was initially taken from Kaggle, on [the data source site](https://www.kaggle.com/c/boston-housing). This project tests your ability to operationalize a Python flask app—in a provided file, `app.py`—that serves out predictions (inference) about housing prices through API calls. This project could be extended to any pre-trained machine learning model, such as those for image recognition and data labeling.

### Project Tasks

Your project goal is to operationalize this working, machine learning microservice using [kubernetes](https://kubernetes.io/), which is an open-source system for automating the management of containerized applications. In this project you will:
* Test your project code using linting
* Complete a Dockerfile to containerize this application
* Deploy your containerized application using Docker and make a prediction
* Improve the log statements in the source code for this application
* Configure Kubernetes and create a Kubernetes cluster
* Deploy a container using Kubernetes and make a prediction
* Upload a complete Github repo with CircleCI to indicate that your code has been tested

You can find a detailed [project rubric, here](https://review.udacity.com/#!/rubrics/2576/view).

**The final implementation of the project will showcase your abilities to operationalize production microservices.**

---

## Setup the Environment

* Create a virtualenv and activate it
* Run `make install` to install the necessary dependencies

### Running `app.py`

1. Standalone:  `python app.py`
2. Run in Docker:  `./run_docker.sh`
3. Run in Kubernetes:  `./run_kubernetes.sh`

### Kubernetes Steps

* Setup and Configure Docker locally
* Setup and Configure Kubernetes locally
* Create Flask app in Container
* Run via kubectl

### Tasks:
1) Complete Dockerfile:
    * Specify python image
    * Create a working directory
    * Copy source code (app.py) to working directory
    * Install packages from requirements.txt (Independencies) (make install)
    * Expose port 2000 (80 not working for me)
    * Run app.py at container launch
    $ make linting
   
    %%% See Screenshot (Task-1) %%
    
    
2) Run a Container & Make a Prediction
    * Build the docker image from the Dockerfile
    * List the created docker images
    * Run the containerized Flask app; publish the container’s port (2000) to a host port (8000).
    
    ** Run the container using the run_docker.sh
    $ ./run_docker.sh
    
    ** After running the container (docker app) we can able to run the prediction using the make_prediction.sh script:
    $ ./make_prediction.sh
    
      %%% See Screenshot (Task-2.1) & (Task-2.2) %%%
    
3) Improve Logging & Save Output
    * Add a prediction log statement in docker_out.sh
    * Run the container and make a prediction to check the logs (./run_docker.sh)
    
    $ docker ps
    
    %%% See Screenshot (Task-3.1) & (Task-3.2) %%%
    
4)  Upload the Docker Image
    * Login to docker hub account
    * Build the docker container with  (docker build --tag=udacity2 .)
    * Define a dockerpath which is <docker_hub_username>/<project_name> e.g: ekram321/Microservices
    * Authenticate and tag image
    * Push your docker image to the dockerpath
    
    $ ./upload_docker.sh
    
     %%% See Screenshot (Task-4) %%%
     
5)  Configure Kubernetes to Run Locally
    * Install minikube && kubectl
     %%% See Screenshot (Task-5.1) & (Task-5.2) %%%

6) Deploy with Kubernetes and Save Output Logs
    * Define a dockerpath which will be <docker_hub_username>/<project_name> (ekram321/microservices)
    * Run docker container with kubectl; (kubectl create deployment udacity2 --image=$dockerpath --port=8000)
    * List kubernetes pods (kubectl get pods)
    * Forward the container port to a host port (kubectl port-forward deployment/udacity2 8000:2000)
    
    & ./run_kubernetes.sh
    
    %%% See Screenshot (Task-6.1) & (Task-6.2) %%%
    
7) Delete Cluster
    * stop the kubernetes cluster with (minikube stop)
    * Delete the kubernetes cluster  (minikube delete)
    %%% See Screenshot (Task-7) %%%
    
8) CircleCI Integration
    * Login to CircleCi account
    * create .circleci/config.yml and configure it
    * Add a status badge using this [![CircleCI](https://circleci.com/gh/EKRAM-MOHAMED/Microservices/tree/master.svg?style=svg)](https://circleci.com/gh/EKRAM-MOHAMED/Microservices/tree/master)
    