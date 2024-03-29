pipeline {
  agent any 
  stages {
    stage('maven build') {
      steps {
      sh '/opt/maven/bin/mvn clean install'
      }
    }
  }
}
