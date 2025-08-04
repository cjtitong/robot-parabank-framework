pipeline {
    agent any

    tools {
        python 'Python311' // Use the Python tool name defined in Jenkins Global Tool Configuration
    }

    environment {
        PYTHON = 'python' // Jenkins puts the selected Python in PATH, so we can just use 'python'
    }

    stages {
        stage('Check Python Version') {
            steps {
                bat "${env.PYTHON} --version"
            }
        }

        stage('Set Up Virtual Environment') {
            steps {
                bat """
                ${env.PYTHON} -m venv venv
                call venv\\Scripts\\activate
                python -m pip install --upgrade pip
                pip install -r requirements.txt
                """
            }
        }

        stage('Run Robot Tests') {
            steps {
                bat """
                call venv\\Scripts\\activate
                robot -d results tests
                """
            }
        }

        stage('Publish Robot Report') {
            steps {
                robot outputPath: 'results'
            }
        }
    }

    post {
        always {
            archiveArtifacts artifacts: 'results/*.*', allowEmptyArchive: true
        }
    }
}
