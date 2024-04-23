class Bullet extends Entity {
  float direction; // Specific property for Bullet
  
  // Constructor
  Bullet(float x, float y, float speed, float direction) {
    super(x, y, speed); // Call Entity's constructor
    this.direction = direction;
    this.speed = this.speed * 6;
  }
  
  // Override the update method to move the bullet
  @Override
  void update() {
    x += cos(direction) * speed;
    y += sin(direction) * speed;
  }
  
  // Override the display method to show the bullet
  @Override
  void display() {
    pushMatrix();
    translate(x, y);
    rotate(direction); // Adjust for proper bullet orientation
    // Assume bulletImg is a PImage loaded elsewhere in your code
    image(bulletImg, -bulletImg.width / 2, -bulletImg.height / 2);
    popMatrix();
  }
}
