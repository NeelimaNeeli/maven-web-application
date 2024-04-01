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
 stage ('Deploy to the container') {
   steps {
     sh 'docker run -d -p 8888:8080 tomcat:9.0'
   }
 }
  }     
}

