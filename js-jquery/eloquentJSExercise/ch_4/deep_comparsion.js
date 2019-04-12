function deepEqual( val1, val2 ){
    if( val1!=null && val2!=null ){      //null check
        if( typeof val1 == "object" && typeof val2 == "object"){
            let flag = true;
            let keys1 = Object.keys( val1 );
            let keys2 = Object.keys( val2 );
            if( keys1.length == keys2.length ){
                for( let i = 0; i < keys1.length; ++i ){
                    if( keys1[i] === keys2[i] ){
                        flag = flag && deepEqual( val1[keys1[i]], val2[keys2[i] ] ); //recursively match keys
                    }else{
                        flag = false;
                    }
                }
                return flag;
            }else{
                return false;
            }

        }else{
            return val1 === val2;
        }
    }else{
        return val1 === val2;
    }
}

let obj = {here: {is: "an"}, object: 2};
console.log(deepEqual(obj, obj));
console.log(deepEqual(obj, {here: 1, object: 2}));
console.log(deepEqual(obj, {here: {is: "an"}, object: 2}));