class Vec{
    constructor(x, y){
        this.x = x;
        this.y = y;
    }

    plus(vec2){
        let newVec = new Vec();
        newVec.x = this.x + vec2.x;
        newVec.y = this.y + vec2.y;
        return newVec;
    }
    
    minus(vec2){
        let newVec = new Vec();
        newVec.x = this.x - vec2.x;
        newVec.y = this.y - vec2.y;
        return newVec;
    }

    get length(){
        return Math.sqrt( this.x*this.x + this.y*this.y );
    }
}

console.log(new Vec(1, 2).plus(new Vec(2, 3)));
console.log(new Vec(1, 2).minus(new Vec(2, 3)));
console.log(new Vec(3, 4).length);