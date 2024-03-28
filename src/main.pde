PImage backgroundImage, characterImage, bulletImage, zombieImage, buttonImage, gameOverImage;
Character player;
Background background;
BulletManager bulletManager;
EnemyManager enemyManager;
CollisionManager collisionManager;
PageManager pageManager;
float mapX, mapY;
int playerSpeed = 3, playerHealth = 5, previousScore = 0;

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
  buttonImage = loadImage("../Assets/button.png");
  gameOverImage = loadImage("../Assets/gameOver.png");
  
  mapX = backgroundImage.width;
  mapY = backgroundImage.height;
  player = new Character(mapX / 2, mapY / 2, playerSpeed, characterImage, playerHealth);
  background = new Background(player, mapX, mapY, backgroundImage);
  bulletManager = new BulletManager(mapX, mapY, bulletImage, player);
  enemyManager = new EnemyManager(mapX, mapY, player, zombieImage);
  collisionManager = new CollisionManager(player, enemyManager, bulletManager);
  pageManager = new PageManager(player, 1);
  
  frameRate(300);
  //println(width + "," + height);
  

  
}




void draw() {
  //println(frameRate);
  switch(pageManager.pageNumber){
    case 1:
      pageManager.gameStart();
      break;
    case 2:
      pageManager.homePage();
      break;
    case 3:
      if(player.health == 0){
        previousScore = player.score;
        gameReset();
        break;
      }
      background.update();
      player.update();
      background.update();
      
      bulletManager.update();
      player.display();
      enemyManager.update();
      collisionManager.update();
      pageManager.StatisticsDisplay();
      //println(frameRate);
      break;
      case 4:
        pageManager.gameOverPage(previousScore);
        
        break;
    }     
}

void keyPressed(){
  if(pageManager.pageNumber == 3){
    player.keyPressed();
  }
  else{
    pageManager.keyPressed();
  }
  
  }
  
void keyReleased(){
  player.keyReleased();
}

void gameReset(){
  player = new Character(mapX / 2, mapY / 2, playerSpeed, characterImage, playerHealth);
  background = new Background(player, mapX, mapY, backgroundImage);
  bulletManager = new BulletManager(mapX, mapY, bulletImage, player);
  enemyManager = new EnemyManager(mapX, mapY, player, zombieImage);
  collisionManager = new CollisionManager(player, enemyManager, bulletManager);
  pageManager = new PageManager(player, 4);
  
}
