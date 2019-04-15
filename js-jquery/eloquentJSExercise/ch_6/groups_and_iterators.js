class Group{
    constructor(){
        this.count = 0;
        this.set = new Array(); 
        this.bitMap = new Object(); //to check the existence of an element
    }
    add( element ){
        if( this.bitMap[element] == undefined ){
            this.set.push( element );
            this.count++;
            this.bitMap[element] = 1;
        }
    }

    delete( element ){
        if( this.bitMap[element] == undefined ){
            //element doesn't exist
        }else{
            this.set.splice( this.set.indexOf( x => x === element ) ); // O(n)
            delete this.bitMap[element];
            this.count--; 
        }
    }

    has( element ){
        return ( this.bitMap[element] == 1 );
    }

    static from( iterable ){
        let newObj = new Group();
        for( let element of iterable ){
            newObj.add( element );
        }
        return newObj;
    }
}


class GroupIterator{
    constructor(group){
        this.group = group;
        this.count = this.group.count;
        this.current = 0;
    }

    next(){
        if( this.current == this.count ){
            return {done: true};
        }
        let value =  this.group.set[this.current];
        this.current++;
        return {value: value, done: false};
    }
}

Group.prototype[Symbol.iterator] = function(){
    return new GroupIterator(this);
};

// let group = Group.from([10, 20]);
// group.add(30);
// console.log( group.set );
// console.log(group.has(10));
// console.log(group.has(30));
// console.log( group.set );
// group.add(10);
// group.delete(10);
// console.log(group.has(10));
for (let value of Group.from(["a", "b", "c"])) {
    console.log(value);
}