# simple-maven-app CICD pipeline)

## Architecture diagram

<img width="214" height="214" alt="Image" src="https://github.com/user-attachments/assets/dcef1664-1326-4cdd-be45-d2de45b10387" />


## Jenkins-server
Create an Amazon Linux 2 VM instance and call it "jenkins-server"
Instance type: t2.medium
Security Group (Open): 8080 and 22 to 0.0.0.0/0
Key pair: Select or create a new keypair
storage 50 GiB
give an IAM role permission giving full access or customise the permission
User data (Copy the following user data)https://github.com/kingakwa/simple-maven-app/blob/main/jenkins-server-install.sh

-click `lauch instance`

## 🔐 SSH into EC2 (after launch)
`ssh -i /path/to/your-key.pem ec2-user@<public-ip>`

## 🌐 Access Jenkins UI
`http://<EC2-Public-IP>:8080`

## Retrieve the initial admin password:
-copy the path on the jenkins server in red, then retrieve on the terminal by typing 
`sudo cat /var/jenkins_home/secrets/initialAdminPassword`

<img width="739" height="385" alt="Image" src="https://github.com/user-attachments/assets/aacd566d-5ba9-49e0-9e2d-2f8354c5a8bf" />

-Paste the password into the Jenkins UI and continue with setup

<img width="437" height="136" alt="Image" src="https://github.com/user-attachments/assets/17ce361c-22fe-4d29-bee8-9a64207d2750" />

## 🛠️ Post-Setup Tips
Install recommended plugins.
Create your first admin user.
Save backup snapshots or AMIs after setup.


## Project structure 
```
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
```


## 🚀 Jenkins Setup Steps (From Dashboard)
Now that you are logged into Jenkins on AWS and at the Dashboard, follow these steps:

✅ PART 1: Jenkins Plugins to Install Before Pipeline Setup
Before you start building Maven pipelines, it’s essential to install a few key Jenkins plugins:


## 🔧 Recommended Plugins:
```
Plugin Name          	             Purpose
-Pipeline:stage view	             Enables creating Jenkins pipelines using Jenkinsfile.
-Git push        	                 Allows Jenkins to clone Git repositories.
-GitHub intergration                 Integrates Jenkins with GitHub repositories.
-Maven Integration	                 Allows Jenkins to build Maven projects.
-JUnit Realtime test reporter        Provides test result visualization for Maven unit tests.
-Blue Ocean (optional)	              Modern UI for Jenkins Pipelines.
```

## 🔨 How to Install Plugins:
- Go to Jenkins Dashboard
- Click `Manage Jenkins`
-Click `Manage Plugins`
-Go to `Available` tab
-Search for each plugin above and check them
-Click `Install` without restart
-After installing, `restart` Jenkins if prompted.

<img width="909" height="421" alt="Image" src="https://github.com/user-attachments/assets/684655d2-855b-4abf-81cc-9791d2d90367" />

## ✅ STEP 1: Create a New Job
-Click "New Item" from the left sidebar.
-Enter: simple-maven-pipeline
-Select: `Pipeline`
-Click OK

## ✅ STEP 2: Configure the Pipeline
-Scroll down to the Pipeline section.
-In Definition, `select Pipeline script from SCM`
Choose `Git`

In the Repository URL, enter your GitHub repo (e.g. `https://github.com/kingakwa/simple-maven-app.git`)

Set Branch: main or master (depending on your repo)

Script Path: Jenkinsfile (default)
Click `Save`

## ✅ STEP 3: Install Maven in Jenkins (if not installed)
-If Maven is not already installed on your Jenkins server:
-Go to Manage Jenkins → Global Tool Configuration
-Scroll to Maven
-Click `Add Maven`
Name: `Maven 3       # this name should reflect in the jenkinsfile`

Uncheck “Install automatically” if you installed Maven manually via terminal (check with mvn -v)
click `Save`

## ✅ STEP 4: Run the Pipeline
Go back to Dashboard → `simple-maven-pipeline`

Click `Build Now`

## ✅ STEP 5: See Results
You’ll see stages: Checkout → Build → Test → Package

Click on a build (#1, #2...) → Console Output to see logs

