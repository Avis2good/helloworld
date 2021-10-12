pipeline {
  agent any
  tools {
    maven 'M2_HOME'
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
          sh 'mvn -Dmaven.test.failure.ignore=true install' 
            }
            post {
                success {
                    junit 'target/surefire-reports/**/*.xml' 
        }
     }
      stage('Docker Build') {
      agent any
      steps {
        sh 'docker build -t avis2good/blessed:latest .'
      }
    }
    stage('Docker Push') {
      agent any
      steps {
        withCredentials([usernamePassword(credentialsId: 'docker_hub_login', passwordVariable: 'docker_hub_loginPassword', usernameVariable: 'docker_hub_loginUser')]) {
          sh "docker login -u ${env.docker_hub_loginUser} -p ${env.docker_hub_loginPassword}"
          sh 'docker push avis2good/blessed:latest'
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
