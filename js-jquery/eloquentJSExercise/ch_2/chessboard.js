let size = 10;
let string = "";
for (let i = 0; i < size; ++i) {
	for (let j = 0; j < size; ++j) {
		if( (i + j) % 2 == 0 ) {
			string += " ";
		} else {
			string += "#";
		}
	}
	string += '\n';
}
console.log(string);
