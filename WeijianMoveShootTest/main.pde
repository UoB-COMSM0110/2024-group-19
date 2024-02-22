float playerX, playerY;
float playerSpeed = 3;
PImage bground, cat, bulletImg, zombieImg;
ArrayList<Bullet> bullets = new ArrayList<Bullet>();
float lastBulletTime = 0; 
Character player;
Enemy initEnemy;
ArrayList<Enemy> enemies = new ArrayList<Enemy>();

int lastEnemySpawnTime = 0;
int enemiesSpawned = 0;
float safeDistance = 150; // Minimum distance from the player


void setup() {
  size(1500, 800);
  playerX = width / 2;
  playerY = height / 2;
  bground = loadImage("game_background.png");
  bground.resize(width, height);
  
  zombieImg = loadImage("zombie.png");
  cat = loadImage("maleAdventurer.png");
  bulletImg = loadImage("bullet.png"); 
  
  player = new Character(width / 2, height / 2, playerSpeed, cat, 10);
  
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


void draw() {
  background(bground);
  player.update();
  player.display();
  
  // Spawn enemies with a delay and check for maximum limit
  if (millis() - lastEnemySpawnTime > 1000 && enemiesSpawned < 5) { // 1-second gap
    spawnEnemy();
    lastEnemySpawnTime = millis();
    enemiesSpawned++;
  }
  autoShoot();

  updateEnemyAndBulletCollisions(); //  Handle updateEnemyAndBulletCollisions, including removing dead enemies
  handleCharacterCollisions();
  if(player.health <= 0){
    System.out.println("Game over!");
    exit();
  }
  // Update and display enemies
  for (Enemy enemy : enemies) {
    enemy.updatePlayerPosition(player);
    enemy.update();
    enemy.display();
  }

  // 自动发射子弹，方向基于鼠标位置


  // 更新和绘制子弹
  for (Bullet b : bullets) {
    b.update();
    b.display();
  }
  
  // 移除飞出屏幕的子弹
  bullets.removeIf(bullet -> bullet.isOffScreen());
  
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
