pipeline {
  agent any
  tools {
    maven 'M3'
  }
  environment {
    registry = "avis2good/blessed"
    registryCredential = 'docker_hub_login'
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
                    docker.build registry + ":$BUILD_NUMBER"
              }
           }
        }
      stage('Deploy Image') {
        steps {    
          script {
      docker.withRegistry( '', registryCredential ) 
            {
        dockerImage.push()
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
