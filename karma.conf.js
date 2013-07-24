// Karma configuration

// base path, that will be used to resolve files and exclude
basePath = './';

// list of files / patterns to load in the browser
files = [
    JASMINE,
    JASMINE_ADAPTER,
    'app/bower_components/angular/angular.js',
    'app/bower_components/angular-ui-router/release/angular-ui-router.js',
    'app/bower_components/angular-mocks/angular-mocks.js',
    'app/scripts/libs/sjcl.js',
    'app/scripts/libs/core-min.js',
    'app/scripts/libs/x64-core-min.js',
    'app/scripts/libs/md5-min.js',
    'app/scripts/libs/sha1-min.js',
    'app/scripts/libs/sha256-min.js',
    'app/scripts/libs/sha3-min.js',
    'app/scripts/libs/enc-base64-min.js',
    'app/scripts/*.coffee',
    'app/scripts/**/*.coffee',
    'test/mock/**/*.coffee',
    'test/spec/**/*.coffee'
];

// list of files to exclude
exclude = [];

// test results reporter to use
// possible values: dots || progress || growl
reporters = ['progress'];

// web server port
port = 8080;

// cli runner port
runnerPort = 9100;

// enable / disable colors in the output (reporters and logs)
colors = true;

// level of logging
// possible values: LOG_DISABLE || LOG_ERROR || LOG_WARN || LOG_INFO || LOG_DEBUG
logLevel = LOG_INFO;

// enable / disable watching file and executing tests whenever any file changes
autoWatch = false;

// Start these browsers, currently available:
// - Chrome
// - ChromeCanary
// - Firefox
// - Opera
// - Safari (only Mac)
// - PhantomJS
// - IE (only Windows)
browsers = ['Chrome'];

// If browser does not capture in given timeout [ms], kill it
captureTimeout = 10000;

// Continuous Integration mode
// if true, it capture browsers, run tests and exit
singleRun = true;
