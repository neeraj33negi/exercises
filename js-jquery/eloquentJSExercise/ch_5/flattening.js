function flatten( arrayOfArrays ) {
  return arrayOfArrays.reduce( (x,y) => x.concat(y) );
}

console.log( flatten([[1, 2, 3], [4, 5], [6]]) );
