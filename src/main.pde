PImage backgroundImage, characterImage, bulletImage, zombieImage;
Character player;
Background background;
BulletManager bulletManager;
EnemyManager enemyManager;
CollisionManager collisionManager;
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
  zombieImage = loadImage("../Assets/zombie.png");
  
  mapX = backgroundImage.width;
  mapY = backgroundImage.height;
  player = new Character(mapX / 2, mapY / 2, playerSpeed, characterImage, playerHealth);
  background = new Background(player, mapX, mapY, backgroundImage);
  bulletManager = new BulletManager(mapX, mapY, bulletImage, player);
  enemyManager = new EnemyManager(mapX, mapY, player, zombieImage);
  collisionManager = new CollisionManager(player, enemyManager, bulletManager);
  frameRate(300);
  //println(width + "," + height);
  

  
}




void draw() {
  //println(frameRate);
  player.update();
  background.update();
  
  bulletManager.update();
  player.display();
  enemyManager.update();
  collisionManager.update();
  //println(frameRate);
  
}

void keyPressed(){
  player.keyPressed();
  }
  
void keyReleased(){
  player.keyReleased();
}
