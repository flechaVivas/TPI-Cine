package entities;

public class RoomType {
	private int idRoomType;
	private String description;
	private int sizeCol;
	private int sizeRow;
	
	public int getIdRoomType() {
		return idRoomType;
	}
	public void setIdRoomType(int idRoomType) {
		this.idRoomType = idRoomType;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public int getSizeCol() {
		return sizeCol;
	}
	public void setSizeCol(int sizeCol) {
		this.sizeCol = sizeCol;
	}
	public int getSizeRow() {
		return sizeRow;
	}
	public void setSizeRow(int sizeRow) {
		this.sizeRow = sizeRow;
	}
	public RoomType(){}
}
