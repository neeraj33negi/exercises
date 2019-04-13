function every(array, test) {
    let flag = true;
    for( let i = 0; i < array.length; ++i ){
        flag = flag && test( array[i] );
    }
    return flag;
}
  
  console.log(every([1, 3, 5], n => n < 10));
  console.log(every([2, 4, 16], n => n < 10));
  console.log(every([], n => n < 10));