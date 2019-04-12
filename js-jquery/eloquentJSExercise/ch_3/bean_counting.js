function countBs(string){
    let numBs = 0;
    for( let i = 0; i < string.length; ++i ){
        if( string[i] == 'B' ){
            numBs++;
        }
    }
    return numBs;
}

function countChar(string, char){
    let numChars = 0;
    for( let i = 0; i < string.length; ++i ){
        if(string[i] == char){
            numChars++;
        }
    }
    return numChars;
}

console.log( countBs("BBSB") );
console.log( countChar("BBSB", 'B') );
console.log( countChar("kakkerlak", "k") );