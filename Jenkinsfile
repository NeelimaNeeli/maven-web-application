pipeline {
  agent any 
  stages {
    stage('maven build') {
      steps {
       sh '/opt/maven/bin/mvn clean install'
      }
    }
   stage ('Image Building') {
     steps {
      sh 'sudo chmod 777 /var/run/docker.sock'
      sh 'docker build -t maven:latest .'
     }
   }
  stage ('Docker Push') {
     steps {
      sh 'docker login -u neelima640 -p Peacock@2127'
      sh 'docker tag maven:latest neelima640/maven:latest'
      sh 'docker push neelima640/maven:latest'
     }
   }
  stage ('Removing existing container') {
        when {
                // Skip this stage if the container 'sathvika' does not exist
                expression { return sh(script: 'docker ps -a --format "{{.Names}}" | grep -q "maven"', returnStatus: true) == 0 }
            }
            steps {
                sh 'docker stop maven || true' // Stop the container if it exists, ignore errors if it doesn't
                sh 'docker rm maven || true'   // Remove the container if it exists, ignore errors if it doesn't
            }
        }
  
 stage ('Deploy to the container') {
   steps {
     sh 'docker run -d -p 9999:8080 tomcat:9.0 --name=maven'
     
   }
 }
  }     
}

