pipeline {
    agent any

    environment {
        VENV_DIR = 'venv'
    }

    stages {
        stage('Preparation') {
            steps {
                echo 'Cloning repo or accessing project directory'
                // git checkout already happens from SCM config
            }
        }

        stage('Set Up Environment') {
            steps {
                bat '''
                python -m venv venv
                call venv\\Scripts\\activate
                pip install --upgrade pip
                pip install -r requirements.txt
                '''
            }
        }

        stage('Run Robot Tests') {
            steps {
                bat '''
                call venv\\Scripts\\activate
                robot -d results tests\\ui
                '''
            }
        }

        stage('Publish Report') {
            steps {
                robot outputPath: 'results'
            }
        }
    }

    post {
        always {
            archiveArtifacts artifacts: 'results\\*.*', allowEmptyArchive: true
        }
    }
}
