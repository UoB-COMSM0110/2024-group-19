float playerX, playerY;
float playerSpeed = 3;
boolean[] keys = new boolean[4]; // 用于记录WASD按键状态
PImage bground, cat, bulletImg;
ArrayList<Bullet> bullets = new ArrayList<Bullet>();
float lastBulletTime = 0; // 记录上次发射子弹的时间

void setup() {
  size(1500, 800);
  playerX = width / 2;
  playerY = height / 2;
  bground = loadImage("game_background.png");
  bground.resize(width, height);
  cat = loadImage("maleAdventurer.png");
  bulletImg = loadImage("bullet.png"); // 加载子弹图像
}

void draw() {
  background(bground);
  positionUpdate();
  
  // 直接绘制角色，不应用旋转
  image(cat, playerX - cat.width / 2, playerY - cat.height / 2);

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

void positionUpdate() {
  if (keys[0]) playerY -= playerSpeed; // W
  if (keys[1]) playerX -= playerSpeed; // A
  if (keys[2]) playerY += playerSpeed; // S
  if (keys[3]) playerX += playerSpeed; // D
}

void keyPressed() {
  if (key == 'w' || key == 'W') keys[0] = true;
  if (key == 'a' || key == 'A') keys[1] = true;
  if (key == 's' || key == 'S') keys[2] = true;
  if (key == 'd' || key == 'D') keys[3] = true;
}

void keyReleased() {
  if (key == 'w' || key == 'W') keys[0] = false;
  if (key == 'a' || key == 'A') keys[1] = false;
  if (key == 's' || key == 'S') keys[2] = false;
  if (key == 'd' || key == 'D') keys[3] = false;
}

void autoShoot() {
  if (millis() - lastBulletTime > 500) {
    float bulletDirection = atan2(mouseY - playerY, mouseX - playerX); // 基于鼠标位置计算子弹方向
    bullets.add(new Bullet(playerX, playerY, playerSpeed, bulletDirection));
    lastBulletTime = millis();
  }
}
