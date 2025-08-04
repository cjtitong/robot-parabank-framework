pipeline {
    agent any

    environment {
        // Use double backslashes or a single forward slash
        PYTHON_HOME = 'C:/Users/Code Byte/AppData/Local/Programs/Python/Python311'
        PATH = "${PYTHON_HOME}/Scripts;${PYTHON_HOME};${env.PATH}"
    }

    stages {
        stage('Check Python version') {
            steps {
                bat 'python --version'
            }
        }

        stage('Install dependencies') {
            steps {
                bat 'pip install --upgrade pip'
                bat 'pip install -r requirements.txt'
            }
        }

        stage('Run Robot Tests') {
            steps {
                bat 'robot tests/ui'
            }
        }
    }
}
