pipeline {
  agent any
  tools {
    maven 'M3'
  }
  environment {
    DOCKER_IMAGE_NAME = "avis2good/blessed"

}
  
    stages { 
      stage ('Build') {
        steps {
          sh 'mvn clean'
          sh 'mvn install'
          sh 'mvn package'
        }
     }
   
      stage ('test') {
        steps {
          sh 'mvn test'
        }
     }
      stage ('Build Image') {
        steps {
          script {
                    app = docker.build(DOCKER_IMAGE_NAME)
              }
           }
        }
      stage('Push Image') {
        steps {    
          script {
     docker.withRegistry('https://registry.hub.docker.com', 'docker_hub_login') {
                        app.push("${env.BUILD_NUMBER}")
                        app.push("latest")
     
      }
    }
  }
}
       stage('Remove Unused docker image') {
         steps {
        sh "docker rmi $registry:$BUILD_NUMBER"
      }
    }
}
} 
