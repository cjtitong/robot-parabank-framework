pipeline {
    agent any

    environment {
        // This will be set in the 'Setup Python' stage
        PATH = ""
    }

    stages {
        stage('Setup Python') {
            steps {
                script {
                    // Use Python311 configured in Jenkins > Global Tool Configuration
                    def pythonHome = tool name: 'Python311', type: 'jenkins.plugins.shiningpanda.tools.PythonInstallation'
                    env.PATH = "${pythonHome}/bin:${env.PATH}"
                }
            }
        }

        stage('Install Dependencies') {
            steps {
                sh '''
                    python --version
                    pip install --upgrade pip
                    pip install -r requirements.txt
                '''
            }
        }

        stage('Run Robot Tests') {
            steps {
                sh '''
                    robot -d results tests/ui
                '''
            }
        }
    }

    post {
        always {
            archiveArtifacts artifacts: 'results/**/*.xml, results/**/*.html, results/**/*.log', allowEmptyArchive: true
        }
    }
}
