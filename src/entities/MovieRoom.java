package entities;

public class MovieRoom {

	private int roomNumber;
	private int capacity;
	private RoomType rt;
	
	public RoomType getRt() {
		return rt;
	}
	public void setRt(RoomType rt) {
		this.rt = rt;
	}
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
	
	@Override
	public String toString() {
		return "MovieRoom [roomNumber=" + roomNumber + ", capacity=" + capacity + "]";
	}
	
}
