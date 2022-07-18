package entities;

public class Ubication {
	
	private String row;
	private int col;
	private String status;

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
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	
	@Override
	public String toString() {
		return "Ubication [row=" + row + ", col=" + col + ", status=" + status + "]";
	}
	
	
}
