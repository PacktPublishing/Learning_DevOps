module.exports = {
    globals: {
      "ts-jest": {
        skipBabel: true,
      },
    },
    moduleFileExtensions: ["js", "ts"],
    testResultsProcessor: "jest-sonar-reporter",
    transform: {
      "^.+\\.ts$": "<rootDir>/node_modules/ts-jest/preprocessor.js",
    },
    testMatch: ["<rootDir>/tests/*.Test.ts"],
  };