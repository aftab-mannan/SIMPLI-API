pipeline {
    agent any
      stages {
        stage('log version info') {
      steps {
        sh 'docker --version'
        sh 'mvn --version'
      }
    }
  }
}