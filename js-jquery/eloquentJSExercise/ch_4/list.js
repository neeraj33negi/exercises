function arrayToList(array){
    let list = new Object();
    let origin = list;
    let i = 0;
    for( ; i < array.length-1; ++i ){
        list["value"] = array[i];
        list["rest"] = new Object();
        list = list.rest;
        
    }
    list["value"] = array[i];
    list["rest"] = null;
    return origin;
}

function listToArray(list){
    let array = new Array();
    let temp = list;
    while(temp){
        array.push( temp["value"] );
        temp = temp["rest"];
    }
    return array;
}

function prepend(element, list){
    let newList = new Object();
    newList["value"] = element;
    newList["rest"] = list;
    return newList;
}

function nth( list, n ){
    if( list == null ){
        return undefined;
    }
    if( n == 0 ){
        return list["value"];
    }
    return nth(list["rest"], n-1);
}

const array = [1,2];
let list = arrayToList( array );
//console.log( list );
let newArr = listToArray( list );
//console.log( newArr );
//console.log( prepend(10, prepend(20,null)) );
console.log(nth(arrayToList([10, 20, 30, 70]), 11));