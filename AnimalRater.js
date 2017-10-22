this.AnimalRater=function(){function AnimalRater(){this.animals=["Cheetah","Tiger","Leopard","Snow Leopard","Panther","Lion","Cougar","Puma","Jaguar","Springbok","Antelope","Gazelle","Elk","Wildebeest","Impala","Wolf","Horse","Zebra","Lynx","Ocelot","Coyote","Fox","Hyena","Ostrich","Pony","Greyhound","Whippet","Jackal","Mongoose","Mule deer","Wildcat","Ferret","Rabbit","Giraffe","Reindeer","Kangaroo","Polar bear","Grizzly bear","Warthog","Deer","Otter","Cat","Panda","Human","Elephant","Dachshund","Cobra","Mamba","Scorpion","Squirrel","Kitten","Pug","Pig","Chicken","Mouse","Wasp","Bee","Crab","Lobster","Spider","Giant tortoise","Three-toed sloth","Ant","Snail","Slug"];this.adjectives=["Slippery","Tenacious","Anxious","Noisy","Hardy","Robust","Jaunty","Whistling","Comfy","Shy","Happy","Crafty","Giggling","Masterful","Noble","Samurai","Energetic","Nifty","Thoughtful","Jade","Magic","Brave","Giddy","Ticklish","Skittish","Laughing","Couragous","Heroic","Dazzling","Radiant","Champion","Platinum","Helpful","Groovy","Beautiful","Intrepid","Dancing","Friendly","Rambunctious","Far-out","Radical","Ninja","Sneaky","Speedy","Creeping","Bashful","Magnetic","Galloping","Fearless","Magnificent","Vigorous","Jumping","Leaping","Prancing","Golden","Triumphant","Lively","Flying","Crouching","Have-a-go","Pedigree","Fantastic","Surprising","Outstanding","Funky","Sheepish","Festive","Atomic","Epic","Jumbo","Legendary","Nimble","Turbo","Hectic","Relaxed","Supersonic","Agile","Non-stop","Tireless","Furious","Dynamic","Productive","Shining","Kung Fu","Athletic","Upbeat","Eager","Wild","Electric","Startling","Invisible","Unstoppable","Superstar","Bionic","Chirpy","Sprightly","Swashbuckling","Plucky","Gallant"]}AnimalRater.prototype.rate=function(score){var adj,adjScore,animal,ratio;if(score>60){return"Porridge"}if(score<10){return"Lightning"}ratio=(score-10)/50;animal=Math.floor(ratio*this.animals.length);adjScore=(score%1).toFixed(2);adj=Math.floor(adjScore*this.adjectives.length);console.log(adjScore);console.log(adj);return this.adjectives[adj]+" "+this.animals[animal]};AnimalRater.prototype.checkUnique=function(arr){var i,item,len,oops,tmp;tmp=[];for(i=0,len=arr.length;i<len;i++){item=arr[i];if(tmp.indexOf(item)===-1){tmp.push(item)}else{oops=true;console.log(item+" is a duplicate!")}}if(oops){return false}else{return"Unique!"}};return AnimalRater}();