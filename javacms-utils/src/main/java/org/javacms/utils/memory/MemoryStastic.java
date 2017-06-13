package org.javacms.utils.memory;

import org.javacms.utils.bytes.ByteConverter;

import java.util.HashMap;
import java.util.Map;

public class MemoryStastic {
	
	public static Map<String, String> getMemoryStastic() {
		Map<String, String> map = new HashMap<String, String>();
		long freeMemory = Runtime.getRuntime().freeMemory();
		long totalMemory = Runtime.getRuntime().totalMemory();
		long usedMemory = totalMemory - freeMemory;
		long maxMemory = Runtime.getRuntime().maxMemory();
		map.put("freeMemory", ByteConverter.convertByteToMbyte(freeMemory));
		map.put("usedMemory", ByteConverter.convertByteToMbyte(usedMemory));
		map.put("totalMemory", ByteConverter.convertByteToMbyte(totalMemory));
		map.put("maxMemory", ByteConverter.convertByteToMbyte(maxMemory));
		return map;
	}

}
