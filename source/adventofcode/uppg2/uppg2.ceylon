import adventofcode.lib {
	resource
}
import ceylon.math.integer {
	min
}
shared void uppg2() {
	{String*} dimensions = resource("uppg2.input").lines;

	class Box(Integer w, Integer h, Integer l) {
		Integer[2][3] sides = [[w, h], [w, l], [h, l]];
		Integer[3] sideAreas => [w * h, w * l, h * l];
		Integer smallestSide => sideAreas.locate((el) => (el == min(sideAreas)))?.key else 0;
		shared Integer totalArea => 2*sum(sideAreas);
		shared Integer smallestArea => sideAreas[smallestSide] else 0;
		shared Integer volume => w * h * l;
		shared Integer smallestCircumference = sum(sides[smallestSide] else [0]) * 2;
	}
	Integer parseInt(String? strInt, Integer fallback) =>
			parseInteger(strInt else "") else fallback;

	{Box*} boxes = dimensions.map((row){
		value dims = row.split('x'.equals).sequence();
		return Box(parseInt(dims[0], 0),parseInt(dims[1], 0),parseInt(dims[2], 0));
	});

	Integer wrappingPaper = boxes.fold(0)((acc, it){
		Integer? smallestArea = it.smallestArea;
		assert(exists smallestArea);
		return  acc + smallestArea + it.totalArea;
	});

	Integer stringNeeded = boxes.fold(0)((acc, it){
		return acc + it.smallestCircumference + it.volume;
	});

	process.writeLine("Total wrapping paper needed: ``wrappingPaper``");
	process.writeLine("Total string needed: ``stringNeeded``");

}
