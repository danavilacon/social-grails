package com.crossover

class Department {
	static hasMany = [users: User]
	static belongsTo = [company: Company]

	String name

    static constraints = {
    }
}
