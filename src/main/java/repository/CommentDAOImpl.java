package repository;
import java.util.List;
import org.apache.ibatis.session.SqlSession;
import domain.CommentVO;
import orm.DBConfig;

public class CommentDAOImpl implements CommentDAO {
    private SqlSession sql;
    private String NS = "cmtMapper.";
    
    public CommentDAOImpl() {
        sql = DBConfig.getSqlSessionFactory().openSession(true);
    }
    @Override
    public int insert(CommentVO cvo) {
        int isOk = sql.insert(NS + "add", cvo);
        if(isOk>0) sql.commit();
        return isOk;
    }
    @Override
    public List<CommentVO> selectList(int rno) {
        return sql.selectList(NS + "list", rno);
    }
    @Override
    public int delete(int cno) {
        int isOk = sql.delete(NS + "del", cno);
        if(isOk>0) sql.commit();
        return isOk;
    }
}