PImage backgroundImage, characterImage;
Character player;
Background background;
float mapX, mapY;
int playerSpeed = 5, playerHealth = 5;

void setup() {
  // Set renderer to P2D or it lags horrifically.
  fullScreen(P2D);
  characterImage = loadImage("../Assets/character.png");
  backgroundImage = loadImage("../Assets/gameBackground.png");
  
  mapX = backgroundImage.width;
  mapY = backgroundImage.height;
  player = new Character(mapX / 2, mapY / 2, playerSpeed, characterImage, playerHealth);
  background = new Background(player, mapX, mapY, backgroundImage);
  frameRate(300);
  println(width + "," + height);

  
}




void draw() {
  //println(frameRate);
  player.update();
  background.update();
  player.display();
}

void keyPressed(){
  player.keyPressed();
  }
  
void keyReleased(){
  player.keyReleased();
}
