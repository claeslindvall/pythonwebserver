pipeline {
    agent { docker { image 'python:3.12.0-alpine3.18' } }
    stages {
        stage('build') {
            steps {
                sh 'python --version'
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

