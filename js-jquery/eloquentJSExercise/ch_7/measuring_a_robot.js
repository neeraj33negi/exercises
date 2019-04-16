
function countSteps(state, robot, memory) {
    for (let steps = 0;; ++steps) {
      if (state.parcels.length == 0) {
        return steps;
      }
      let action = robot(state, memory);
      state = state.move(action.direction);
      memory = action.memory;
    }
  }


function compareRobots(robot1, memory1, robot2, memory2) {
    let steps1 = 0, steps2 = 0;
    for(let i = 0; i < 100; ++i){
        let state = VillageState.random();
        steps1 += countSteps( state, robot1, memory1 );
        steps2 += countSteps( state, robot2, memory2 );
    }
    console.log( `Robot1 took ${steps1/100} on avg and and robot2 took ${steps2/100} on avg` );
}
  
compareRobots(routeRobot, [], goalOrientedRobot, []);