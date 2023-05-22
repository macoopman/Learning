package com.coopman.calculator;

import static org.junit.jupiter.api.Assertions.assertEquals;
import org.junit.jupiter.api.Test;


public class CalculatorTest{
	
	@Test
	public void testAdd(){
		var calc = new Calculator();
		var result = calc.add(10,50);
		assertEquals(60, result, 0);
	}
}
