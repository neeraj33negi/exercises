const box = {
  locked: true,
  unlock() {
    this.locked = false;
  },
  lock() {
    this.locked = true;
  },
  _content: [],
  get content() {
    if (this.locked) throw new Error("Locked!");
    return this._content;
  }
};

function withBoxUnlocked(body) {
  let isLocked = box.locked;
  if( !isLocked ) {
    console.log("unlocking....");
    return body();
  }
  try {
    box.unlock();
    return body();
  } catch(e) {
    return e;
  } finally {
    box.lock();
  }
}



withBoxUnlocked(function() {
  box.content.push("gold piece");
});

try {
  withBoxUnlocked(function() {
    throw new Error("Pirates on the horizon! Abort!");
    console.log("throw");
  });
} catch (e) {
  console.log( "Error raised:", e);
}
console.log(box.locked);
