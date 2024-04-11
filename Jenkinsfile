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
      
      sh 'docker build -t tomcat:latest .'
     }
   }
  stage ('Docker Push') {
     steps {
      sh 'docker login -u neelima640 -p Peacock@2127'
      sh 'docker tag tomcat:latest neelima640/tomcat:latest'
      sh 'docker push neelima640/tomcat:latest'
     }
   }
  stage ('Removing existing container') {
        when {
                // Skip this stage if the container 'tmct' does not exist
                expression { return sh(script: 'docker ps -a --format "{{.Names}}" | grep -q "tmct"', returnStatus: true) == 0 }
            }
            steps {
                sh 'docker stop tmct || true' // Stop the container if it exists, ignore errors if it doesn't
                sh 'docker rm tmct || true'   // Remove the container if it exists, ignore errors if it doesn't
            }
        }
  
 stage ('Deploy to the container') {
   steps {
     sh 'docker run -d -p 9999:8080 --name tmct tomcat:latest'
  

     
     
   }
 }
  }     
}

