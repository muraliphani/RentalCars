node(){
    stage ("git clone")
     {
       git branch: 'rentalpractice', credentialsId: 'Gitcreds', url: 'https://github.com/muraliphani/RentalCars.git'
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
       timeout(time: 10, unit: 'MINUTES') {
            waitForQualityGate abortPipeline: true
        }


      }
       









}