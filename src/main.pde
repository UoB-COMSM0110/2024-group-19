PImage backgroundImage, characterImage, bulletImage, zombieImage, buttonImage, gameOverImage, heartImage, treeImage, portalImage, rapidFireImage, speedImage,gameStartImage;
Character player;
Background background;
BulletManager bulletManager;
EnemyManager enemyManager;
CollisionManager collisionManager;
PageManager pageManager;
TreeManager treeManager;
ObstacleManager obstacleManager;
PowerUpManager powerUpManager;
PlayerScore playerScore;
float mapX, mapY;
int playerSpeed = 2, playerHealth = 5, previousScore = 0;
PFont font;
String playerName = ""; 


void setup() {
  // Set renderer to P2D or it lags horrifically.
  fullScreen(P2D);
  characterImage = loadImage("../Assets/character.png");
  //characterImage.resize(width/20, height/20);
  backgroundImage = loadImage("../Assets/background.png");
  backgroundImage.resize(width*3, height*3);
  bulletImage = loadImage("../Assets/bullet.png");
  bulletImage.resize(20,20);
  zombieImage = loadImage("../Assets/enemy.png");
  zombieImage.resize(zombieImage.width/11, zombieImage.height/11);
  gameStartImage = loadImage("../Assets/gameStart.png");
  gameStartImage.resize(width, height);
  buttonImage = loadImage("../Assets/button.png");
  gameOverImage = loadImage("../Assets/gameOver.png");
  heartImage = loadImage("../Assets/heart.png");
  heartImage.resize(50,50);
  treeImage = loadImage("../Assets/tree.png");
  treeImage.resize(50,50);
  portalImage = loadImage("../Assets/portal.png");
  portalImage.resize(50,95);
  speedImage = loadImage("../Assets/speed.png");
  speedImage.resize(72,50);
  rapidFireImage = loadImage("../Assets/3bullet.png");
  rapidFireImage.resize(80,25);
  

  font= createFont("../Assets/data/Eight-Bit Madness.ttf", 180);
  //font = loadFont("../Assets/data/Silom-48.vlw");
  textFont(font);

  
  mapX = backgroundImage.width;
  mapY = backgroundImage.height;
  player = new Character(mapX / 2, mapY / 2, playerSpeed, characterImage, playerHealth);
  background = new Background(player, mapX, mapY, backgroundImage);
  bulletManager = new BulletManager(mapX, mapY, bulletImage, player);
  enemyManager = new EnemyManager(mapX, mapY, player, zombieImage);
  collisionManager = new CollisionManager(player, enemyManager, bulletManager);
  pageManager = new PageManager(player, 1, enemyManager, bulletManager);
  BoundaryChecker boundaryChecker = new BoundaryChecker(player, mapX, mapY);
  treeManager = new TreeManager(treeImage, mapX, mapY, 6000, boundaryChecker);
  // Power up probability currently hard-coded at 0.1, this can be adjusted later.
  powerUpManager = new PowerUpManager(mapX, mapY, player, 0.2, bulletManager);
  obstacleManager =new ObstacleManager("../src/obstacles.json");
  frameRate(300);
  //println(width + "," + height);
}



int loopCount = 0;
void draw() {
  //println(frameRate);
  
  switch(pageManager.pageNumber){
    case 1:
      pageManager.gameStart();
      break;
    case 2:
      pageManager.enterName();
      pageManager.displayPlayerName();
      break;
    case 3:
      pageManager.story();
      break;
    case 4:
      pageManager.homePage();
      break;
    case 5:
      pageManager.InstructionPage();
      break;
    case 6:
      if(player.health == 0){
        previousScore = player.score;
        gameReset();
        break;
      }
      background.update();
      
      player.update();
      background.update();
      obstacleManager.displayAll();
      bulletManager.update();
      player.display();
      enemyManager.update();
      collisionManager.update();
      powerUpManager.update();
      //background.update();
      treeManager.drawTrees(background);
      
      pageManager.StatisticsDisplay();
      //println(frameRate);
      break;
      case 7:
        pageManager.gameOverPage(previousScore);
        if(loopCount == 0){
          pageManager.addScore();
        }
        
        loopCount++;
        break;
      case 8:
         pageManager.leaderboard();
         break;
      case 9:
         pageManager.helpPage();
         break;
      case 10:
         pageManager.MenuTwoPage();
         break;
   
    }
   
}

void keyPressed(){
  if(pageManager.pageNumber == 6 || pageManager.pageNumber == 9 || pageManager.pageNumber == 10){
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
  pageManager = new PageManager(player, 7, enemyManager, bulletManager);
  powerUpManager = new PowerUpManager(mapX, mapY, player, 0.2, bulletManager);
  loopCount = 0;
  
}
