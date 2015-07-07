package com.crossover

class Department {
	static belongsTo = [company: Company]

	String name

    static constraints = {
    }
}
