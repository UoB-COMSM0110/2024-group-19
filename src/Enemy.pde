class Enemy extends Entity {
  float stopDistance = 75;
  float health;
  Character player;

  Enemy(float x, float y, float speed, PImage img, float health, Character player) {
    super(x, y, speed, img);
    this.health = health;
    this.player = player;
    
  }


  // Overrides the Entity update method to include movement logic
  @Override
  void update() {
    float angle = atan2(player.y - y, player.x - x);
    
    // Calculate distance to the player
    float distance = dist(x, y, player.x, player.y);
    
    // Move towards the player if farther than stopDistance
    if (distance > stopDistance) {
      x += cos(angle) * speed;
      y += sin(angle) * speed;
    }
  }
  
  // Display the character image at its current position
  @Override
  void display() {
    image(img, x - img.width / 2, y - img.height / 2);
  }



}
