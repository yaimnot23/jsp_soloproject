package domain;

public class CommentVO {
    private int cno;
    private int rno;
    private String writer;
    private String content;
    private int rating;
    private String regDate;
    
    // 기본 생성자
    public CommentVO() {}

    // 등록용 생성자
    public CommentVO(int rno, String writer, String content, int rating) {
        this.rno = rno;
        this.writer = writer;
        this.content = content;
        this.rating = rating;
    }

    // Getter & Setter
    public int getCno() { return cno; }
    public void setCno(int cno) { this.cno = cno; }
    
    public int getRno() { return rno; }
    public void setRno(int rno) { this.rno = rno; }
    
    public String getWriter() { return writer; }
    public void setWriter(String writer) { this.writer = writer; }
    
    public String getContent() { return content; }
    public void setContent(String content) { this.content = content; }
    
    public int getRating() { return rating; }
    public void setRating(int rating) { this.rating = rating; }
    
    public String getRegDate() { return regDate; }
    public void setRegDate(String regDate) { this.regDate = regDate; }
}