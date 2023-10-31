pipeline {
    agent { 
        docker { image 'registry.intraphone.tech/test01/python-server:v6'}
    }
    stages {
        stage('build') {
            steps {
                sh '/usr/bin/python3 --version'
            }
        }
        stage('test') {
            steps {
                sh 'echo "Testing again"'
                sh '/usr/bin/python3 --version'
            }
        }        
    }
}

