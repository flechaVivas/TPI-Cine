package entities;

public class Ubication {
	
	private String row;
	private int col;
	private Boolean status;
	private MovieRoom room;
	
	public String getRow() {
		return row;
	}
	public void setRow(String row) {
		this.row = row;
	}
	public int getCol() {
		return col;
	}
	public void setCol(int col) {
		this.col = col;
	}
	
	public Boolean getStatus() {
		return status;
	}
	public void setStatus(Boolean status) {
		this.status = status;
	}
	public MovieRoom getRoom() {
		return room;
	}
	public void setRoom(MovieRoom room) {
		this.room = room;
	}
	
	@Override
	public String toString() {
		return "Ubication [row=" + row + ", col=" + col + ", status=" + status + ", room=" + room + "]";
	}
	
	
}
