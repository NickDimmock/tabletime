shuffle = (a) ->
    i = a.length
    while --i > 0
        j = ~~(Math.random() * (i + 1))
        t = a[j]
        a[j] = a[i]
        a[i] = t
    a

a=[11,22,33]
for _ in [1..2000]
	b = shuffle(a)
	c=[]
	yow=false
	for e in b
		if c.indexOf(e) isnt -1
			console.log "YOW!"
			yow=true
		c.push e
	if yow
		console.log c
			
