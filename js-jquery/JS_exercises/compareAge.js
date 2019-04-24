class User{
	constructor(name, age){
		this.name = name;
		this.age = age;
	}

	compareAge(user){
		let returnStr = " is older than ";
		return ( this.age > user.age ) ? this.name + returnStr + user.name : user.name + returnStr + this.name;
	};
}

let user1 = new User("neeraj", 10);
let user2 = new User("shubham", 20);

console.log( user1.compareAge(user2) );

