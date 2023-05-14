-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 31, 2022 at 12:36 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `datvexekhach`
--

-- --------------------------------------------------------

--
-- Table structure for table `account`
--

CREATE TABLE `account` (
  `id` int(11) NOT NULL,
  `fullname` varchar(255) NOT NULL,
  `phone` varchar(11) DEFAULT NULL,
  `username` varchar(30) NOT NULL,
  `password` varchar(255) NOT NULL,
  `avatar` varchar(2000) DEFAULT NULL,
  `created_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `enable` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `account`
--

INSERT INTO `account` (`id`, `fullname`, `phone`, `username`, `password`, `avatar`, `created_date`, `enable`) VALUES
(2, 'admin', NULL, 'admin1', '12345', NULL, '2022-08-25 03:13:21', 1),
(5, 'hoàng thị hoài', '091728323', 'hoaiht', '123', 'http://res.cloudinary.com/vietnam-national-university-of-agricuture/image/upload/v1661589785/lyrcjczcmnakzqwbyw9o.jpg', '2022-08-30 03:39:49', 1),
(6, 'nguyễn tuấn hùng', '082168312', 'hungnt', '123', 'http://res.cloudinary.com/vietnam-national-university-of-agricuture/image/upload/v1661589829/rslhvxfihekj6hl9osfe.jpg', '2022-08-27 08:42:13', 1),
(7, 'lê thị thu hà', '08128321', 'halt', '123', 'http://res.cloudinary.com/vietnam-national-university-of-agricuture/image/upload/v1661589857/mpirjy8nvb1ecglr8jjh.jpg', '2022-08-27 08:42:41', 1),
(8, 'vũ khánh huyền', '081823332', 'huyenvk', '123', 'http://res.cloudinary.com/vietnam-national-university-of-agricuture/image/upload/v1661589887/f4jxacapr24d2h8lahcl.jpg', '2022-08-27 08:43:11', 1),
(9, 'trần thị lan', '018293123', 'lanlt', '123', 'http://res.cloudinary.com/vietnam-national-university-of-agricuture/image/upload/v1661589906/gqaavm19ikrrolr4cak6.jpg', '2022-08-27 08:43:30', 1),
(10, 'Trần văn hiếu', '0382267161', 'hieutv', '123', 'http://res.cloudinary.com/vietnam-national-university-of-agricuture/image/upload/v1661592140/jmroleb2wg0gys0aold6.jpg', '2022-08-27 09:20:44', 1),
(12, 'lê khải hoàn', '091278932', 'hoanlk', '123', 'http://res.cloudinary.com/vietnam-national-university-of-agricuture/image/upload/v1661596032/t9zuytyzr7ek2gnoocgg.jpg', '2022-08-27 10:25:35', 1),
(13, 'hoàng mạnh hùng', '09217833', 'hungmh', '123', 'http://res.cloudinary.com/vietnam-national-university-of-agricuture/image/upload/v1661612368/xsphboasmg1dlxkl753c.jpg', '2022-08-27 14:57:51', 1),
(14, 'lê thúy vân', '098362834', 'vantl', '12345', 'http://res.cloudinary.com/vietnam-national-university-of-agricuture/image/upload/v1661686149/iwxqut2wqb77uagnejnn.jpg', '2022-08-28 11:27:31', 1);

-- --------------------------------------------------------

--
-- Table structure for table `binhluan`
--

CREATE TABLE `binhluan` (
  `id` int(11) NOT NULL,
  `content` varchar(2000) NOT NULL,
  `account_id` int(11) NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `chuyenxe_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `binhluan`
--

INSERT INTO `binhluan` (`id`, `content`, `account_id`, `created_date`, `chuyenxe_id`) VALUES
(1, 'nhân viên phục vụ tốt', 14, '2022-08-28 12:30:35', 2),
(3, 'chất lượng dịch vụ tạm được', 9, '2022-08-28 12:42:26', 2);

-- --------------------------------------------------------

--
-- Table structure for table `chuyenxe`
--

CREATE TABLE `chuyenxe` (
  `id` int(11) NOT NULL,
  `taixe` int(11) NOT NULL,
  `ngaydi` date NOT NULL,
  `tuyenxe` int(11) NOT NULL,
  `giodi` varchar(15) NOT NULL,
  `giove` varchar(15) DEFAULT NULL,
  `price` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `chuyenxe`
--

INSERT INTO `chuyenxe` (`id`, `taixe`, `ngaydi`, `tuyenxe`, `giodi`, `giove`, `price`) VALUES
(2, 12, '2022-08-28', 1, '12:07', '14:07', 120000),
(3, 12, '2022-08-29', 1, '13:36', '15:47', 80000),
(4, 13, '2022-08-29', 3, '10:03', '12:36', 300000),
(5, 13, '2022-09-02', 3, '10:03', '12:36', 300000),
(6, 13, '2022-09-02', 4, '18:00', '05:00', 450000);

-- --------------------------------------------------------

--
-- Table structure for table `datxe`
--

CREATE TABLE `datxe` (
  `id` int(11) NOT NULL,
  `khachhang` int(11) DEFAULT NULL,
  `ngaydat` timestamp NOT NULL DEFAULT current_timestamp(),
  `giave` double NOT NULL,
  `chuyenxe` int(11) NOT NULL,
  `sove` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `datxe`
--

INSERT INTO `datxe` (`id`, `khachhang`, `ngaydat`, `giave`, `chuyenxe`, `sove`) VALUES
(2, 14, '2022-08-28 12:10:08', 300000, 4, 2),
(4, 2, '2022-08-30 03:27:45', 300000, 5, 1),
(7, 14, '2022-08-30 13:12:21', 120000, 2, 1),
(8, 5, '2022-08-31 09:46:10', 300000, 4, 1),
(9, NULL, '2022-08-31 10:01:28', 450000, 6, 1),
(10, NULL, '2022-08-31 10:01:55', 450000, 6, 2);

-- --------------------------------------------------------

--
-- Table structure for table `tuyenxe`
--

CREATE TABLE `tuyenxe` (
  `id` int(11) NOT NULL,
  `diemdau` varchar(255) NOT NULL,
  `diemcuoi` varchar(255) NOT NULL,
  `ngaytao` timestamp NOT NULL DEFAULT current_timestamp(),
  `nguoitao` int(11) NOT NULL,
  `giatien` double NOT NULL,
  `bienso` varchar(30) DEFAULT NULL,
  `giokhoihanh` varchar(15) NOT NULL,
  `giove` varchar(15) DEFAULT NULL,
  `cac_chang_qua` varchar(5000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tuyenxe`
--

INSERT INTO `tuyenxe` (`id`, `diemdau`, `diemcuoi`, `ngaytao`, `nguoitao`, `giatien`, `bienso`, `giokhoihanh`, `giove`, `cac_chang_qua`) VALUES
(1, 'hà nội', 'nam định', '2022-08-28 02:37:13', 2, 80000, '18B-08922', '13:36', '15:47', 'bến xe giáp bát, cao tốc pháp vân, phủ lý, nam định'),
(3, 'vũng tàu', 'cà mau', '2022-08-28 02:52:26', 2, 300000, '99A-98126', '10:03', '12:36', 'mũi né, vũng tàu'),
(4, 'HCM', 'Đăk Lăk', '2022-08-30 04:37:07', 2, 400000, '47A', '20:00', '17:36', 'abc');

-- --------------------------------------------------------

--
-- Table structure for table `user_roles`
--

CREATE TABLE `user_roles` (
  `id` int(11) NOT NULL,
  `account_id` int(11) NOT NULL,
  `USER_ROLE` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user_roles`
--

INSERT INTO `user_roles` (`id`, `account_id`, `USER_ROLE`) VALUES
(3, 2, 'ADMIN'),
(2, 2, 'USER'),
(5, 5, 'EMPLOYEE'),
(6, 6, 'EMPLOYEE'),
(7, 7, 'EMPLOYEE'),
(8, 8, 'EMPLOYEE'),
(9, 9, 'EMPLOYEE'),
(17, 10, 'EMPLOYEE'),
(19, 12, 'DRIVER'),
(20, 13, 'DRIVER'),
(21, 14, 'USER');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `account`
--
ALTER TABLE `account`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `binhluan`
--
ALTER TABLE `binhluan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `account_id_1` (`account_id`),
  ADD KEY `chuyenxe_id` (`chuyenxe_id`);

--
-- Indexes for table `chuyenxe`
--
ALTER TABLE `chuyenxe`
  ADD PRIMARY KEY (`id`),
  ADD KEY `taixe` (`taixe`),
  ADD KEY `tuyenxe` (`tuyenxe`);

--
-- Indexes for table `datxe`
--
ALTER TABLE `datxe`
  ADD PRIMARY KEY (`id`),
  ADD KEY `khachhang` (`khachhang`),
  ADD KEY `chuyenxe1` (`chuyenxe`);

--
-- Indexes for table `tuyenxe`
--
ALTER TABLE `tuyenxe`
  ADD PRIMARY KEY (`id`),
  ADD KEY `nguoi_tao` (`nguoitao`);

--
-- Indexes for table `user_roles`
--
ALTER TABLE `user_roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `USER_ROLE_UK` (`account_id`,`USER_ROLE`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `account`
--
ALTER TABLE `account`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `binhluan`
--
ALTER TABLE `binhluan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `chuyenxe`
--
ALTER TABLE `chuyenxe`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `datxe`
--
ALTER TABLE `datxe`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `tuyenxe`
--
ALTER TABLE `tuyenxe`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `user_roles`
--
ALTER TABLE `user_roles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `binhluan`
--
ALTER TABLE `binhluan`
  ADD CONSTRAINT `account_id_1` FOREIGN KEY (`account_id`) REFERENCES `account` (`id`),
  ADD CONSTRAINT `chuyenxe_id` FOREIGN KEY (`chuyenxe_id`) REFERENCES `chuyenxe` (`id`);

--
-- Constraints for table `chuyenxe`
--
ALTER TABLE `chuyenxe`
  ADD CONSTRAINT `taixe` FOREIGN KEY (`taixe`) REFERENCES `account` (`id`),
  ADD CONSTRAINT `tuyenxe` FOREIGN KEY (`tuyenxe`) REFERENCES `tuyenxe` (`id`);

--
-- Constraints for table `datxe`
--
ALTER TABLE `datxe`
  ADD CONSTRAINT `chuyenxe1` FOREIGN KEY (`chuyenxe`) REFERENCES `chuyenxe` (`id`),
  ADD CONSTRAINT `khachhang` FOREIGN KEY (`khachhang`) REFERENCES `account` (`id`);

--
-- Constraints for table `tuyenxe`
--
ALTER TABLE `tuyenxe`
  ADD CONSTRAINT `nguoi_tao` FOREIGN KEY (`nguoitao`) REFERENCES `account` (`id`);

--
-- Constraints for table `user_roles`
--
ALTER TABLE `user_roles`
  ADD CONSTRAINT `account_id` FOREIGN KEY (`account_id`) REFERENCES `account` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
