class User{
	constructor(name, age){
		this.name = name;
		this.age = age;
	}

	compareAge(user){
		var returnStr = " is older than ";
		return ( this.age > user.age ) ? this.name + returnStr + user.name : user.name + returnStr + this.name;
	};
}

var user1 = new User("neeraj", 10);
var user2 = new User("shubham", 20);

console.log( user1.compareAge(user2) );
