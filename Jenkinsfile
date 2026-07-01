pipeline {
    agent any

    stages {

        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Build') {
            steps {
                sh './scripts/build.sh'
            }
        }

        stage('Cppcheck') {
            steps {
                sh './scripts/cppcheck.sh'
            }
        }

        stage('Clang-Tidy') {
            steps {
                sh './scripts/clangtidy.sh'
            }
        }

        stage('Valgrind') {
            steps {
                sh './scripts/valgrind.sh'
            }
        }
    }

    post {
        always {

            archiveArtifacts artifacts: 'reports/*', fingerprint: true

            recordIssues(
                tools: [
                    cppCheck(pattern: 'reports/cppcheck.xml'),
                    clangTidy(pattern: 'reports/clangtidy.txt')
                ]
            )

        }
    }
}
