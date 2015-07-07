package com.crossover

class Post {
	static belongsTo = [blog: Blog, user: User]
	static hasMany = [comments: Comment]

	String title
	String content

    static constraints = {
    	content(maxSize: 65000, markup:true)
    }
}
