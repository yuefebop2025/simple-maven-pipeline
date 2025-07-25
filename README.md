# simple-maven-app 9CICD pipeline)

## Jenkins-server
Create an Amazon Linux 2 VM instance and call it "jenkins-server"
Instance type: t2.medium
Security Group (Open): 8080 and 22 to 0.0.0.0/0
Key pair: Select or create a new keypair
give an IAM role permission giving full access or customise the permission
User data (Copy the following user data)
## Project structure 
simple-maven-app/
├── Jenkinsfile
├── pom.xml
└── src/
    ├── main/
    │   └── java/
    │       └── com/example/App.java
    └── test/
        └── java/
            └── com/example/AppTest.java



## 🚀 Jenkins Setup Steps (From Dashboard)
Now that you are logged into Jenkins on AWS and at the Dashboard, follow these steps:

## ✅ STEP 1: Create a New Job
Click "New Item" from the left sidebar.

Enter: simple-maven-pipeline

Select: Pipeline

Click OK

## ✅ STEP 2: Configure the Pipeline
Scroll down to the Pipeline section.

In Definition, select Pipeline script from SCM

Choose Git

In the Repository URL, enter your GitHub repo (e.g. https://github.com/your-username/simple-maven-app.git)

Set Branch: main or master (depending on your repo)

Script Path: Jenkinsfile (default)

Click Save

## ✅ STEP 3: Install Maven in Jenkins (if not installed)
If Maven is not already installed on your Jenkins server:

Go to Manage Jenkins → Global Tool Configuration

Scroll to Maven

Click Add Maven

Name: Maven 3

Uncheck “Install automatically” if you installed Maven manually via terminal (check with mvn -v)

Save

## ✅ STEP 4: Run the Pipeline
Go back to Dashboard → simple-maven-pipeline

Click Build Now

## ✅ STEP 5: See Results
You’ll see stages: Checkout → Build → Test → Package

Click on a build (#1, #2...) → Console Output to see logs

