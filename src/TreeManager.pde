public class TreeManager {
    private ArrayList<Tree> trees;
    private PImage treeImage;
    private float mapX, mapY;
    private int numberOfTrees;
    private BoundaryChecker boundaryChecker;

    public TreeManager(PImage treeImage, float mapX, float mapY, int numberOfTrees, BoundaryChecker boundaryChecker) {
        this.treeImage = treeImage;
        this.mapX = mapX;
        this.mapY = mapY;
        this.numberOfTrees = numberOfTrees;
        this.boundaryChecker = boundaryChecker;
        this.trees = new ArrayList<Tree>();

        generateTrees();
    }

    private void generateTrees() {
        while (trees.size() < numberOfTrees) {
            int treeX = (int) random(0, mapX);
            int treeY = (int) random(0, mapY);
            Tree potentialTree = new Tree(treeImage, treeX, treeY, 50); // 50 is the width here
            
            // Set the tree's position for the boundary check
            potentialTree.setX(treeX);
            potentialTree.setY(treeY);

            // Check if the tree is outside the boundary
            if (boundaryChecker.treeCheck(potentialTree)) {
                trees.add(potentialTree);
            }
        }
    }

    public void drawTrees() {
        for (Tree tree : trees) {
            tree.drawTree();
        }
    }
}
