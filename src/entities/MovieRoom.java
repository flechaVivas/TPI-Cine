package entities;

public class MovieRoom {

	private int roomNumber;
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
}
