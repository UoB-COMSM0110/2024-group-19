PImage backgroundImage, characterImage, bulletImage;
Character player;
Background background;
BulletManager bulletManager;
float mapX, mapY;
int playerSpeed = 3, playerHealth = 5;

void setup() {
  // Set renderer to P2D or it lags horrifically.
  fullScreen(P2D);
  characterImage = loadImage("../Assets/character.png");
  //characterImage.resize(width/20, height/20);
  backgroundImage = loadImage("../Assets/gameBackground.png");
  backgroundImage.resize(width*3, height*3);
  bulletImage = loadImage("../Assets/bullet.png");
  bulletImage.resize(20,20);
  
  mapX = backgroundImage.width;
  mapY = backgroundImage.height;
  player = new Character(mapX / 2, mapY / 2, playerSpeed, characterImage, playerHealth);
  background = new Background(player, mapX, mapY, backgroundImage);
  bulletManager = new BulletManager(mapX, mapY, bulletImage, player);
  frameRate(300);
  //println(width + "," + height);

  
}




void draw() {
  //println(frameRate);
  player.update();
  background.update();
  
  bulletManager.update();
  player.display();
  
}

void keyPressed(){
  player.keyPressed();
  }
  
void keyReleased(){
  player.keyReleased();
}
