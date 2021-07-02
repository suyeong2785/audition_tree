DROP DATABASE IF EXISTS audition_tree;
CREATE DATABASE audition_tree;
USE audition_tree;

# 게시물 테이블 생성
CREATE TABLE Member (


    id INT(10) UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT COMMENT '회원번호',
    regDate DATETIME NOT NULL COMMENT '가입날짜',
    updateDate DATETIME NOT NULL COMMENT '가입정보수정날짜',
    delDate DATETIME COMMENT '삭제날짜',
    delStatus TINYINT(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '삭제여부',
    displayStatus TINYINT(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '블라인드여부',
    `name` CHAR(100) NOT NULL COMMENT '회원이름',
    nickname CHAR(100) NOT NULL COMMENT '닉네임',
    loginId CHAR(20) NOT NULL UNIQUE COMMENT '로그인아이디',
    loginPw VARCHAR(50) NOT NULL COMMENT '로그인비번',
    phoneNo CHAR(15) NOT NULL COMMENT '휴대전화번호',
    emergencyCall CHAR(15) NOT NULL COMMENT '비상연락처',
    email CHAR(50) NOT NULL COMMENT '이메일',
    `address` CHAR(100) NOT NULL COMMENT '주소',
    job CHAR(50) NOT NULL COMMENT '직업',
    artworkid CHAR(50) NOT NULL COMMENT '작품',
    career TEXT NOT NULL COMMENT '커리어',
    agency CHAR(50) NOT NULL COMMENT '소속사'




);

CREATE TABLE Artwork(

    id INT(10) UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT COMMENT '작품번호',
    regDate DATETIME NOT NULL COMMENT '작품등록날짜',
    updateDate DATETIME NOT NULL COMMENT '작품수정날짜',
    delDate DATETIME COMMENT '삭제날짜',
    delStatus TINYINT(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '삭제여부',
    displayStatus TINYINT(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '블라인드여부',
    title CHAR(100) NOT NULL COMMENT '제목',
    genre CHAR(100) NOT NULL COMMENT '장르',
    memberId CHAR(100) NOT NULL COMMENT '감독회원아이디',
    `name` CHAR(100) NOT NULL COMMENT '회원이름',
    summary TEXT NOT NULL COMMENT '줄거리',
    award CHAR(100) NOT NULL COMMENT '수상내역',
    producer CHAR(100) NOT NULL COMMENT '배급사'

);





