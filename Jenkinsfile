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
      stage ('test') {
        steps {
          sh 'mvn test'
        }
     }
      stage ('Build Image') {
        steps {
          script {
                    app = docker.build("avis2good/blessed")
                    app.inside {
                        sh 'echo $(curl localhost:8080)'
              }
           }
        }
      } 
       stage ('Push docker image') {
        steps {
          script {
                    docker.withRegistry('https://registry.hub.docker.com', 'docker_hub_login') {
                        app.push("${env.BUILD_NUMBER}")
                        app.push("latest")
                    }
                }
        }
      } 
  }
}
