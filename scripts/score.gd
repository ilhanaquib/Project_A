extends Label

var score = 0

func increaseScore():
	score += 1
	text = "Score: %s" % score
