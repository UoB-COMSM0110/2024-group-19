float playerX, playerY;
float playerSpeed = 3;
PImage bground, cat, bulletImg, zombieImg;
ArrayList<Bullet> bullets = new ArrayList<Bullet>();
float lastBulletTime = 0; 
Character player;
Enemy initEnemy;
ArrayList<Enemy> enemies = new ArrayList<Enemy>();

void setup() {
  size(1500, 800);
  playerX = width / 2;
  playerY = height / 2;
  bground = loadImage("game_background.png");
  bground.resize(width, height);
  
  zombieImg = loadImage("zombie.png");
  cat = loadImage("maleAdventurer.png");
  bulletImg = loadImage("bullet.png"); 
  
  player = new Character(width / 2, height / 2, playerSpeed, cat);
  initEnemy = new Enemy(width/3, height/3, playerSpeed/2, zombieImg);
  
}

void draw() {
  background(bground);
  player.update();
  player.display();
  
  initEnemy.updatePlayerPosition(player);
  initEnemy.update();
  initEnemy.display();

  // 自动发射子弹，方向基于鼠标位置
  autoShoot();

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

/*void enemySpawn(){
  if (millis() - lastBulletTime > 500) {
    float bulletDirection = atan2(mouseY - player.y, mouseX - player.x); // 基于鼠标位置计算子弹方向
    bullets.add(new Bullet(player.x, player.y, playerSpeed, bulletDirection));
    lastBulletTime = millis();
  }
}
*/
