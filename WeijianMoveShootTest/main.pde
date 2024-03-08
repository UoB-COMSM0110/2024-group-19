float playerX, playerY;
float playerSpeed = 3;
PImage bground, button, cat, bulletImg, zombieImg, healthImg;
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
  button = loadImage("gameBackground.png");
  
  zombieImg = loadImage("zombie.png");
  cat = loadImage("maleAdventurer.png");
  bulletImg = loadImage("bullet.png"); 
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
  
  if (pageNum == 1) { // Welcome screen
    page.gameStart();
  } //else if (pageNum == 2) { // game over screen
    //page.gameOver();
    else {
        if (player.health > 0) {
    player.update();
    player.display();
    // Handle game logic only if the player is alive
    handleGameLogic();
  } else {
    // Display game over message
    fill(255, 0, 0); // Set text color to red
    textSize(32); // Set text size
    text("Player is Dead", width / 2 - 100, height / 2); // Position the text in the middle
  }

  
  displayPlayerHealth();
    }

}


void keyPressed() {
  player.keyPressed();
}

void keyReleased() {
  player.keyReleased();
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
