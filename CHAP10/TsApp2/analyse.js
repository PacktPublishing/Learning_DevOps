const scanner = require("sonarqube-scanner");

scanner(
  {
    // this example uses local instance of SQ
    serverUrl: "http://localhost:9000/",
    options: {
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