pipeline {
    agent any
      stages {
        stage('log version info') {
      steps {
        sh 'doceker --version'
        sh 'mvn --version'
      }
    }
  }
}