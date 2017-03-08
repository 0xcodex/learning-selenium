var page = require('webpage').create();
page.open('http://exadmin.hailiangtong.com/', function() {
  page.render('haliangtong.png');
  phantom.exit();
});