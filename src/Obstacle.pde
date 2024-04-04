public class Obstacle {
    public PImage image;
    float x, y;
    float width, height;

    public Obstacle(PImage img, float x, float y, float width, float height) {
        this.image = img;
        this.x = x;
        this.y = y;
        this.width = width;
        this.height = height;
    }

    public void display() {
        image(image, x, y, width, height);
    }

    // Additional methods for obstacle behavior
}
