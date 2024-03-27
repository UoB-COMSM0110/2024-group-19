class Entity {
  float x, y; // Position
  float speed; // Speed
  PImage img;
  
  // Constructor
  Entity(float x, float y, float speed, PImage img) {
    this.x = x;
    this.y = y;
    this.speed = speed;
    this.img = img;
  }
  
  // Update the entity's state. This method can be overridden by subclasses.
  void update() {
    // Default implementation is empty. Subclasses will provide specific behaviors.
  }
  
  // Display the entity on the screen. This method must be implemented by subclasses.
  void display() {
    // This is an abstract behavior that subclasses need to override.
  }
  
  // Check if the entity is off the screen. This might be useful for many entities.
  boolean isOffScreen() {
    return x < 0 || x > width || y < 0 || y > height;
  }
}
