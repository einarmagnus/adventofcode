import adventofcode {
	projectFile,
	getFileContents
}
void uppg1() {
	String ps = getFileContents(projectFile("uppg1-1.input"));
	Integer result = ps.count('('.equals) - ps.count(')'.equals);
	process.writeLine("Floor: ``result``");

}

void uppgift1b() {
	String ps = getFileContents(projectFile("uppg1-1.input"));
	variable Integer floor = 0;
	variable Integer pos = 0;
	while (floor >= 0) {
		if (exists ch = ps[pos]) {
			if (ch == ')') {
				floor--;
			} else {
				floor++;
			}
		}
		pos++;
	}
	process.writeLine("Floor: ``pos``");	
}
