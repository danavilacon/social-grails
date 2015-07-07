package com.crossover

class Blog {
	static hasMany = [posts: Post]

	String name
	String description

    static constraints = {
    }
}
