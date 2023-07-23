-- --------------------------------------------------------
-- 호스트:                          127.0.0.1
-- 서버 버전:                        10.5.19-MariaDB - mariadb.org binary distribution
-- 서버 OS:                        Win64
-- HeidiSQL 버전:                  11.3.0.6295
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- m1 데이터베이스 구조 내보내기
CREATE DATABASE IF NOT EXISTS `m1` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci */;
USE `m1`;

-- 테이블 m1.subject 구조 내보내기
CREATE TABLE IF NOT EXISTS `subject` (
  `subject_no` int(11) NOT NULL AUTO_INCREMENT,
  `subject_name` varchar(50) NOT NULL,
  `subject_time` int(11) NOT NULL DEFAULT 0,
  `updatedate` datetime NOT NULL,
  `createdate` datetime NOT NULL,
  PRIMARY KEY (`subject_no`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- 테이블 데이터 m1.subject:~5 rows (대략적) 내보내기
/*!40000 ALTER TABLE `subject` DISABLE KEYS */;
INSERT INTO `subject` (`subject_no`, `subject_name`, `subject_time`, `updatedate`, `createdate`) VALUES
	(1, '자바', 50, '2023-05-26 17:08:13', '2023-05-25 14:58:27'),
	(2, 'C#', 60, '2023-05-25 14:58:27', '2023-05-25 14:58:27'),
	(3, 'python', 40, '2023-05-25 14:58:27', '2023-05-25 14:58:27'),
	(4, 'DB', 40, '2023-05-25 14:58:27', '2023-05-25 14:58:27'),
	(5, 'HTML', 10, '2023-05-25 14:58:27', '2023-05-25 14:58:27'),
	(8, '테스트', 1200, '2023-05-27 18:28:08', '2023-05-27 18:28:08');
/*!40000 ALTER TABLE `subject` ENABLE KEYS */;

-- 테이블 m1.teacher 구조 내보내기
CREATE TABLE IF NOT EXISTS `teacher` (
  `teacher_no` int(11) NOT NULL AUTO_INCREMENT,
  `teacher_id` varchar(50) NOT NULL,
  `teacher_name` varchar(50) NOT NULL,
  `teacher_history` text NOT NULL,
  `updatedate` datetime NOT NULL,
  `createdate` datetime NOT NULL,
  PRIMARY KEY (`teacher_no`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- 테이블 데이터 m1.teacher:~10 rows (대략적) 내보내기
/*!40000 ALTER TABLE `teacher` DISABLE KEYS */;
INSERT INTO `teacher` (`teacher_no`, `teacher_id`, `teacher_name`, `teacher_history`, `updatedate`, `createdate`) VALUES
	(1, 'good', '구원이', '메모,,,', '2023-05-26 09:22:21', '2023-05-26 09:22:21'),
	(2, 'g3', '구원사', '메모테스트2', '2023-05-27 20:30:18', '2023-05-26 10:36:56'),
	(3, 'g4', '구원사', '메모4,,,', '2023-05-26 10:36:56', '2023-05-26 10:36:56'),
	(4, 'g5', '구원오', '메모5,,,', '2023-05-26 10:36:56', '2023-05-26 10:36:56'),
	(5, 'g6', '구원육', '메모6,,,', '2023-05-26 10:36:56', '2023-05-26 10:36:56'),
	(6, 'g7', '구원칠', '메모7,,,', '2023-05-26 10:36:56', '2023-05-26 10:36:56'),
	(7, 'g8', '구원팔', '메모8,,,', '2023-05-26 10:36:56', '2023-05-26 10:36:56'),
	(8, 'g9', '구원구', '메모9,,,', '2023-05-26 10:36:57', '2023-05-26 10:36:57'),
	(9, 'g10', '구원십', '메모10,,,', '2023-05-26 10:36:57', '2023-05-26 10:36:57'),
	(10, 'g11', '구원십일', '메모11,,,', '2023-05-26 10:36:57', '2023-05-26 10:36:57');
/*!40000 ALTER TABLE `teacher` ENABLE KEYS */;

-- 테이블 m1.teacher_subject 구조 내보내기
CREATE TABLE IF NOT EXISTS `teacher_subject` (
  `teacher_subject_no` int(11) NOT NULL AUTO_INCREMENT,
  `teacher_no` int(11) NOT NULL,
  `subject_no` int(11) NOT NULL,
  `createdate` datetime NOT NULL,
  `updatedate` datetime NOT NULL,
  PRIMARY KEY (`teacher_subject_no`),
  KEY `FK__teacher` (`teacher_no`),
  KEY `FK__subject` (`subject_no`),
  CONSTRAINT `FK__subject` FOREIGN KEY (`subject_no`) REFERENCES `subject` (`subject_no`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `FK__teacher` FOREIGN KEY (`teacher_no`) REFERENCES `teacher` (`teacher_no`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- 테이블 데이터 m1.teacher_subject:~12 rows (대략적) 내보내기
/*!40000 ALTER TABLE `teacher_subject` DISABLE KEYS */;
INSERT INTO `teacher_subject` (`teacher_subject_no`, `teacher_no`, `subject_no`, `createdate`, `updatedate`) VALUES
	(1, 1, 1, '2023-05-26 09:24:19', '2023-05-26 09:24:19'),
	(2, 1, 2, '2023-05-26 09:24:39', '2023-05-26 09:24:39'),
	(4, 2, 2, '2023-05-26 11:33:38', '2023-05-26 11:33:38'),
	(5, 2, 3, '2023-05-26 11:33:38', '2023-05-26 11:33:38'),
	(6, 3, 4, '2023-05-26 11:33:38', '2023-05-26 11:33:38'),
	(7, 4, 5, '2023-05-26 11:33:38', '2023-05-26 11:33:38'),
	(8, 2, 3, '2023-05-26 11:33:38', '2023-05-26 11:33:38'),
	(9, 3, 3, '2023-05-26 11:33:38', '2023-05-26 11:33:38'),
	(10, 4, 4, '2023-05-26 11:33:38', '2023-05-26 11:33:38'),
	(11, 5, 5, '2023-05-26 11:33:38', '2023-05-26 11:33:38'),
	(12, 8, 1, '2023-05-26 11:33:38', '2023-05-26 11:33:38'),
	(13, 6, 2, '2023-05-26 11:33:38', '2023-05-26 11:33:38');
/*!40000 ALTER TABLE `teacher_subject` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
