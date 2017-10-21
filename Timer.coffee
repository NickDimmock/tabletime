class @Timer

    start: ->
        @startTime = new Date().getTime()
        @running = true

    stop: ->
        if @running
            @running = false
            stopTime = new Date().getTime()
            ((stopTime - this.startTime) / 1000).toFixed(2)