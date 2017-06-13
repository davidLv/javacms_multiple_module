package org.javacms.utils.bytes;

public class ByteConverter {
	
	public static String convertByteToMbyte(long byteNum) {
		long devidend = 1024 * 1024;
		return String.format("%.2f", (float) (byteNum / devidend));
	}

}
