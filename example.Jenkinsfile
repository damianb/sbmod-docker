#!groovy

pipeline {
  agent {
    docker {
      image 'sbmod-docker'
    }
  }
  environment {
    CI = 'true'
    PAKNAME = 'MyModName.pak'
    ASSET_PATH = '/opt/StarboundAssets/'
    SB_GENPATCH = 'true'
    SB_VALIDATE = 'true'
    SB_CRUSHPNG = 'false'
  }
  options {
    timestamps()
  }
  post {
    success {
      archiveArtifacts 'build/*.pak'
    }
    cleanup {
      cleanWs()
    }
  }
  stages {
    stage('Prepare') {
      steps {
        sh 'mkdir ./build/'
      }
    }
    stage('Build') {
      when {
        environment name: 'SB_GENPATCH', value: 'true'
      }
      steps {
        sh "sbtool genpatch ${env.ASSET_PATH} ./modified/ ./src/"
      }
    }
    stage('Validate') {
      when {
        environment name: 'SB_VALIDATE', value: 'true'
      }
      steps {
        sh 'sbtool checkjson ./src/'
      }
    }
    stage('Compact Image Assets') {
      when {
        environment name: 'SB_CRUSHPNG', value: 'true'
      }
      steps {
        sh 'sbtool pngpack ./src/'
      }
    }
    stage('Pack') {
      steps {
        sh "sbpak pack ./src/ ./build/${env.PAKNAME}"
      }
    }
  }
}
