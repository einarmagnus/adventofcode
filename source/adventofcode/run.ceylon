import ceylon.math.whole {...}
import ceylon.collection {
	unlinked,
	HashMap,
	Hashtable
}
import adventofcode.lib {
	projectFile,
	getFileContents
}
import adventofcode.uppg1 {
	uppgift1
}
import adventofcode.uppg2 {
	uppg2
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
	uppg2();

}
