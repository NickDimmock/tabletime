class @AnimalRater

  constructor: ->

    @animals = [
      'Cheetah' #120
      'Pronghorn' #88.5
      'Springbok' #88
      'Wildebeest' #80.5
      'Lion' #80.5
      'Jaguar' #80
      'Impala' #80
      'Blackbuck' #80
      'Lynx' #80
      'Hare' #80
      'Greyhound' #74
      'Elk' #72
      'Whippet' #72
      'Jackrabbit' #71
      'Kangaroo' #71
      'Horse'#70
      'Deer' #70
      'Gazelle' #70
      'Ostrich' #70
      'Coyote' #65
      'Dolphin' #65
      'Wolf' #64
      'Zebra' #64
      'Camel' #64
      'Pony' #64
      'Ocelot' #61
      'Tiger' #60
      'Hyena' #60
      'Panther' #58
      'Leopard' #58
      'Rhino' #56
      'Mule deer' #56
      'Grizzly bear' #56
      'Dragonfly' #56
      'Snow Leopard' #55
      'Beaver' #55
      'Reindeer' #52
      'Puma' #50
      'Anteater' #50
      'Fox' #48
      'Giraffe' #48
      'Wolverine' #48
      'Warthog' #48
      'Boar' #48
      'Cat' #48
      'Armadillo' #48
      'Dingo' #48
      'Llama' #48
      'Human' #47
      'Cougar' #45
      'Baboon' #45
      'Polar bear' #40
      'Mandrill' #40
      'Wombat' #40
      'Yak' #40
      'Zebu'#40
      'Hornet' #40
      'Gorilla' #40
      'Sheep' #40
      'Bison' #35
      'Buffalo' #35
      'Iguana' #35
      'Platypus' #35
      'Chipmunk' #33
      'Roadrunner' #32
      'Jackal' #32
      'Moose' #32
      'Panda' #32
      'Lemur' #32
      'Mongoose' #32
      'Alligator' #32
      'Dachshund' #30
      'Badger' #30
      'Wildcat' #25
      'Gopher' #25
      'Elephant' #25
      'Ferret' #25
      'Weasel' #25
      'Chichilla' #24
      'Racoon' #24
      'Wasp' #24
      'Porpoise' #23
      'Squirrel' #20
      'Mamba' #19
      'Hippo' #19
      'Scorpion' #19
      'Hedgehog' #19
      'Lobster' #18
      'Pig' #17
      'Goat' #17
      'Skunk' #16
      'Woodchuck' #16
      'Crab' #16
      'Chicken' #14
      'Mouse' #13
      'Shrew' #13
      'Mink' #13
      'Rat' #13
      'Bee' #13
      'Otter' #11
      'Frog' #11
      'Koala' #10
      'Pug' #8
      'Groundhog' #8
      'Mole' #8
      'Toad' #8
      'Tarantula' #6
      'Rabbit' #4
      'Hamster' #4
      'Turtle' #4
      'Pocupine' #3
      'Sloth' #2
      'Tortoise' #0.5
      'Slug' #0.3
      'Snail' #0.05
    ]

    @adjectives = [
      'Slippery'
      'Tenacious'
      'Anxious'
      'Noisy'
      'Hardy'
      'Robust'
      'Jaunty'
      'Whistling'
      'Comfy'
      'Shy'
      'Happy'
      'Crafty'
      'Giggling'
      'Blazing'
      'Jade'
      'Masterful'
      'Noble'
      'Samurai'
      'Energetic'
      'Nifty'
      'Thoughtful'
      'Cromulent'
      'Phantom'
      'Magic'
      'Brave'
      'Giddy'
      'Ticklish'
      'Skittish'
      'Laughing'
      'Couragous'
      'Heroic'
      'Dazzling'
      'Radiant'
      'Champion'
      'Platinum'
      'Helpful'
      'Groovy'
      'Beautiful'
      'Intrepid'
      'Dancing'
      'Friendly'
      'Rambunctious'
      'Far-out'
      'Radical'
      'Ninja'
      'Sneaky'
      'Speedy'
      'Creeping'
      'Bashful'
      'Magnetic'
      'Galloping'
      'Fearless'
      'Magnificent'
      'Vigorous'
      'Jumping'
      'Leaping'
      'Prancing'
      'Golden'
      'Triumphant'
      'Lively'
      'Flying'
      'Crouching'
      'Have-a-go'
      'Pedigree'
      'Fantastic'
      'Surprising'
      'Outstanding'
      'Funky'
      'Sheepish'
      'Festive'
      'Atomic'
      'Epic'
      'Jumbo'
      'Legendary'
      'Nimble'
      'Turbo'
      'Hectic'
      'Relaxed'
      'Supersonic'
      'Agile'
      'Non-stop'
      'Tireless'
      'Furious'
      'Dynamic'
      'Productive'
      'Shining'
      'Kung Fu'
      'Athletic'
      'Upbeat'
      'Eager'
      'Wild'
      'Electric'
      'Startling'
      'Invisible'
      'Unstoppable'
      'Superstar'
      'Bionic'
      'Chirpy'
      'Sprightly'
      'Swashbuckling'
      'Plucky'
      'Gallant'
    ]

  rate: (score) ->
    # score will be fixed to 3 decimal places
    # limit score to 10-60 seconds
    if score > 60
      return 'Porridge'
    if score < 10
      return 'Lightning'
    # get the ratio:
    ratio = (score - 10) / 50 # 60 - 10
    # map to animals array:
    animal = Math.floor(ratio * (@animals.length))
    # use the decimal part of the score for the adjective key:
    adjScore = (score % 1).toFixed(3)
    adj = Math.floor(adjScore * (@adjectives.length))
    return @adjectives[adj] + ' '  + @animals[animal]

  checkUnique: (arr) ->
    tmp = []
    for item in arr
      if tmp.indexOf(item) is -1
        tmp.push item
      else
        oops = true
        console.log item + ' is a duplicate!'
    if oops
        false
    else
        'Unique!'
