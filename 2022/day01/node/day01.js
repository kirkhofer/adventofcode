const fs = require('fs');

const content = fs.readFileSync('../input.txt','utf8');

const elves = content.split('\n\n');

console.log('elves: %d',elves.length);

let grp = [];

for(i=0;i < elves.length-1;i++)
{
    let caleries=0;
    elves[i].split('\n').forEach(function(val,index,array){
        caleries=caleries + parseInt(val);
    });
    // console.log("Calories: %d",caleries);
    grp.push(parseInt(caleries));
}

// Sort the array in place
grp.sort((a,b)=> a - b);
// const top3 = grp.sort((a,b)=> a - b).slice(-3);
let sum = grp.slice(-3).reduce((accumulator, value) => {
    return accumulator + parseInt(value);
  }, 0);

console.log("Answer to 1: %s",Math.max(...grp));
console.log("Answer to 2: %s",sum);


console.assert(Math.max(...grp) === 69281,"Answer 1 failed");
console.assert(sum === 201524,"Answer 2 failed");

/*
Answer 1:69281
Answer 2:201524
*/
// console.log(grp.slice(-3));
