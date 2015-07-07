package com.crossover

class Company {
	static hasMany = [departments: Department]

	String name

    static constraints = {
    }
}
