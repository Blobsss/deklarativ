let gamerlist = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
let shuffleOn = false;
let Sting = "Tryk på knappen for at shuffle";
let farver = [200, 200, 200]

function setup() {
  //laver canves 500,500 pixels
  createCanvas(500, 500);
  
  //vælger tilfældige farver
  farver[0] = random(0,255);
  farver[1] = random(0,255);
  farver[3] = random(0,255);
  
  
  //shufller listen og skriver den ud
  gamerlist = shuffleListDeclarative(gamerlist);
  console.log("før "+gamerlist)
  
  //sorter listen og skriver den ud
  gamerlist = mySortDeclarative(gamerlist);
  console.log("efter "+gamerlist)
}

function draw() {
  //bagrunden
  background(220);
  //tegner digramet
  fill(farver[0],farver[1],farver[2]);
  drawDiagram(gamerlist)
  //tegner teksten
  fill(0)
  text(Sting,50,50);
}

function mousePressed(){
  //ændre på bool om den skal sorter eller ej
  shuffleOn = !shuffleOn;
  
  
  if(shuffleOn){
    //shufllerliste og ændre teksten og farven
    Sting = "Tryk på knappen for at sort"
     gamerlist = shuffleListDeclarative(gamerlist);
    farver[0] = random(0,255);
        farver[1] = random(0,255);
        farver[3] = random(0,255);
     }else{
       //sorter liste og ændre teksten og farven
       Sting = "Tryk på knappen for at shuffle"
       gamerlist = mySortDeclarative(gamerlist);
       farver[0] = random(0,255);
        farver[1] = random(0,255);
        farver[3] = random(0,255);
     }
}

function shuffleListDeclarative(numArr = []) {
  //går arrayet igennem og ændre på pladserne tilfældigt
  numArr.map((currentValue, currentIndex, array) => {
    let randIdx = Math.floor(Math.random() * array.length);
    [array[currentIndex], array[randIdx]] = [array[randIdx], array[currentIndex]];
  });
  
  return numArr;
}

function mySortDeclarative(arr) {
  //går arrray igennem og for vært skridt finder den mindtse og sortere
  arr.forEach(function(el, idx) {
                let minIdx = idx + 1 + findMin(arr.slice(idx +1));
                if(el > arr[minIdx]) { 
                  [arr[minIdx], arr[idx]] = [arr[idx], arr[minIdx]];
                }
              });
  return arr;

}

function findMin(arr) {
  //finder den mindste
  return arr.reduce((minIdx, curVal, curIdx, myArr) => curVal < myArr[minIdx] ? curIdx : minIdx, 0);
}


function drawDiagram(gamerliste) {
  //tenger listen
  gamerliste.filter(function(current, index, arr) {

    rect(height / gamerliste.length * index, height, height / gamerliste.length, -gamerliste[index] * height / (gamerliste.length));
  });


}
