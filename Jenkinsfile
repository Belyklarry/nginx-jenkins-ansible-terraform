pipeline {
  agent any
  parameters {
    choice(
        name: 'Action',
        choices: "apply\ndestroy",
        description: 'Apply or Destroy the instance' )
  }
  stages {

    stage('Checkout') {
        steps {
            git branch: 'master', credentialsId: 'jenkins', url: 'git@github.com:Belyklarry/nginx-jenkins-ansible-terraform.git'
        }
    }

    stage('Terraform') {
      steps {
        script {
          if (params.Action == "apply") {
            sh 'terraform -chdir=terraform/static-site init'
            sh 'terraform -chdir=terraform/static-site apply --auto-approve'
          } 
          else {
            sh 'terraform -chdir=terraform/static-site destroy --auto-approve'
          }
        }
      }
    }

    stage('Ansible') {
      steps {
        retry(count: 5) {
          sh 'ansible-playbook -i /etc/ansible/aws_ec2.yml ansible/static-site/site.yml'
        }
      }
    }
  }
}
