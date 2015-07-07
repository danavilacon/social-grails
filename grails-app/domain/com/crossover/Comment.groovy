package com.crossover

class Comment {
	static belongsTo = [user: User, post: Post]

	String content
	Integer rating

    static constraints = {
    	rating range: 1..5
    }
}
