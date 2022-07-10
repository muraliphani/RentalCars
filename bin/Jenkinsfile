node(){
stage("Git checkout"){

checkout([$class: 'GitSCM', branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/muraliphani/project-dento.git']]])
sh "ls -l"

}
  
  stage("Maven Build"){
  sh "mvn install"
  }  
  stage("Upload to nexus"){
  nexusArtifactUploader artifacts: [[artifactId: '$BUILD_ID', classifier: '', file: 'target/devtest1.war', type: 'war']], 
    credentialsId: 'nexusrepologin', groupId: 'prod', nexusUrl: '34.221.193.230:8081', nexusVersion: 'nexus3', protocol: 'http', repository: 'devtest1', version: '$BUILD_ID'
  
  }
  
}
