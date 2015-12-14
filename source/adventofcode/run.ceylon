import ceylon.file { File,
	home,
	Path,
	Reader,
	lines,
	Resource,
	ExistingResource }
"Run the module `adventofcode`."
shared void run() {
    uppgift1b();
}

String getFileContents(File? file) {
	if (exists file) {
		return "".join(lines(file));
	}
	throw Exception("File did not exist");
}

File? projectFile(String name){
	Resource r = home.childPath("workspace/adventofcode/``name``").resource;
	
	if (is File r) {
		return r;
	} 
	else {
		return null;
	}
}

void uppgift1() {
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
