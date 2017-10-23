var addOption,checkGuess,clearScreen,getHiScores,getReady,loseScreen,pickRandom,root,saveHiScores,showHelp,showScores,shuffle,startQuiz,startRound,startScreen,updateHiScores,winScreen;root=this;startScreen=function(){clearScreen();return $("#start").show()};clearScreen=function(){$(".page").hide();$("#newHi").hide();return $("#currentHi").hide()};winScreen=function(){var displayTime,old,rank,roundTime;clearScreen();roundTime=root.timer.stop();if(roundTime>300){alert("Sorry! Session timed out (longer than 5 minutes).");return startScreen()}else{displayTime=roundTime.toFixed(2);rank=root.rater.rate(roundTime);$("#roundTime").text(displayTime);$("#rank").text(rank);$("#quizNumber").text(root.quizNumber);$("#winner").show();if(displayTime<root.hiScores[root.quizNumber]||root.hiScores[root.quizNumber]===0){old=root.hiScores[root.quizNumber]?root.hiScores[root.quizNumber]:"nothing";$("#oldHi").text(old);root.hiScores[root.quizNumber]=displayTime;saveHiScores();return $("#newHi").show()}else{$("#currentHiNumber").text(root.quizNumber);$("#currentHiScore").text(root.hiScores[root.quizNumber]);return $("#currentHi").show()}}};loseScreen=function(){var badLuck,tryAgain;badLuck=["Bad luck!","Game over!","Oh no!","Oops!","Oh dear!","Whoops!","Three strikes!"];tryAgain=["Don't give up!","You can do it!","Have another go!"];$("#loser h2").text(pickRandom(badLuck));$("#tryAgainMsg").text(pickRandom(tryAgain));clearScreen();return $("#loser").show()};showHelp=function(){clearScreen();return $("#instructions").show()};getReady=function(){clearScreen();$("#readyNumber").html(root.quizNumber);return $("#getReady").show()};startQuiz=function(){clearScreen();root.tableNumbers=shuffle([1,2,3,4,5,6,7,8,9,10,11,12]);root.life=1;root.completed=0;$("#lives span").removeClass("used");$("#completed span").removeClass("completed");$("#quiz").show();root.timer.start();return startRound()};startRound=function(){root.options=[];root.factor=root.tableNumbers.pop();root.answer=root.quizNumber*root.factor;$("#options a").removeClass("tried");$("#sumLeft").text(root.factor);$("#sumRight").text(root.quizNumber);root.options.push(answer);addOption();addOption();root.options=shuffle(root.options);$("#opt1").text(root.options[0]);$("#opt2").text(root.options[1]);return $("#opt3").text(root.options[2])};addOption=function(){var r;while(true){r=Math.floor(Math.random()*12)+1;r=r*root.quizNumber;if(root.options.indexOf(r)===-1){break}}return root.options.push(r)};checkGuess=function(g){var myAnswer;if(g.hasClass("tried")){return false}myAnswer=parseInt(g.text(),10);if(myAnswer===root.answer){root.completed++;if(root.completed===12){return winScreen()}else{$('#completed span[data-completed="'+root.factor+'"]').addClass("completed");return startRound()}}else{if(root.life===3){return loseScreen()}else{$('span[data-life="'+root.life+'"]').addClass("used");root.life++;return g.addClass("tried")}}};showScores=function(){clearScreen();return $("#hiScores").show()};getHiScores=function(){var _,k,results;if(!localStorage.hiScores){root.hiScores=[];results=[];for(_=k=1;k<=12;_=++k){root.hiScores[_]=0;results.push(localStorage.hiScores=JSON.stringify(root.hiScores))}return results}else{root.hiScores=JSON.parse(localStorage.hiScores);return updateHiScores()}};updateHiScores=function(){var k,len,num,ref,results,score;ref=root.hiScores;results=[];for(num=k=0,len=ref.length;k<len;num=++k){score=ref[num];if(score){$('td.scoresTableScore[data-score="'+num+'"]').text(score+"s");results.push($('td.scoresTableRank[data-score="'+num+'"]').text(root.rater.rate(score)))}else{results.push(void 0)}}return results};saveHiScores=function(){localStorage.hiScores=JSON.stringify(root.hiScores);return updateHiScores()};shuffle=function(a){var i,j,t;i=a.length;while(--i>0){j=~~(Math.random()*(i+1));t=a[j];a[j]=a[i];a[i]=t}return a};pickRandom=function(a){return a[Math.floor(Math.random()*a.length)]};$(function(){root.rater=new AnimalRater;root.timer=new Timer;getHiScores();$("a").click(function(){return event.preventDefault()});$("#choose a").click(function(){root.quizNumber=$(this).text();return getReady()});$("#go").click(function(){return startQuiz()});$("#help").click(function(){return showHelp()});$("#ok").click(function(){return startScreen()});$("#options a").click(function(){return checkGuess($(this))});$(".retry").click(function(){return startScreen()});$("#showScores").click(function(){return showScores()});$("#closeScores").click(function(){return startScreen()});return startScreen()});