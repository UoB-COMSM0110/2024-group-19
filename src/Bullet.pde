class Bullet extends Entity {
  float direction; // Specific property for Bullet
  
  // Constructor
  Bullet(float x, float y, float speed,PImage img, float direction) {
    super(x, y, speed, img); // Call Entity's constructor
    this.direction = direction;
  }
  
  // Override the update method to move the bullet
  @Override
  void update() {
    x += cos(direction) * speed;
    y += sin(direction) * speed;
  }
  
  // Override the display method to show the bullet

}
