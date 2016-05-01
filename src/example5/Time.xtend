/*******************************************************************************
 * Copyright (c) 2012 itemis AG (http://www.itemis.eu) and others.
 * All rights reserved. This program and the accompanying materials
 * are made available under the terms of the Eclipse Public License v1.0
 * which accompanies this distribution, and is available at
 * http://www.eclipse.org/legal/epl-v10.html
 * 
 * Author - Sven Efftinge
 *******************************************************************************/
package example5

import org.eclipse.xtend.lib.annotations.Data
import java.math.BigDecimal

@Data class Time {
	BigDecimal msec
	
	def operator_plus(Time other) {
		new Time(this.msec + other.msec)
	}
	
	def operator_minus(Time other) {
		new Time(this.msec - other.msec)
	}

	def operator_multiply(int times) {
		new Time(this.msec * new BigDecimal(times))
	}
	
	def operator_divide(int times) {
		new Time(this.msec / new BigDecimal(times))
	}
	
	def static msec(int msec) {
		new Time(new BigDecimal(msec))
	}
	
	def static sec(int sec) {
		msec(sec * 1000)
	}
	
	def static min(int min) {
		sec(min * 60)
	}
	
	def static h(int h) {
		min(h * 60)
	}
	def static h() {
		h(1)
	}
}