class Enemy extends Entity {
  PImage enemyImg; // Character image
  float player_x, player_y, stopDistance = 50;

  Enemy(float x, float y, float speed, PImage img) {
    super(x, y, speed);
    this.enemyImg = img;
    
  }
  
  void updatePlayerPosition(Character player){
    this.player_x = player.x;
    this.player_y = player.y;
  }

  // Overrides the Entity update method to include movement logic
  @Override
  void update() {
    float angle = atan2(this.player_y - y, this.player_x - x);
    
    // Calculate distance to the player
    float distance = dist(x, y, this.player_x, this.player_y);
    
    // Move towards the player if farther than stopDistance
    if (distance > stopDistance) {
      x += cos(angle) * speed;
      y += sin(angle) * speed;
    }
  }
  
  // Display the character image at its current position
  @Override
  void display() {
    image(enemyImg, x - enemyImg.width / 2, y - enemyImg.height / 2);
  }


}
