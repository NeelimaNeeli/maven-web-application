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
      
      sh 'docker build -t tomcat:9.0 .'
     }
   }
  stage ('Docker Push') {
     steps {
      sh 'docker login -u neelima640 -p Peacock@2127'
      sh 'docker tag tomcat:9.0 neelima640/tomcat:9.0'
      sh 'docker push neelima640/tomcat:9.0'
     }
   }
  stage ('Removing existing container') {
        when {
                // Skip this stage if the container 'maven' does not exist
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
     sh 'docker cp /home/neelima/maven-web-application/target/maven-web-application.war 
     
   }
 }
  }     
}

