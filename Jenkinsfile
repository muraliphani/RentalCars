node(){
stage("Git checkout"){

checkout([$class: 'GitSCM', branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/muraliphani/RentalCars.git']]])
sh "ls -l"

}
  
  stage("Maven Build"){
  sh "mvn install"
  }  
  
  stage("Checkstyle"){
  
  sh "mvn checkstyle:checkstyle"
  
  }
  
  stage("sonarqube"){
       scannerHome = tool 'SonarQubeScanner'
       withSonarQubeEnv('sonar') {
            sh "${scannerHome}/bin/sonar-scanner"
        }
       timeout(time: 10, unit: 'MINUTES') {
            waitForQualityGate abortPipeline: true
        }
  
 }
  stage("Upload to nexus"){
  nexusArtifactUploader artifacts: [[artifactId: '$BUILD_ID', classifier: '', file: 'target/RentalCars.war', type: 'war']], 
    credentialsId: 'nexusrepologin', groupId: 'prod', nexusUrl: '34.221.193.230:8081', nexusVersion: 'nexus3', protocol: 'http', repository: 'devtest1', version: '$BUILD_ID'
  
  }
  
  
}
