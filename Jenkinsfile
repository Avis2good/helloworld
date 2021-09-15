pipeline {
  agent any
  tools {
    maven 'M2_HOME'
  }
  
    stages { 
      stage ('Build') {
        steps {
          sh 'mvn clean'
          sh 'mvn install'
          sh 'mvn package'
        }
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
                    docker.build("avis2good/blessed")
              }
           }
        }
       
} 
