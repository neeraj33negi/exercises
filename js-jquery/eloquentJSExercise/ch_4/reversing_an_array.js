function reverseArray(array){
    let reversedArray = new Array();
    for( let i = array.length - 1; i >= 0; --i ){
        reversedArray.push( array[i] );
    }
    return reversedArray;
}

function reverseArrayInPlace( array ){
    let i = 0, j = array.length-1;
    while( i < j ){
        let temp = array[i];
        array[i] = array[j];
        array[j] = temp;
        i++;
        j--;
    }
    return array;
}

let array = [1,3,3,4,5,6,9];
console.log(reverseArray(array));
console.log(reverseArrayInPlace(array));