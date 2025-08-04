pipeline {
    agent any

    environment {
        PYTHONPATH = "C:/Users/Code Byte/AppData/Local/Programs/Python/Python311"
        PATH = "${env.PYTHONPATH};${env.PYTHONPATH}/Scripts;${env.PATH}"
    }

    stages {
        stage('Check Python version') {
            steps {
                bat 'python --version'
            }
        }

        stage('Upgrade pip') {
            steps {
                bat 'python -m pip install --upgrade pip'
            }
        }

        stage('Install dependencies') {
            steps {
                bat 'pip install -r requirements.txt || echo No requirements.txt found'
            }
        }

        stage('Run Robot Tests') {
            steps {
                bat 'robot tests'
            }
        }
    }
}
