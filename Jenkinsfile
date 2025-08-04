pipeline {
    agent any

    environment {
        ROBOT_OPTIONS = '--outputdir reports'
    }

    stages {
        stage('Setup Python') {
            steps {
                script {
                    def pythonHome = tool name: 'Python311', type: 'jenkins.plugins.shiningpanda.tools.PythonInstallation'
                    env.PATH = "${pythonHome}\\Scripts;${pythonHome};${env.PATH}"
                }
            }
        }

        stage('Install Dependencies') {
            steps {
                bat 'pip install --upgrade pip'
                bat 'pip install -r requirements.txt'
            }
        }

        stage('Run Robot Tests') {
            steps {
                bat 'robot %ROBOT_OPTIONS% tests/'
            }
        }
    }

    post {
        always {
            archiveArtifacts artifacts: 'reports/**', fingerprint: true
        }
    }
}
