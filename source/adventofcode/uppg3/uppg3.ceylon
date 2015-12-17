import adventofcode.lib {
	resource
}
import ceylon.collection {
	HashMap,
	Hashtable,
	unlinked
}

shared void uppg3() {
	String instructions = resource("uppg3.input");

	class Location(x, y) {
		shared Integer x;
		shared Integer y;

		shared Location adjacent(Integer dx, Integer dy) {return Location(x+dx,y+dy);}
		shared actual String string => "(``x``, ``y``)";
		shared actual Integer hash => string.hash;
		shared actual Boolean equals(Object other){
			if (is Location other) {
				return x == other.x && y == other.y;
			} else {
				return false;
			}
		}
	}

	Map<Character, Location(Location)> modLocation = map {
		'<' -> ((Location l) => l.adjacent(-1, 0)),
		'>' -> ((Location l) => l.adjacent(1, 0)),
		'^' -> ((Location l) => l.adjacent(0, -1)),
		'v' -> ((Location l) => l.adjacent(0, 1))
	};

	value city = HashMap<Location, Integer>(unlinked, Hashtable());
	variable value santa = Location(0,0);
	city.put(santa, 1);
	for (dir in instructions) {
		value lFunc = modLocation.get(dir);
		assert (exists lFunc);
		santa = lFunc(santa);
		value l = city.get(santa);
		city.put(santa, (l else 0) + 1);
	}

	process.writeLine("``city.size`` houses were visited by santa");

	city.clear();
	variable Location[2] movers = [Location(0, 0), Location(0, 0)];
	city.put(movers[0], 1);
	for (dir in instructions) {
		value lFunc = modLocation.get(dir);
		assert (exists lFunc);
		value newLoc = lFunc(movers.first);
		city.put(newLoc, (city.get(newLoc) else 0) + 1);
		movers = [movers[1], newLoc];
	}
	process.writeLine("``city.size`` houses were visited by santa and his robot");

}
