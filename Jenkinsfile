pipeline {
    agent { dockerfile true }
    stages {
        stage('Test') {
            steps {
                sh '/usr/local/bin/python3 --version'
            }
        }
    }
}
// pipeline {
//     agent any 
//     stages { 
//         stage('Build') {
//             agent {
//                 docker { 
//                     image 'registry.intraphone.tech/test01/python-server:v6'
//                     reuseNode true
//                 }
//             }
//             steps {
//                 sh 'echo "Jepp"' 
//             }
//         }
//         stage('Front-end') {
//             agent {
//                 docker { image 'node:20.9.0-alpine3.18' }
//             }
//             steps {
//                 sh 'node --version'
//             }
//         }        
//     }
// }


// stage('BuildInside') {
//          docker.image('ubuntu1804').withRun('-d=true -p 8888:8080') {c ->
//             docker.image('ubuntu1804').inside{
//                /*  Do something here inside container  */
//                sh "ls"
//             }
//         }
//   }
