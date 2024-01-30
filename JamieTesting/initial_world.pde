float playerX, playerY;
float playerSpeed = 3;
boolean[] keys;
PImage bground;


void setup(){
  size(800,600);
  playerX = width/2;
  playerY = height/2;
  keys=new boolean[5];
  keys[0]=false;
  keys[1]=false;
  keys[2]=false;
  keys[3]=false;
  keys[4]=false;
  bground = loadImage("test_background.png");
}

void draw(){
  background(bground);
  positionUpdate();
  
  // Draw the player as a red circle
  fill(255, 0, 0); // Red color
  ellipse(playerX, playerY, 20, 20); // Draw the player
  
}
void keyPressed() {
  if (keyCode == 'a' || keyCode == 'A') {
    keys[0]=true;
  } else if (keyCode == 'd' || keyCode == 'D') {
    keys[1]=true;
  } else if (keyCode == 's' || keyCode == 'S') {
    keys[2]=true;
  } else if (keyCode == 'w' || keyCode == 'W') {
    keys[3]=true;
  } else if (keyCode == 32) {
    keys[4]=true;
  }
}

void keyReleased() {
  if (keyCode == 'a' || keyCode == 'A') {
    keys[0]=false;
  } 
  else if (keyCode == 'd' || keyCode == 'D') {
    keys[1]=false;
  } 
  else if (keyCode == 's' || keyCode == 'S') {
    keys[2]=false;
  } 
  else if (keyCode == 'w' || keyCode == 'W') {
    keys[3]=false;
  } 
  else if (keyCode == 32) {
    keys[4]=false;
  }
}

void positionUpdate(){
  if (keys[0]){
    playerX -= playerSpeed;
  }
  if (keys[1]){
    playerX += playerSpeed;
  }
  if (keys[2]){
    playerY += playerSpeed;
  }
  if (keys[3]){
    playerY -= playerSpeed;
  }
 }
