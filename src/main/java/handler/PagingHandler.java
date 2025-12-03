package handler;

import java.util.List;
import domain.RoomVO;

public class PagingHandler {
    
    private int pageNo;      // 현재 페이지 번호
    private int qty;         // 한 페이지당 보여줄 개수
    private int totalCount;  // 전체 데이터 개수
    
    private int startPage;   // 시작 페이지 번호 (1, 11...)
    private int endPage;     // 끝 페이지 번호 (10, 20...)
    private boolean prev;    // [이전] 버튼
    private boolean next;    // [다음] 버튼
    
    private List<RoomVO> list; // 실제 데이터
    
    // 이 생성자가 없으면 에러가 납니다!
    public PagingHandler(int pageNo, int qty, int totalCount, List<RoomVO> list) {
        this.pageNo = pageNo;
        this.qty = qty;
        this.totalCount = totalCount;
        this.list = list;
        
        // 페이지 계산 로직
        this.endPage = (int)(Math.ceil(this.pageNo / 10.0)) * 10;
        this.startPage = this.endPage - 9;
        
        int realEndPage = (int)(Math.ceil((this.totalCount * 1.0) / this.qty));
        
        if(realEndPage < this.endPage) {
            this.endPage = realEndPage;
        }
        
        this.prev = this.startPage > 1;
        this.next = this.endPage < realEndPage;
    }

    // Getter
    public int getPageNo() { return pageNo; }
    public int getQty() { return qty; }
    public int getTotalCount() { return totalCount; }
    public int getStartPage() { return startPage; }
    public int getEndPage() { return endPage; }
    public boolean isPrev() { return prev; }
    public boolean isNext() { return next; }
    public List<RoomVO> getList() { return list; }
}