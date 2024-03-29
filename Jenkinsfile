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
  }
  
}
