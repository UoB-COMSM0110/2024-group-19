public class PlayerScore implements Comparable<PlayerScore> {
    String playerName;
    int score;

    public PlayerScore(String playerName, int score) {
        this.playerName = playerName;
        this.score = score;
    }

    @Override
    public int compareTo(PlayerScore other) {
        return Integer.compare(other.score, this.score); // For descending order
    }
}
