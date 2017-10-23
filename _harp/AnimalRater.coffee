class @AnimalRater

  constructor: ->

    @animals = [
      'Cheetah'
      'Tiger'
      'Leopard'
      'Snow Leopard'
      'Panther'
      'Lion'
      'Cougar'
      'Puma'
      'Jaguar'
      'Springbok'
      'Antelope'
      'Gazelle'
      'Elk'
      'Wildebeest'
      'Impala'
      'Wolf'
      'Horse'
      'Zebra'
      'Lynx'
      'Ocelot'
      'Coyote'
      'Fox'
      'Hyena'
      'Ostrich'
      'Pony'
      'Greyhound'
      'Whippet'
      'Jackal'
      'Mongoose'
      'Mule deer'
      'Wildcat'
      'Ferret'
      'Rabbit'
      'Giraffe'
      'Reindeer'
      'Kangaroo'
      'Polar bear'
      'Grizzly bear'
      'Warthog'
      'Deer'
      'Otter'
      'Cat'
      'Panda'
      'Human'
      'Elephant'
      'Dachshund'
      'Cobra'
      'Mamba'
      'Scorpion'
      'Squirrel'
      'Kitten'
      'Pug'
      'Pig'
      'Chicken'
      'Mouse'
      'Wasp'
      'Bee'
      'Crab'
      'Lobster'
      'Spider'
      'Giant tortoise'
      'Three-toed sloth'
      'Ant'
      'Snail'
      'Slug'
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
    # limit score to 10-60 seconds
    if score > 60
      return 'Porridge'
    if score < 10
      return 'Lightning'
    # get the ratio:
    ratio = (score - 10) / 50 # 60 - 10
    # map to animals array:
    animal = Math.floor(ratio * (@animals.length))
    # now get the decimal part of the score:
    adjScore = (score % 1).toFixed(2)
    #adjRatio = adjScore / 100
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
