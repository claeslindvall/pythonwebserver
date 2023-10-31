pipeline {
    agent { dockerfile true }
    stages {
        stage('build') {
            steps {
                sh 'python --version'
            }
        }

	#stage("test") {
	#	steps {
	#		echo "Testing the application"		
	#	}
	#}
	
	#stage("deploy") {
	#	steps {
	#		echo "Deploying the application"		
	#	}
	#}			
    }
}

