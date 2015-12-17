import adventofcode.lib {
	resource
}
import ceylon.regex {
	regex
}

shared void uppg5() {
	value strings = resource("uppg5.input").lines;

	Boolean threeVowels(String str) => str.count((ch) => ch in "aeiou") >= 3;
	Boolean doubles(String str) => regex("(.)\\1").test(str);
	Boolean naughties(String str) => ["ab", "cd", "pq", "xy"].any((fragment) => fragment in str);

	Integer nice1 = strings.count((str) => threeVowels(str) && doubles(str) && !naughties(str));

	Boolean xy_xy(String str) => regex("(..).*\\1").test(str);
	Boolean xyx(String str) => regex("(.).\\1").test(str);

	Integer nice2 = strings.count((str) => xy_xy(str) && xyx(str));

	process.writeLine("There were ``nice1`` nice strings with the first rules");
	process.writeLine("There were ``nice2`` nice strings with the later rules");
}