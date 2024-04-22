PImage backgroundImage, characterImage, bulletImage, zombieImage, buttonImage, gameOverImage, heartImage, treeImage, portalImage, rapidFireImage, speedImage,gameStartImage;
ArrayList<PImage> characterWalkingForward = new ArrayList(), characterWalkingBackward = new ArrayList(), characterWalkingLeft = new ArrayList(), characterWalkingRight = new ArrayList(), characterStationary = new ArrayList();
ArrayList<PImage> enemyWalkingForward = new ArrayList(), enemyWalkingBackward = new ArrayList(), enemyWalkingLeft = new ArrayList(), enemyWalkingRight = new ArrayList(), enemyStationary = new ArrayList();
Character player;
boolean hardMode;
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
  zombieImage = loadImage("../Assets/enemyWalking/tile000.png");
  zombieImage.resize(64,96);
  //zombieImage.resize(zombieImage.width/11, zombieImage.height/11);
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
  
  characterWalkingForward.add(loadImage("../Assets/characterWalking/tile000.png"));
  characterWalkingForward.add(loadImage("../Assets/characterWalking/tile001.png"));
  characterWalkingForward.add(loadImage("../Assets/characterWalking/tile002.png"));
  characterWalkingForward.add(loadImage("../Assets/characterWalking/tile003.png"));
  
  characterWalkingLeft.add(loadImage("../Assets/characterWalking/tile004.png"));
  characterWalkingLeft.add(loadImage("../Assets/characterWalking/tile005.png"));
  characterWalkingLeft.add(loadImage("../Assets/characterWalking/tile006.png"));
  characterWalkingLeft.add(loadImage("../Assets/characterWalking/tile007.png"));
  
  characterWalkingRight.add(loadImage("../Assets/characterWalking/tile008.png"));
  characterWalkingRight.add(loadImage("../Assets/characterWalking/tile009.png"));
  characterWalkingRight.add(loadImage("../Assets/characterWalking/tile010.png"));
  characterWalkingRight.add(loadImage("../Assets/characterWalking/tile011.png"));
  
  characterWalkingBackward.add(loadImage("../Assets/characterWalking/tile012.png"));
  characterWalkingBackward.add(loadImage("../Assets/characterWalking/tile013.png"));
  characterWalkingBackward.add(loadImage("../Assets/characterWalking/tile014.png"));
  characterWalkingBackward.add(loadImage("../Assets/characterWalking/tile015.png"));
  
  characterStationary.add(loadImage("../Assets/characterWalking/tile000.png"));
  characterStationary.add(loadImage("../Assets/characterWalking/tile000.png"));
  characterStationary.add(loadImage("../Assets/characterWalking/tile000.png"));
  characterStationary.add(loadImage("../Assets/characterWalking/tile000.png"));
  
  enemyWalkingForward.add(loadImage("../Assets/enemyWalking/tile000.png"));
  enemyWalkingForward.add(loadImage("../Assets/enemyWalking/tile001.png"));
  enemyWalkingForward.add(loadImage("../Assets/enemyWalking/tile002.png"));
  enemyWalkingForward.add(loadImage("../Assets/enemyWalking/tile003.png"));
  
  enemyWalkingLeft.add(loadImage("../Assets/enemyWalking/tile004.png"));
  enemyWalkingLeft.add(loadImage("../Assets/enemyWalking/tile005.png"));
  enemyWalkingLeft.add(loadImage("../Assets/enemyWalking/tile006.png"));
  enemyWalkingLeft.add(loadImage("../Assets/enemyWalking/tile007.png"));
  
  enemyWalkingRight.add(loadImage("../Assets/enemyWalking/tile008.png"));
  enemyWalkingRight.add(loadImage("../Assets/enemyWalking/tile009.png"));
  enemyWalkingRight.add(loadImage("../Assets/enemyWalking/tile010.png"));
  enemyWalkingRight.add(loadImage("../Assets/enemyWalking/tile011.png"));
  
  enemyWalkingBackward.add(loadImage("../Assets/enemyWalking/tile012.png"));
  enemyWalkingBackward.add(loadImage("../Assets/enemyWalking/tile013.png"));
  enemyWalkingBackward.add(loadImage("../Assets/enemyWalking/tile014.png"));
  enemyWalkingBackward.add(loadImage("../Assets/enemyWalking/tile015.png"));
  
  enemyStationary.add(loadImage("../Assets/enemyWalking/tile000.png"));
  enemyStationary.add(loadImage("../Assets/enemyWalking/tile000.png"));
  enemyStationary.add(loadImage("../Assets/enemyWalking/tile000.png"));
  enemyStationary.add(loadImage("../Assets/enemyWalking/tile000.png"));
  
  
  

  font= createFont("../Assets/data/Eight-Bit Madness.ttf", 180);
  //font = loadFont("../Assets/data/Silom-48.vlw");
  textFont(font);

  
  mapX = backgroundImage.width;
  mapY = backgroundImage.height;
  player = new Character(mapX / 2, mapY / 2, playerSpeed, characterImage, playerHealth);
  background = new Background(player, mapX, mapY, backgroundImage);
  bulletManager = new BulletManager(mapX, mapY, bulletImage, player);
  enemyManager = new EnemyManager(mapX, mapY, player, zombieImage);
  obstacleManager =new ObstacleManager("../src/obstacles.json");
  collisionManager = new CollisionManager(player, enemyManager, bulletManager, obstacleManager);
  pageManager = new PageManager(player, 1, enemyManager, bulletManager);
  BoundaryChecker boundaryChecker = new BoundaryChecker(player, mapX, mapY);
  treeManager = new TreeManager(treeImage, mapX, mapY, 6000, boundaryChecker);
  // Power up probability currently hard-coded at 0.1, this can be adjusted later.
  powerUpManager = new PowerUpManager(mapX, mapY, player, 0.2, bulletManager);
  
  frameRate(300);
  //println(width + "," + height);
}



int loopCount = 0;
void draw() {
  
  switch(pageManager.pageNumber){
    case 1:
      pageManager.gameStart();
      break;
    case 2:
      pageManager.enterName();
      pageManager.displayPlayerName();
      break;
    case 3:
      pageManager.difficultySelection();
      break;
    case 4:
      pageManager.story();
      break;
    case 5:
      pageManager.homePage();
      break;
    case 6:
      pageManager.InstructionPage();
      break;
    case 7:
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
      treeManager.drawTrees(background);
      
      pageManager.StatisticsDisplay();
      //println(frameRate);
      break;
      case 8:
        pageManager.gameOverPage(previousScore);
        if(loopCount == 0){
          pageManager.addScore();
        }
        
        loopCount++;
        break;
      case 9:
         pageManager.leaderboard();
         break;
      case 10:
         pageManager.MenuTwoPage();
         break;
   
    }
   
}

void keyPressed(){
  if(pageManager.pageNumber == 7 || pageManager.pageNumber == 10){
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
  obstacleManager = new ObstacleManager("../src/obstacles.json");
  collisionManager = new CollisionManager(player, enemyManager, bulletManager, obstacleManager);
  pageManager = new PageManager(player, 8, enemyManager, bulletManager);
  powerUpManager = new PowerUpManager(mapX, mapY, player, 0.2, bulletManager);
  loopCount = 0;
  
}
