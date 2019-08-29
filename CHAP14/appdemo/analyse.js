const scanner = require("sonarqube-scanner");

scanner(
  {
    // this example uses local instance of SQ
    serverUrl: "http://168.63.8.18",
    token : "32b7e0e1f75e223f92fa11592652c66eab38ef01",
    options: {
      "sonar.projectKey" : "demobook",
      "sonar.projectVersion": "1.1.0",
      "sonar.sources": "src",
      "sonar.tests": "tests",
      "sonar.typescript.lcov.reportPaths": "coverage/lcov.info",
      "sonar.testExecutionReportPaths": "test-report.xml"
    },
  },
  () => {
    // callback is required
  }
);