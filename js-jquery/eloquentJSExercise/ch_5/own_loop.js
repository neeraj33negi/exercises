function loop( value, testFunction, updateFunction, bodyFunction) {
  while ( testFunction(value) ) {
    bodyFunction( value );
    value = updateFunction( value );
  }
}

loop(3, n => n > 0, n => n - 1, console.log);
