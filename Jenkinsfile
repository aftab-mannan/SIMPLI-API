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
        // cucumber buildStatus: 'UNSTABLE',
        //         reportTitle: 'My report',
        //         fileIncludePattern: '**/*.json',
        //         trendsLimit: 10,
        //         classifications: [
        //             [
        //                 'key': 'Browser',
        //                 'value': 'Firefox'
        //             ]
        //         ]

        publishHTML (target: [
      allowMissing: false,
      alwaysLinkToLastBuild: false,
      keepAll: true,
      reportDir: 'target/cucumber-html-reports',
      reportFiles: 'overview-features.html',
      reportName: "RCov Report"
    ])
    }
    }
  }
}