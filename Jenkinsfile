pipeline{
    agent any
    stages{


        stage ('Clone git repo'){
             steps{
                  echo 'pulling from git ... ';
                  git branch:'master',
                  url:'https://github.com/JecerBenH/AnjayClient.git';
             }
        }

        stage('Build Docker Image'){
             steps {
                  script{
                        sh 'docker image build --no-cache -t jecer1997/anjay:latest .  '
                  }
             }
        }


    }
}