class @Timer

    # Simple class to start a timer and return elapsed time when stopped.
    # Returns seconds to three decimal places.

    start: ->
        @startTime = new Date().getTime()
        @running = true

    stop: ->
        if @running
            @running = false
            stopTime = new Date().getTime()
            parseFloat ((stopTime - this.startTime) / 1000).toFixed(3)