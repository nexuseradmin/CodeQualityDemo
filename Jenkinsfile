pipeline {
    agent any

    environment {
        REPORT_DIR = "reports"
    }

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

        // Uncomment this when you add gcovr
        /*
        stage('Coverage') {
            steps {
                sh './scripts/coverage.sh'
            }
        }
        */
    }

    post {
        always {

            // Archive all generated reports
            archiveArtifacts artifacts: 'reports/**/*', fingerprint: true

            // Publish Cppcheck & Clang-Tidy results
            recordIssues(
                enabledForFailure: true,
                tools: [
                    cppCheck(pattern: 'reports/cppcheck.xml'),
                    clangTidy(pattern: 'reports/clangtidy.txt')
                ]
            )

            // Publish Valgrind report
            publishValgrind(
                pattern: 'reports/valgrind.xml',
                failThresholdDefinitelyLost: 1,
                failThresholdInvalidReadWrite: 1
            )

            // Publish HTML coverage report (enable after adding gcovr)
            /*
            publishHTML(target: [
                allowMissing: true,
                alwaysLinkToLastBuild: true,
                keepAll: true,
                reportDir: 'reports/coverage',
                reportFiles: 'index.html',
                reportName: 'Code Coverage Report'
            ])
            */
        }
    }
}
