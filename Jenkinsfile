//This file with create a CI/CD pipeline for building and deploying the dcoker image to k8 cluster using Github as source control version.

pipeline{
    
    environment {

	    	registry = "anandseshadrii/studentsurvey645"
        registryCredential = 'dockercred'
        def dateTag = new Date().format("yyyyMMdd-HHmmss")
	}
agent any
  stages{
    stage('Building war') {
            steps {
                script {
                    sh 'rm -rf *.war'
                    sh 'jar -cvf swe-645-assignment-1.war .'
                    docker.withRegistry('',registryCredential){
                      def img = docker.build('anandseshadrii/studentsurvey645:'+ dateTag)
                   }
                    
               }
            }
        }
    stage('Pushing latest code to Docker Hub') {
            steps {
                script {
                    docker.withRegistry('',registryCredential) {
                        def image = docker.build('anandseshadrii/studentsurvey645:'+ dateTag, '. --no-cache')
                        docker.withRegistry('',registryCredential) {
                            image.push()
                        }
                    }
                }
            }
        }
     stage('Deploying to single node in Rancher') {
         steps {
            script{
               sh 'kubectl set image deployment/surveyform container-0=anandseshadrii/studentsurvey645:'+dateTag
               sh 'kubectl set image deployment/surveyformlb container-0=anandseshadrii/studentsurvey645:'+dateTag
            }
         }
      }
  }
 
  post {
	  always {
			sh 'docker logout'
		}
	}    
}