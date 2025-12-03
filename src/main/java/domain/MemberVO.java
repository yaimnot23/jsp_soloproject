package domain;

public class MemberVO {
    private String id;
    private String pwd;
    private String email;
    private String regDate;
    
    // 기본 생성자
    public MemberVO() {}

    // 로그인용 생성자
    public MemberVO(String id, String pwd) {
        this.id = id;
        this.pwd = pwd;
    }

    // 회원가입용 생성자
    public MemberVO(String id, String pwd, String email) {
        this.id = id;
        this.pwd = pwd;
        this.email = email;
    }

    // Getter & Setter
    public String getId() { return id; }
    public void setId(String id) { this.id = id; }
    
    public String getPwd() { return pwd; }
    public void setPwd(String pwd) { this.pwd = pwd; }
    
    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }
    
    public String getRegDate() { return regDate; }
    public void setRegDate(String regDate) { this.regDate = regDate; }
}