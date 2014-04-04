angular.module("passwordEncoderApp").controller("PasswordCtrl",["$scope","Password",function(a,b){a.sjcl="btn-info",a.passwordService=b,a.useHash=function(b){return a.passwordService.encoding=b,a.md5="md5"===b?"btn-info":"",a.sha1="sha1"===b?"btn-info":"",a.sha2="sha2"===b?"btn-info":"",a.sha3="sha3"===b?"btn-info":"",a.sjcl="sjcl"===b?"btn-info":"",a.encodePassword(a.passwordService.word,!0)},a.encodePassword=function(b,c){var d,e;return b&&""!==b.trim()?c||"sjcl"!==a.passwordService.encoding?(a.loading="password-loading",d=a.getHash(b),e=a.strengthen(a.truncate(a.stripSpecialChars(d),a.passwordService.wordLength)),a.isStrongEnough(e)?(c&&a.selectText(),a.passwordService.crypto=e,a.loading="",a.passwordService.crypto):a.encodePassword(b+"x",c)):"":(a.passwordService.crypto="","")},a.stripSpecialChars=function(a){return a.toString(CryptoJS.enc.Base64).replace(/\+|\/|=/g,"")},a.isStrongEnough=function(b){return b.length<a.passwordService.wordLength?!0:a.containsMinCharTypeMix(b,Math.floor(b.length/6))},a.truncate=function(a,b){return b>0&&b<a.length&&(a=a.substring(0,b)),a},a.containsMinCharTypeMix=function(b,c){var d;return d=a.passwordService.useSpecial?a.countMatches(b,/[\!\@\#\$\^\&\(\)\~]/g)>=c:!0,d&&a.countMatches(b,/[0-9]/g)>=c&&a.countMatches(b,/[a-z]/g)>=c&&a.countMatches(b,/[A-Z]/g)>=c},a.countMatches=function(a,b){return(a.match(b)||[]).length},a.getSJCLHash=function(b){var c,d,e;return e=sjcl.codec.base64.toBits("xnChH53E3iwFt4GIG0e5Og29"),d=3*Math.ceil(a.passwordService.wordLength/4)*8+48,c=sjcl.misc.pbkdf2(b,e,a.passwordService.strengthener,d),sjcl.codec.base64.fromBits(c)},a.getHash=function(b){var c;return c=a.passwordService.encoding||"sjcl","sha1"===c?CryptoJS.SHA1(b):"sha2"===c?CryptoJS.SHA256(b):"sha3"===c?CryptoJS.SHA3(b):"md5"===c?CryptoJS.MD5(b):"sjcl"===c?a.getSJCLHash(b):void 0},a.truncate=function(b){var c;return c=parseInt(a.passwordService.wordLength,10),c>0&&c<b.length&&(b=b.substring(0,c)),b},a.strengthen=function(b){return a.passwordService.useSpecial&&(b.match(/^[0-9].*[0-9]$/g)&&(b="^"+b.substring(0,b.length-2)+"!"),b.match(/^[0-9].*[A-Z]$/g)&&(b="#"+b.substring(0,b.length-2)+"~"),b.match(/^[0-9].*[a-z]$/g)&&(b="@"+b.substring(0,b.length-2)+"^"),b.match(/^[A-Z].*[0-9]$/g)&&(b="^"+b.substring(0,b.length-2)+"$"),b.match(/^[A-Z].*[A-Z]$/g)&&(b="!"+b.substring(0,b.length-2)+"^"),b.match(/^[A-Z].*[a-z]$/g)&&(b="$"+b.substring(0,b.length-2)+"#"),b.match(/^[a-z].*[0-9]$/g)&&(b="@"+b.substring(0,b.length-2)+"$"),b.match(/^[a-z].*[A-Z]$/g)&&(b="#"+b.substring(0,b.length-2)+"^"),b.match(/^[a-z].*[a-z]$/g)&&(b="!"+b.substring(0,b.length-2)+"$")),b},a.selectText=function(){var a;return a=$("#cryptoText"),a.focus(function(){return this.setSelectionRange(0,9999),!1}).mouseup(function(){return!1}),a.focus()}}]),angular.module("passwordEncoderApp").service("Password",function(){return{encoding:"sjcl",word:"",crypto:"",wordLength:12,strengthener:1e4,useSpecial:!0,maskInput:!0}}),angular.module("passwordEncoderApp").filter("uppercase",[function(){return function(a){return a.toUpperCase()}}]);