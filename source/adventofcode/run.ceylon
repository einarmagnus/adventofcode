import ceylon.file { File,
	home,
	Resource
}

import ceylon.io.charset {
	utf8
}
import ceylon.io.buffer {
	newByteBufferWithData
}

import ceylon.math.whole {...}
import ceylon.collection {
	HashSet,
	Stability,
	unlinked,
	HashMap,
	Hashtable
}


shared String getFileContents(File? file) {
	if (exists file) {
		return utf8.decode(newByteBufferWithData(*file.Reader("utf-8").readBytes(file.size)));		
	}
	throw Exception("File did not exist");
}

shared File? projectFile(String name){
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

void uppgift2() {
	{String*} dimensions = getFileContents(projectFile("uppg2.input")).lines;
	[Integer*] areas = dimensions.collect((String dimStr) {
		Integer[] dims = dimStr.split('x'.equals).collect((s) => parseInteger(s) else 0);
		Integer x = dims[0] else 0;
		Integer y = dims[1] else 0;
		Integer z = dims[2] else 0;
		process.writeLine("x: ``x``, y: ``y``, z: ``z``");
		value sides = [x * y, x*z, y*z];
		Integer smallestSide = min(sides);
		process.writeLine("sides: ``sides``, smallest: ``smallestSide``");
		return sum(sides) * 2 + smallestSide;
	});
	if (nonempty areas) {
		process.writeLine("The Elves need ``sum(areas)`` square inches");
	}
	
}
void uppgift2b() {
	{String*} dimensions = getFileContents(projectFile("uppg2.input")).lines;
	[Integer*] areas = dimensions.collect((String dimStr) {
		Integer[] dims = dimStr.split('x'.equals).collect((s) => parseInteger(s) else 0);
		Integer x = dims[0] else 0;
		Integer y = dims[1] else 0;
		Integer z = dims[2] else 0;
		process.writeLine("x: ``x``, y: ``y``, z: ``z``");
		value sides = [x+y, x+z, y+z].collect((x) => x*2);
		Integer smallestSide = min(sides);
		process.writeLine("sides: ``sides``, smallest: ``smallestSide``");
		return smallestSide + x*y*z;
	});
	if (nonempty areas) {
		process.writeLine("The Elves need ``sum(areas)`` feet of ribbon");
	}	
}

void uppgift3() {
	String instructions = getFileContents(projectFile("uppg3.input"));
	value locations = HashMap<Integer[2], Integer>(unlinked, Hashtable());
	variable value x = 0;
	variable value y = 0;
	locations.put([x, y], 1);
	for (dir in instructions) {
		switch (dir)
		case('<'){
			x--;
		}
		case('>') {
			x++;
		}
		case('^') {
			y++;
		}
		case('v') {
			y--;
		}
		else {
			assert (false);
		}
		locations.put([x, y], (locations.get([x,y]) else 0)+1);
	}
	process.writeLine("``locations.size`` houses were visited");
	
	
	
}

"Run the module `adventofcode`."
shared void run() {
	uppgift3();
}