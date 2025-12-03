package domain;

public class RoomVO {
    private int rno;
    private String roomNum;
    private String roomType;
    private int price;
    private String roomStatus;
    private String content;
    private String imageFile;
    private String regDate;

    public RoomVO() {}

    // 생성자
    public RoomVO(String roomNum, String roomType, int price, String content, String imageFile) {
        this.roomNum = roomNum;
        this.roomType = roomType;
        this.price = price;
        this.content = content;
        this.imageFile = imageFile;
    }

    // Getter & Setter
    public int getRno() { return rno; }
    public void setRno(int rno) { this.rno = rno; }
    
    public String getRoomNum() { return roomNum; }
    public void setRoomNum(String roomNum) { this.roomNum = roomNum; }
    
    public String getRoomType() { return roomType; }
    public void setRoomType(String roomType) { this.roomType = roomType; }
    
    public int getPrice() { return price; }
    public void setPrice(int price) { this.price = price; }
    
    public String getRoomStatus() { return roomStatus; }
    public void setRoomStatus(String roomStatus) { this.roomStatus = roomStatus; }
    
    public String getContent() { return content; }
    public void setContent(String content) { this.content = content; }
    
    public String getImageFile() { return imageFile; }
    public void setImageFile(String imageFile) { this.imageFile = imageFile; }
    
    public String getRegDate() { return regDate; }
    public void setRegDate(String regDate) { this.regDate = regDate; }
}