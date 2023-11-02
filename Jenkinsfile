pipeline {
  agent {
    label 'agent01'
  }
  stages {
    stage('Compiling ...') {
      steps {
        echo 'Compiling some stuff here ... like mvn compile'
      }
    }

    stage('Check syntax') {
      steps {
        echo 'Check syntax | syntaxcheck'
      }
    }

    stage('Test software') {
      steps {
        echo 'Running tests ...'
      }
    }

    stage('Build a docker image') {
      agent {
        dockerfile true
      }
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
      parallel {
        stage('Cleaning up the images from Jenkins server') {
          steps {
            sh "docker rmi $registry:$BUILD_NUMBER"
          }
        }
      }
    }

    // withKubeConfig([credentialsId: 'user1', serverUrl: 'https://api.k8s.my-company.com']) {
    stage('Deploy to Kubernetes') {
        steps {
            script {
                withKubernetes([k8scred]:'clalin', serverUrl: 'https://192.168.12.224:16443') {
                    sh 'kubectl apply -f nginx_deployment.yaml'
                }
            }
        }

    }

    // stage('Deploy to Cluster') {
    //   steps {
    //     sh " envsubst < $WORKSPACE/nginx_deployment.yaml | /snap/bin/kubectl -f -"
    //   }
    // }

  }
  environment {
    registry = 'registry.intraphone.tech/test01/python-server'
  }
}
