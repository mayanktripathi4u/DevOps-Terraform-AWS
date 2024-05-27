# Project Details
In this project we will be using Github Actions; Terraform; Docker and AWS.

The aim of this sample project is to deploy a Application to Amazon EC2 and for this we will provision EC2 instance using Terraform and weill deploy the application using Docker on that EC2 instance.

# Steps 
1. Create a Application / Sample Application.
This is just a sample application to print "Server is Up and Running, and on Server ....".
We will build the application in Python and Flask.

Now that our flask application is running and giving us the expected output, let us dockerise it.

2. Dockerize Flask application
 What is Docker? 
 As per [Docker](https://www.docker.com/resources/what-container/) Docs
    A container is a standard unit of software that packages up code and all its dependencies so the application runs quickly and reliably from one computing environment to another. A Docker container image is a lightweight, standalone, executable package of software that includes everything needed to run an application

Technically, docker containers are an abstraction layer on top of your application. In our case the flask application. 
So what all do we need to run our flask application error-free on different environments? 
The answer is simple, we just need below 

* Python.
* Flask library.
* requirements.txt file.

Well, that is all we need. Let’s say you want your flask app to be shipped and run elsewhere on your peer’s machine all we need is a python environment with flask installed in it. That’s exactly the problem Docker solves.

You don’t have to provide your dependent libraries or a README document to your peer to get started with your flask app. All he/she needs is a docker environment to run your app and access to the repository where your app is hosted. We will use the dockerhub to host the flask app. However, most of the organisations use JFrog artifactory as well to host their internal docker images.

## DockerFile Line-by-Line explanation
    * Import python from dockerhub.
    * Create a working directory app.
    * Copy the requirements.txt file inside the app directory.
    * Install all the dependencies from the requirements.txt file.
    * Copy the entire app project into the app directory.
    * We expose port 5000 as the app will run on port 5000.
    * Define the FLASK_APP environment variable. Else the interpreter may complain it’s unable to find the variable
    * Finally, type in the run command which is flask run --host 0.0.0.0. This is to ensure the server accepts requests from all hosts.

## Building docker images
Now that we have our Dockerfile ready, we will build the docker image. Please ensure that your docker desktop is running. Else you may get the error.

Command:    
    (docker-env) % docker build -t myflaskapp .

    docker push <username>/<reponame>:tagname

    docker push dinesh/myflaskapp:mytag

Please notice the period at the end of the command.

