class Enemy extends Entity {
  public float stopDistance = 75, hitDistance = 75;
  float health;
  Character player;
  float centreX, centreY;

  Enemy(float x, float y, float speed, PImage img, float health, Character player) {
    super(x, y, speed, img);
    this.health = health;
    this.player = player;
    
  }


  // Overrides the Entity update method to include movement logic
  @Override
  public void update() {
    float angle = atan2(player.y - y, player.x - x);
    
    // Calculate distance to the player
    float distance = dist(x, y, player.x, player.y);
    
    // Move towards the player if farther than stopDistance
    if (distance > stopDistance) {
      x += cos(angle) * speed;
      y += sin(angle) * speed;
      centreX = x + (img.width/2);
      centreY = y + (img.height/2);
    }
  }
  
  public void specificMovement(float angle){
    
     x += cos(angle) * speed;
     y += sin(angle) * speed;
     centreX = x + (img.width/2);
     centreY = y + (img.height/2);
    
  }

}
