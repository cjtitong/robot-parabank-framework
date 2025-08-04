pipeline {
    agent any

    environment {
        VENV_DIR = 'venv'
    }

    stages {
        stage('Preparation') {
            steps {
                echo 'Cloning repo or accessing project directory'
                // Uncomment below if this pipeline is triggered from a Git repo
                // git 'https://your.git.repo.url/robot-parabankparasoft-framework.git'
            }
        }

        stage('Set Up Environment') {
            steps {
                sh '''
                python -m venv venv
                . venv/bin/activate
                pip install --upgrade pip
                pip install -r requirements.txt
                '''
            }
        }

        stage('Run Robot Tests') {
            steps {
                sh '''
                . venv/bin/activate
                robot -d results tests
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
            archiveArtifacts artifacts: 'results/*.*', allowEmptyArchive: true
        }
    }
}
