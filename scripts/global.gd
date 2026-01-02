extends Node

const question = "
53..7....
6..195...
.98....6.
8...6...3
4..8.3..1
7...2...6
.6....28.
...419..5
....8..79
"
const solution = "
534678912
672195348
198342567
859761423
426853791
713924856
961537284
287419635
345286179
"

var question_matrix: Array = []
var solution_matrix: Array = []

func _ready() -> void:
	var qstr = question.trim_prefix("\n").trim_suffix("\n")
	qstr = qstr.split("\n")
	for qrow in qstr:
		var qrow_splited = qrow.split("")
		var row = []
		for c in qrow_splited:
			if c == '.':
				row.append(null)
			else:
				row.append(int(c))
		question_matrix.append(row)
	#print_debug(question_matrix)
	
	var sstr = solution.trim_prefix("\n").trim_suffix("\n")
	sstr = sstr.split("\n")
	for srow in sstr:
		var srow_splited = srow.split("")
		var row = []
		for c in srow_splited:
			row.append(int(c))
		solution_matrix.append(row)
	#print_debug(solution_matrix)
