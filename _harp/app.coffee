# space for global variables:
root = this

startScreen = ->
    # Display the starting screen
    clearScreen()
    $('#start').show()

clearScreen = ->
    # Hide all pages
    $('.page').hide()

winScreen = ->
    roundTime = root.timer.stop()
    rank = root.rater.rate(roundTime)
    $('#roundTime').text(roundTime)
    $('#rank').text(rank)
    $('#quizNumber').text(quizNumber)
    clearScreen()
    $('#winner').show()

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
            clearScreen()
            $('#loser').show()
        else
            # Mark a lost life and increment the current life:
            $('span[data-life="'+root.life+'"]').addClass('used')
            root.life++
            # Mark the answer as tried:
            g.addClass('tried')

shuffle = (a) ->
    i = a.length
    while --i > 0
        j = ~~(Math.random() * (i + 1))
        t = a[j]
        a[j] = a[i]
        a[i] = t
    a

$ ->
    root.rater = new AnimalRater()
    root.timer = new Timer()

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

    startScreen()
    