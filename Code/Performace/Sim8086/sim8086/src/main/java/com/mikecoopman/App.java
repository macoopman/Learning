package com.mikecoopman;

import java.nio.charset.*;
import java.lang.*;
import java.io.*;
import java.util.*;

public class App {
	private static int BUFFER_SIZE = 2;
	private static int NUM_OF_INSTRUCTIONS = 1;
	private static int END_OF_INSTR = 6;
	private static int D = 6;
	private static int W = 7;

    public static void main(String[] args) throws IOException {
		System.out.println("bits 16\n");

		var instructionMap = new HashMap(NUM_OF_INSTRUCTIONS);
		instructionMap.put("100010", "mov");

		var regMapNarrow = new HashMap(8);
		regMapNarrow.put("000", "al");
		regMapNarrow.put("001", "cl");
		regMapNarrow.put("010", "dl");
		regMapNarrow.put("011", "bl");
		regMapNarrow.put("100", "ah");
		regMapNarrow.put("101", "ch");
		regMapNarrow.put("110", "dh");
		regMapNarrow.put("111", "bh");
		
		var regMapWide = new HashMap(8);
		regMapWide.put("000", "ax");
		regMapWide.put("001", "cx");
		regMapWide.put("010", "dx");
		regMapWide.put("011", "bx");
		regMapWide.put("100", "sp");
		regMapWide.put("101", "bp");
		regMapWide.put("110", "si");
		regMapWide.put("111", "di");
		
		
		try(var in = new FileInputStream(args[0]);)
		{
			var buffer = new byte[BUFFER_SIZE];
			
			while ((in.read(buffer)) != -1 )
			{
				StringBuilder results = new StringBuilder();

				var byte1 = String.format("%8s", Integer.toBinaryString(buffer[0] & 0xFF)).replace(' ', '0');
				var byte2= String.format("%8s", Integer.toBinaryString(buffer[1] & 0xFF)).replace(' ', '0');
				
				

				var instr = byte1.substring(0,END_OF_INSTR);
				
				if (instructionMap.containsKey(instr))
				{
					results.append(instructionMap.get(instr));
					results.append(" ");
				}
				else
				{
					System.out.println("Instruction " + instr + " not found");
					return;
				}

				var d = byte1.charAt(D);
				var w = byte1.charAt(W);

				var mod = byte2.substring(0,2);
				var reg = byte2.substring(2,5);
				var rm = byte2.substring(5);
				
				if (w == '0')
				{
					if (d == '0')
					{
						results.append(regMapNarrow.get(rm));
						results.append(", ");
						results.append(regMapNarrow.get(reg));
					}
					else
					{
						results.append(regMapNarrow.get(reg));
						results.append(", ");
						results.append(regMapNarrow.get(rm));
					}
				}
				else
				{
					if (d == '0')
					{
						results.append(regMapWide.get(rm));
						results.append(", ");
						results.append(regMapWide.get(reg));
					}
					else
					{
						results.append(regMapWide.get(reg));
						results.append(", ");
						results.append(regMapWide.get(rm));
					}
				}

				System.out.println(results);


			}
		}
		catch(IOException ex)
		{
			ex.printStackTrace();
		}
		
        System.out.println();
    }
}
