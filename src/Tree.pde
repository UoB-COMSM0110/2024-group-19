public class Tree extends Entity {
    
    PImage treeImage;
    int width;

    // Constructor
    public Tree(PImage treeImage, int x, int y, int width) {
        super(x, y, 0, treeImage); // x, y, speed (0 for static object), and image
        this.treeImage = treeImage;
        this.width = width;
    }

    // Draw method for a single tree
    public void drawTree() {
        // Assuming x and y are the top-left coordinates
        image(this.treeImage, this.x, this.y);
    }
}
