pipeline {
	agent any
	stages {
		stage("build") {
			steps {
				echo "Building the application"		
				echo "Builing the application" >> /tmp/jenkins.txt
			}
		}
		stage("test") {
			steps {
				echo "Testing the application"		
			}
		}
		
		stage("deploy") {
			steps {
				echo "Deploying the application"		
			}
		}			
	}
}
