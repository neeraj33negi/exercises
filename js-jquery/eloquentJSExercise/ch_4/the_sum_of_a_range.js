const range = (start, end, step=1) => {
    let arr = new Array();
    for( let i = start; i <= end; i+=step ){
        arr.push( i );
    }
    return arr;
}
const sum = array => {
    let sum = 0;
    for(let i = 0; i < array.length; ++i){
        sum += array[i];
    }
    return sum;
}

console.log( sum( range(1,10) ) );