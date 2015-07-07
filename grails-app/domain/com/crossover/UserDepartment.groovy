package com.crossover

class UserDepartment {
	static belongsTo = [user: User, department: Department]

    static constraints = {
    }
}
