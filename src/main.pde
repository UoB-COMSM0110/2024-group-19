PImage backgroundImage, characterImage;
Character player;
Background background;
float mapX, mapY;
int playerSpeed = 10, playerHealth = 5;

void setup() {
  fullScreen();
  //size(1500,1000);
  characterImage = loadImage("../Assets/character.png");
  backgroundImage = loadImage("../Assets/gameBackground.png");
  
  mapX = backgroundImage.width;
  mapY = backgroundImage.height;
  player = new Character(mapX / 2, mapY / 2, playerSpeed, characterImage, playerHealth);
  background = new Background(player, mapX, mapY, backgroundImage);

  
}




void draw() {
  println(frameRate);
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
