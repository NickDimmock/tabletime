this.AnimalRater=function(){function AnimalRater(){this.animals=["Cheetah","Pronghorn","Springbok","Wildebeest","Lion","Jaguar","Impala","Blackbuck","Lynx","Hare","Greyhound","Elk","Whippet","Jackrabbit","Kangaroo","Horse","Deer","Gazelle","Ostrich","Coyote","Dolphin","Wolf","Zebra","Camel","Pony","Ocelot","Tiger","Hyena","Panther","Leopard","Rhino","Mule deer","Grizzly bear","Dragonfly","Snow Leopard","Beaver","Reindeer","Puma","Anteater","Fox","Giraffe","Wolverine","Warthog","Boar","Cat","Armadillo","Dingo","Llama","Human","Cougar","Baboon","Polar bear","Mandrill","Wombat","Yak","Zebu","Hornet","Gorilla","Sheep","Bison","Buffalo","Iguana","Platypus","Chipmunk","Roadrunner","Jackal","Moose","Panda","Lemur","Mongoose","Alligator","Dachshund","Badger","Wildcat","Gopher","Elephant","Ferret","Weasel","Chichilla","Racoon","Wasp","Porpoise","Squirrel","Mamba","Hippo","Scorpion","Hedgehog","Lobster","Pig","Goat","Skunk","Woodchuck","Crab","Chicken","Mouse","Shrew","Mink","Rat","Bee","Otter","Frog","Koala","Pug","Groundhog","Mole","Toad","Tarantula","Rabbit","Hamster","Turtle","Pocupine","Sloth","Tortoise","Slug","Snail"];this.adjectives=["Slippery","Tenacious","Anxious","Noisy","Hardy","Robust","Jaunty","Whistling","Comfy","Shy","Happy","Crafty","Giggling","Blazing","Jade","Masterful","Noble","Samurai","Energetic","Nifty","Thoughtful","Cromulent","Phantom","Magic","Brave","Giddy","Ticklish","Skittish","Laughing","Couragous","Heroic","Dazzling","Radiant","Champion","Platinum","Helpful","Groovy","Beautiful","Intrepid","Dancing","Friendly","Rambunctious","Far-out","Radical","Ninja","Sneaky","Speedy","Creeping","Bashful","Magnetic","Galloping","Fearless","Magnificent","Vigorous","Jumping","Leaping","Prancing","Golden","Triumphant","Lively","Flying","Crouching","Have-a-go","Pedigree","Fantastic","Surprising","Outstanding","Funky","Sheepish","Festive","Atomic","Epic","Jumbo","Legendary","Nimble","Turbo","Hectic","Relaxed","Supersonic","Agile","Non-stop","Tireless","Furious","Dynamic","Productive","Shining","Kung Fu","Athletic","Upbeat","Eager","Wild","Electric","Startling","Invisible","Unstoppable","Superstar","Bionic","Chirpy","Sprightly","Swashbuckling","Plucky","Gallant"]}AnimalRater.prototype.rate=function(score){var adj,adjScore,animal,ratio;if(score>60){return"Porridge"}if(score<10){return"Lightning"}ratio=(score-10)/50;animal=Math.floor(ratio*this.animals.length);adjScore=(score%1).toFixed(3);adj=Math.floor(adjScore*this.adjectives.length);return this.adjectives[adj]+" "+this.animals[animal]};AnimalRater.prototype.checkUnique=function(arr){var i,item,len,oops,tmp;tmp=[];for(i=0,len=arr.length;i<len;i++){item=arr[i];if(tmp.indexOf(item)===-1){tmp.push(item)}else{oops=true;console.log(item+" is a duplicate!")}}if(oops){return false}else{return"Unique!"}};return AnimalRater}();