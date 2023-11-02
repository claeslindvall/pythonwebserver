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

        stage('Test02') {
          steps {
            kubeconfig(serverUrl: 'https://192.168.12.224:16443', credentialsId: 'k8scred', caCertificate: '-----BEGIN CERTIFICATE----- MIIDDzCCAfegAwIBAgIUMkKIsXfRk2D4EhU2KoCJ83pNDzUwDQYJKoZIhvcNAQEL BQAwFzEVMBMGA1UEAwwMMTAuMTUyLjE4My4xMB4XDTIzMTEwMjA5MTg0MVoXDTMz MTAzMDA5MTg0MVowFzEVMBMGA1UEAwwMMTAuMTUyLjE4My4xMIIBIjANBgkqhkiG 9w0BAQEFAAOCAQ8AMIIBCgKCAQEA7RfvapWZ2L0SQvXN91vqstOJNt20//lkfFNm tjJN+Cc0y2dy6q7JjtPr6exk3I6ByUbTlfGAvHbxiYXS0otMlDrYwixGbeAWdLR+ qakjjctZztkGrx+XXZeS0GNjAtVA5cOJvY1wiwPNPBu9KG83VtzUMt+GFj/MOUQL myV7lItJRVVl7zng2qoco9u9aR4xdIlUDod9aTFbutBaYkaQOWHqWqerMooONoos YHP6KdVYIV4L0OU0x7V4qN138XcjnWuocarAiWnw1HlEEj4g6OhVlHXo4D7FzhFV +M6U/awoPU7i6UKDUQj1EWZFm0hp4OvQTeCd2oznGcg1FIe3HwIDAQABo1MwUTAd BgNVHQ4EFgQUR6bP8Dmoc/ZnNffA1gdkREZUEJYwHwYDVR0jBBgwFoAUR6bP8Dmo c/ZnNffA1gdkREZUEJYwDwYDVR0TAQH/BAUwAwEB/zANBgkqhkiG9w0BAQsFAAOC AQEAk3TzbYMiqemmVWSTDpF5QA65XG0pkOls0nLKWNxY+NvfBJ+g6OkKFjRmxuHO BQf56M8FRP/k7VncDdiIuURpEnW0rJqCGteBW+++fBsaf9a66EyLdmMrozl3ckFb de1MPSTv6NrhWM/+/W5gojDiFSyVw09SvMRPe4xAOqTSAXlh3BuXz3m0ex0lAswa w3+6qxqdMHGb9CFOE5A56xQFZvniBKf2px7d9RtUrCqohpEYe3xFv4qyvCTGXGBD 6sTk4A7JMZzah0EDovI3JR3rfx/Ec0w8GI/3XNyNJiT03wK3yFntti/YJcx5Xe9U sLFJCOt5Wjt1i1W+OMPHc4LPOQ== -----END CERTIFICATE-----') {
              withKubeConfig(caCertificate: '-----BEGIN CERTIFICATE----- MIIDDzCCAfegAwIBAgIUMkKIsXfRk2D4EhU2KoCJ83pNDzUwDQYJKoZIhvcNAQEL BQAwFzEVMBMGA1UEAwwMMTAuMTUyLjE4My4xMB4XDTIzMTEwMjA5MTg0MVoXDTMz MTAzMDA5MTg0MVowFzEVMBMGA1UEAwwMMTAuMTUyLjE4My4xMIIBIjANBgkqhkiG 9w0BAQEFAAOCAQ8AMIIBCgKCAQEA7RfvapWZ2L0SQvXN91vqstOJNt20//lkfFNm tjJN+Cc0y2dy6q7JjtPr6exk3I6ByUbTlfGAvHbxiYXS0otMlDrYwixGbeAWdLR+ qakjjctZztkGrx+XXZeS0GNjAtVA5cOJvY1wiwPNPBu9KG83VtzUMt+GFj/MOUQL myV7lItJRVVl7zng2qoco9u9aR4xdIlUDod9aTFbutBaYkaQOWHqWqerMooONoos YHP6KdVYIV4L0OU0x7V4qN138XcjnWuocarAiWnw1HlEEj4g6OhVlHXo4D7FzhFV +M6U/awoPU7i6UKDUQj1EWZFm0hp4OvQTeCd2oznGcg1FIe3HwIDAQABo1MwUTAd BgNVHQ4EFgQUR6bP8Dmoc/ZnNffA1gdkREZUEJYwHwYDVR0jBBgwFoAUR6bP8Dmo c/ZnNffA1gdkREZUEJYwDwYDVR0TAQH/BAUwAwEB/zANBgkqhkiG9w0BAQsFAAOC AQEAk3TzbYMiqemmVWSTDpF5QA65XG0pkOls0nLKWNxY+NvfBJ+g6OkKFjRmxuHO BQf56M8FRP/k7VncDdiIuURpEnW0rJqCGteBW+++fBsaf9a66EyLdmMrozl3ckFb de1MPSTv6NrhWM/+/W5gojDiFSyVw09SvMRPe4xAOqTSAXlh3BuXz3m0ex0lAswa w3+6qxqdMHGb9CFOE5A56xQFZvniBKf2px7d9RtUrCqohpEYe3xFv4qyvCTGXGBD 6sTk4A7JMZzah0EDovI3JR3rfx/Ec0w8GI/3XNyNJiT03wK3yFntti/YJcx5Xe9U sLFJCOt5Wjt1i1W+OMPHc4LPOQ== -----END CERTIFICATE-----', clusterName: 'microk8s-cluster', credentialsId: 'k8scred', namespace: 'default', serverUrl: 'https://192.168.12.224:16443')
            }

          }
        }

      }
    }

    stage('Deploy to Cluster') {
      steps {
        sh " envsubst < $WORKSPACE/nginx_deployment.yaml | /snap/bin/kubectl -f -"
      }
    }

  }
  environment {
    registry = 'registry.intraphone.tech/test01/python-server'
  }
}