# Reactjs-E-commerce-Application-Deployment
Sure! Here's an example of a README file that explains the project, how to deploy and run the React application, and how to build Docker images:

---

# **React Application Deployment with Docker, Jenkins, and AWS**

## **Project Overview**

This project is a React application that demonstrates how to deploy a production-ready web app using Docker, Jenkins, and AWS. The app is built and deployed using the following technologies:

- **React** for the frontend
- **Docker** for containerization
- **Jenkins** for Continuous Integration/Continuous Deployment (CI/CD)
- **AWS EC2** for deployment
- **Docker Hub** for image storage
- **Prometheus/Grafana** for monitoring

The objective is to set up the entire pipeline for building, pushing, and deploying the application automatically using Jenkins, with separate Docker images for development and production environments.

## **Technologies Used**

- **React**: Frontend application.
- **Docker**: Containerization for deploying the app in different environments.
- **Jenkins**: For automating the build, push, and deploy processes.
- **AWS EC2**: For deploying the app on a cloud server.
- **Prometheus/Grafana**: For monitoring the health of the app.
- **Docker Hub**: For storing and managing Docker images.

## **Steps to Run the Project Locally**

### **1. Clone the Repository**

 
```

### **2. Install Dependencies**

Make sure you have `Docker` and `Docker Compose` installed on your machine.

If not, install them by following the instructions from the official Docker website.

### **3. Dockerize the React Application**

To run the application using Docker, we need to build a Docker image using the provided `Dockerfile`.

The `Dockerfile` is set up to:
- Use a Node.js image to build the React app.
- Install dependencies.
- Build the React app using `npm run build`.
- Use a lightweight server to serve the built app.

### **4. Build the Docker Image**

Run the following command to build the Docker image:

```bash
docker build -t react-app .
```

This will build the image with the name `react-app`.

### **5. Run the Docker Container**

Once the Docker image is built, you can run the application in a container with the following command:

```bash
docker run -p 80:80 react-app
```

This will start the React app on port 80. You can access it by navigating to `http://localhost` in your browser.

---

## **Steps to Deploy on AWS EC2**

### **1. Launch EC2 Instance**

- Go to the [AWS EC2 Console](https://aws.amazon.com/ec2/) and launch an EC2 instance (preferably `t2.micro` for free-tier).
- Use the Amazon Linux 2 AMI.
- Configure security groups:
  - Allow inbound HTTP traffic on port 80 from any IP.
  - Allow SSH traffic only from your IP address.

### **2. SSH into EC2 Instance**

After the instance is running, SSH into the EC2 instance using your private key:

```bash
ssh -i <your-key.pem> ec2-user@<your-ec2-ip>
```

### **3. Install Docker on EC2**

Once you're logged into the EC2 instance, run the following commands to install Docker:

```bash
sudo yum update -y
sudo amazon-linux-extras install docker
sudo service docker start
sudo usermod -a -G docker ec2-user
```

### **4. Install Docker Compose on EC2**

Install Docker Compose to manage multi-container Docker applications:

```bash
sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
```

### **5. Deploy the Application**

Upload your project files to the EC2 instance using `scp` or any other file transfer method.

Then, run the following command to start the application with Docker Compose:

```bash
docker-compose up -d
```

This will start the React application on the EC2 instance and you can access it through `http://<your-ec2-ip>`.

---

## **Docker Hub Integration**

### **1. Docker Hub Repositories**

Create two repositories on Docker Hub:
- **dev** (public)
- **prod** (private)

### **2. Build Docker Images for Both Repos**

Build and push the Docker images to Docker Hub:
- For the **dev** repository:
  
  ```bash
  docker build -t <your-dockerhub-username>/dev:latest .
  docker push <your-dockerhub-username>/dev:latest
  ```

- For the **prod** repository:

  ```bash
  docker build -t <your-dockerhub-username>/prod:latest .
  docker push <your-dockerhub-username>/prod:latest
  ```

### **3. Docker Compose with Docker Hub**


## **Jenkins CI/CD Setup**

### **1. Create Jenkins Pipeline**

Set up Jenkins with the following steps:
- Install Jenkins on your local machine or EC2.
- Set up Jenkins to connect to your GitHub repository.
- Create a Jenkins pipeline to:
  - Trigger builds on `dev` and `master` branch updates.
  - Build and push Docker images to Docker Hub for `dev` and `prod`.

### **2. Auto Build Trigger**

- Set up webhook integration in GitHub to trigger Jenkins builds when changes are pushed to the `dev` or `master` branch.

---

## **Monitoring (Prometheus/Grafana)**

### **1. Install Prometheus & Grafana**

Set up Prometheus to monitor the health of the application and Grafana to visualize the metrics.

### **2. Monitoring Health**

Configure Prometheus to track the health of the Docker containers and application status. Grafana can be used to visualize the application metrics and set up alerts if the application goes down.

---

## **Conclusion**

This project demonstrates how to set up a full CI/CD pipeline using Jenkins, Docker, and AWS. The app is automatically built, pushed, and deployed with Jenkins, and the deployment is monitored using Prometheus and Grafana.

For any questions or issues, feel free to open an issue in the repository.

--- 
