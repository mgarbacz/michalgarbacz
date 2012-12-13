"use strict";

$('#a-github').hover(
  function() {
    $(this).html('github');
  }, function() {
    $(this).html('gh');
});
$('#a-stackoverflow').hover(
  function() { 
    $(this).html('stackoverflow'); 
  }, function() { 
    $(this).html('so');
});

var myplugin;
if(!myplugin){
  myplugin = $('#skill-python').cprogress({
    percent: 10, // starting position
    img1: 'img/v1.png', // background
    img2: 'img/v2.png', // foreground
    speed: 200, // speed (timeout)
    PIStep : 0.05, // every step foreground area is bigger about this val
    limit: 20, // end value
    loop : false, //if true, no matter if limit is set, progressbar will be running
    showPercent : true, //show hide percent
    onInit: function(){console.log('onInit');},
    onProgress: function(p){console.log('onProgress',p);}, //p=current percent
    onComplete: function(p){console.log('onComplete',p);}
  });
}
