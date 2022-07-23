node(){
    stage ("git clone")
     {
       //git branch: 'rentalpractice', credentialsId: 'Gitcreds', url: 'https://github.com/muraliphani/RentalCars.git'
       checkout scm
     }
     stage ("mvn package")
    {
      sh "mvn package"
    } 
    stage("Upload to Nexus"){

      nexusArtifactUploader artifacts: [[artifactId: '$BUILD_ID', classifier: '', file: 'target/RentalCars.war', type: 'war']],
      credentialsId: 'nexus', groupId: 'prod', nexusUrl: '54.183.14.138:8081', nexusVersion: 'nexus3', protocol: 'http', repository: 'suryamaniSoftSolutions', version: '$BUILD_ID'
      }
    stage("Deploy to tomcat"){
    //sh "echo ${ip_address}"
    sshagent(['suryaSoft']) {
    sh "scp -o StrictHostKeyChecking=no target/RentalCars.war ec2-user@13.52.247.144:/opt/tomcat/apache-tomcat-8.5.37/webapps"
}
  }  

}