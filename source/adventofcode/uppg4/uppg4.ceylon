import java.security {
	MessageDigest
}
import ceylon.io.charset {
	utf8
}
import java.lang {
	JByte = Byte
}
import ceylon.interop.java {
	createJavaByteArray
}


shared String md5(String str) {
	MessageDigest md = MessageDigest.getInstance("md5");
	value bytes = createJavaByteArray(utf8.encode(str));
	String hex(JByte b) => formatInteger(b.byteValue().unsigned, 16).padLeading(2, '0');
	return "".join(md.digest(bytes).array.map(hex));
}

shared Integer findDigestStartingWith(String start, String secret) {
	variable value key = 0;

	while (true){
		if (md5(secret + key.string).startsWith(start)) {
			return key;
		}
		key += 1;
	}
}

shared void uppg4() {
	value secret = "ckczppom";
	process.writeLine("five zeros:``findDigestStartingWith("00000", secret)``");
	process.writeLine("six zeros:``findDigestStartingWith("000000", secret)``");
}