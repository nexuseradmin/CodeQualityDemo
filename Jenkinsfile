pipeline {
    agent any
    stages {
        stage('Checkout'){steps{checkout scm}}
        stage('Build'){steps{sh './scripts/build.sh'}}
        stage('Cppcheck'){steps{sh './scripts/cppcheck.sh'}}
        stage('Clang-Tidy'){steps{sh './scripts/clangtidy.sh'}}
        stage('Valgrind'){steps{sh './scripts/valgrind.sh'}}
        stage('Archive'){
            steps{
                archiveArtifacts artifacts: 'reports/*', fingerprint: true
            }
        }
    }
}
