package com.crossover

class Blog {
	static hasMany = [posts: Post]
	static belongsTo = [department: Department]

	String name
	String description

    static constraints = {
    }
}
