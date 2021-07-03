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
    producer CHAR(100) NOT NULL COMMENT '제작사'

);




CREATE TABLE CastingArticle(

    id INT(10) UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT COMMENT '캐스팅게시물번호',
    regDate DATETIME NOT NULL COMMENT '게시물등록날짜',
    updateDate DATETIME NOT NULL COMMENT '게시물수정날짜',
    delDate DATETIME COMMENT '삭제날짜',
    delStatus TINYINT(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '삭제여부',
    displayStatus TINYINT(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '블라인드여부',
    title CHAR(100) NOT NULL COMMENT '제목',
    summary TEXT NOT NULL COMMENT '작품소개&줄거리',
    director CHAR(100) NOT NULL COMMENT '감독',
    writer CHAR(100) NOT NULL COMMENT '작가',
    producer CHAR(100) NOT NULL COMMENT '제작사',

    /*actingRole,artworkId(작품) 테이블 따로 만들어서 관리해야 할 듯*/ 

    
    
    startDate DATETIME COMMENT '캐스팅시작날짜',
    endDate DATETIME COMMENT '마감날짜',
    career TEXT NOT NULL COMMENT  '경력',
    agency CHAR(100) NOT NULL COMMENT '제작사',
    contactMail  CHAR(100) NOT NULL COMMENT '담당자메일',
    contactPhone  CHAR(100) NOT NULL COMMENT '담당자번호',
    contactName  CHAR(100) NOT NULL COMMENT '담당자이름',
    
    alramId INT(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT  COMMENT '알람기능',

);

CREATE TABLE actingRole (
    id INT(10) UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT COMMENT '아이디',
    regDate DATETIME NOT NULL COMMENT '등록날짜',
    updateDate DATETIME NOT NULL COMMENT '수정날짜',
    artworkId INT(10) UNSIGNED NOT NULL COMMENT '작품아이디',
    /*realName CHAR(50) NOT NULL COMMENT '배역이름', <-이게 뭔지모르겠음*/
    `name` CHAR(50) NOT NULL COMMENT '배역이름',
    pay CHAR(50) NOT NULL COMMENT '급여',
    age CHAR(50) NOT NULL COMMENT '나이',
    job CHAR(100) NOT NULL COMMENT '직업',
    scriptStatus TINYINT(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '대본유무',
    gender CHAR(5) NOT NULL COMMENT '성별',

    /*
    scenesCount TINYINT(2) UNSIGNED NOT NULL DEFAULT 0 COMMENT '스크린갯수',
    shootingsCount TINYINT(2) UNSIGNED NOT NULL DEFAULT 0 COMMENT '슈팅갯수',*/

    `character` TEXT COMMENT '배역설명',
    etc TEXT COMMENT '기타'
    
);

