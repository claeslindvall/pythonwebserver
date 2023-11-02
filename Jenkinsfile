pipeline {
    agent { label 'agent01'}
    // agent any
    environment {
        registry = "registry.intraphone.tech/test01/python-server"
        //registryCredential = 'dockerhub'
    }

    stages {

    //     stage('Cloning git repo') {
    //         steps {
    //             git branch: 'main', url: 'https://github.com/claeslindvall/pythonwebserver.git'
    //         }
    //     }

        stage('Compiling ...') {
            steps {
                echo "Compiling some stuff here ... like mvn compile"
            }
        }

        stage('Check syntax') {
            steps {
                echo "Check syntax | syntaxcheck"
            }
        }

        stage('Test software') {
            steps {
                echo "Running tests ..."
            }
        }

        stage('Build a docker image') {
            agent { dockerfile true }
            steps {
                sh '/usr/bin/python3 --version'
            }
        }

        stage('Name and push the Image to registry') {
            steps {
                script {
                    docker.withRegistry('https://registry.intraphone.tech', 'Jenkins') {
                        def newImage = docker.build registry + ":$BUILD_NUMBER"
                        newImage.push()
                    }
                }
            }   
        }


        stage('Cleaning up the images from Jenkins server') {
            steps {
                sh "docker rmi $registry:$BUILD_NUMBER"
            }
        }

        stage('Deploy to Cluster') {
            steps {
                sh " envsubst < $WORKSPACE/nginx_deployment.yaml | kubectl -f -"
            }

        }

        // Fung ej pga att plugin är depricated
        // stage('Deploying nginx to Kubernetes') {
        //     steps {
        //         script {
        //             kubernetesDeploy(configs: "nginx_deployment.yaml")
        //         }
        //     }
        // }        

    }
}
// pipeline {
//     agent any //{ label 'agent01' } 
//     stages { 
//         stage('Build') {
//             steps {
//                 script {
//                     img = docker.build("registry.intraphone.tech/test01/python-server:v6")
//                     //img.inside("--entrypoint=/usr/bin/python3 /server.py") {
//                     //     sh "uname -a"
//                     // }
//                 }
//             }
        
//         }
//     }
// }

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
//         stage('Front-end2') {
//             agent {
//                 docker { image 'node:20.9.0-alpine3.17' }
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
