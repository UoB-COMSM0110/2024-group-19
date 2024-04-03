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

    // Update method, if you need to add behavior or interactions for the trees
    public void update() {
        // Implement any updates for individual trees here
        // For example, you could handle changes in the tree's appearance, size, etc.
    }
}
