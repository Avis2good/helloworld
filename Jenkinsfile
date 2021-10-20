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
          archiveArtifacts artifacts: '**/*.war', followSymlinks: false
	}
      }
      stage('Docker Build') {
	when {
	     branch 'main'
	}
      agent any
      steps {
        sh 'docker build -t avis2good/frontend:latest .
      }
    }
    stage('Docker Push') {
	when {
		branch 'main'
	}
      agent any
      steps {
    
    withCredentials([usernamePassword(credentialsId: 'docker_hub_login', passwordVariable: 'docker_hub_loginPassword', usernameVariable: 'docker_hub_loginUser')]) {
          sh "docker login -u ${env.docker_hub_loginUser} -p ${env.docker_hub_loginPassword}"
          sh 'docker push avis2good/frontend:latest'
        }
      }
    }
}
} 
