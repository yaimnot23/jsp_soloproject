mysql -u root -p
CREATE DATABASE hoteldb;
USE hoteldb;

CREATE USER 'hoteluser'@'localhost' IDENTIFIED BY 'mysql';
GRANT ALL PRIVILEGES ON hoteldb.* TO 'hoteluser'@'localhost';
FLUSH PRIVILEGES;

CREATE TABLE room (
    rno INT NOT NULL AUTO_INCREMENT,
    room_num VARCHAR(50) NOT NULL,
    room_type VARCHAR(50) NOT NULL,
    price INT NOT NULL DEFAULT 0,
    room_status VARCHAR(20) DEFAULT '빈방',
    content TEXT,
    image_file VARCHAR(500),
    reg_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (rno)
);

- 더미 데이터
INSERT INTO room (room_num, room_type, price, content, image_file)
VALUES ('101호', 'Standard', 150000, '아늑한 기본 객실입니다.', 'default.jpg');

-- 기존 데이터 싹 비우기 (선택사항)
TRUNCATE TABLE room;

-- 새 데이터 30개 넣기
INSERT INTO room (room_num, room_type, price, content, room_status, image_file) VALUES 
('201호', 'Standard', 80000, 'test1', '빈방', 'default.jpg'),
('202호', 'Standard', 80000, 'test2', '사용중', 'default.jpg'),
('203호', 'Standard', 80000, 'test3', '청소중', 'default.jpg'),
('205호', 'Deluxe', 120000, 'test4', '빈방', 'default.jpg'),
('301호', 'Standard', 85000, 'test5', '빈방', 'default.jpg'),
('302호', 'Standard', 85000, 'test6', '사용중', 'default.jpg'),
('303호', 'Deluxe', 130000, 'test7', '빈방', 'default.jpg'),
('305호', 'Deluxe', 130000, 'test8', '청소중', 'default.jpg'),
('306호', 'Suite', 250000, 'test9', '빈방', 'default.jpg'),
('307호', 'Standard', 85000, 'test10', '사용중', 'default.jpg'),
('401호', 'Standard', 90000, 'test11', '빈방', 'default.jpg'),
('402호', 'Standard', 90000, 'test12', '빈방', 'default.jpg'),
('403호', 'Deluxe', 140000, 'test13', '사용중', 'default.jpg'),
('405호', 'Deluxe', 140000, 'test14', '빈방', 'default.jpg'),
('406호', 'Suite', 280000, 'test15', '사용중', 'default.jpg'),
('407호', 'Standard', 90000, 'test16', '빈방', 'default.jpg'),
('408호', 'Deluxe', 140000, 'test17', '청소중', 'default.jpg'),
('501호', 'Royal Suite', 400000, 'test18', '빈방', 'default.jpg'),
('502호', 'Standard', 95000, 'test19', '빈방', 'default.jpg'),
('503호', 'Standard', 95000, 'test20', '사용중', 'default.jpg'),
('505호', 'Deluxe', 150000, 'test21', '빈방', 'default.jpg'),
('506호', 'Deluxe', 150000, 'test22', '빈방', 'default.jpg'),
('507호', 'Suite', 300000, 'test23', '청소중', 'default.jpg'),
('508호', 'Standard', 95000, 'test24', '빈방', 'default.jpg'),
('601호', 'Standard', 100000, 'test25', '빈방', 'default.jpg'),
('602호', 'Deluxe', 160000, 'test26', '사용중', 'default.jpg'),
('603호', 'Suite', 320000, 'test27', '빈방', 'default.jpg'),
('605호', 'Standard', 100000, 'test28', '사용중', 'default.jpg'),
('606호', 'Deluxe', 160000, 'test29', '빈방', 'default.jpg'),
('607호', 'Royal Suite', 450000, 'test30', '빈방', 'default.jpg');

-- 회원 테이블 생성
CREATE TABLE member (
    id VARCHAR(50) NOT NULL,          -- 아이디 (PK)
    pwd VARCHAR(100) NOT NULL,        -- 비밀번호
    email VARCHAR(100),               -- 이메일
    reg_date DATETIME DEFAULT CURRENT_TIMESTAMP, -- 가입일
    PRIMARY KEY (id)
);

-- 테스트용 관리자 계정 1개 미리 추가 (아이디: admin / 비번: 1111)
INSERT INTO member (id, pwd, email) VALUES ('admin', '1111', 'admin@hotel.com');

-- 예약 테이블 생성
CREATE TABLE reservation (
    rsv_no INT NOT NULL AUTO_INCREMENT,   -- 예약 고유 번호
    rno INT NOT NULL,                     -- 어떤 방을 예약했는지 (방 번호 PK)
    room_num VARCHAR(50) NOT NULL,        -- 방 호수 (화면에 보여주기 용)
    guest_name VARCHAR(50) NOT NULL,      -- 예약자 이름
    guest_phone VARCHAR(50) NOT NULL,     -- 예약자 전화번호
    check_in DATE NOT NULL,               -- 체크인 날짜
    check_out DATE NOT NULL,              -- 체크아웃 날짜
    reg_date DATETIME DEFAULT CURRENT_TIMESTAMP, -- 예약한 시간
    PRIMARY KEY (rsv_no)
);

-- 댓글/후기 테이블
CREATE TABLE comment (
    cno INT NOT NULL AUTO_INCREMENT,       -- 후기 고유 번호
    rno INT NOT NULL,                      -- 어떤 방에 달린 글인지 (FK)
    writer VARCHAR(50) NOT NULL,           -- 작성자 (로그인 ID)
    content TEXT NOT NULL,                 -- 후기 내용
    rating INT DEFAULT 5,                  -- 별점 (1~5)
    reg_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (cno)
);

-- 기존에 'Suite'로 저장된 데이터를 모두 'Royal Suite'로 변경
UPDATE room SET room_type = 'Royal Suite' WHERE room_type = 'Suite';

-- 스탠다드 방 사진 변경
UPDATE room SET image_file = 'default_standard.jpg' WHERE room_type = 'Standard';

-- 디럭스 방 사진 변경
UPDATE room SET image_file = 'default_deluxe.jpg' WHERE room_type = 'Deluxe';

-- 로얄 스위트 방 사진 변경
UPDATE room SET image_file = 'default_royal.jpg' WHERE room_type = 'Royal Suite';
