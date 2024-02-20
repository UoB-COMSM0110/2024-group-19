class Character extends Entity {
  boolean[] keys = new boolean[4]; // 用于记录WASD按键状态
  PImage characterImg; // Character image

  Character(float x, float y, float speed, PImage img) {
    super(x, y, speed);
    this.characterImg = img;
    // Initialize keys array to false
    //Arrays.fill(keys, false);
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
}
