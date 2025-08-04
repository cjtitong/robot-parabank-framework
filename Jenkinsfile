pipeline {
    agent any

    environment {
        PYTHON_HOME = tool name: 'Python311', type: 'hudson.plugins.python.PythonInstallation'
        PATH = "${env.PYTHON_HOME};${env.PYTHON_HOME}\\Scripts;${env.PATH}"
    }

    stages {
        stage('Setup Python') {
            steps {
                echo "Using Python at: ${env.PYTHON_HOME}"
                bat 'python --version'
            }
        }

        stage('Install Dependencies') {
            steps {
                bat 'python -m pip install --upgrade pip'
                bat 'pip install -r requirements.txt'
            }
        }

        stage('Run Robot Tests') {
            steps {
                bat 'robot tests/ui'
            }
        }
    }

    post {
        always {
            archiveArtifacts artifacts: '**/output.xml', allowEmptyArchive: true
        }
    }
}
