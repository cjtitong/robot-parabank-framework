pipeline {
    agent any

    environment {
        VENV_DIR = 'venv'
        PYTHON = 'python' // Use full path like 'C:\\Python311\\python.exe' if needed
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
                ${env.PYTHON} -m venv ${env.VENV_DIR}
                call ${env.VENV_DIR}\\Scripts\\activate
                ${env.VENV_DIR}\\Scripts\\python.exe -m pip install --upgrade pip
                ${env.VENV_DIR}\\Scripts\\pip.exe install -r requirements.txt
                """
            }
        }

        stage('Run Robot Tests') {
            steps {
                bat """
                call ${env.VENV_DIR}\\Scripts\\activate
                ${env.VENV_DIR}\\Scripts\\robot -d results tests
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
