pipeline {
    agent { 
        docker { image 'registry.intraphone.tech/test01/python-server:v3'}
    }
    stages {
        stage('build') {
            steps {
                sh 'python --version'
            }
        }
    }
}

