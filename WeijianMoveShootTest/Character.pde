class Character extends Entity {
  boolean[] keys = new boolean[4]; // 用于记录WASD按键状态
  boolean invulnerable = true;
  PImage characterImg; // Character image
  long lastHitRecieved;
  int health;

  Character(float x, float y, float speed, PImage img, int health) {
    super(x, y, speed);
    this.characterImg = img;
    this.health = health;
  }

  // Overrides the Entity update method to include movement logic
  @Override
  void update() {
    positionUpdate();
  }

  void positionUpdate() {
    if (keys[0]) y -= speed; // W
    if (keys[1]) x -= speed; // A
    if (keys[2]) y += speed; // S
    if (keys[3]) x += speed; // D
  }
  
  // Display the character image at its current position
  @Override
  void display() {
    image(characterImg, x - characterImg.width / 2, y - characterImg.height / 2);
  }

  void keyPressed() {
    updateKey(key, true);
  }

  void keyReleased() {
    updateKey(key, false);
  }
  
  // Helper method to update keys based on input
  private void updateKey(char key, boolean pressed) {
    if (key == 'w' || key == 'W') keys[0] = pressed;
    if (key == 'a' || key == 'A') keys[1] = pressed;
    if (key == 's' || key == 'S') keys[2] = pressed;
    if (key == 'd' || key == 'D') keys[3] = pressed;
  }
  
  boolean enemyCollision(Enemy enemy, long time){
    
    boolean proximity = dist(enemy.x, enemy.y, this.x, this.y) < 100;
    if(!proximity){return false;}
    
    if(((time - lastHitRecieved) > 1000) && invulnerable){
      invulnerable = false;
    } 
    
    if(proximity && !invulnerable){
      invulnerable = true;
      lastHitRecieved = time;
      this.health -= 1;
      System.out.println("Hit, health remaining:" + this.health);
      return true;}
    
    return false;
  }
}
