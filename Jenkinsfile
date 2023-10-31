pipeline {
    agent { 
        docker { image 'registry.intraphone.tech/test01/python-server:v4'}
    }
    stages {
        stage('build') {
            steps {
                sh 'python --version'
            }
        }
    }
}

