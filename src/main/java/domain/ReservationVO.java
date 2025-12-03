package domain;

public class ReservationVO {
    private int rsvNo;
    private int rno;
    private String roomNum;
    private String guestName;
    private String guestPhone;
    private String checkIn;
    private String checkOut;
    private String regDate;
    
    // 기본 생성자
    public ReservationVO() {}

    // 예약 등록용 생성자
    public ReservationVO(int rno, String roomNum, String guestName, String guestPhone, String checkIn, String checkOut) {
        this.rno = rno;
        this.roomNum = roomNum;
        this.guestName = guestName;
        this.guestPhone = guestPhone;
        this.checkIn = checkIn;
        this.checkOut = checkOut;
    }

    // Getter & Setter
    public int getRsvNo() { return rsvNo; }
    public void setRsvNo(int rsvNo) { this.rsvNo = rsvNo; }
    
    public int getRno() { return rno; }
    public void setRno(int rno) { this.rno = rno; }
    
    public String getRoomNum() { return roomNum; }
    public void setRoomNum(String roomNum) { this.roomNum = roomNum; }
    
    public String getGuestName() { return guestName; }
    public void setGuestName(String guestName) { this.guestName = guestName; }
    
    public String getGuestPhone() { return guestPhone; }
    public void setGuestPhone(String guestPhone) { this.guestPhone = guestPhone; }
    
    public String getCheckIn() { return checkIn; }
    public void setCheckIn(String checkIn) { this.checkIn = checkIn; }
    
    public String getCheckOut() { return checkOut; }
    public void setCheckOut(String checkOut) { this.checkOut = checkOut; }
    
    public String getRegDate() { return regDate; }
    public void setRegDate(String regDate) { this.regDate = regDate; }
}