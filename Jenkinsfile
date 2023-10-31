pipeline {
    agent { 
        docker { image 'registry.intraphone.tech/test01/python-server:v6'}
    }
    stages {
        stage('build') {
            steps {
                sh 'python3 --version'
            }
        }
        stage('test') {
            steps {
                sh 'echo "Testing again"'
                sh 'python3 --version'
            }
        }        
    }
}

