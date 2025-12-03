package repository;

import domain.MemberVO;

public interface MemberDAO {
	int insert(MemberVO mvo); // 회원가입
	MemberVO selectOne(MemberVO mvo); // 로그인 (아이디,비번으로 조회)
}