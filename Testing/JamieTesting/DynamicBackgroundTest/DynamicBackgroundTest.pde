PImage backgroundImage;
float bgOffsetX; // Initial background offset X
float bgOffsetY; // Initial background offset X
float maxOffsetX;
float maxOffsetY;
float mapX;
float mapY;
int windowX = 800, windowY = 600;

boolean[] keys;
float playerSpeed = 10;

void settings() {
  size(windowX, windowY);
}
void setup() {
  
  // Load the background image
  // Image sourced from CraftPix.net
  backgroundImage = loadImage("../test_background2.png");
  mapX = backgroundImage.width;
  mapY = backgroundImage.height;
  keys=new boolean[5];
  keys[0]=false;
  keys[1]=false;
  keys[2]=false;
  keys[3]=false;
  keys[4]=false;
  
  maxOffsetX = -(mapX-windowX);
  maxOffsetY = -(mapY-windowY);
  bgOffsetX = maxOffsetX/2;
  bgOffsetY = maxOffsetY/2;
 
}

void draw() {
  background(255);
  
  // Draw the background image
  image(backgroundImage, bgOffsetX, bgOffsetY);
  positionUpdate();
  
  
  // Draw the dot
  fill(255, 0, 0);
  ellipse(windowX/2, windowY/2, 20, 20);
}

void keyPressed() {
  if (keyCode == 'a' || keyCode == 'A') {
    keys[0]=true;
  } if (keyCode == 'd' || keyCode == 'D') {
    keys[1]=true;
  } if (keyCode == 's' || keyCode == 'S') {
    keys[2]=true;
  } if (keyCode == 'w' || keyCode == 'W') {
    keys[3]=true;
  } if (keyCode == 32) {
    keys[4]=true;
  }
}

void keyReleased() {
  if (keyCode == 'a' || keyCode == 'A') {
    keys[0]=false;
  } 
  if (keyCode == 'd' || keyCode == 'D') {
    keys[1]=false;
  } 
  if (keyCode == 's' || keyCode == 'S') {
    keys[2]=false;
  } 
  if (keyCode == 'w' || keyCode == 'W') {
    keys[3]=false;
  } 
  if (keyCode == 32) {
    keys[4]=false;
  }
}

void positionUpdate(){
  if (keys[0]){
    bgOffsetX += playerSpeed;
  }
  if (keys[1]){
    bgOffsetX -= playerSpeed;
  }
  if (keys[2]){
    bgOffsetY -= playerSpeed;
  }
  if (keys[3]){
    bgOffsetY += playerSpeed;
  }
  boundaryChecker();
  
  
 }
 
void boundaryChecker(){
  if(bgOffsetX<maxOffsetX){
    bgOffsetX = maxOffsetX;
  } if(bgOffsetX>0){
    bgOffsetX = 0;
  } if(bgOffsetY<maxOffsetY){
    bgOffsetY = maxOffsetY;
  } if(bgOffsetY>0){
    bgOffsetY = 0;
  }
}
 
 
