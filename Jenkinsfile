pipeline {
    agent { 
        docker { image 'registry.intraphone.tech/test01/python-server:v6'}
    }
    stages {
        stage('build') {
            steps {
                //sh '/usr/bin/python3 --version'
                sh '/usr/bin/python3 /server.py &&' 
                // sh 'echo "Jepp"'
            }
        }
    }
}


// stage('BuildInside') {
//          docker.image('ubuntu1804').withRun('-d=true -p 8888:8080') {c ->
//             docker.image('ubuntu1804').inside{
//                /*  Do something here inside container  */
//                sh "ls"
//             }
//         }
//   }
