float playerX, playerY;
float playerSpeed = 3;
PImage bground, button, cat, bulletImg, zombieImg, healthImg, gameover, instruction;
ArrayList<Bullet> bullets = new ArrayList<Bullet>();
float lastBulletTime = 0; 
Character player;
ArrayList<Enemy> enemies = new ArrayList<Enemy>();
int waveNum=0;
Round currentRound;

Page page;
public int scorePoint = 0;
int playerHealth = 5;
int pageNum;
int lastRoundTime = 0, lastEnemySpawned = 0;
int enemiesSpawned = 0;
float safeDistance = 150; // Minimum distance from the player


void setup() {
  fullScreen(P2D);
  page = new Page();
  pageNum = 1;
  playerX = width / 2;
  playerY = height / 2;
  bground = loadImage("gameBackground.png");
  bground.resize(width, height);
  instruction = loadImage("./Asset/instruction/instruction.png");
  button = loadImage("./Asset/button/platformPack_tile004.png");
  gameover = loadImage("./Asset/gameover/game_over.png");
  
  zombieImg = loadImage("zombie.png");
  zombieImg.resize(70,70);
  cat = loadImage("./Asset/character/1.png");
  bulletImg = loadImage("bullet.png"); 
  bulletImg.resize(20,20);
  healthImg = loadImage("health.png");

  player = new Character(width / 2, height / 2, playerSpeed, cat, playerHealth);
  
}


void updateEnemyAndBulletCollisions() {
    // Assuming you have a method to handle bullet-enemy collisions already
    handleBulletCollisions();

    // Remove dead enemies
    enemies.removeIf(enemy -> enemy.health <= 0);
}

void handleBulletCollisions() {
    ArrayList<Bullet> bulletsToRemove = new ArrayList<Bullet>();
    for (Enemy enemy : enemies) {
        for (Bullet bullet : bullets) {
            if (enemy.bulletCollision(bullet)) {
                addScore();
                bulletsToRemove.add(bullet); // Mark bullet for removal
            }
        }
    }
    bullets.removeIf(bulletsToRemove::contains); // Remove bullets that collided
}

void handleCharacterCollisions(){
  for(Enemy enemy : enemies){
    player.enemyCollision(enemy, millis());
    break;
  }
}

void displayPlayerOxygen() {
  // Display the oxygen bar, perhaps as a simple rectangle that decreases/increases
  fill(0, 0, 255); // Blue color for oxygen
  rect(width/150, height*0.05, (player.oxygenLevel * (width * 0.00266)), height/35,height*0.02); // Example: 200px wide when full
}

void displayPlayerHealth(){
  // Display player's health in the top-left corner
  //fill(0); // Set text color to black for the health display
  //textSize(20); // Set text size for the health display
  //text("Health: " + player.health, 10, 20); // Position the text in the top-left corner

  // Display health icons
  for (int i = 0; i < player.health; i++) {
    image(healthImg, (width/60 + (healthImg.width + width*(5/1500)) * i), (height/40)); // Adjust positioning as needed
  }
}

void displayScore(){
  // display score top left 
 fill(0);
 textSize(40);
 text("Score:" + scorePoint , (width*(0.8666)),(height*0.0625));
}

void displayWaveNum(){
  // display score top left 
 fill(0);
 textSize(40);
 text("Waves:" + waveNum , (width*(0.8666)),height*0.1);
}

void addScore(){
  scorePoint = scorePoint + 10;
}

void handleGameLogic() {
  // Spawn enemies with a delay and check for maximum limit
  if (waveNum == 0 || millis() - lastRoundTime > currentRound.roundTime || (enemies.size() == 0 && player.oxygenLevel==100)) { 
    currentRound = new Round(++waveNum);
    lastRoundTime = millis();
  }
  
  if(millis()-lastEnemySpawned > 700 && currentRound.leftToSpawn > 0){
    spawnEnemy();
    lastEnemySpawned = millis();
    currentRound.spawn();
  }
  

  autoShoot();
  updateEnemyAndBulletCollisions(); // Handle updateEnemyAndBulletCollisions, including removing dead enemies
  handleCharacterCollisions();

  // Update and display enemies
  for (Enemy enemy : enemies) {
    enemy.updatePlayerPosition(player);
    enemy.update();
    enemy.display();
  }

  // 更新和绘制子弹
  for (Bullet b : bullets) {
    b.update();
    b.display();
  }
  
  // 移除飞出屏幕的子弹
  bullets.removeIf(bullet -> bullet.isOffScreen());
}



void draw() {
  background(bground);

  switch (pageNum) {
    case 1: // Welcome screen
      page.gameStart();
      break;
    case 2: // Instructions screen
      page.gameInstruct();
      break;
    case 3: // Game is on
      if (player.health > 0) {
        player.update();
        player.display();
        handleGameLogic();
        displayPlayerHealth();
        displayPlayerOxygen();
        displayScore();
        displayWaveNum();
      } else {
        pageNum = 4; // Move to game over screen
      }
      break;
    case 4: // Game over screen
      page.gameOver();
      break;
  }
}

void mousePressed() {
  // 如果当前页面是游戏说明页面，点击鼠标进入游戏
  if (pageNum == 2) {
    pageNum = 3; // 进入游戏
  } 
  // 如果当前页面是游戏结束页面，点击鼠标重启游戏
  else if (pageNum == 4) {
    resetGame(); // 重置游戏状态
    pageNum = 1; // 返回游戏开始页面
  }
}


void resetGame() {
  // Reset player health, position, and other necessary states to start a new game
  player.health = playerHealth;
  player.x = width / 2;
  player.y = height / 2;
  enemies.clear();
  bullets.clear();
  lastRoundTime = 0;
  enemiesSpawned = 0;
  waveNum =0;
  scorePoint = 0;
  for (int i = 0; i < player.keys.length; i++) {
    player.keys[i] = false;
}
  // Any other necessary resets
}

void keyPressed() {
  if (keyCode == ENTER) {
    if (pageNum == 1) {
      pageNum = 2; // 从 gameStart 到 gameInstruct
    } else if (pageNum == 2) {
      pageNum = 3; // 从 gameInstruct 到 gameOn
    } else if (pageNum == 4){
      resetGame();
      pageNum = 2;
    }
  }

  // 处理玩家的其他按键输入，比如移动控制
  if (pageNum == 3) { // 确保只有在游戏进行中时才处理玩家控制
    player.keyPressed();
  }
}

void keyReleased() {
  if (pageNum == 3) { // 确保只有在游戏进行中时才处理玩家控制
    player.keyReleased();
  }
}

void autoShoot() {
  if (millis() - lastBulletTime > 250) {
    float bulletDirection = atan2(mouseY - player.y, mouseX - player.x); // 基于鼠标位置计算子弹方向
    bullets.add(new Bullet(player.x, player.y-bulletImg.height, playerSpeed, bulletDirection));
    lastBulletTime = millis();
  }
}

void spawnEnemy() {
  float enemyX, enemyY;
  do {
    enemyX = random(width);
    enemyY = random(height);
  } while (dist(enemyX, enemyY, player.x, player.y) < safeDistance); // Ensure enemy spawns away from player

    enemies.add(new Enemy(enemyX, enemyY, currentRound.enemySpeed, zombieImg, currentRound.averageHealth));
    for(Enemy zomb:enemies){
      //System.out.println(zomb.speed);
    }
  }
 
  