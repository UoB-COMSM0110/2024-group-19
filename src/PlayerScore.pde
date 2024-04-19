public class PlayerScore implements Comparable<PlayerScore> {
    private String playerName = "", difficulty;
    private int score;

    public PlayerScore(String playerName, int score, String difficulty) {
        this.playerName = playerName;
        this.score = score;
        this.difficulty = difficulty;
    }

    @Override
    public int compareTo(PlayerScore other) {
        return Integer.compare(other.score, this.score);  // Sort in descending order
    }

    @Override
    public String toString() {
        return playerName/*"abc"*/ + " - " + score + " " + difficulty;  // String representation for easy display
    }
}
