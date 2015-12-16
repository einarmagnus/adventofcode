import ceylon.collection {
	...
}
import adventofcode.lib {
	DoubleLinkedList,
	getFileContents,
	projectFile
}

shared void uppgift1() {
	String ps = getFileContents(projectFile("uppg1-1.input"));

	Integer upDown(Character c) => c == '(' then 1 else -1;
	// DoubleLinkedList can be substituted with ArrayList and it works all the same,
	// exept about 60 times faster. But it was a good exercise implementing the list :)
	value trail = ps.fold(DoubleLinkedList<Integer>())((list, ch) {
		list.add(upDown(ch) + (list.last else 0));
		return list;
	});
	value lastFloor = trail.last;
	if (exists lastFloor) {
		process.writeLine("Santa ends up at floor: ``lastFloor``");
	}
	value basementPos = trail.locate(Integer.negative);
	if (exists basementPos) {
		process.writeLine("Santa enters the basement after: ``basementPos.key + 1``");
	}
}
