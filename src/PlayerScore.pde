public class PlayerScore implements Comparable<PlayerScore> {
    private String playerName = "";
    private int score;

    public PlayerScore(String playerName, int score) {
        this.playerName = playerName;
        this.score = score;
    }

    @Override
    public int compareTo(PlayerScore other) {
        return Integer.compare(other.score, this.score);  // Sort in descending order
    }

    @Override
    public String toString() {
        return playerName/*"abc"*/ + " - " + score;  // String representation for easy display
    }
}
