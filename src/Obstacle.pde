public class Obstacle {
    public PImage image;
    float x, y;
    public float imgWidth, imgHeight;

    public Obstacle(PImage img, float x, float y, float imgWidth, float imgHeight) {
        this.image = img;
        this.x = x;
        this.y = y;
        this.imgWidth =imgWidth;
        this.imgHeight = imgHeight;
    }

    // Additional methods for obstacle behavior
}
