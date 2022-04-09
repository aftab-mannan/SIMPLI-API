pipeline {
    agent any
      stages {
        stage('log version info') {
      steps {
        sh 'docker --version'
        sh 'docker-compose up'
      }
    }
    stage('Generate HTML report') {
       steps {
        cucumber buildStatus: 'UNSTABLE',
                reportTitle: 'My report',
                fileIncludePattern: '**/*.json',
                trendsLimit: 10,
                classifications: [
                    [
                        'key': 'Browser',
                        'value': 'Firefox'
                    ]
                ]
    }
    }
  }
}