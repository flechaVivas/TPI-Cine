package entities;

public class MovieRoom {

	private int roomNumber;
	private int capacity;
	private int row;
	private String col;
	
	
	public int getRoomNumber() {
		return roomNumber;
	}
	public void setRoomNumber(int roomNumber) {
		this.roomNumber = roomNumber;
	}
	public int getCapacity() {
		return capacity;
	}
	public void setCapacity(int capacity) {
		this.capacity = capacity;
	}
	public int getRow() {
		return row;
	}
	public void setRow(int row) {
		this.row = row;
	}
	public String getCol() {
		return col;
	}
	public void setCol(String col) {
		this.col = col;
	}
	@Override
	public String toString() {
		return "MovieRoom [roomNumber=" + roomNumber + ", capacity=" + capacity + ", row=" + row + ", col=" + col + "]";
	}
	
}
