pipeline {
    agent { 
        docker { image 'registry.intraphone.tech/test01/python-server:v6'}
    }
    stages {
        stage('build') {
            steps {
                //sh '/usr/bin/python3 --version'
                sh '/usr/bin/python3 /server.py '
            }
        }
    }
}

