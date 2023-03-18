pipeline {
    
    agent { dockerfile true }
    
    stages {
        //ansible-shell
        stage('SCM Checkout'){
            steps{
                git 'https://github.com/saspath/myapp-ansible.git'
            }
        }
        stage('Run Shell'){
            steps{
                ansiblePlaybook credentialsId: 'private-key', disableHostKeyChecking: true, installation: 'ansible-pb', inventory: 'dev.inv', playbook: 'playbook.yml'
            }
        }
    }
}
