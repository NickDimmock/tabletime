var addOption,checkGuess,clearScreen,getReady,root,showHelp,shuffle,startQuiz,startRound,startScreen,winScreen;root=this;startScreen=function(){clearScreen();return $("#start").show()};clearScreen=function(){return $(".page").hide()};winScreen=function(){var rank,roundTime;roundTime=root.timer.stop();rank=root.rater.rate(roundTime);$("#roundTime").text(roundTime);$("#rank").text(rank);$("#quizNumber").text(quizNumber);clearScreen();return $("#winner").show()};showHelp=function(){clearScreen();return $("#instructions").show()};getReady=function(){clearScreen();$("#readyNumber").html(root.quizNumber);return $("#getReady").show()};startQuiz=function(){clearScreen();root.tableNumbers=shuffle([1,2,3,4,5,6,7,8,9,10,11,12]);root.life=1;root.completed=0;$("#lives span").removeClass("used");$("#completed span").removeClass("completed");$("#quiz").show();root.timer.start();return startRound()};startRound=function(){root.options=[];root.factor=root.tableNumbers.pop();root.answer=root.quizNumber*root.factor;$("#options a").removeClass("tried");$("#sumLeft").text(root.factor);$("#sumRight").text(root.quizNumber);root.options.push(answer);addOption();addOption();root.options=shuffle(root.options);$("#opt1").text(root.options[0]);$("#opt2").text(root.options[1]);return $("#opt3").text(root.options[2])};addOption=function(){var r;while(true){r=Math.floor(Math.random()*12)+1;r=r*root.quizNumber;if(root.options.indexOf(r)===-1){break}}return root.options.push(r)};checkGuess=function(g){var myAnswer;if(g.hasClass("tried")){return false}myAnswer=parseInt(g.text(),10);if(myAnswer===root.answer){root.completed++;if(root.completed===12){return winScreen()}else{$('#completed span[data-completed="'+root.factor+'"]').addClass("completed");return startRound()}}else{if(root.life===3){clearScreen();return $("#loser").show()}else{$('span[data-life="'+root.life+'"]').addClass("used");root.life++;return g.addClass("tried")}}};shuffle=function(a){var i,j,t;i=a.length;while(--i>0){j=~~(Math.random()*(i+1));t=a[j];a[j]=a[i];a[i]=t}return a};$(function(){root.rater=new AnimalRater;root.timer=new Timer;$("a").click(function(){return event.preventDefault()});$("#choose a").click(function(){root.quizNumber=$(this).text();return getReady()});$("#go").click(function(){return startQuiz()});$("#help").click(function(){return showHelp()});$("#ok").click(function(){return startScreen()});$("#options a").click(function(){return checkGuess($(this))});$(".retry").click(function(){return startScreen()});return startScreen()});