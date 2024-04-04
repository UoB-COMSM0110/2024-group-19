class Character extends Entity {
  public boolean[] keys = new boolean[4]; // For tracking WASD key states
  boolean invulnerable = false;
  public float lastHitReceived = 0;
  public float invulnerablePeroid = 2000;
  public int health, score;
  float oxygenLevel = 100; // Initialize oxygen level to 100
  private BoundaryChecker boundary;
  
  Character(float x, float y, float speed, PImage img, int health) {
    super(x, y, speed, img);
    this.health = health;
    // We can initialise using x*2 and y*2 as these are the centre of the background at initialisation.
    boundary = new BoundaryChecker(this, x*2, y*2);
    this.score = 0;
  }

  // Overrides the Entity update method to include movement logic and oxygen recovery
  @Override
  void update() {
    positionUpdate();
    boundary.playerCheck();
  }

  void positionUpdate() {
    // Only allow movement if there's enough oxygen
    if (oxygenLevel > 0) {
      if (keys[0]) {
        y -= speed; // W
      }
      if (keys[1]) {
        x -= speed; // A
      }
      if (keys[2]) {
        y += speed; // S
      }
      if (keys[3]) {
        x += speed; // D
      }
    }
      
    if(keys[0] || keys[1] || keys[2] || keys[3]){
      decreaseOxygen();
    }
    else{recoverOxygen();}
    
  }
  
  // Decrease oxygen when moving
  void decreaseOxygen() {
    oxygenLevel = max(0, oxygenLevel - 0.1);
  }
  
  // Recover oxygen when not moving
  void recoverOxygen() {
    oxygenLevel = min(100, oxygenLevel + 0.7);
  }
  
  // Check if the character is moving

  // Display the character image at its current position
  @Override
  void display() {
    image(img, width/2, height/2);
  }

  // Update keys on key press
  void keyPressed() {
    updateKey(key, true);
    if(key == 'M' || key == 'm'){
      pageManager.pageNumber =5;
    }
   // if(keypress? == 'M' || keypress == 'm'){
    //  pageManager = 5;
    //   if(keypress =='Enter'
          // resume game pageManager.pagenumber = 3;
          // else( keypress == 'Shoift')
          //{ gamereset();
          //pagemanager.pagenumber = 1; 
          
   // }
  }

  // Update keys on key release
  void keyReleased() {
    updateKey(key, false);
  }
  
  // Helper method to update key states based on input
  private void updateKey(char key, boolean pressed) {
    if (key == 'w' || key == 'W') keys[0] = pressed;
    if (key == 'a' || key == 'A') keys[1] = pressed;
    if (key == 's' || key == 'S') keys[2] = pressed;
    if (key == 'd' || key == 'D') keys[3] = pressed;
  }
  
  // Handle enemy collisions
  boolean enemyCollision(Enemy enemy, long time) {
    boolean proximity = dist(enemy.x, enemy.y, this.x, this.y) < 100;
    if (!proximity) return false;
    
    if ((time - lastHitReceived > 1000) && invulnerable) {
      invulnerable = false;
    }
    
    if (proximity && !invulnerable) {
      invulnerable = true;
      lastHitReceived = time;
      health -= 1;
      System.out.println("Hit, health remaining: " + health);
      return true;
    }
    
    return false;
  }
}
