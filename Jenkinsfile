pipeline {
  agent any
  tools {
    maven 'M2_HOME
  }
  
    stages { 
      stage ('Build') {
        steps {
          sh 'mvn clean'
          sh 'mvn maven'
          sh 'mvn package'
        }
     }
      stage ('test') {
        steps {
          sh 'mvn test'
        }
     }
      stage ('Staging') {
        steps {
          echo "build step"
          sleep 10
        }
     }
      stage ('Deploy') {
        steps {
          echo "build step"
          sleep 10
        }
     }
  }
}
