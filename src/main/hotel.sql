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
