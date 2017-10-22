# space for global variables:
root = this

startScreen = ->
    # Display the starting screen
    clearScreen()
    $('#start').show()

clearScreen = ->
    # Hide all pages
    $('.page').hide()
    $('#newHi').hide()
    $('#currentHi').hide()

winScreen = ->
    clearScreen()
    winTime = root.timer.stop()
    rank = root.rater.rate(winTime)
    $('#roundTime').text(winTime)
    $('#rank').text(rank)
    $('#quizNumber').text(root.quizNumber)
    $('#winner').show()
    if (winTime < 300) && winTime < parseInt(root.hiScores[root.quizNumber]) or root.hiScores[root.quizNumber] == 0
        # A new record!
        old = if root.hiScores[root.quizNumber] then root.hiScores[root.quizNumber] else 'nothing'
        $('#oldHi').text(old)
        root.hiScores[root.quizNumber] = winTime
        saveHiScores()
        $('#newHi').show()
    else
        $('#currentHiNumber').text(root.quizNumber)
        $('#currentHiScore').text(root.hiScores[root.quizNumber])
        $('#currentHi').show()

loseScreen = ->
    badLuck = [
        'Bad luck!'
        'Game over!'
        'Oh no!'
        'Oops!'
        'Oh dear!'
        'Whoops!'
        'Three strikes!'
    ]
    tryAgain = [
        "Don't give up!"
        'You can do it!'
        'Have another go!'
    ]
    $('#loser h2').text(pickRandom(badLuck))
    $('#tryAgainMsg').text(pickRandom(tryAgain))
    clearScreen()
    $('#loser').show()

showHelp = ->
    # Show the help screen
    clearScreen()
    $('#instructions').show()

getReady = ->
    # Show the get ready screen prior to starting the quiz
    # (timer starts after this screen)
    clearScreen()
    $('#readyNumber').html(root.quizNumber)
    $('#getReady').show()

startQuiz = ->
    # Set up a new quiz and show the quiz screen
    clearScreen()
    root.tableNumbers = shuffle([1,2,3,4,5,6,7,8,9,10,11,12])
    # Clear out the lives and completed numbers data & display
    root.life = 1
    root.completed = 0
    $('#lives span').removeClass('used')
    $('#completed span').removeClass('completed')
    $('#quiz').show()
    root.timer.start()
    startRound()

startRound = ->
    # Start a new round in the current quiz
    root.options = []   # Array of three answer options
    root.factor = root.tableNumbers.pop()    # Pick the factor for this round
    root.answer = (root.quizNumber * root.factor)  # Set the answer for this round
    # clear any tried options from last round
    $('#options a').removeClass('tried')
    # udpate the sum display:
    $('#sumLeft').text root.factor
    $('#sumRight').text root.quizNumber
    root.options.push answer    # Add the answer to the options
    # Add two wrong answers:
    addOption()
    addOption()
    root.options = shuffle root.options   # Shake the options up so the answer isn't first
    # Update the options display:
    $('#opt1').text root.options[0]
    $('#opt2').text root.options[1]
    $('#opt3').text root.options[2]
    # Done! 

addOption = ->
    # Add an option to the array of possile answers, making sure
    # it's not already in there.
    loop
        r = Math.floor(Math.random()*12) + 1
        r = r * root.quizNumber
        break if root.options.indexOf(r) is -1
    root.options.push r

checkGuess = (g) ->
    # Check if a guess is correct and update accordingly
    # g is the jQuery object clicked
    if g.hasClass('tried')
        return false;
    myAnswer = parseInt(g.text(), 10)
    if myAnswer is root.answer
        # Correct!
        root.completed++
        if root.completed is 12
            # All done!
            winScreen()
        else
            # update completed display
            $('#completed span[data-completed="' + root.factor + '"]').addClass('completed')
            #next question
            startRound()
    else
        #Wrong!
        if root.life == 3
            # It's all over!
            loseScreen()
        else
            # Mark a lost life and increment the current life:
            $('span[data-life="'+root.life+'"]').addClass('used')
            root.life++
            # Mark the answer as tried:
            g.addClass('tried')

showScores = ->
    clearScreen()
    $('#hiScores').show()

getHiScores = ->
    if !localStorage.hiScores
        root.hiScores = []
        for _ in [1..12]
            root.hiScores[_] = 0
            localStorage.hiScores = JSON.stringify root.hiScores
    else
        # Set local copy of hi scores
        root.hiScores = JSON.parse localStorage.hiScores
        updateHiScores()

updateHiScores = ->
    # Update score table for existing scores:
    for score, num in root.hiScores
        if score
            $('td.scoresTableScore[data-score="' + num + '"]').text(score + 's')
            $('td.scoresTableRank[data-score="' + num + '"]').text(root.rater.rate(score))

saveHiScores = ->
    localStorage.hiScores = JSON.stringify root.hiScores
    updateHiScores()

shuffle = (a) ->
    i = a.length
    while --i > 0
        j = ~~(Math.random() * (i + 1))
        t = a[j]
        a[j] = a[i]
        a[i] = t
    a

pickRandom = (a) ->
    a[Math.floor(Math.random() * a.length)]

$ ->
    root.rater = new AnimalRater()
    root.timer = new Timer()

    getHiScores()

    $('a').click ->
        event.preventDefault()

    $('#choose a').click ->
        root.quizNumber = $(this).text()
        getReady()
    
    $('#go').click ->
        startQuiz()

    $('#help').click ->
        showHelp()

    $('#ok').click ->
        startScreen()

    $('#options a').click ->
        checkGuess $(this)

    $('.retry').click ->
        startScreen()

    $('#showScores').click ->
        showScores()
    
    $('#closeScores').click ->
        startScreen()

    startScreen()
    