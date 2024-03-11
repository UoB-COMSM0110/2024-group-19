float playerX, playerY;
float playerSpeed = 3;
PImage bground, button, cat, bulletImg, zombieImg, healthImg, gameover, instruction;
ArrayList<Bullet> bullets = new ArrayList<Bullet>();
float lastBulletTime = 0; 
Character player;
Enemy initEnemy;
ArrayList<Enemy> enemies = new ArrayList<Enemy>();

Page page;

int playerHealth = 5;
int pageNum;
int lastEnemySpawnTime = 0;
int enemiesSpawned = 0;
float safeDistance = 150; // Minimum distance from the player


void setup() {
  size(1500, 800);
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

void displayPlayerHealth(){
  // Display player's health in the top-left corner
  //fill(0); // Set text color to black for the health display
  //textSize(20); // Set text size for the health display
  //text("Health: " + player.health, 10, 20); // Position the text in the top-left corner

  // Display health icons
  for (int i = 0; i < player.health; i++) {
    image(healthImg, 10 + (healthImg.width + 5) * i, 10); // Adjust positioning as needed
  }
}

void handleGameLogic() {
  // Spawn enemies with a delay and check for maximum limit
  if (millis() - lastEnemySpawnTime > 1000 && enemiesSpawned < 5) { // 1-second gap
    spawnEnemy();
    lastEnemySpawnTime = millis();
    enemiesSpawned++;
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
  lastEnemySpawnTime = 0;
  enemiesSpawned = 0;
  // Any other necessary resets
}

void keyPressed() {
  if (keyCode == ENTER) {
    if (pageNum == 1) {
      pageNum = 2; // 从 gameStart 到 gameInstruct
    } else if (pageNum == 2) {
      pageNum = 3; // 从 gameInstruct 到 gameOn
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
  if (millis() - lastBulletTime > 500) {
    float bulletDirection = atan2(mouseY - player.y, mouseX - player.x); // 基于鼠标位置计算子弹方向
    bullets.add(new Bullet(player.x, player.y, playerSpeed, bulletDirection));
    lastBulletTime = millis();
  }
}

void spawnEnemy() {
  float enemyX, enemyY;
  do {
    enemyX = random(width);
    enemyY = random(height);
  } while (dist(enemyX, enemyY, player.x, player.y) < safeDistance); // Ensure enemy spawns away from player

  enemies.add(new Enemy(enemyX, enemyY, playerSpeed / 2, zombieImg, 3));
}
