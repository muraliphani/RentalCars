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
      stage ("sonar qube analasis")
      {
          scannerHome = tool 'SonarQubeScanner'
       withSonarQubeEnv('sonarQubeServer') {
            sh "${scannerHome}/bin/sonar-scanner"
        }
       timeout(time: 15, unit: 'MINUTES') {
            waitForQualityGate abortPipeline: true
        }


      }

      stage("Upload to Nexus"){

      nexusArtifactUploader artifacts: [[artifactId: '$BUILD_ID', classifier: '', file: 'target/RentalCars.war', type: 'war']],
      credentialsId: 'nexus', groupId: 'prod', nexusUrl: '54.177.152.94:8081', nexusVersion: 'nexus3', protocol: 'http', repository: 'RentalCars', version: '$BUILD_ID'
      }
       









}