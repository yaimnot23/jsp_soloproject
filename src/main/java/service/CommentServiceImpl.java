package service;
import java.util.List;
import domain.CommentVO;
import repository.CommentDAO;
import repository.CommentDAOImpl;

public class CommentServiceImpl implements CommentService {
    private CommentDAO cdao;
    
    public CommentServiceImpl() {
        cdao = new CommentDAOImpl();
    }
    @Override
    public int post(CommentVO cvo) {
        return cdao.insert(cvo);
    }
    @Override
    public List<CommentVO> getList(int rno) {
        return cdao.selectList(rno);
    }
    @Override
    public int remove(int cno) {
        return cdao.delete(cno);
    }
}