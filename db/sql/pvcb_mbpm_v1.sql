/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 100421 (10.4.21-MariaDB)
 Source Host           : localhost:3306
 Source Schema         : pvcb_mbpm

 Target Server Type    : MySQL
 Target Server Version : 100421 (10.4.21-MariaDB)
 File Encoding         : 65001

 Date: 01/06/2024 19:57:50
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for branch
-- ----------------------------
DROP TABLE IF EXISTS `branch`;
CREATE TABLE `branch`  (
  `branchID` int NOT NULL AUTO_INCREMENT,
  `brName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'Name of PVCB Branch',
  `brDes` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'Descrption of Branch',
  PRIMARY KEY (`branchID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of branch
-- ----------------------------
INSERT INTO `branch` VALUES (1, 'PVcomBank Trà Nóc', 'Chi nhánh Chuẩn');
INSERT INTO `branch` VALUES (2, 'Vùng 6', 'Vùng');
INSERT INTO `branch` VALUES (3, 'PVcomBank Test', 'Chi nhánh dùng để Test');
INSERT INTO `branch` VALUES (4, 'PVcomBank Vĩnh Long', 'Chi nhánh Vĩnh Long');
INSERT INTO `branch` VALUES (5, 'PVcomBank Đồng Tháp', 'Chi nhánh Đồng Tháp');
INSERT INTO `branch` VALUES (6, 'PVcomBank Tiền Giang', 'Chi nhánh Tiền Giang');
INSERT INTO `branch` VALUES (7, 'PVcomBank Lý Tự Trọng', 'Chi nhánh Đa năng KĐĐ');
INSERT INTO `branch` VALUES (8, 'PVcomBank Bà Chiểu', 'Chi nhánh Bà Chiểu');
INSERT INTO `branch` VALUES (9, 'PVcomBank Cờ Đỏ', 'Chi nhánh chuẩn');

-- ----------------------------
-- Table structure for case
-- ----------------------------
DROP TABLE IF EXISTS `case`;
CREATE TABLE `case`  (
  `caseID` int NOT NULL AUTO_INCREMENT,
  `custID` int NOT NULL,
  `productID` int NOT NULL,
  `openTime` datetime NOT NULL,
  `updateTime` datetime NULL DEFAULT NULL,
  `finalSLA` int NOT NULL,
  `empID` int NOT NULL,
  `statusID` int NOT NULL,
  PRIMARY KEY (`caseID`) USING BTREE,
  INDEX `fk_cust_case`(`custID` ASC) USING BTREE,
  INDEX `fk_emp_case`(`empID` ASC) USING BTREE,
  INDEX `fk_prod_case`(`productID` ASC) USING BTREE,
  INDEX `fk_status_case`(`statusID` ASC) USING BTREE,
  CONSTRAINT `fk_cust_case` FOREIGN KEY (`custID`) REFERENCES `customer` (`custID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_emp_case` FOREIGN KEY (`empID`) REFERENCES `employee` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_prod_case` FOREIGN KEY (`productID`) REFERENCES `product` (`productID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_status_case` FOREIGN KEY (`statusID`) REFERENCES `status` (`statusID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of case
-- ----------------------------

-- ----------------------------
-- Table structure for customer
-- ----------------------------
DROP TABLE IF EXISTS `customer`;
CREATE TABLE `customer`  (
  `custID` int NOT NULL AUTO_INCREMENT,
  `custName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `custPhone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `socialID` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'This info to verify customer',
  `t24ID` int NULL DEFAULT NULL,
  `empT24id` int NULL DEFAULT NULL,
  `note` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  PRIMARY KEY (`custID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of customer
-- ----------------------------

-- ----------------------------
-- Table structure for emp_func
-- ----------------------------
DROP TABLE IF EXISTS `emp_func`;
CREATE TABLE `emp_func`  (
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `functionID` int NOT NULL,
  INDEX `fk_func`(`functionID` ASC) USING BTREE,
  INDEX `fk_emp_funct`(`username` ASC) USING BTREE,
  CONSTRAINT `fk_emp_funct` FOREIGN KEY (`username`) REFERENCES `employee` (`username`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_func` FOREIGN KEY (`functionID`) REFERENCES `function` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of emp_func
-- ----------------------------
INSERT INTO `emp_func` VALUES ('nhannv', 2);
INSERT INTO `emp_func` VALUES ('nhannv', 4);
INSERT INTO `emp_func` VALUES ('nhannv', 5);
INSERT INTO `emp_func` VALUES ('nhannv', 6);
INSERT INTO `emp_func` VALUES ('nhannv', 7);
INSERT INTO `emp_func` VALUES ('nhannv', 8);
INSERT INTO `emp_func` VALUES ('nhannv', 9);
INSERT INTO `emp_func` VALUES ('nhannv', 10);
INSERT INTO `emp_func` VALUES ('nhuntq', 9);
INSERT INTO `emp_func` VALUES ('oanhdth', 9);
INSERT INTO `emp_func` VALUES ('truongdonvi', 9);
INSERT INTO `emp_func` VALUES ('hannt3', 8);
INSERT INTO `emp_func` VALUES ('hannt3', 9);
INSERT INTO `emp_func` VALUES ('phuclh', 8);
INSERT INTO `emp_func` VALUES ('phuclh', 9);
INSERT INTO `emp_func` VALUES ('bichpn', 9);
INSERT INTO `emp_func` VALUES ('hieunt2', 9);
INSERT INTO `emp_func` VALUES ('ngannk1', 9);
INSERT INTO `emp_func` VALUES ('duynk2', 9);
INSERT INTO `emp_func` VALUES ('khanhnt', 9);
INSERT INTO `emp_func` VALUES ('hoint', 9);
INSERT INTO `emp_func` VALUES ('trinhpnh', 9);
INSERT INTO `emp_func` VALUES ('ngadtb', 8);
INSERT INTO `emp_func` VALUES ('ngadtb', 9);
INSERT INTO `emp_func` VALUES ('vyplh', 9);
INSERT INTO `emp_func` VALUES ('thanhnlt', 9);
INSERT INTO `emp_func` VALUES ('binhnp', 9);
INSERT INTO `emp_func` VALUES ('vanttt2', 9);
INSERT INTO `emp_func` VALUES ('Vunhv', 9);
INSERT INTO `emp_func` VALUES ('maiptn1', 9);
INSERT INTO `emp_func` VALUES ('loild', 9);
INSERT INTO `emp_func` VALUES ('thuyltt1', 9);
INSERT INTO `emp_func` VALUES ('nganntk2', 9);
INSERT INTO `emp_func` VALUES ('duynm3', 9);
INSERT INTO `emp_func` VALUES ('diemntm', 9);
INSERT INTO `emp_func` VALUES ('huydn1', 9);
INSERT INTO `emp_func` VALUES ('trangtt4', 9);
INSERT INTO `emp_func` VALUES ('tuyennt1', 9);
INSERT INTO `emp_func` VALUES ('maihth', 9);
INSERT INTO `emp_func` VALUES ('binhnt7', 9);
INSERT INTO `emp_func` VALUES ('linhnt22', 9);
INSERT INTO `emp_func` VALUES ('chungvtk', 9);
INSERT INTO `emp_func` VALUES ('hungvq1', 9);
INSERT INTO `emp_func` VALUES ('tructtd', 9);
INSERT INTO `emp_func` VALUES ('trucptk', 9);
INSERT INTO `emp_func` VALUES ('phucnh2', 9);
INSERT INTO `emp_func` VALUES ('thanhpn', 9);
INSERT INTO `emp_func` VALUES ('dungntt4', 9);
INSERT INTO `emp_func` VALUES ('thonth', 9);
INSERT INTO `emp_func` VALUES ('trinhntd', 9);
INSERT INTO `emp_func` VALUES ('luanpm', 9);
INSERT INTO `emp_func` VALUES ('luanpm', 8);
INSERT INTO `emp_func` VALUES ('soncnt', 5);
INSERT INTO `emp_func` VALUES ('soncnt', 6);
INSERT INTO `emp_func` VALUES ('soncnt', 7);
INSERT INTO `emp_func` VALUES ('soncnt', 9);
INSERT INTO `emp_func` VALUES ('truongdonvi', 8);
INSERT INTO `emp_func` VALUES ('nhanvien', 3);
INSERT INTO `emp_func` VALUES ('nhanvien', 5);
INSERT INTO `emp_func` VALUES ('nhanvien', 6);
INSERT INTO `emp_func` VALUES ('nhanvien', 7);
INSERT INTO `emp_func` VALUES ('nhanvien', 9);
INSERT INTO `emp_func` VALUES ('nhanvien', 10);
INSERT INTO `emp_func` VALUES ('nhanvien', 11);
INSERT INTO `emp_func` VALUES ('dannt2', 8);
INSERT INTO `emp_func` VALUES ('dannt2', 9);
INSERT INTO `emp_func` VALUES ('sanglx', 9);
INSERT INTO `emp_func` VALUES ('lamnt2', 9);
INSERT INTO `emp_func` VALUES ('khanhnh', 9);
INSERT INTO `emp_func` VALUES ('khanhnat', 9);
INSERT INTO `emp_func` VALUES ('tutt6', 9);
INSERT INTO `emp_func` VALUES ('thaoqt1', 9);
INSERT INTO `emp_func` VALUES ('khoanty', 9);
INSERT INTO `emp_func` VALUES ('thibk', 9);
INSERT INTO `emp_func` VALUES ('luunt1', 9);
INSERT INTO `emp_func` VALUES ('quangpn1', 9);
INSERT INTO `emp_func` VALUES ('tranglt5', 9);
INSERT INTO `emp_func` VALUES ('ngoandt1', 9);
INSERT INTO `emp_func` VALUES ('thaobtb', 9);
INSERT INTO `emp_func` VALUES ('phuongtl3', 9);
INSERT INTO `emp_func` VALUES ('nhitd', 9);
INSERT INTO `emp_func` VALUES ('hieulmh', 8);
INSERT INTO `emp_func` VALUES ('hieulmh', 9);
INSERT INTO `emp_func` VALUES ('trilm2', 9);
INSERT INTO `emp_func` VALUES ('phannth', 9);
INSERT INTO `emp_func` VALUES ('tudtc', 9);
INSERT INTO `emp_func` VALUES ('huyennt27', 9);
INSERT INTO `emp_func` VALUES ('lynh1', 9);
INSERT INTO `emp_func` VALUES ('tuntt2', 9);
INSERT INTO `emp_func` VALUES ('tiendtt4', 9);
INSERT INTO `emp_func` VALUES ('thanhhm', 3);
INSERT INTO `emp_func` VALUES ('dint', 3);
INSERT INTO `emp_func` VALUES ('hunglk', 3);
INSERT INTO `emp_func` VALUES ('hieuptn', 3);
INSERT INTO `emp_func` VALUES ('phuongnt24', 3);
INSERT INTO `emp_func` VALUES ('anhntk5', 3);
INSERT INTO `emp_func` VALUES ('dienhv', 9);
INSERT INTO `emp_func` VALUES ('danbv', 9);
INSERT INTO `emp_func` VALUES ('vylp', 9);
INSERT INTO `emp_func` VALUES ('thucnd', 9);
INSERT INTO `emp_func` VALUES ('sanght8', 9);
INSERT INTO `emp_func` VALUES ('tranhth', 9);
INSERT INTO `emp_func` VALUES ('nganmt', 9);
INSERT INTO `emp_func` VALUES ('ngocdb2', 9);
INSERT INTO `emp_func` VALUES ('trangptb', 9);
INSERT INTO `emp_func` VALUES ('tuyetnta5', 9);
INSERT INTO `emp_func` VALUES ('khanhlh', 9);
INSERT INTO `emp_func` VALUES ('trangnn6', 3);
INSERT INTO `emp_func` VALUES ('trangnn6', 5);
INSERT INTO `emp_func` VALUES ('trangnn6', 12);
INSERT INTO `emp_func` VALUES ('trangnn6', 9);

-- ----------------------------
-- Table structure for employee
-- ----------------------------
DROP TABLE IF EXISTS `employee`;
CREATE TABLE `employee`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'password to login',
  `fullname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'fullname of user',
  `status` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'enable',
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'email of user',
  `phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'user phoneNo',
  `branchID` int NOT NULL COMMENT 'ID of pvcb branch',
  `roleID` int NOT NULL COMMENT 'role of user',
  `teamID` int NULL DEFAULT NULL,
  `empT24id` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `username`(`username` ASC) USING BTREE,
  INDEX `fk_emp_brach`(`branchID` ASC) USING BTREE,
  INDEX `fk_emp_role`(`roleID` ASC) USING BTREE,
  INDEX `fk_emp_team`(`teamID` ASC) USING BTREE,
  CONSTRAINT `fk_emp_team` FOREIGN KEY (`teamID`) REFERENCES `team` (`teamID`) ON DELETE SET NULL ON UPDATE SET NULL
) ENGINE = InnoDB AUTO_INCREMENT = 93 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of employee
-- ----------------------------
INSERT INTO `employee` VALUES (1, 'sa', '$2y$10$HzzM6xk1URtt6QQ0KyZXI.C0HoO42Z4JFhVGOQfHjKotBvunNkF0y', 'Nguyễn Văn Nhân', 'enable', 'admin@hitechmekong.vn', NULL, 1, 1, 4, NULL);
INSERT INTO `employee` VALUES (2, 'nhannv', '$2y$10$WWn4X2meSGWaMv/f/nYVT.oEHuhUuBWtk2DMLuktpZsn0aAGyNnOK', 'Nguyễn Văn Nhân', 'enable', 'nhannv@pvcombank.com.vn', NULL, 9, 4, 4, NULL);
INSERT INTO `employee` VALUES (3, 'dienhv', '$2y$10$66px/rD1I9lyG3PiYYGHU.HtI5aS38Kr3Wrvg/zlEu3Es7MeEGcQG', 'Huỳnh Văn Điền', 'enable', 'dienhv@pvcombank.com.vn', NULL, 1, 5, 1, NULL);
INSERT INTO `employee` VALUES (4, 'nhuntq', '$2y$10$HzzM6xk1URtt6QQ0KyZXI.C0HoO42Z4JFhVGOQfHjKotBvunNkF0y', 'Nguyễn Thị Quỳnh Như', 'disable', 'nhuntq@pvcombank.com.vn', NULL, 1, 6, 1, NULL);
INSERT INTO `employee` VALUES (5, 'phuochv', '$2y$10$HzzM6xk1URtt6QQ0KyZXI.C0HoO42Z4JFhVGOQfHjKotBvunNkF0y', 'Huỳnh Văn Phước', 'enable', 'phuochv@pvcombank.com.vn', NULL, 2, 2, 4, NULL);
INSERT INTO `employee` VALUES (6, 'thanhhm', '$2y$10$HzzM6xk1URtt6QQ0KyZXI.C0HoO42Z4JFhVGOQfHjKotBvunNkF0y', 'Huỳnh Minh Thành', 'enable', 'thanhhm@pvcombank.com.vn', NULL, 1, 5, 1, NULL);
INSERT INTO `employee` VALUES (7, 'dint', '$2y$10$HzzM6xk1URtt6QQ0KyZXI.C0HoO42Z4JFhVGOQfHjKotBvunNkF0y', 'Nguyễn Thanh Di', 'disable', 'dint@pvcombank.com.vn', NULL, 1, 5, 1, NULL);
INSERT INTO `employee` VALUES (8, 'hunglk', '$2y$10$HzzM6xk1URtt6QQ0KyZXI.C0HoO42Z4JFhVGOQfHjKotBvunNkF0y', 'Lê Khánh Hưng', 'enable', 'hunglk@pvcombank.com.vn', NULL, 1, 5, 1, NULL);
INSERT INTO `employee` VALUES (9, 'hieuptn', '$2y$10$HzzM6xk1URtt6QQ0KyZXI.C0HoO42Z4JFhVGOQfHjKotBvunNkF0y', 'Phan Thị Ngọc Hiểu', 'disable', 'hieuptn@pvcombank.com.vn', NULL, 1, 5, 1, NULL);
INSERT INTO `employee` VALUES (10, 'oanhdth', '$2y$10$jR1dmxm0K2dH7mDTO1yZkeUbslj0JKD1Zcwis8MTe228QmLiDiXjK', 'Đặng Thị Hoàng Oanh', 'enable', 'oanhdth@pvcombank.com.vn', NULL, 1, 10, 4, NULL);
INSERT INTO `employee` VALUES (11, 'truongdonvi', '$2y$10$HzzM6xk1URtt6QQ0KyZXI.C0HoO42Z4JFhVGOQfHjKotBvunNkF0y', 'Nguyễn Văn A', 'enable', 'test@pvcombank.com.vn', NULL, 3, 4, 4, NULL);
INSERT INTO `employee` VALUES (12, 'nhanvien', '$2y$10$HzzM6xk1URtt6QQ0KyZXI.C0HoO42Z4JFhVGOQfHjKotBvunNkF0y', 'Trần Thị C', 'enable', 'test@pvcombank.com.vn', NULL, 3, 5, 4, NULL);
INSERT INTO `employee` VALUES (13, 'phuclh', '$2y$10$jR1dmxm0K2dH7mDTO1yZkeUbslj0JKD1Zcwis8MTe228QmLiDiXjK', 'Lê Hoài Phúc', 'enable', 'phuclh@pvcombank.com.vn', NULL, 6, 4, 4, NULL);
INSERT INTO `employee` VALUES (14, 'huydn1', '$2y$10$jR1dmxm0K2dH7mDTO1yZkeUbslj0JKD1Zcwis8MTe228QmLiDiXjK', 'Đinh Nhật Huy', 'enable', 'huydn1@pvcombank.com.vn', NULL, 6, 5, 1, NULL);
INSERT INTO `employee` VALUES (15, 'trangtt4', '$2y$10$jR1dmxm0K2dH7mDTO1yZkeUbslj0JKD1Zcwis8MTe228QmLiDiXjK', 'Trần Thị Phương Trang', 'enable', 'trangtt4@pvcombank.com.vn', NULL, 6, 5, 1, NULL);
INSERT INTO `employee` VALUES (16, 'tuyennt1', '$2y$10$jR1dmxm0K2dH7mDTO1yZkeUbslj0JKD1Zcwis8MTe228QmLiDiXjK', 'Nguyễn Thị Mộng Tuyền', 'enable', 'tuyennt1@pvcombank.com.vn', NULL, 6, 5, 1, NULL);
INSERT INTO `employee` VALUES (17, 'maihth', '$2y$10$jR1dmxm0K2dH7mDTO1yZkeUbslj0JKD1Zcwis8MTe228QmLiDiXjK', 'Hà Thị Huỳnh Mai', 'enable', 'maihth@pvcombank.com.vn', NULL, 6, 5, 1, NULL);
INSERT INTO `employee` VALUES (18, 'binhnt7', '$2y$10$jR1dmxm0K2dH7mDTO1yZkeUbslj0JKD1Zcwis8MTe228QmLiDiXjK', 'Nguyễn Thanh Bình', 'enable', 'binhnt7@pvcombank.com.vn', NULL, 6, 5, 1, NULL);
INSERT INTO `employee` VALUES (19, 'soncnt', '$2y$10$jR1dmxm0K2dH7mDTO1yZkeUbslj0JKD1Zcwis8MTe228QmLiDiXjK', 'Châu Ngọc Thanh Sơn', 'enable', 'soncnt@pvcombank.com.vn', NULL, 6, 5, 1, NULL);
INSERT INTO `employee` VALUES (20, 'linhnt22', '$2y$10$jR1dmxm0K2dH7mDTO1yZkeUbslj0JKD1Zcwis8MTe228QmLiDiXjK', 'Nguyễn Trúc Linh', 'enable', 'linhnt22@pvcombank.com.vn', NULL, 6, 5, 1, NULL);
INSERT INTO `employee` VALUES (21, 'chungvtk', '$2y$10$jR1dmxm0K2dH7mDTO1yZkeUbslj0JKD1Zcwis8MTe228QmLiDiXjK', 'Võ Thị Kim Chung', 'enable', 'chungvtk@pvcombank.com.vn', NULL, 6, 5, 1, NULL);
INSERT INTO `employee` VALUES (22, 'hungvq1', '$2y$10$jR1dmxm0K2dH7mDTO1yZkeUbslj0JKD1Zcwis8MTe228QmLiDiXjK', 'Võ Quốc Hưng', 'enable', 'hungvq1@pvcombank.com.vn', NULL, 6, 5, 1, NULL);
INSERT INTO `employee` VALUES (23, 'tructtd', '$2y$10$jR1dmxm0K2dH7mDTO1yZkeUbslj0JKD1Zcwis8MTe228QmLiDiXjK', 'Trương Thị Diễm Trúc', 'enable', 'tructtd@pvcombank.com.vn', NULL, 6, 5, 1, NULL);
INSERT INTO `employee` VALUES (24, 'trucptk', '$2y$10$jR1dmxm0K2dH7mDTO1yZkeUbslj0JKD1Zcwis8MTe228QmLiDiXjK', 'Phùng Thị Kim Trúc', 'enable', 'trucptk@pvcombank.com.vn', NULL, 6, 5, 1, NULL);
INSERT INTO `employee` VALUES (25, 'phucnh2', '$2y$10$jR1dmxm0K2dH7mDTO1yZkeUbslj0JKD1Zcwis8MTe228QmLiDiXjK', 'Nguyễn Hoàng Phúc', 'enable', 'phucnh2@pvcombank.com.vn', NULL, 6, 5, 1, NULL);
INSERT INTO `employee` VALUES (26, 'thanhpn', '$2y$10$jR1dmxm0K2dH7mDTO1yZkeUbslj0JKD1Zcwis8MTe228QmLiDiXjK', 'Phan Nguyệt Thanh', 'enable', 'thanhpn@pvcombank.com.vn', NULL, 6, 5, 1, NULL);
INSERT INTO `employee` VALUES (27, 'dungntt4', '$2y$10$jR1dmxm0K2dH7mDTO1yZkeUbslj0JKD1Zcwis8MTe228QmLiDiXjK', 'Nguyễn Thị Thùy Dung', 'enable', 'dungntt4@pvcombank.com.vn', NULL, 6, 5, 1, NULL);
INSERT INTO `employee` VALUES (28, 'thonth', '$2y$10$jR1dmxm0K2dH7mDTO1yZkeUbslj0JKD1Zcwis8MTe228QmLiDiXjK', 'Ngô Thị Hồng Thơ', 'enable', 'thonth@pvcombank.com.vn', NULL, 6, 5, 1, NULL);
INSERT INTO `employee` VALUES (29, 'trinhntd', '$2y$10$jR1dmxm0K2dH7mDTO1yZkeUbslj0JKD1Zcwis8MTe228QmLiDiXjK', 'Nguyễn Thị Diễm Trinh', 'enable', 'trinhntd@pvcombank.com.vn', NULL, 6, 5, 1, NULL);
INSERT INTO `employee` VALUES (30, 'luanpm', '$2y$10$jR1dmxm0K2dH7mDTO1yZkeUbslj0JKD1Zcwis8MTe228QmLiDiXjK', 'Phan Minh Luận', 'enable', 'luanpm@pvcombank.com.vn', '0908.244.448', 5, 8, 4, NULL);
INSERT INTO `employee` VALUES (31, 'utbv', '$2y$10$jR1dmxm0K2dH7mDTO1yZkeUbslj0JKD1Zcwis8MTe228QmLiDiXjK', 'Bùi Văn Út', 'enable', 'utbv@pvcombank.com.vn', '0931 050 456', 5, 7, 1, NULL);
INSERT INTO `employee` VALUES (32, 'vyplh', '$2y$10$jR1dmxm0K2dH7mDTO1yZkeUbslj0JKD1Zcwis8MTe228QmLiDiXjK', 'Phạm Lê Hoàng Vy', 'enable', 'vyplh@pvcombank.com.vn', '0939 999 083', 5, 5, 1, NULL);
INSERT INTO `employee` VALUES (33, 'thanhnlt', '$2y$10$jR1dmxm0K2dH7mDTO1yZkeUbslj0JKD1Zcwis8MTe228QmLiDiXjK', 'Nguyễn Long Trung Thành', 'enable', 'thanhnlt@pvcombank.com.vn', '0961222054', 5, 5, 1, NULL);
INSERT INTO `employee` VALUES (34, 'binhnp', '$2y$10$jR1dmxm0K2dH7mDTO1yZkeUbslj0JKD1Zcwis8MTe228QmLiDiXjK', 'Nguyễn Phước Bình', 'enable', 'binhnp@pvcombank.com.vn', '0971505281', 5, 5, 1, NULL);
INSERT INTO `employee` VALUES (35, 'vanttt2', '$2y$10$jR1dmxm0K2dH7mDTO1yZkeUbslj0JKD1Zcwis8MTe228QmLiDiXjK', 'Trương Thị Tường Vân', 'enable', 'vanttt2@pvcombank.com.vn', '0939289922', 5, 5, 1, NULL);
INSERT INTO `employee` VALUES (36, 'Vunhv', '$2y$10$jR1dmxm0K2dH7mDTO1yZkeUbslj0JKD1Zcwis8MTe228QmLiDiXjK', 'Nguyễn Huỳnh Vương Vũ', 'enable', 'Vunhv@pvcombank.com.vn', '0796999099', 5, 5, 1, NULL);
INSERT INTO `employee` VALUES (37, 'maiptn1', '$2y$10$jR1dmxm0K2dH7mDTO1yZkeUbslj0JKD1Zcwis8MTe228QmLiDiXjK', 'Phan Thị Ngọc Mai', 'enable', 'maiptn1@pvcombank.com.vn', '0853545577', 5, 5, 1, NULL);
INSERT INTO `employee` VALUES (38, 'loild', '$2y$10$jR1dmxm0K2dH7mDTO1yZkeUbslj0JKD1Zcwis8MTe228QmLiDiXjK', 'Lê Đức Lợi', 'enable', 'loild@pvcombank.com.vn', '0931.066.616', 5, 5, 1, NULL);
INSERT INTO `employee` VALUES (39, 'thuyltt1', '$2y$10$jR1dmxm0K2dH7mDTO1yZkeUbslj0JKD1Zcwis8MTe228QmLiDiXjK', 'Lê Thị Thanh Thúy', 'enable', 'thuyltt1@pvcombank.com.vn', '0915.392.006', 5, 5, 1, NULL);
INSERT INTO `employee` VALUES (40, 'nganntk2', '$2y$10$jR1dmxm0K2dH7mDTO1yZkeUbslj0JKD1Zcwis8MTe228QmLiDiXjK', 'Ngô Thị Kim Ngân', 'enable', 'nganntk2@pvcombank.com.vn', '0829.027.551', 5, 5, 1, NULL);
INSERT INTO `employee` VALUES (41, 'duynm3', '$2y$10$jR1dmxm0K2dH7mDTO1yZkeUbslj0JKD1Zcwis8MTe228QmLiDiXjK', 'Nguyễn Mạnh Duy', 'enable', 'duynm3@pvcombank.com.vn', '0932.903.424', 5, 5, 1, NULL);
INSERT INTO `employee` VALUES (42, 'diemntm', '$2y$10$jR1dmxm0K2dH7mDTO1yZkeUbslj0JKD1Zcwis8MTe228QmLiDiXjK', 'Nguyễn Thị Mai Diễm', 'enable', 'diemntm@pvcombank.com.vn', '0945.759.069', 5, 5, 1, NULL);
INSERT INTO `employee` VALUES (43, 'hannt3', '$2y$10$jR1dmxm0K2dH7mDTO1yZkeUbslj0JKD1Zcwis8MTe228QmLiDiXjK', 'Nguyễn Trường Hận', 'enable', 'hannt3@pvcombank.com.vn', NULL, 4, 4, 4, NULL);
INSERT INTO `employee` VALUES (44, 'bichpn', '$2y$10$y53imAB8OuYdAbtQ8kAtI.u5GhthKz1OXFX44RjTfVo4iyM.H4ytO', 'Phạm Ngọc Bích', 'enable', 'bichpn@pvcombank.com.vn', NULL, 4, 8, 1, NULL);
INSERT INTO `employee` VALUES (45, 'hieunt2', '$2y$10$a7Pub5CVYdvSyrwq/FFc4uOCH6xg/VQsbIA32SJN7rAYmChNzDrvO', 'Ngô Trung Hiếu', 'enable', 'hieunt2@pvcombank.com.vn', NULL, 4, 5, 1, NULL);
INSERT INTO `employee` VALUES (46, 'ngannk1', '$2y$10$jR1dmxm0K2dH7mDTO1yZkeUbslj0JKD1Zcwis8MTe228QmLiDiXjK', 'Nguyễn Kim Ngân', 'enable', 'ngannk1@pvcombank.com.vn', NULL, 4, 5, 1, NULL);
INSERT INTO `employee` VALUES (47, 'duynk2', '$2y$10$1BoaYWE1ptyL4P3yN2ISpOUjWg1k0C6o7N0I3enPfb5Vd05bkFv7W', 'Nguyễn Khánh Duy', 'enable', 'duynk2@pvcombank.com.vn', NULL, 4, 5, 1, NULL);
INSERT INTO `employee` VALUES (48, 'khanhnt', '$2y$10$jR1dmxm0K2dH7mDTO1yZkeUbslj0JKD1Zcwis8MTe228QmLiDiXjK', 'Nguyễn Tuấn Khanh', 'enable', 'khanhnt@pvcombank.com.vn', NULL, 4, 5, 1, NULL);
INSERT INTO `employee` VALUES (49, 'hoint', '$2y$10$jR1dmxm0K2dH7mDTO1yZkeUbslj0JKD1Zcwis8MTe228QmLiDiXjK', 'Nguyễn Thị Hồi', 'enable', 'hoint@pvcombank.com.vn', NULL, 4, 5, 1, NULL);
INSERT INTO `employee` VALUES (50, 'trinhpnh', '$2y$10$jR1dmxm0K2dH7mDTO1yZkeUbslj0JKD1Zcwis8MTe228QmLiDiXjK', 'Phan Nguyễn Hồng Trinh', 'enable', 'trinhpnh@pvcombank.com.vn', NULL, 4, 5, 1, NULL);
INSERT INTO `employee` VALUES (51, 'ngadtb', '$2y$10$jR1dmxm0K2dH7mDTO1yZkeUbslj0JKD1Zcwis8MTe228QmLiDiXjK', 'Dương Thị Bích Nga', 'enable', 'ngadtb@pvcombank.com.vn', NULL, 5, 4, 4, NULL);
INSERT INTO `employee` VALUES (52, 'phuongnt24', '$2y$10$HzzM6xk1URtt6QQ0KyZXI.C0HoO42Z4JFhVGOQfHjKotBvunNkF0y', 'Nguyễn Thanh Phương', 'disable', 'phuongnt24@pvcombank.com.vn', NULL, 1, 5, 1, NULL);
INSERT INTO `employee` VALUES (53, 'anhntk5', '$2y$10$HzzM6xk1URtt6QQ0KyZXI.C0HoO42Z4JFhVGOQfHjKotBvunNkF0y', 'Nguyễn Thị Kiều Anh', 'enable', 'anhntk5@pvcombank.com.vn', NULL, 1, 5, 1, NULL);
INSERT INTO `employee` VALUES (54, 'dannt2', '$2y$10$jR1dmxm0K2dH7mDTO1yZkeUbslj0JKD1Zcwis8MTe228QmLiDiXjK', 'Nguyễn Thị Dân', 'enable', 'dannt2@pvcombank.com.vn', NULL, 7, 4, 1, NULL);
INSERT INTO `employee` VALUES (55, 'daont1', '$2y$10$jR1dmxm0K2dH7mDTO1yZkeUbslj0JKD1Zcwis8MTe228QmLiDiXjK', 'Nguyễn Trần Anh Đào', 'enable', 'daont1@pvcombank.com.vn', NULL, 7, 9, 1, NULL);
INSERT INTO `employee` VALUES (56, 'tranglt5', '$2y$10$jR1dmxm0K2dH7mDTO1yZkeUbslj0JKD1Zcwis8MTe228QmLiDiXjK', 'Lê Thụy Thùy Trang', 'enable', 'tranglt5@pvcombank.com.vn', NULL, 7, 6, 1, NULL);
INSERT INTO `employee` VALUES (57, 'huongdh', '$2y$10$jR1dmxm0K2dH7mDTO1yZkeUbslj0JKD1Zcwis8MTe228QmLiDiXjK', 'Đoàn Huỳnh Hương', 'enable', 'huongdh@pvcombank.com.vn', NULL, 7, 10, 1, NULL);
INSERT INTO `employee` VALUES (58, 'ngoandt1', '$2y$10$jR1dmxm0K2dH7mDTO1yZkeUbslj0JKD1Zcwis8MTe228QmLiDiXjK', 'Dương Thị Ngoan', 'enable', 'ngoandt1@pvcombank.com.vn', NULL, 7, 6, 1, NULL);
INSERT INTO `employee` VALUES (59, 'thaobtb', '$2y$10$jR1dmxm0K2dH7mDTO1yZkeUbslj0JKD1Zcwis8MTe228QmLiDiXjK', 'Bùi Thị Bé Thảo', 'enable', 'thaobtb@pvcombank.com.vn', NULL, 7, 6, 1, NULL);
INSERT INTO `employee` VALUES (60, 'phuongtl3', '$2y$10$jR1dmxm0K2dH7mDTO1yZkeUbslj0JKD1Zcwis8MTe228QmLiDiXjK', 'Tô Lan Phương', 'enable', 'phuongtl3@pvcombank.com.vn', NULL, 7, 6, 1, NULL);
INSERT INTO `employee` VALUES (61, 'sanglx', '$2y$10$7MCAjsuu4uOfrcm4m/2y/Oc6aqYr4Tpya31zheymYzivwKlzb/Bs.', 'Lê Xuân Sang', 'enable', 'sanglx@pvcombank.com.vn', NULL, 7, 8, 1, NULL);
INSERT INTO `employee` VALUES (62, 'nhitd', '$2y$10$jR1dmxm0K2dH7mDTO1yZkeUbslj0JKD1Zcwis8MTe228QmLiDiXjK', 'Trần Đăng Phương Nhi ', 'enable', 'nhitd@pvcombank.com.vn', NULL, 7, 5, 3, NULL);
INSERT INTO `employee` VALUES (63, 'lamnt2', '$2y$10$jR1dmxm0K2dH7mDTO1yZkeUbslj0JKD1Zcwis8MTe228QmLiDiXjK', 'Ngô Thị Hồng Lắm', 'enable', 'lamnt2@pvcombank.com.vn', NULL, 7, 5, 1, NULL);
INSERT INTO `employee` VALUES (64, 'khanhnh', '$2y$10$zFdMQTE5l68g49mQNdjKMepB/wuZfVg5pT0tulAPR68pvMM/zJpUu', 'Nguyễn Hoàng Khánh', 'enable', 'khanhnh@pvcombank.com.vn', NULL, 7, 5, 1, NULL);
INSERT INTO `employee` VALUES (65, 'khanhnat', '$2y$10$yYFyDPwXp6DFsrgCLIOTo.EOuXDw6/Tn71j..U2GSafZyNu6JlJNu', 'Nguyễn Âu Trường Khánh', 'enable', 'khanhnat@pvcombank.com.vn', NULL, 7, 5, 1, NULL);
INSERT INTO `employee` VALUES (66, 'tutt6', '$2y$10$r95XUcLK3iNQwAmlIlQZT.MevlJrHXpNzJufgI.PeRGpTxLJI12YK', 'Trương Tuấn Tú', 'enable', 'tutt6@pvcombank.com.vn', NULL, 7, 5, 1, NULL);
INSERT INTO `employee` VALUES (67, 'thaoqt1', '$2y$10$jR1dmxm0K2dH7mDTO1yZkeUbslj0JKD1Zcwis8MTe228QmLiDiXjK', 'Quách Thương Thảo', 'enable', 'thaoqt1@pvcombank.com.vn', NULL, 7, 5, 1, NULL);
INSERT INTO `employee` VALUES (68, 'khoanty', '$2y$10$jR1dmxm0K2dH7mDTO1yZkeUbslj0JKD1Zcwis8MTe228QmLiDiXjK', 'Nguyễn Thị Yến Khoa', 'enable', 'khoanty@pvcombank.com.vn', NULL, 7, 5, 1, NULL);
INSERT INTO `employee` VALUES (69, 'thibk', '$2y$10$jR1dmxm0K2dH7mDTO1yZkeUbslj0JKD1Zcwis8MTe228QmLiDiXjK', 'Bùi Khoa Thi', 'enable', 'thibk@pvcombank.com.vn', NULL, 7, 5, 1, NULL);
INSERT INTO `employee` VALUES (70, 'luunt1', '$2y$10$jR1dmxm0K2dH7mDTO1yZkeUbslj0JKD1Zcwis8MTe228QmLiDiXjK', 'Nguyễn Thiện Lưu', 'enable', 'luunt1@pvcombank.com.vn', NULL, 7, 5, 4, NULL);
INSERT INTO `employee` VALUES (71, 'quangpn1', '$2y$10$jR1dmxm0K2dH7mDTO1yZkeUbslj0JKD1Zcwis8MTe228QmLiDiXjK', 'Phan Nhật Quang', 'enable', 'quangpn1@pvcombank.com.vn', NULL, 7, 5, 1, NULL);
INSERT INTO `employee` VALUES (72, 'trilm2', '$2y$10$jR1dmxm0K2dH7mDTO1yZkeUbslj0JKD1Zcwis8MTe228QmLiDiXjK', 'Lâm Minh Trí', 'enable', 'trilm2@pvcombank.com.vn', NULL, 8, 5, 1, NULL);
INSERT INTO `employee` VALUES (73, 'phannth', '$2y$10$jR1dmxm0K2dH7mDTO1yZkeUbslj0JKD1Zcwis8MTe228QmLiDiXjK', 'Nguyễn Thị Hồng Phấn', 'enable', 'phannth@pvcombank.com.vn', NULL, 8, 5, 1, NULL);
INSERT INTO `employee` VALUES (74, 'tudtc', '$2y$10$jR1dmxm0K2dH7mDTO1yZkeUbslj0JKD1Zcwis8MTe228QmLiDiXjK', 'Đặng Thị Cẩm Tú', 'enable', 'tudtc@pvcombank.com.vn', NULL, 8, 5, 1, NULL);
INSERT INTO `employee` VALUES (75, 'huyennt27', '$2y$10$jR1dmxm0K2dH7mDTO1yZkeUbslj0JKD1Zcwis8MTe228QmLiDiXjK', 'Nguyễn Thị Huyền', 'enable', 'huyennt27@pvcombank.com.vn', NULL, 8, 5, 1, NULL);
INSERT INTO `employee` VALUES (76, 'lynh1', '$2y$10$jR1dmxm0K2dH7mDTO1yZkeUbslj0JKD1Zcwis8MTe228QmLiDiXjK', 'Nguyễn Hương Ly', 'enable', 'lynh1@pvcombank.com.vn', NULL, 8, 5, 1, NULL);
INSERT INTO `employee` VALUES (77, 'tuntt2', '$2y$10$jR1dmxm0K2dH7mDTO1yZkeUbslj0JKD1Zcwis8MTe228QmLiDiXjK', 'Nguyễn Thị Thanh Tú', 'enable', 'tuntt2@pvcombank.com.vn', NULL, 8, 5, 1, NULL);
INSERT INTO `employee` VALUES (78, 'tiendtt4', '$2y$10$jR1dmxm0K2dH7mDTO1yZkeUbslj0JKD1Zcwis8MTe228QmLiDiXjK', 'Đinh Thị Thủy Tiên', 'enable', 'tiendtt4@pvcombank.com.vn', NULL, 8, 5, 1, NULL);
INSERT INTO `employee` VALUES (79, 'hieulmh', '$2y$10$jR1dmxm0K2dH7mDTO1yZkeUbslj0JKD1Zcwis8MTe228QmLiDiXjK', 'Lê Minh Hoàng Hiếu', 'enable', 'hieulmh@pvcombank.com.vn', NULL, 8, 4, 4, NULL);
INSERT INTO `employee` VALUES (80, 'tranhth', '$2y$10$HzzM6xk1URtt6QQ0KyZXI.C0HoO42Z4JFhVGOQfHjKotBvunNkF0y', 'Huỳnh Thị Huyền Trân', 'enable', 'tranhth@pvcombank.com.vn', '0939043120', 9, 6, 5, NULL);
INSERT INTO `employee` VALUES (83, 'danbv', '$2y$10$4XWS/t8ChJSdBMfZLQfBeOw4eGqf0Zy8eYlKYuQ.RVrpQdiC/2M1G', 'Bùi Văn Dân', 'enable', 'danbv@pvcombank.com.vn', '0972152834', 9, 5, 1, NULL);
INSERT INTO `employee` VALUES (84, 'trangnn6', '$2y$10$HzzM6xk1URtt6QQ0KyZXI.C0HoO42Z4JFhVGOQfHjKotBvunNkF0y', 'Nguyễn Ngọc Trạng', 'enable', 'trangnn6@pvcombank.com.vn', '0932949584', 9, 5, 1, NULL);
INSERT INTO `employee` VALUES (85, 'vylp', '$2y$10$ECBg1hdfm3HRr268zFdan.7ghlXkrr2Dw6UrzOuSXGhBFRf.vQUsO', 'Lâm Phượng Vy', 'enable', 'vylp@pvcombank.com.vn', '0824633211', 9, 5, 1, NULL);
INSERT INTO `employee` VALUES (86, 'thucnd', '$2y$10$H9a8Q2SGkCqohk1YiBa7S.tlAALGvt295UBql24vf1GLSggCzNuqG', 'Nguyễn Duy Thức', 'enable', 'thucnd@pvcombank.com.vn', '0835227449', 9, 5, 1, NULL);
INSERT INTO `employee` VALUES (87, 'sanght8', '$2y$10$Nx7h2xiXKNbf0zrUVqDDpujX8FHs.S9V.cUuC8uob2PNkTS.Ol19m', 'Huỳnh Thanh Sang', 'enable', 'sanght8@pvcombank.com.vn', '0899454349', 9, 5, 1, NULL);
INSERT INTO `employee` VALUES (88, 'nganmt', '$2y$10$HzzM6xk1URtt6QQ0KyZXI.C0HoO42Z4JFhVGOQfHjKotBvunNkF0y', 'Mai Thảo Ngân', 'enable', 'nganmt@pvcombank.com.vn', '0775501230', 9, 6, 5, NULL);
INSERT INTO `employee` VALUES (89, 'ngocdb2', '$2y$10$HzzM6xk1URtt6QQ0KyZXI.C0HoO42Z4JFhVGOQfHjKotBvunNkF0y', 'Đoàn Bảo Ngọc', 'enable', 'ngocdb2@pvcombank.com.vn', '0909872946', 9, 6, 5, NULL);
INSERT INTO `employee` VALUES (90, 'trangptb', '$2y$10$NKA.Pl57jOpmDUQ60OtK..kJrz4w7WHGrYxUDKUF5ecEDu91VTnTG', 'Phạm Thị Bảo Trang', 'enable', 'trangptb@pvcombank.com.vn', '0907603906', 9, 4, 4, NULL);
INSERT INTO `employee` VALUES (91, 'tuyetnta5', '$2y$10$V0chzUj3OdXA7VG.BaP86OSD0ZEJ3B3Xh0nhYuZp30ik1xeyqOl4q', 'Nguyễn Thị Ánh Tuyết', 'enable', 'tuyetnta5@pvcombank.com.vn', '0779088034', 9, 5, 1, NULL);
INSERT INTO `employee` VALUES (92, 'khanhlh', '$2y$10$jknRmXlVVcXqTnyxIcwu6OBJLqYTqpe7vCAGf2zgJj0T.jQSwq8CS', 'Lê Hoàng Khánh', 'enable', 'khanhlh@pvcombank.com.vn', NULL, 9, 5, NULL, NULL);

-- ----------------------------
-- Table structure for function
-- ----------------------------
DROP TABLE IF EXISTS `function`;
CREATE TABLE `function`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `funcName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `status` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `menu_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of function
-- ----------------------------
INSERT INTO `function` VALUES (1, 'DashboardRegion', NULL, 'index.php', 'disable', NULL);
INSERT INTO `function` VALUES (2, 'DashboardBranch', NULL, 'index.php', 'disable', NULL);
INSERT INTO `function` VALUES (3, 'DashboardEmp', NULL, 'index.php', 'disable', NULL);
INSERT INTO `function` VALUES (4, 'KPIbranchManage', NULL, 'kpibranch.php', 'disable', NULL);
INSERT INTO `function` VALUES (5, 'KPIempManage', NULL, 'employeekpi.php', 'disable', NULL);
INSERT INTO `function` VALUES (6, 'CustomerManage', NULL, 'custmanage.php', 'disable', NULL);
INSERT INTO `function` VALUES (7, 'CaseManage', NULL, 'casemanage.php', 'disable', NULL);
INSERT INTO `function` VALUES (8, 'EmpManage', NULL, 'empmanage.php', 'enable', NULL);
INSERT INTO `function` VALUES (9, 'WorkManage', NULL, 'workmanage.php', 'enable', NULL);
INSERT INTO `function` VALUES (10, 'BadDebtManage', NULL, 'baddebtmanage.php', 'disable', NULL);
INSERT INTO `function` VALUES (11, 'Elearning', NULL, 'elearning.php', 'disable', NULL);
INSERT INTO `function` VALUES (12, 'KPIcalcTools', NULL, 'kpiCalcTool.php', 'enable', 'Tính điểm KPI');

-- ----------------------------
-- Table structure for kpi_branch
-- ----------------------------
DROP TABLE IF EXISTS `kpi_branch`;
CREATE TABLE `kpi_branch`  (
  `kpi_branch_id` int NOT NULL AUTO_INCREMENT,
  `kpi_branch_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`kpi_branch_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of kpi_branch
-- ----------------------------
INSERT INTO `kpi_branch` VALUES (1, 'Tín dụng');
INSERT INTO `kpi_branch` VALUES (2, 'Huy động VNĐ');
INSERT INTO `kpi_branch` VALUES (3, 'Gói tài khoản');
INSERT INTO `kpi_branch` VALUES (4, 'Thẻ tín dụng');
INSERT INTO `kpi_branch` VALUES (5, 'Bảo hiểm');
INSERT INTO `kpi_branch` VALUES (6, 'Thu thuần');

-- ----------------------------
-- Table structure for kpi_branch_map
-- ----------------------------
DROP TABLE IF EXISTS `kpi_branch_map`;
CREATE TABLE `kpi_branch_map`  (
  `kpi_branch_id` int NOT NULL,
  `branchID` int NOT NULL,
  `kpi_schedule_value` float NOT NULL,
  `kpi_advance_value` float NOT NULL,
  PRIMARY KEY (`kpi_branch_id`) USING BTREE,
  INDEX `fk_branch`(`branchID` ASC) USING BTREE,
  CONSTRAINT `fk_branch` FOREIGN KEY (`branchID`) REFERENCES `branch` (`branchID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_kpi_branch` FOREIGN KEY (`kpi_branch_id`) REFERENCES `kpi_branch` (`kpi_branch_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of kpi_branch_map
-- ----------------------------
INSERT INTO `kpi_branch_map` VALUES (1, 1, 20000, 25000);
INSERT INTO `kpi_branch_map` VALUES (2, 1, 47000, 50000);
INSERT INTO `kpi_branch_map` VALUES (3, 1, 8, 10);
INSERT INTO `kpi_branch_map` VALUES (4, 1, 4, 10);
INSERT INTO `kpi_branch_map` VALUES (5, 1, 30, 100);
INSERT INTO `kpi_branch_map` VALUES (6, 1, 1000, 1000);

-- ----------------------------
-- Table structure for kpi_employee
-- ----------------------------
DROP TABLE IF EXISTS `kpi_employee`;
CREATE TABLE `kpi_employee`  (
  `kpi_emp_id` int NOT NULL AUTO_INCREMENT,
  `kpi_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`kpi_emp_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of kpi_employee
-- ----------------------------
INSERT INTO `kpi_employee` VALUES (1, 'Tín dụng');
INSERT INTO `kpi_employee` VALUES (2, 'Huy động VND');
INSERT INTO `kpi_employee` VALUES (3, 'Bảo hiểm');
INSERT INTO `kpi_employee` VALUES (4, 'Gói tài khoản');
INSERT INTO `kpi_employee` VALUES (5, 'Huy động USD');
INSERT INTO `kpi_employee` VALUES (6, 'Thẻ tín dụng');

-- ----------------------------
-- Table structure for kpi_employee_map
-- ----------------------------
DROP TABLE IF EXISTS `kpi_employee_map`;
CREATE TABLE `kpi_employee_map`  (
  `kpi_employee_id` int NOT NULL,
  `empID` int NOT NULL,
  `kpi_schedule_value` float NOT NULL,
  `kpi_advance_value` float NOT NULL,
  PRIMARY KEY (`kpi_employee_id`) USING BTREE,
  INDEX `fk_emp`(`empID` ASC) USING BTREE,
  CONSTRAINT `fk_emp` FOREIGN KEY (`empID`) REFERENCES `employee` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_kpi_emp` FOREIGN KEY (`kpi_employee_id`) REFERENCES `kpi_employee` (`kpi_emp_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of kpi_employee_map
-- ----------------------------
INSERT INTO `kpi_employee_map` VALUES (1, 3, 1200, 2500);
INSERT INTO `kpi_employee_map` VALUES (2, 3, 300, 800);
INSERT INTO `kpi_employee_map` VALUES (3, 3, 20, 30);
INSERT INTO `kpi_employee_map` VALUES (4, 3, 5, 8);
INSERT INTO `kpi_employee_map` VALUES (5, 3, 10000, 10000);
INSERT INTO `kpi_employee_map` VALUES (6, 3, 4, 6);

-- ----------------------------
-- Table structure for kpi_list
-- ----------------------------
DROP TABLE IF EXISTS `kpi_list`;
CREATE TABLE `kpi_list`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `kpi_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `kpi_year` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `kpi_point` int NOT NULL,
  `desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of kpi_list
-- ----------------------------

-- ----------------------------
-- Table structure for kpi_regist
-- ----------------------------
DROP TABLE IF EXISTS `kpi_regist`;
CREATE TABLE `kpi_regist`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `emp_id` int NOT NULL,
  `kpi_id` int NOT NULL,
  `regist_value` int NOT NULL,
  `month` int NOT NULL,
  `year` int NOT NULL,
  `input_date` datetime NOT NULL,
  `inputter_id` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `kpi_regist_id`(`kpi_id` ASC) USING BTREE,
  CONSTRAINT `kpi_regist_id` FOREIGN KEY (`kpi_id`) REFERENCES `kpi_list` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of kpi_regist
-- ----------------------------

-- ----------------------------
-- Table structure for kpi_role
-- ----------------------------
DROP TABLE IF EXISTS `kpi_role`;
CREATE TABLE `kpi_role`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `kpi_id` int NOT NULL,
  `role_id` int NOT NULL,
  `min_value` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `kpi_id`(`kpi_id` ASC) USING BTREE,
  INDEX `role_id`(`role_id` ASC) USING BTREE,
  CONSTRAINT `kpi_id` FOREIGN KEY (`kpi_id`) REFERENCES `kpi_list` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `role_id` FOREIGN KEY (`role_id`) REFERENCES `role` (`roleID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of kpi_role
-- ----------------------------

-- ----------------------------
-- Table structure for mess_role
-- ----------------------------
DROP TABLE IF EXISTS `mess_role`;
CREATE TABLE `mess_role`  (
  `messageID` int NOT NULL,
  `roleID` int NOT NULL COMMENT 'receiver',
  INDEX `fk_mess_role`(`roleID` ASC) USING BTREE,
  INDEX `fk_mess`(`messageID` ASC) USING BTREE,
  CONSTRAINT `fk_mess` FOREIGN KEY (`messageID`) REFERENCES `message` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_mess_role` FOREIGN KEY (`roleID`) REFERENCES `role` (`roleID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of mess_role
-- ----------------------------
INSERT INTO `mess_role` VALUES (2, 5);
INSERT INTO `mess_role` VALUES (1, 5);
INSERT INTO `mess_role` VALUES (1, 6);
INSERT INTO `mess_role` VALUES (3, 5);
INSERT INTO `mess_role` VALUES (3, 6);

-- ----------------------------
-- Table structure for message
-- ----------------------------
DROP TABLE IF EXISTS `message`;
CREATE TABLE `message`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `startTime` datetime NOT NULL,
  `endTime` datetime NOT NULL,
  `content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `from` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `status` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of message
-- ----------------------------
INSERT INTO `message` VALUES (1, '2020-03-09 16:20:41', '2020-03-16 22:21:08', 'Thử nghiệm hệ thống quản trị KPI', 'Nguyễn Văn Nhân', 'enable');
INSERT INTO `message` VALUES (2, '2020-03-09 16:21:04', '2020-03-22 22:21:08', 'Golive bản Alpha 1.0 vào lúc 8:00 - 15/03/2020', 'Nguyễn Văn Nhân', 'enable');
INSERT INTO `message` VALUES (3, '2020-03-15 08:00:00', '2020-03-28 08:00:00', 'Chào mừng toàn thể người dùng đến với ứng dụng Quản trị KPI - PVcomBank', 'Nguyễn Văn Nhân', 'enable');

-- ----------------------------
-- Table structure for min_role_point
-- ----------------------------
DROP TABLE IF EXISTS `min_role_point`;
CREATE TABLE `min_role_point`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `role_id` int NOT NULL,
  `min_point` int NOT NULL,
  `year_of_point` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `role_min_point`(`role_id` ASC) USING BTREE,
  CONSTRAINT `role_min_point` FOREIGN KEY (`role_id`) REFERENCES `role` (`roleID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of min_role_point
-- ----------------------------

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product`  (
  `productID` int NOT NULL AUTO_INCREMENT,
  `productName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `typeID` int NOT NULL,
  `defaultSLA` int NOT NULL COMMENT 'Default SLA time (count by Day)',
  `description` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'Description of product',
  PRIMARY KEY (`productID`) USING BTREE,
  INDEX `fk_type_prod`(`typeID` ASC) USING BTREE,
  CONSTRAINT `fk_type_prod` FOREIGN KEY (`typeID`) REFERENCES `producttype` (`typeID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES (1, 'Cho vay mua BĐS', 1, 5, 'Sản phẩm cho vay thế chấp mua bất động sản');
INSERT INTO `product` VALUES (2, 'Cho vay Xây dựng/sửa chữa nhà', 1, 5, 'Sản phẩm cho vay thế chấp, xây dựng/sửa chữa nhà ở');
INSERT INTO `product` VALUES (3, 'Cho vay mua Ô tô tiêu dùng', 1, 5, 'Cho vay mua Ô tô tiêu dùng');
INSERT INTO `product` VALUES (4, 'Cho vay mua Ô tô SXKD', 1, 5, 'Cho vay mua Ô tô SXKD');
INSERT INTO `product` VALUES (5, 'Cho vay tín chấp NSNN', 1, 3, 'Cho vay Tín chấp dành cho đv lương NSNN');
INSERT INTO `product` VALUES (6, 'Cho vay tín chấp CBNV PVCB', 1, 2, 'Cho vay tín chấp CBNV PvcomBank');
INSERT INTO `product` VALUES (7, 'Cho vay tín chấp Đơn vị chi lương', 1, 2, 'Cho vay tín chấp Đơn vị chi lương PVCB');
INSERT INTO `product` VALUES (8, 'Cho vay bổ sung vốn SXKD', 1, 7, 'Cho vay bổ sung vốn lưu động/Đầu tư TSCĐ');
INSERT INTO `product` VALUES (9, 'Thẻ tín dụng', 6, 2, 'Thẻ tín dụng');
INSERT INTO `product` VALUES (10, 'Gói tài khoản', 4, 1, 'Gói tài khoản');
INSERT INTO `product` VALUES (11, 'Tài khoản chi lương', 5, 5, 'Ký hợp đồng chi lương');
INSERT INTO `product` VALUES (12, 'Pru đầu tư linh hoạt', 3, 3, 'Sản phẩm bảo hiểm');
INSERT INTO `product` VALUES (13, 'Pru An tâm trọn đời', 3, 3, 'Sản phẩm bảo hiểm');
INSERT INTO `product` VALUES (14, 'Pru Cuộc sống bình an', 3, 3, 'Sản phẩm bảo hiểm');

-- ----------------------------
-- Table structure for producttype
-- ----------------------------
DROP TABLE IF EXISTS `producttype`;
CREATE TABLE `producttype`  (
  `typeID` int NOT NULL AUTO_INCREMENT,
  `typeName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`typeID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of producttype
-- ----------------------------
INSERT INTO `producttype` VALUES (1, 'Tín dụng');
INSERT INTO `producttype` VALUES (2, 'Huy động VNĐ');
INSERT INTO `producttype` VALUES (3, 'Bảo hiểm');
INSERT INTO `producttype` VALUES (4, 'Tài khoản/Thẻ');
INSERT INTO `producttype` VALUES (5, 'Đơn vị chi lương');
INSERT INTO `producttype` VALUES (6, 'Thẻ tín dụng');
INSERT INTO `producttype` VALUES (7, 'Huy động USD');

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role`  (
  `roleID` int NOT NULL AUTO_INCREMENT,
  `roleName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `roleDes` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`roleID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES (1, 'superAdmin', 'Full Permission');
INSERT INTO `role` VALUES (2, 'Giám đốc Vùng', 'Full View');
INSERT INTO `role` VALUES (3, 'Thư ký Vùng', '');
INSERT INTO `role` VALUES (4, 'Giám đốc ĐVKD', 'Full control of branch');
INSERT INTO `role` VALUES (5, 'RM KHCN', NULL);
INSERT INTO `role` VALUES (6, 'Giao dịch viên', NULL);
INSERT INTO `role` VALUES (7, 'Trưởng Bộ phận', 'Full control Team');
INSERT INTO `role` VALUES (8, 'Trưởng phòng KHCN', 'Full control Room');
INSERT INTO `role` VALUES (9, 'Trưởng phòng DVKH', NULL);
INSERT INTO `role` VALUES (10, 'Kiểm soát viên', NULL);
INSERT INTO `role` VALUES (11, 'RM mSME', NULL);
INSERT INTO `role` VALUES (12, 'RM KHƯT', NULL);
INSERT INTO `role` VALUES (13, 'RM Banca', NULL);

-- ----------------------------
-- Table structure for role_func
-- ----------------------------
DROP TABLE IF EXISTS `role_func`;
CREATE TABLE `role_func`  (
  `roleID` int NOT NULL,
  `funcID` int NOT NULL,
  INDEX `fk_role_func`(`roleID` ASC) USING BTREE,
  INDEX `fk_func_role`(`funcID` ASC) USING BTREE,
  CONSTRAINT `fk_func_role` FOREIGN KEY (`funcID`) REFERENCES `function` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_role_func` FOREIGN KEY (`roleID`) REFERENCES `role` (`roleID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of role_func
-- ----------------------------

-- ----------------------------
-- Table structure for status
-- ----------------------------
DROP TABLE IF EXISTS `status`;
CREATE TABLE `status`  (
  `statusID` int NOT NULL AUTO_INCREMENT,
  `statusName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `statusSLA_Percent` float NOT NULL,
  PRIMARY KEY (`statusID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of status
-- ----------------------------
INSERT INTO `status` VALUES (1, 'Tiếp nhận thông tin', 10);
INSERT INTO `status` VALUES (2, 'Giới thiệu sản phẩm', 20);
INSERT INTO `status` VALUES (3, 'Đang nhận hồ sơ', 30);
INSERT INTO `status` VALUES (4, 'Đang thẩm định hồ sơ', 40);
INSERT INTO `status` VALUES (5, 'Đang trình hồ sơ', 50);
INSERT INTO `status` VALUES (6, 'Đã phê duyệt', 60);
INSERT INTO `status` VALUES (7, 'Soạn thảo Hồ sơ', 75);
INSERT INTO `status` VALUES (8, 'Đã giải ngân', 85);
INSERT INTO `status` VALUES (9, 'Đã bổ sung sau vay', 100);
INSERT INTO `status` VALUES (10, 'Từ chối', 100);

-- ----------------------------
-- Table structure for statustodo
-- ----------------------------
DROP TABLE IF EXISTS `statustodo`;
CREATE TABLE `statustodo`  (
  `statusID` int NOT NULL AUTO_INCREMENT,
  `statusName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`statusID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of statustodo
-- ----------------------------
INSERT INTO `statustodo` VALUES (1, 'Processing');
INSERT INTO `statustodo` VALUES (2, 'Finished');

-- ----------------------------
-- Table structure for team
-- ----------------------------
DROP TABLE IF EXISTS `team`;
CREATE TABLE `team`  (
  `teamID` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`teamID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of team
-- ----------------------------
INSERT INTO `team` VALUES (1, 'KHCN');
INSERT INTO `team` VALUES (2, 'mSME');
INSERT INTO `team` VALUES (3, 'KHUT');
INSERT INTO `team` VALUES (4, 'No Team');
INSERT INTO `team` VALUES (5, 'DVKH');

-- ----------------------------
-- Table structure for todo
-- ----------------------------
DROP TABLE IF EXISTS `todo`;
CREATE TABLE `todo`  (
  `todoID` int NOT NULL AUTO_INCREMENT,
  `empID` int NOT NULL,
  `startTime` datetime NOT NULL,
  `endTime` datetime NOT NULL,
  `statusID` int NOT NULL,
  `todoContent` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `isLate` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`todoID`) USING BTREE,
  INDEX `fk_emp_todo`(`empID` ASC) USING BTREE,
  INDEX `fk_status_todo`(`statusID` ASC) USING BTREE,
  CONSTRAINT `fk_emp_todo` FOREIGN KEY (`empID`) REFERENCES `employee` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_status_todo` FOREIGN KEY (`statusID`) REFERENCES `statustodo` (`statusID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 2851 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of todo
-- ----------------------------
INSERT INTO `todo` VALUES (16, 3, '2020-03-16 09:30:00', '2020-03-16 10:30:00', 2, 'Chuẩn bị hồ sơ giải ngân hạn mức KH Hoàng Văn Đức', NULL);
INSERT INTO `todo` VALUES (17, 3, '2020-03-16 10:30:00', '2020-03-16 11:50:00', 2, 'Nhắc nợ các KH nợ quá hạn', NULL);
INSERT INTO `todo` VALUES (18, 8, '2020-03-17 09:22:00', '2020-03-16 17:30:00', 2, 'Xử lý hồ sơ chị Cẩm Hiền', NULL);
INSERT INTO `todo` VALUES (19, 3, '2020-03-16 13:30:00', '2020-03-16 14:00:00', 2, 'Gọi các KH vay cũ mở thẻ tín dụng ', NULL);
INSERT INTO `todo` VALUES (20, 6, '2020-03-16 09:30:00', '2020-03-16 09:30:00', 2, 'Gọi điện thoại nhắc nợ ', NULL);
INSERT INTO `todo` VALUES (21, 6, '2020-03-16 09:32:00', '2020-03-16 09:32:00', 2, 'Gọi đt hẹn gặp kh mở thẻ tín dụng', NULL);
INSERT INTO `todo` VALUES (22, 6, '2020-03-16 09:33:00', '2020-03-16 09:33:00', 2, 'Gặp kh Nguyễn Phương Linh ký hs mở thẻ tín dụng\r\n', NULL);
INSERT INTO `todo` VALUES (23, 6, '2020-03-16 09:33:00', '2020-03-16 09:33:00', 2, 'Soạn cho xong hs tín chấp KH Nguyễn Thị Thùy Mỵ', NULL);
INSERT INTO `todo` VALUES (25, 6, '2020-03-16 09:34:00', '2020-03-16 09:34:00', 2, 'Làm bàn giao hs KH Nguyễn Hữu Quý bàn giao cho quản lý tín dụng', NULL);
INSERT INTO `todo` VALUES (29, 3, '2020-03-17 08:00:00', '2020-03-17 09:00:00', 2, 'Gặp KH môi giới BDS', NULL);
INSERT INTO `todo` VALUES (30, 7, '2020-03-16 09:50:00', '2020-03-16 09:50:00', 2, 'Xử lý, kiểm tra các hồ sơ thẻ tín dụng để trình hồ sơ', NULL);
INSERT INTO `todo` VALUES (31, 3, '2020-03-16 16:00:00', '2020-03-16 17:00:00', 2, 'Gặp KH mở gói tài khoản', NULL);
INSERT INTO `todo` VALUES (35, 9, '2020-03-16 14:00:00', '2020-03-16 16:00:00', 2, 'Gặp khách hàng mở tài khoản + tvan bảo hiểm Hà Thị Thanh Loan ', NULL);
INSERT INTO `todo` VALUES (36, 9, '2020-03-16 16:00:00', '2020-03-16 17:00:00', 2, 'Làm.báo cáo ngày ', NULL);
INSERT INTO `todo` VALUES (42, 8, '2020-03-16 14:46:00', '2020-03-16 16:00:00', 1, 'KH Mộng Lan kí mở thẻ visa.', NULL);
INSERT INTO `todo` VALUES (43, 8, '2020-03-16 16:25:00', '2020-03-16 16:25:00', 2, 'Gặp Trọng Bảo mở tk', NULL);
INSERT INTO `todo` VALUES (44, 8, '2020-03-16 16:25:00', '2020-03-16 16:25:00', 2, 'Nhận chứng từ kiểm soát sau Quách Kim Hậu', NULL);
INSERT INTO `todo` VALUES (45, 8, '2020-03-16 16:26:00', '2020-03-16 16:26:00', 2, 'Gọi đt đôn đốc KH Trương Hồng kỳ bs hs thẻ visa', NULL);
INSERT INTO `todo` VALUES (46, 8, '2020-03-16 16:26:00', '2020-03-16 16:26:00', 2, 'Đôn đốc KH Lê Danh Đồng bs hs vay vốn', NULL);
INSERT INTO `todo` VALUES (47, 7, '2020-03-16 16:43:00', '2020-03-16 16:43:00', 2, 'Gặp KH mở gói TK', NULL);
INSERT INTO `todo` VALUES (48, 3, '2020-03-17 09:30:00', '2020-03-16 10:30:00', 2, 'Trình hồ sơ thẻ tín dụng KH Huỳnh Thứ Phát', NULL);
INSERT INTO `todo` VALUES (49, 3, '2020-03-17 10:45:00', '2020-03-17 11:45:00', 2, 'Gọi điện thoại nhắc nợ quá hạn', NULL);
INSERT INTO `todo` VALUES (50, 3, '2020-03-17 13:30:00', '2020-03-17 14:00:00', 2, 'Tất toán thẻ tín dụng quá hạn KH Lương Hoàng Vũ', NULL);
INSERT INTO `todo` VALUES (51, 3, '2020-03-17 07:30:00', '2020-03-17 08:30:00', 2, 'Gặp KH mở gói tài khoản', NULL);
INSERT INTO `todo` VALUES (52, 6, '2020-03-17 00:00:00', '2020-03-17 00:00:00', 2, 'Bàn giao hs vay KH Nguyễn Hữu Quý', NULL);
INSERT INTO `todo` VALUES (53, 6, '2020-03-17 00:00:00', '2020-03-17 00:00:00', 2, 'Trình hs vay KH Nguyễn Thị Thùy Mỵ', NULL);
INSERT INTO `todo` VALUES (54, 6, '2020-03-17 00:00:00', '2020-03-17 00:00:00', 2, 'Soạn sẵn hs vay KH Nguyễn Đoàn Diễm Trinh\r\n', NULL);
INSERT INTO `todo` VALUES (55, 6, '2020-03-17 00:00:00', '2020-03-17 00:00:00', 2, 'Soạn tờ trình hs thẻ tín dụng KH Nguyễn Phương Linh', NULL);
INSERT INTO `todo` VALUES (56, 6, '2020-03-17 00:00:00', '2020-03-17 00:00:00', 2, 'Xem nợ quá hạn đt nhắc nợ KH quá hạn và đt cho những KH đang có nhu cầu mở thẻ TD và KH vay', NULL);
INSERT INTO `todo` VALUES (57, 7, '2020-03-17 08:02:00', '2020-03-17 08:02:00', 2, 'Làm thẻ tín dụng Nguyễn Văn Dũng', NULL);
INSERT INTO `todo` VALUES (58, 7, '2020-03-17 08:03:00', '2020-03-17 08:03:00', 2, 'Gọi KH mở thẻ tín dụng từ danh sách lựa chọn trước', NULL);
INSERT INTO `todo` VALUES (60, 7, '2020-03-17 08:12:00', '2020-03-17 08:12:00', 2, 'Hoàn thiện các hồ sơ thẻ Du, Tuấn, Kỳ ', NULL);
INSERT INTO `todo` VALUES (61, 8, '2020-03-17 08:00:00', '2020-03-17 08:30:00', 2, 'Kiểm tra Thông tin KH Nguyễn Văn Út vay 600M, tìm hiểu nhu cầu', NULL);
INSERT INTO `todo` VALUES (62, 8, '2020-03-17 08:30:00', '2020-03-17 00:00:00', 2, 'Xử lý tờ trình KH Lê Danh Đồng, yêu cầu KH xiác nhận lại kinh nghiệm kinh doanh', NULL);
INSERT INTO `todo` VALUES (63, 8, '1970-01-01 00:00:00', '1970-01-01 00:00:00', 1, 'KH Mộng Lan kí mở thẻ Visa', NULL);
INSERT INTO `todo` VALUES (64, 8, '2020-03-17 14:00:00', '2020-03-17 16:00:00', 2, 'Mở gói TK cho các KH Võ Quốc An, Bùi Nguyên Thịnh, Đỗ Đăng Duy, Lê Văn Hòa, Nguyễn Thị Hợi, Trần Đức Dũng', NULL);
INSERT INTO `todo` VALUES (65, 8, '2020-03-17 16:00:00', '2020-03-17 17:00:00', 2, 'Hoàn thành hồ sơ Nguyễn Thị Cẩm Hiền', NULL);
INSERT INTO `todo` VALUES (67, 9, '2020-03-17 16:00:00', '2020-03-17 17:00:00', 2, 'Làm Báo cáo hằng ngày ', NULL);
INSERT INTO `todo` VALUES (68, 9, '2020-03-17 13:00:00', '2020-03-17 13:30:00', 2, 'Nhắn cho khách hàng Vân xem việc khách hàng đã xem bảng minh họa và còn thắc mắc gì không để hướng khách hàng việc lên hđ', NULL);
INSERT INTO `todo` VALUES (69, 9, '2020-03-17 13:30:00', '2020-03-17 14:00:00', 2, 'Nhắn cho khách hàng Linh Hương khách có hứa giới thiệu thêm chị gái để tham gia sản phẩm bảo hiểm, ntin hỏi thăm và xin cuộc hẹn ', NULL);
INSERT INTO `todo` VALUES (70, 9, '2020-03-17 14:00:00', '2020-03-17 16:00:00', 2, 'Gọi điện thoại nhắc phí khách hàng \r\n1. Huỳnh Thị Huỳnh Như\r\n2.Nguyễn cao mỹ\r\n3. Trần văn trung\r\n4.Nguyễn Thị Ánh Xuân ', NULL);
INSERT INTO `todo` VALUES (71, 6, '2020-03-17 14:30:00', '2020-03-17 15:00:00', 2, 'Điện thoại anh Vinh tư vấn vay tiêu dùng', NULL);
INSERT INTO `todo` VALUES (72, 7, '2020-03-17 16:00:00', '2020-03-17 16:30:00', 2, 'Mang chứng từ về anh Châu', NULL);
INSERT INTO `todo` VALUES (73, 9, '2020-03-18 08:00:00', '2020-03-18 09:00:00', 2, 'Hoàn thiện file báo cáo + hồ sơ còn thiếu gửi gắp về cho Tuấn bộ phận Nhân sự ', NULL);
INSERT INTO `todo` VALUES (74, 9, '2020-03-18 09:00:00', '2020-03-18 10:00:00', 2, 'Chạy lại bmh cho khách hàng Nguyễn Ngọc Huyền + Anh Trai Huyền gói sản phẩm cuộc sống bình an đóng phí 18tr \r\n', NULL);
INSERT INTO `todo` VALUES (75, 9, '2020-03-18 10:00:00', '2020-03-18 00:00:00', 2, 'Gặp khách hàng Tô Văn Cưng với chị GDV Đỗ Huyền Nga tvan sản phẩm. Bước đầu chạy thử sp Đầu Tư phí 25tr. ', NULL);
INSERT INTO `todo` VALUES (76, 3, '2020-03-18 08:30:00', '2020-03-18 09:30:00', 2, 'Gặp KH chỗ anh Quân An Gia nhận HS ', NULL);
INSERT INTO `todo` VALUES (77, 3, '2020-03-18 10:00:00', '2020-03-18 10:30:00', 2, 'Làm Hs tất nợ hạn mức KH Hoàng Văn Đức để ngày mai giải ngân lại hạn mức', NULL);
INSERT INTO `todo` VALUES (78, 3, '2020-03-18 10:30:00', '2020-03-18 11:00:00', 2, 'Gọi nhắc nợ quá hạn', NULL);
INSERT INTO `todo` VALUES (79, 3, '2020-03-18 13:30:00', '2020-03-18 14:30:00', 2, 'Gọi KH Võ Thị Cẩm Loan tư vấn vay thế chấp và liên hệ các KH cũ tư vấn vay thêm', NULL);
INSERT INTO `todo` VALUES (80, 3, '2020-03-19 16:30:00', '2020-03-19 17:30:00', 2, 'Gặp KH mở gói tài khoản', NULL);
INSERT INTO `todo` VALUES (81, 7, '2020-03-18 08:36:00', '2020-03-18 08:37:00', 2, '\r\nLàm bàn giao cho xử lý nợ Huỳnh Kim Nguyên', NULL);
INSERT INTO `todo` VALUES (82, 7, '2020-03-18 08:42:00', '2020-03-18 08:42:00', 2, 'Gọi điện, nhắc nợ các kh quá hạn', NULL);
INSERT INTO `todo` VALUES (83, 6, '2020-03-20 16:05:00', '2020-03-20 00:00:00', 2, 'Cho KH Nguyễn Thị Diễm Trinh ký hs vay\r\n', NULL);
INSERT INTO `todo` VALUES (84, 6, '2020-03-18 15:06:00', '2020-03-18 00:00:00', 2, 'Đt tư vấn mở thẻ tín dụng cho KH Nguyễn Thị Kiều My', NULL);
INSERT INTO `todo` VALUES (85, 6, '2020-03-18 16:07:00', '2020-03-18 00:00:00', 2, 'Đt nhắc nợ KH quá hạn ', NULL);
INSERT INTO `todo` VALUES (87, 6, '2020-03-18 11:20:00', '2020-03-18 11:20:00', 2, 'Chuẩn bị hồ sơ giải ngân KH Nguyễn Thị Thùy Mỵ\r\n', NULL);
INSERT INTO `todo` VALUES (88, 9, '2020-03-18 15:00:00', '2020-03-18 15:15:00', 2, 'Báo cáo nhanh các  Case bảo hiểm đã chạy bảng minh họa cho anh Nhân', NULL);
INSERT INTO `todo` VALUES (89, 9, '2020-03-18 13:00:00', '2020-03-18 15:00:00', 2, 'Lên bảng minh họa chạy lại sp cho khách hàng Tô Văn Cưng vừa đi gặp. \r\nLiên hệ với khách hàng Nguyễn Thị Ánh Xuân hưỡng dẫn khách rút tiền đtt (52tr) \r\nĐt trao đổi vs khách hàng Nguyễn Ngọc Huyền về phí bhiem cố gắng push để 24.03 lên hd như dự định. ', NULL);
INSERT INTO `todo` VALUES (90, 7, '2020-03-19 16:30:00', '2020-03-18 16:30:00', 2, 'Đi cần thơ bàn giao hs cho xử lý nợ', NULL);
INSERT INTO `todo` VALUES (91, 9, '2020-03-18 15:15:00', '2020-03-18 16:15:00', 2, 'Tư vấn khâch hàng Nguyễn Thị Kim Phượng của  Chị Hằng gdv gói sp đầu tư phí 20tr/nam.', NULL);
INSERT INTO `todo` VALUES (92, 9, '2020-03-18 16:15:00', '2020-03-18 17:00:00', 2, 'Làm báo cáo hằng ngày. \r\n', NULL);
INSERT INTO `todo` VALUES (93, 8, '2020-03-18 15:00:00', '2020-03-18 15:10:00', 2, 'Điện thoại nhắc nợ anh Hậu', NULL);
INSERT INTO `todo` VALUES (94, 8, '2020-03-18 15:30:00', '2020-03-18 16:00:00', 2, 'Bàn giao hs anh Hậu cho QLTD', NULL);
INSERT INTO `todo` VALUES (95, 3, '2020-03-19 08:30:00', '2020-03-18 09:00:00', 2, 'Trình hs giải ngân KH Hoàng Văn Đức', NULL);
INSERT INTO `todo` VALUES (96, 3, '2020-03-19 09:30:00', '2020-03-19 10:00:00', 2, 'Gọi nhắc nợ KH quá hạn', NULL);
INSERT INTO `todo` VALUES (97, 3, '2020-03-19 13:30:00', '2020-03-19 14:30:00', 2, 'Gặp KH Phan Tuấn Kiệt tư vấn vay thế chấp', NULL);
INSERT INTO `todo` VALUES (98, 3, '2020-03-19 15:00:00', '2020-03-19 16:00:00', 2, 'Gặp chị Linh tư vấn vay thế chấp', NULL);
INSERT INTO `todo` VALUES (99, 9, '2020-03-19 08:00:00', '2020-03-19 09:00:00', 2, 'Họp thường lệ PKD', NULL);
INSERT INTO `todo` VALUES (100, 9, '2020-03-19 09:00:00', '2020-03-19 11:00:00', 2, 'Gặp khách hàng Nguyễn Thị Ánh Xuân tư vấn rút dtt 52tr. Ngày 18.03 đã tvan qua điện thoại khách yêu cầu rút và 19.03 lại nhà khách để hướng dãn khách.\r\n', NULL);
INSERT INTO `todo` VALUES (101, 7, '2020-03-19 07:02:00', '2020-03-19 08:02:00', 2, 'Trình hồ sơ thẻ tín dụng Nguyễn Văn Dũng', NULL);
INSERT INTO `todo` VALUES (102, 7, '2020-03-19 07:06:00', '2020-03-19 07:06:00', 2, 'Làm bàn giao hồ sơ thẻ tín dụng Huỳnh Văn Điền', NULL);
INSERT INTO `todo` VALUES (103, 7, '2020-03-19 07:09:00', '2020-03-19 07:09:00', 2, 'Kiểm tra danh sách bạn bè, gọi điện để hẹn gặp ký giấy mở gói tk', NULL);
INSERT INTO `todo` VALUES (104, 8, '2020-03-19 08:00:00', '2020-03-19 09:00:00', 2, 'Gặp Chị Hiền lấy sổ sách ghi chép, gặp Anh Đồng lấy xác nhận kinh doanh', NULL);
INSERT INTO `todo` VALUES (105, 8, '2020-03-19 09:00:00', '2020-03-19 00:00:00', 2, 'Trình hồ sơ Nguyễn Thị Cẩm Hiền', NULL);
INSERT INTO `todo` VALUES (106, 6, '2020-03-19 08:19:00', '2020-03-19 08:19:00', 2, 'Giải ngân hs KH Nguyễn Thị Thùy Mỵ', NULL);
INSERT INTO `todo` VALUES (108, 6, '2020-03-19 13:18:00', '2020-03-19 14:30:00', 2, 'Đt mở gói tài khoản cho KH Đoàn Văn Điểm.', NULL);
INSERT INTO `todo` VALUES (109, 8, '2020-03-19 15:30:00', '2020-03-19 16:30:00', 2, 'Xử lý hồ sơ Phan Tăng Cui', NULL);
INSERT INTO `todo` VALUES (110, 6, '2020-03-19 15:21:00', '2020-03-19 16:00:00', 2, 'Đt lại cho KH Nguyễn Kim Ngân để tư vấn case BH ', NULL);
INSERT INTO `todo` VALUES (111, 8, '2020-03-19 16:30:00', '2020-03-19 17:00:00', 2, 'Bàn giao hồ sơ Quách Kim Hậu cho QLTD', NULL);
INSERT INTO `todo` VALUES (112, 7, '2020-03-19 16:00:00', '2020-03-19 16:00:00', 2, 'Gặp KH Triệu Cẩm Lình mở gói tk', NULL);
INSERT INTO `todo` VALUES (113, 7, '2020-03-19 04:30:00', '2020-03-19 04:30:00', 2, 'Gặp KH Sang mở gói tk', NULL);
INSERT INTO `todo` VALUES (114, 9, '2020-03-19 11:00:00', '2020-03-19 00:00:00', 2, 'Đt liên hệ khách Trần Quang Vinh mở gói tkhoan + tvan gói bhiem tương lai tươi sáng 15tr. ', NULL);
INSERT INTO `todo` VALUES (115, 7, '2020-03-19 04:00:00', '2020-03-19 04:00:00', 2, 'Đi chi nhánh bàn giao hồ sơ Quách Kim Hậu và Huỳnh Văn Điền', NULL);
INSERT INTO `todo` VALUES (116, 9, '2020-03-19 13:00:00', '2020-03-19 03:00:00', 2, 'Đt khách hàng Lê Minh Lý từ refer chị Nga GDV tư vấn gói bảo hiểm đầu tư 20tr. \r\nĐt khách hàng Anh Khải từ refer anh Nhân tvan bảo hiểm ', NULL);
INSERT INTO `todo` VALUES (117, 6, '2020-03-19 16:10:00', '2020-03-19 16:30:00', 2, 'Hoàn thiện báo cáo Chuyển nhóm nợ', NULL);
INSERT INTO `todo` VALUES (118, 9, '2020-03-19 16:00:00', '2020-03-19 17:00:00', 2, ' Hỗ trợ chị Nga ghi hồ sơ Ủy quyền Vũ Thị Hương \r\nLàm báo cáo ngày ', NULL);
INSERT INTO `todo` VALUES (119, 3, '2020-03-20 08:30:00', '2020-03-20 08:45:00', 2, 'Cập nhật bổ sung thông tin phát hành thẻ KH Huỳnh Thứ phát', NULL);
INSERT INTO `todo` VALUES (120, 3, '2020-03-20 09:00:00', '2020-03-20 11:00:00', 2, 'Soạn hồ sơ giải ngân KH Trần Ngọc Thúy', NULL);
INSERT INTO `todo` VALUES (121, 3, '2020-03-20 11:15:00', '2020-03-20 11:50:00', 2, 'Gọi nhắc nợ các KH nợ quá hạn', NULL);
INSERT INTO `todo` VALUES (122, 3, '2020-03-20 13:30:00', '2020-03-20 14:30:00', 2, 'Gọi đt cho KH Võ Thị Cẩm Loan chuẩn bị hs vay thế chấp. Và gọi các KH vay cũ để tư vấn vay thêm và các dịch vụ sản phẩm khác', NULL);
INSERT INTO `todo` VALUES (123, 3, '2020-03-20 16:00:00', '2020-03-20 17:00:00', 2, 'Gặp KH mở gói tài khoản', NULL);
INSERT INTO `todo` VALUES (125, 6, '2020-03-20 08:46:00', '2020-03-20 20:47:00', 2, 'Mở gói tài khoản KH Trần Hữu Toàn', NULL);
INSERT INTO `todo` VALUES (127, 6, '2020-03-20 15:49:00', '2020-03-20 00:00:00', 2, 'Lên xem bảng nợ quá hạn để đt KH quá hạn thanh toán', NULL);
INSERT INTO `todo` VALUES (129, 9, '2020-03-20 08:00:00', '2020-03-20 09:00:00', 2, 'Gặp khách hàng Nguyễn Thị Kim Hương hướng dẫn đổi quỹ. Tư vấn thêm gói spham corona đang tặng để c mua thêm cho ck chị. ', NULL);
INSERT INTO `todo` VALUES (130, 9, '2020-03-20 09:00:00', '2020-03-20 00:00:00', 2, 'Nhận danh sách khách hàng tiền gửi của chị Nga và gọi điện thoại cho khách. Số lượng gọi được và câu trả lơig của khách e sẽ lập thành file báo cáo cho anh sau khi gọi xong. ', NULL);
INSERT INTO `todo` VALUES (131, 6, '2020-03-20 15:29:00', '2020-03-20 00:00:00', 2, 'Làm giấy đi đường KH Triệu Tử Long', NULL);
INSERT INTO `todo` VALUES (132, 6, '2020-03-20 16:41:00', '2020-03-20 00:00:00', 2, 'Trả thẻ tín dụng cho KH Nguyễn Thị Thùy Mỵ', NULL);
INSERT INTO `todo` VALUES (133, 3, '2020-03-20 11:00:00', '2020-03-20 11:30:00', 2, 'Gửi mail TTT xác nhận số sư thẻ & tín chấp Lê Thị Thu Tứ', NULL);
INSERT INTO `todo` VALUES (134, 9, '2020-03-20 14:00:00', '2020-03-20 15:00:00', 2, 'Điện thoại KH gia hạn Bảo hiểm Ô tô - Thành hướng dẫn làm', NULL);
INSERT INTO `todo` VALUES (135, 3, '2020-03-20 13:30:00', '2020-03-20 13:50:00', 2, 'Báo cáo DS chuyển XLN', NULL);
INSERT INTO `todo` VALUES (136, 6, '2020-03-20 13:30:00', '2020-03-20 13:50:00', 2, 'Báo cáo DS chuyển XLN', NULL);
INSERT INTO `todo` VALUES (137, 7, '2020-03-20 13:30:00', '2020-03-20 13:50:00', 2, 'Báo cáo DS chuyển XLN', NULL);
INSERT INTO `todo` VALUES (138, 8, '2020-03-20 13:30:00', '2020-03-20 13:50:00', 2, 'Báo cáo DS chuyển XLN', NULL);
INSERT INTO `todo` VALUES (139, 7, '2020-03-20 04:00:00', '2020-03-20 16:00:00', 2, 'Gặp kh Ý mở gói tk', NULL);
INSERT INTO `todo` VALUES (140, 7, '2020-03-20 13:08:00', '2020-03-20 16:00:00', 2, 'Ở phòng đọc sản phẩm và xử lý các công việc phát sinh', NULL);
INSERT INTO `todo` VALUES (142, 9, '2020-03-20 15:00:00', '2020-03-20 17:00:00', 2, 'Đi khách hàng đinh thị diệu với chị Nga + báo cáo ngày ', NULL);
INSERT INTO `todo` VALUES (143, 9, '2020-03-23 08:00:00', '2020-03-23 08:15:00', 2, 'Chạy bảng minh họa cho chị Mỵ', NULL);
INSERT INTO `todo` VALUES (144, 6, '2020-03-23 13:00:00', '2020-03-23 13:30:00', 2, 'Chốt case bảo hiểm chị Mỵ', NULL);
INSERT INTO `todo` VALUES (151, 12, '2020-03-23 10:00:00', '2020-03-23 10:30:00', 1, 'Thu nợ KH Trần Thế Tấn', NULL);
INSERT INTO `todo` VALUES (152, 12, '2020-03-23 07:30:00', '2020-03-23 08:00:00', 1, 'Gặp KH Nguyễn Văn Hùng mở gói TK', 'accepted');
INSERT INTO `todo` VALUES (154, 3, '2020-03-23 08:00:00', '2020-03-23 08:30:00', 2, 'Họp Huddle đầu ngày', NULL);
INSERT INTO `todo` VALUES (155, 6, '2020-03-23 08:00:00', '2020-03-23 08:30:00', 2, 'Họp Huddle đầu ngày', NULL);
INSERT INTO `todo` VALUES (156, 7, '2020-03-23 08:00:00', '2020-03-23 08:30:00', 2, 'Họp Huddle đầu ngày', NULL);
INSERT INTO `todo` VALUES (157, 8, '2020-03-23 08:00:00', '2020-03-23 08:00:00', 2, 'Họp Huddle đầu ngày', NULL);
INSERT INTO `todo` VALUES (158, 9, '2020-03-23 08:00:00', '2020-03-23 08:30:00', 2, 'Họp Huddle đầu ngày', NULL);
INSERT INTO `todo` VALUES (159, 3, '2020-03-23 09:00:00', '2020-03-23 10:00:00', 2, 'Gửi định giá hs vay KH Hồ Thị Thanh Êm', NULL);
INSERT INTO `todo` VALUES (160, 3, '2020-03-23 10:15:00', '2020-03-23 11:50:00', 2, 'Soạn HS giải ngân hạn mức KH Trần Ngọc Thúy', NULL);
INSERT INTO `todo` VALUES (161, 3, '2020-03-23 13:30:00', '2020-03-23 14:00:00', 2, 'Gọi ĐT nhắc nợ các KH quá hạn', NULL);
INSERT INTO `todo` VALUES (163, 3, '2020-03-23 16:00:00', '2020-03-23 17:00:00', 2, 'Gặp KH Nguyễn Minh Kha mở gói tài khoản và bàn giao hồ sơ giải ngân KH Hoàng Văn Đức', NULL);
INSERT INTO `todo` VALUES (164, 3, '2020-03-23 15:15:00', '2020-03-23 16:50:00', 2, 'Gọi KH cũ tư vấn vay và sử dụng các dịch vụ, sản phẩm khác', NULL);
INSERT INTO `todo` VALUES (165, 8, '2020-03-23 11:30:00', '2020-03-23 00:00:00', 2, 'Bố sung hồ sơ KH Nguyễn Thị Cẩm Hiền cho điều phối', NULL);
INSERT INTO `todo` VALUES (168, 7, '2020-03-23 08:30:00', '2020-03-23 08:30:00', 2, 'Phát hành thẻ chú Dũng', NULL);
INSERT INTO `todo` VALUES (170, 12, '2020-03-23 08:00:00', '2020-03-23 10:00:00', 1, 'Xin phép anh Nhân em đến muộn vì có việc gia đình', 'accepted');
INSERT INTO `todo` VALUES (171, 6, '2020-03-24 15:00:00', '2020-03-24 00:00:00', 2, 'Hoàn tất hồ sơ chi lương Cty Sáu Thuận', NULL);
INSERT INTO `todo` VALUES (172, 7, '2020-03-23 15:29:00', '2020-03-23 15:29:00', 2, 'Liên hệ KH Trần Thanh Hải vay mua BĐS', NULL);
INSERT INTO `todo` VALUES (173, 3, '2020-03-23 16:30:00', '2020-03-23 17:00:00', 2, 'Thẩm định hồ sơ Nguyễn Ngọc Diện', NULL);
INSERT INTO `todo` VALUES (174, 7, '2020-03-23 16:30:00', '2020-03-23 17:00:00', 2, 'Thẩm định hồ sơ Nguyễn Ngọc Diện', NULL);
INSERT INTO `todo` VALUES (175, 12, '2020-03-23 04:10:00', '2020-02-24 00:00:00', 1, 'cho a đên tre', NULL);
INSERT INTO `todo` VALUES (176, 7, '2020-03-23 19:41:00', '2020-03-23 19:41:00', 2, 'Mở gói tk Đỗ Công Lĩnh', NULL);
INSERT INTO `todo` VALUES (177, 6, '2020-03-25 10:30:00', '2020-03-24 21:28:00', 2, 'Trình ký hs vay KH Nguyễn Thị Diễm Trinh', NULL);
INSERT INTO `todo` VALUES (178, 6, '2020-03-24 08:08:00', '2020-03-24 00:00:00', 2, 'Họp huddle đầu ngày', NULL);
INSERT INTO `todo` VALUES (179, 6, '2020-03-24 14:53:00', '2020-03-24 00:00:00', 2, 'Liên hệ tư vấn mở sổ tiết kiệm KH Nguyễn Thih Kiều My', NULL);
INSERT INTO `todo` VALUES (180, 3, '2020-03-24 08:45:00', '2020-03-24 09:45:00', 2, 'Đi định giá hs KH Hồ Thị Thanh Êm', NULL);
INSERT INTO `todo` VALUES (181, 3, '2020-03-24 08:00:00', '2020-03-24 08:30:00', 2, 'Họp huddle', NULL);
INSERT INTO `todo` VALUES (182, 3, '2020-03-24 10:15:00', '2020-03-24 11:00:00', 2, 'Gọi nhắc nợ KH quá hạn', NULL);
INSERT INTO `todo` VALUES (183, 8, '2020-03-24 08:00:00', '2020-03-24 10:00:00', 2, 'Trình HS Lê Danh Đồng và soạn thảo VKTD', NULL);
INSERT INTO `todo` VALUES (184, 8, '2020-03-26 09:00:00', '2020-03-26 11:00:00', 1, 'Xử lý và trình hồ sơ Phan Tăng Cui', NULL);
INSERT INTO `todo` VALUES (185, 8, '2020-03-26 11:00:00', '2020-03-26 00:00:00', 1, 'Trình hồ sơ Thẻ Visa Lê Danh Đồng', NULL);
INSERT INTO `todo` VALUES (186, 8, '2020-03-24 14:30:00', '2020-03-24 15:15:00', 2, 'Nhắc nợ và trình ân hận KH Quách Kim Hậu', NULL);
INSERT INTO `todo` VALUES (188, 7, '2020-03-24 08:30:00', '2020-03-24 08:30:00', 2, 'Họp Huddle xong e đi ra ngoài kiếm hồ sơ (đem theo tờ rơi)', NULL);
INSERT INTO `todo` VALUES (189, 3, '2020-03-24 13:30:00', '2020-03-24 15:00:00', 2, 'Gọi KH vay cũ mở thẻ tín dụng', NULL);
INSERT INTO `todo` VALUES (190, 9, '2020-03-24 08:00:00', '2020-03-24 09:00:00', 2, 'Họp huddle đầu ngày ', NULL);
INSERT INTO `todo` VALUES (191, 9, '2020-03-24 09:00:00', '2020-03-24 10:00:00', 2, 'Đt khách hàng xác nhận gặp kí hd lên bmh giấy tờ cpi kí hd Nguyễn Ngọc Huyền', NULL);
INSERT INTO `todo` VALUES (192, 9, '2020-03-24 10:00:00', '2020-03-24 00:00:00', 2, 'Hủy hẹn vơi khách. Đt tư vấn khách thuyết phục khách nguyễn ngọc huyền. ', NULL);
INSERT INTO `todo` VALUES (193, 3, '2020-03-24 15:20:00', '2020-03-24 16:00:00', 2, 'Kiểm tra danh sách thấu chi tới hạn trong tháng 3,4 để thông báo cho KH', NULL);
INSERT INTO `todo` VALUES (194, 9, '2020-03-24 01:00:00', '2020-03-24 03:00:00', 2, 'Điện thoại theo danh sách khách hàng tiền gửi của c Hằng ', NULL);
INSERT INTO `todo` VALUES (195, 9, '2020-03-24 03:00:00', '2020-03-24 04:00:00', 2, 'Lập dsach kết quả việc dt của c Nga + c hằng gui sếp Nhân + c Oanh. Khách tl the nao hẹn dc khách nào\r\n', NULL);
INSERT INTO `todo` VALUES (196, 7, '2020-03-24 11:00:00', '2020-03-24 11:30:00', 2, 'Đi thẩm định KH Trần Thanh Hải với anh Nhân', NULL);
INSERT INTO `todo` VALUES (197, 8, '2020-03-24 11:00:00', '2020-03-24 11:30:00', 2, 'Đi thẩm định KH Trần Thanh Hải với anh Nhân', NULL);
INSERT INTO `todo` VALUES (198, 3, '2020-03-24 09:30:00', '2020-03-24 10:30:00', 2, 'Báo cáo trích lập dự phòng', NULL);
INSERT INTO `todo` VALUES (199, 3, '2020-03-24 16:30:00', '2020-03-24 17:00:00', 2, 'Gặp KH Nguyễn Minh Kha mở gói tài khoản ', NULL);
INSERT INTO `todo` VALUES (200, 6, '2020-03-24 10:39:00', '2020-03-24 10:39:00', 2, 'Gặp cho KH Trần Văn Điểm ký mở gói tài khoản\r\n', NULL);
INSERT INTO `todo` VALUES (201, 7, '2020-03-24 11:30:00', '2020-03-24 11:30:00', 2, 'Chạy đi coi tài sản Trần Thanh Hải', NULL);
INSERT INTO `todo` VALUES (203, 3, '2020-03-25 08:00:00', '2020-03-25 09:00:00', 2, 'Gặp KH Trương Công Luận ký hs vay góp lương, thẻ tín dụng và gặp KH Đặng Út Em mở thẻ tín dụng, 2 KH công tác tại TTCTXH', 'accepted');
INSERT INTO `todo` VALUES (204, 3, '2020-03-25 09:30:00', '2020-03-25 10:00:00', 2, 'Làm HS xuất mượn tài sản cho KH Lê Hoàng Nam để KH hoàn công', NULL);
INSERT INTO `todo` VALUES (205, 3, '2020-03-25 10:15:00', '2020-03-25 11:00:00', 2, 'Gọi nhắc nợ KH quá hạn', NULL);
INSERT INTO `todo` VALUES (206, 7, '2020-03-24 14:19:00', '2020-03-24 16:00:00', 2, 'Gặp Sale Xe Toyota (Quí và Hiếu)', NULL);
INSERT INTO `todo` VALUES (207, 7, '2020-03-24 17:00:00', '2020-03-24 17:00:00', 2, 'Gặp môi giới BĐS (tên Anh)', NULL);
INSERT INTO `todo` VALUES (208, 6, '2020-03-25 09:32:00', '2020-03-25 00:00:00', 2, 'Xem trình phê duyệt hs KH Nguyễn Thị Diễm Trinh', NULL);
INSERT INTO `todo` VALUES (209, 6, '2020-03-25 15:49:00', '2020-03-25 00:00:00', 2, 'Cho mở gói tài khoản để mở sổ tiết kiệm tích lũy KH Nguyễn Thị Kiều My', NULL);
INSERT INTO `todo` VALUES (210, 6, '2020-03-25 14:51:00', '2020-03-25 00:00:00', 2, 'Xem bảng quá hạn đt nhắc nợ quá hạn', NULL);
INSERT INTO `todo` VALUES (211, 6, '2020-03-26 10:52:00', '2020-03-25 00:00:00', 2, 'Đt bên chú Thuận để xem tình hình ký những gói tài khoản chi lương', NULL);
INSERT INTO `todo` VALUES (214, 7, '2020-03-25 10:00:00', '2020-03-25 10:00:00', 2, 'Gọi nhắc nợ quá hạn', NULL);
INSERT INTO `todo` VALUES (215, 7, '2020-03-25 03:00:00', '2020-03-25 03:00:00', 2, 'Gọi mở thẻ tín dụng tất cả các KH trong danh sách lựa chọn trước.', NULL);
INSERT INTO `todo` VALUES (217, 9, '2020-03-25 08:00:00', '2020-03-25 10:00:00', 2, 'Liên hệ với khách hàng cũ để tư vấn quỹ đầu tư  chuyen sag bao toàn', NULL);
INSERT INTO `todo` VALUES (218, 9, '2020-03-25 10:00:00', '2020-03-25 00:00:00', 2, 'Gọi điện thoại khách hang tien gui theo danh sách còn lại + gửi báo cáo', NULL);
INSERT INTO `todo` VALUES (219, 9, '2020-03-25 01:00:00', '2020-03-25 03:00:00', 2, 'Gặp khách hàng Lê Minh Lý với GDV Nga ', NULL);
INSERT INTO `todo` VALUES (220, 9, '2020-03-25 03:00:00', '2020-03-25 04:00:00', 2, 'Lên bảng minh họa khách hàng vừa gặp theo nhu cầu khách. LÊ MINH LÝ ', NULL);
INSERT INTO `todo` VALUES (221, 9, '2020-03-25 04:00:00', '2020-03-25 05:00:00', 2, 'Thuc hiện việc báo cáo hàng ngày', NULL);
INSERT INTO `todo` VALUES (222, 7, '2020-03-25 04:00:00', '2020-03-25 04:00:00', 2, 'Chạy lại nhà KH Nhựt mở gói tk', NULL);
INSERT INTO `todo` VALUES (223, 3, '2020-03-25 13:30:00', '2020-03-25 14:30:00', 2, 'Làm hồ sơ vay và thẻ tín dụng  KH Trương Công Luận', NULL);
INSERT INTO `todo` VALUES (224, 3, '2020-03-25 14:50:00', '2020-03-25 15:30:00', 2, 'Gặp KH Trần Thị Hồng Hoa ký mở thẻ tín dụng', NULL);
INSERT INTO `todo` VALUES (225, 3, '2020-03-25 15:30:00', '2020-03-25 16:00:00', 2, 'Gặp KH Hoàng Văn Đức ký mở thẻ tín dụng', NULL);
INSERT INTO `todo` VALUES (226, 3, '2020-03-26 13:30:00', '2020-03-26 14:30:00', 2, 'Làm HS thẻ tín dụng KH Đặng Út Em', NULL);
INSERT INTO `todo` VALUES (232, 3, '2020-03-26 08:30:00', '2020-03-26 09:00:00', 2, 'Họp Huddle', NULL);
INSERT INTO `todo` VALUES (233, 6, '2020-03-26 08:30:00', '2020-03-26 09:00:00', 2, 'Họp Huddle', NULL);
INSERT INTO `todo` VALUES (234, 7, '2020-03-26 08:30:00', '2020-03-26 09:00:00', 2, 'Họp Huddle', NULL);
INSERT INTO `todo` VALUES (235, 8, '2020-03-26 08:30:00', '2020-03-26 09:00:00', 2, 'Họp Huddle', NULL);
INSERT INTO `todo` VALUES (236, 9, '2020-03-26 08:30:00', '2020-03-26 09:00:00', 2, 'Họp Huddle', NULL);
INSERT INTO `todo` VALUES (237, 3, '2020-03-26 09:00:00', '2020-03-26 10:00:00', 2, 'Xuất mượn tài sản để hoàn công cho KH Lê Hoàng Nam', NULL);
INSERT INTO `todo` VALUES (238, 3, '2020-03-27 08:30:00', '2020-03-27 09:30:00', 2, 'Làm HS thẻ tín dụng KH Hoàng Văn Đức', NULL);
INSERT INTO `todo` VALUES (239, 3, '2020-03-30 09:45:00', '2020-03-30 10:45:00', 2, 'Làm hồ sơ vay góp lương và thẻ tín dụng chị Hoa TTCTXH', NULL);
INSERT INTO `todo` VALUES (240, 6, '2020-03-26 10:53:00', '2020-03-26 00:00:00', 2, 'C.b hồ sơ giải ngân KH Nguyễn Thị Diễm Trinh', NULL);
INSERT INTO `todo` VALUES (241, 6, '2020-03-26 13:54:00', '2020-03-26 00:00:00', 2, 'Mở gói tk KH Võ Công Luận', NULL);
INSERT INTO `todo` VALUES (242, 6, '2020-03-26 13:56:00', '2020-03-26 00:00:00', 2, 'Mở sổ tiết kiệm tích lũy KH Phạm Thị Kiều My', NULL);
INSERT INTO `todo` VALUES (243, 6, '2020-03-26 13:23:00', '2020-03-26 00:00:00', 2, 'Liên hệ kế toán bên chú Thuận để xem fom mở thẻ nhân viên đã làm xong chưa', NULL);
INSERT INTO `todo` VALUES (248, 9, '2020-03-26 09:00:00', '2020-03-26 10:00:00', 2, 'Thành hưỡng dẫn làm bảo hiểm hồ sơ góp lương', NULL);
INSERT INTO `todo` VALUES (249, 9, '2020-03-26 10:00:00', '2020-03-26 00:00:00', 2, 'Điện thoại khách hàng tiền gửi  có hẹn với khách hàng Nguyễn Thanh Phong tại cơ quan ', NULL);
INSERT INTO `todo` VALUES (250, 9, '2020-03-26 01:00:00', '2020-03-26 02:00:00', 2, 'Lâp danh sách khtg xin sdt chuẩn bị điện ', NULL);
INSERT INTO `todo` VALUES (251, 9, '2020-03-26 02:00:00', '2020-03-26 04:00:00', 2, 'Điện thoại khách hàng tiền gửi\r\n', NULL);
INSERT INTO `todo` VALUES (252, 9, '2020-03-26 04:00:00', '2020-03-26 05:00:00', 2, 'Thống kê gọi bao nhiêu người có hẹn được nhiêu người. Gửi báo cáo', NULL);
INSERT INTO `todo` VALUES (253, 7, '2020-03-26 09:00:00', '2020-03-26 10:00:00', 2, 'Gọi danh sách KH lựa chọn trước', NULL);
INSERT INTO `todo` VALUES (255, 8, '2020-03-26 13:00:00', '2020-03-26 15:30:00', 2, 'Công chứng hồ sơ Lê Danh Đồng', NULL);
INSERT INTO `todo` VALUES (256, 7, '2020-03-26 14:00:00', '2020-03-26 16:00:00', 2, 'Gọi danh sách KH lựa chọn trước mở thẻ tín dụng', NULL);
INSERT INTO `todo` VALUES (257, 8, '2020-03-26 03:30:00', '2020-03-26 04:00:00', 2, 'Bổ sung CG và soạn thảo VKTD Kh Nguyễn Thị Cẩm Hiền', NULL);
INSERT INTO `todo` VALUES (258, 8, '2020-03-26 16:00:00', '2020-03-26 05:00:00', 2, 'Nhập kho TSBĐ, xác nhận tình trạng nhà đất, chuẩn bị giải ngân hs Lê Danh Đồng', NULL);
INSERT INTO `todo` VALUES (259, 9, '2020-03-26 08:00:00', '2020-03-26 08:40:00', 2, 'Em đang gé công ty caximes hướng dẫn khách xài appru chuyển đổi quỹ và đầu tư thêm tí. Tầm 10p nữa em chạy qua tới họp. ', NULL);
INSERT INTO `todo` VALUES (260, 3, '2020-03-26 11:00:00', '2020-03-26 00:00:00', 2, 'Gặp KH Hoa, Tú ký hs góp lương và mở thẻ tín dụng ở TTCTXH', NULL);
INSERT INTO `todo` VALUES (261, 6, '2020-03-26 13:30:00', '2020-03-26 16:30:00', 2, 'Hoàn thành danh sách xăng xe', NULL);
INSERT INTO `todo` VALUES (262, 7, '2020-03-26 16:00:00', '2020-03-26 16:30:00', 2, 'Báo cáo kết quả DS KH Lựa chọn trước.', NULL);
INSERT INTO `todo` VALUES (263, 3, '2020-03-27 10:00:00', '2020-03-27 10:30:00', 2, 'Trình hs vay Trương Công Luận và hs thẻ Đặng Út Em', NULL);
INSERT INTO `todo` VALUES (264, 3, '2020-03-27 11:30:00', '2020-03-27 00:00:00', 2, 'Gọi nhắc nợ các KH quá hạn', NULL);
INSERT INTO `todo` VALUES (265, 3, '2020-03-28 08:00:00', '2020-03-28 08:30:00', 2, 'Trình Ân hạn cho KH Nguyễn Văn Ý', NULL);
INSERT INTO `todo` VALUES (266, 3, '2020-03-27 10:30:00', '2020-03-27 11:00:00', 2, 'Kiểm tra thẻ KH Huỳnh Thứ Phát phát hành hay hoặc chuyển thẻ về cho KH chưa.', NULL);
INSERT INTO `todo` VALUES (267, 3, '2020-03-27 16:00:00', '2020-03-27 17:00:00', 2, 'Gặp anh Kiệt ở TTCTXH ký hs vay góp lương và thẻ tín dụng', NULL);
INSERT INTO `todo` VALUES (268, 7, '2020-03-27 16:00:00', '2020-03-27 16:30:00', 2, 'Gọi lại những KH có nhu cầu mở thẻ từ danh sách KH lựa chọn trước', NULL);
INSERT INTO `todo` VALUES (270, 7, '2020-03-27 17:00:00', '2020-03-27 17:30:00', 2, 'Gặp KH Ngoan mở gói tk', NULL);
INSERT INTO `todo` VALUES (272, 7, '2020-03-27 09:00:00', '2020-03-27 09:00:00', 2, 'Làm bàn giao hồ thẻ thẻ Nguyễn Văn Dũng', NULL);
INSERT INTO `todo` VALUES (273, 9, '2020-03-27 08:00:00', '2020-03-27 09:00:00', 2, 'Ghi chứng từ thẻ tài khoản hỗ trợ gdv. ', NULL);
INSERT INTO `todo` VALUES (274, 9, '2020-03-27 09:00:00', '2020-03-27 11:00:00', 2, 'Đt khách hàng tiền gửi ', NULL);
INSERT INTO `todo` VALUES (275, 9, '2020-03-27 01:00:00', '2020-03-27 02:00:00', 2, 'Tra cứu sdt khách hàng tièn gui de tiep tục gọi điện \r\n', NULL);
INSERT INTO `todo` VALUES (276, 9, '2020-03-27 02:00:00', '2020-03-27 03:00:00', 2, 'Điện thoại khâch hàng tiền gửi. ', NULL);
INSERT INTO `todo` VALUES (277, 9, '2020-03-27 03:00:00', '2020-03-27 04:00:00', 2, 'Có hẹn khách Nguyễn Thanh Phong tư vấn quỹ đầu tư. ', NULL);
INSERT INTO `todo` VALUES (278, 7, '2020-03-27 13:00:00', '2020-03-27 16:00:00', 2, 'Hoàn tất và trình Hs TTD anh Chiến + Chị Như', NULL);
INSERT INTO `todo` VALUES (279, 9, '2020-03-27 14:00:00', '2020-03-27 14:30:00', 2, 'Gửi bảng minh họa cho chị Thắm. Không tư vấn nhiều. Chốt số tiền', NULL);
INSERT INTO `todo` VALUES (280, 3, '2020-03-30 08:00:00', '2020-03-30 09:00:00', 2, 'Thu nợ trước hạn và giải chấp tài sản KH Đào Duy Anh', NULL);
INSERT INTO `todo` VALUES (281, 3, '2020-03-30 11:00:00', '2020-03-30 00:00:00', 2, 'Làm HS vay góp lương và thẻ tín dụng KH Huỳnh Tuấn Kiệt', NULL);
INSERT INTO `todo` VALUES (282, 3, '2020-03-30 13:30:00', '2020-03-30 14:00:00', 2, 'Gọi nhắc nợ quá hạn', NULL);
INSERT INTO `todo` VALUES (283, 9, '2020-03-30 08:00:00', '2020-03-30 09:00:00', 2, 'Họp với phòng KHCN', NULL);
INSERT INTO `todo` VALUES (284, 9, '2020-03-30 09:00:00', '2020-03-30 11:00:00', 2, 'Điện thoại khách hàng tiền gửi', NULL);
INSERT INTO `todo` VALUES (285, 9, '2020-03-30 01:00:00', '2020-03-30 02:00:00', 2, 'Đt tư vấn gửi tiết kiệm khách hàng  Thanh Loan', NULL);
INSERT INTO `todo` VALUES (286, 9, '2020-03-30 02:00:00', '2020-03-30 04:00:00', 2, 'Điện thoại khâch hàng tiền gửi', NULL);
INSERT INTO `todo` VALUES (287, 9, '2020-03-30 04:00:00', '2020-03-30 05:00:00', 2, 'Làm báo cáo\r\n', NULL);
INSERT INTO `todo` VALUES (293, 6, '2020-03-31 08:00:00', '2020-03-31 00:00:00', 2, 'Họp hudle', NULL);
INSERT INTO `todo` VALUES (294, 6, '2020-03-31 13:23:00', '2020-03-31 00:00:00', 2, 'Đt KH Yến có nhu cầu vay tiêu dùng 200tr', NULL);
INSERT INTO `todo` VALUES (295, 6, '2020-03-31 10:24:00', '2020-03-31 00:00:00', 2, 'Xem lại bảo hiểm xe KH Lê Đại Lợi', NULL);
INSERT INTO `todo` VALUES (296, 6, '2020-03-31 15:25:00', '2020-03-31 00:00:00', 2, 'Lên xem bảng quá hạn nhắc KH ', NULL);
INSERT INTO `todo` VALUES (297, 3, '2020-03-31 08:00:00', '2020-03-31 08:30:00', 2, 'Họp huddle', NULL);
INSERT INTO `todo` VALUES (298, 3, '2020-03-31 10:00:00', '2020-03-31 10:30:00', 2, 'Giải ngân HS góp lương Trương công luận', NULL);
INSERT INTO `todo` VALUES (299, 3, '2020-03-31 09:00:00', '2020-03-31 10:00:00', 2, 'Trình hs vay góp lương KH Trần Hồng Hoa', NULL);
INSERT INTO `todo` VALUES (300, 3, '2020-04-01 09:30:00', '2020-04-01 10:30:00', 2, 'Trình HS thẻ tín dụng KH Đặng Út Em và KH Trương Công Luận', NULL);
INSERT INTO `todo` VALUES (301, 3, '2020-03-31 13:30:00', '2020-03-31 14:00:00', 2, 'Gọi nhắc nợ quá hạn', NULL);
INSERT INTO `todo` VALUES (302, 3, '2020-04-01 13:30:00', '2020-04-01 14:30:00', 2, 'Trình HS thẻ tín dụng KH Hoàng Văn Đức', NULL);
INSERT INTO `todo` VALUES (303, 9, '2020-03-31 08:00:00', '2020-03-31 11:00:00', 2, 'Chuẩb bị hồ sơ gặp khách lê danh dòng. Chạy sp cuộc sống bình an 20tr/nam. Gặp khách kí hd ', NULL);
INSERT INTO `todo` VALUES (304, 9, '2020-03-31 11:00:00', '2020-03-31 00:00:00', 2, 'Gé văn phòng nộp giấy', NULL);
INSERT INTO `todo` VALUES (305, 9, '2020-03-31 03:00:00', '2020-03-31 04:00:00', 2, 'Hẹn khâch hàng Vuong Thị Kim', NULL);
INSERT INTO `todo` VALUES (306, 3, '2020-03-31 16:00:00', '2020-03-31 17:00:00', 2, 'Gặp chị Kiều ở Cần Thơ', NULL);
INSERT INTO `todo` VALUES (307, 7, '2020-03-31 09:30:00', '2020-03-31 09:35:00', 2, 'Kích hoạt thẻ chú Dũng', NULL);
INSERT INTO `todo` VALUES (308, 7, '2020-03-31 10:30:00', '2020-03-31 11:30:00', 2, 'Bàn giao hs thẻ cho QLTD', NULL);
INSERT INTO `todo` VALUES (309, 9, '2020-03-31 13:00:00', '2020-03-31 14:00:00', 2, 'Hoàn tất Bảo hiểm xe Lê Đại Lợi', NULL);
INSERT INTO `todo` VALUES (310, 9, '2020-03-31 04:00:00', '2020-03-31 05:00:00', 2, 'Làm báo cáo ngày. ', NULL);
INSERT INTO `todo` VALUES (311, 3, '2020-04-01 08:00:00', '2020-04-01 08:30:00', 2, 'Ghé CN nhận HS thẻ tín dụng KH Đặng Út Em và HS Vay Góp lương KH Trương Công Luận và Giải Ngân HS vay.', 'accepted');
INSERT INTO `todo` VALUES (312, 3, '2020-04-01 11:00:00', '2020-04-01 11:30:00', 2, 'Gọi nhắc nợ quá hạn', NULL);
INSERT INTO `todo` VALUES (313, 3, '2020-04-01 14:40:00', '2020-04-01 15:40:00', 2, 'Soạn HS vay KH Trần Văn Năm', NULL);
INSERT INTO `todo` VALUES (314, 3, '2020-04-01 16:00:00', '2020-04-01 17:00:00', 2, 'Bàn giao HS thẻ tín dụng', NULL);
INSERT INTO `todo` VALUES (315, 6, '2020-04-01 15:00:00', '2020-04-01 00:00:00', 2, 'Xem bảng quá hạn đt nhắc KH', NULL);
INSERT INTO `todo` VALUES (316, 6, '2020-04-01 10:07:00', '2020-04-01 00:00:00', 2, 'Làm giấy đi đường Trần Hoàng Phủ', NULL);
INSERT INTO `todo` VALUES (317, 6, '2020-04-01 11:04:00', '2020-04-01 00:00:00', 2, 'Trả giấy đi đường, ký HDBH KH Đỗ Thị Bích Trâm', NULL);
INSERT INTO `todo` VALUES (318, 9, '2020-04-01 09:30:00', '2020-04-01 11:00:00', 2, 'Học bài cpi 10h thi định hướng hội nhập ', NULL);
INSERT INTO `todo` VALUES (319, 9, '2020-04-01 01:00:00', '2020-04-01 02:00:00', 2, 'Xem danh sách khách hàng tiền gửi để dt khách ', NULL);
INSERT INTO `todo` VALUES (320, 9, '2020-04-01 02:00:00', '2020-04-01 04:00:00', 2, 'Điện thoại khách hàng tiền gửi. ', NULL);
INSERT INTO `todo` VALUES (321, 12, '2020-04-02 07:00:00', '2020-04-02 08:30:00', 1, 'Gặp KH Trần Thị A - HS vay 500tr', 'request');
INSERT INTO `todo` VALUES (326, 12, '2020-04-03 15:39:00', '2020-04-09 15:39:00', 1, 'Hoàn thành Hồ sơ vay 500Tr', NULL);
INSERT INTO `todo` VALUES (327, 3, '2020-04-08 10:30:00', '2020-04-08 11:30:00', 2, 'Hoàn tất HS ân hạn KH Ý', NULL);
INSERT INTO `todo` VALUES (328, 9, '2020-04-06 08:00:00', '2020-04-06 10:00:00', 2, 'Gọi dièn thoại nhắc phí hd tháng 4', NULL);
INSERT INTO `todo` VALUES (329, 9, '2020-04-06 10:00:00', '2020-04-06 00:00:00', 2, 'Hỗ trợ quầy dich vụ  xác nhận pin thẻ của khách hàng. ', NULL);
INSERT INTO `todo` VALUES (330, 9, '2020-04-06 14:00:00', '2020-04-06 15:00:00', 2, 'Điện thoại tư vấn khách hàng Ngọc gói bảo hiểm tương lai tươi sáng phí 15 refer chị Nga', NULL);
INSERT INTO `todo` VALUES (331, 9, '2020-04-06 15:00:00', '2020-04-06 16:00:00', 2, 'Gọi điẹn nhắc phí theo danh sách có sẵn. ', NULL);
INSERT INTO `todo` VALUES (332, 9, '2020-04-06 16:00:00', '2020-04-06 17:00:00', 2, 'Báo cáo việc gọi nhắc phí ', NULL);
INSERT INTO `todo` VALUES (333, 3, '2020-04-06 09:30:00', '2020-04-06 10:30:00', 2, 'Làm HS vay góp lương và thẻ TD KH Nguyễn Phạm Tố Quyên', NULL);
INSERT INTO `todo` VALUES (334, 3, '2020-04-06 10:30:00', '2020-04-06 11:30:00', 2, 'Soạn HS giải ngân hạn mức KH Trần Thị Hồng Hoa', NULL);
INSERT INTO `todo` VALUES (335, 3, '2020-04-06 13:30:00', '2020-04-06 14:00:00', 2, 'Gọi đt nhắc nợ quá hạn', NULL);
INSERT INTO `todo` VALUES (336, 3, '2020-04-06 14:15:00', '2020-04-06 15:30:00', 2, 'Soạn HS thẻ TD KH Hứa Anh Đào', NULL);
INSERT INTO `todo` VALUES (337, 6, '2020-04-06 10:30:00', '2020-04-06 11:30:00', 2, 'Điện thại nhắc nợ KH Quá hạn', NULL);
INSERT INTO `todo` VALUES (338, 3, '2020-04-07 08:00:00', '2020-04-07 08:30:00', 2, 'Gặp KH Hứa Thị Anh Đào ký HS thẻ tín dụng và Nguyễn Phạm Tố Quyên ký HS vay góp lương và thẻ tín dụng ở TTCTXH', 'accepted');
INSERT INTO `todo` VALUES (339, 3, '2020-04-07 09:00:00', '2020-04-07 09:30:00', 2, 'Giải chấp và xuất kho giấy đất ở Trà Nóc bàn giao cho KH Nguyễn Hoàng Dũng', NULL);
INSERT INTO `todo` VALUES (340, 3, '2020-04-07 09:30:00', '2020-04-07 10:30:00', 2, 'Giải ngân HS hạn mức KH Trần Thị Hồng Hoa', NULL);
INSERT INTO `todo` VALUES (341, 3, '2020-04-07 13:30:00', '2020-04-07 14:30:00', 2, 'Trình hs vay góp lương và thẻ tín dụng KH Nguyễn Phạm Tố Quyên', NULL);
INSERT INTO `todo` VALUES (342, 3, '2020-04-07 14:40:00', '2020-04-07 15:40:00', 2, 'Trình hs thẻ tín dụng KH Hứa Thị Anh Đào', NULL);
INSERT INTO `todo` VALUES (343, 9, '2020-04-07 09:00:00', '2020-04-07 11:00:00', 2, 'Gửi sỗ tiết kiệm và nhậ tiền đe về cơ quan khách hàng Nguyễn thị Thùy dung', NULL);
INSERT INTO `todo` VALUES (344, 9, '2020-04-07 08:00:00', '2020-04-07 09:00:00', 2, 'Gửi báo cáo gắp tìn hình cho BSM sơn. ', NULL);
INSERT INTO `todo` VALUES (345, 9, '2020-04-07 14:00:00', '2020-04-07 16:00:00', 2, 'Điệ thoại tư vấn khách hàng Yến Phượng gói an tâm trọn đời refer của Hiểu', NULL);
INSERT INTO `todo` VALUES (346, 9, '2020-04-07 16:00:00', '2020-04-07 17:00:00', 2, 'Làm báo cáo ngày', NULL);
INSERT INTO `todo` VALUES (347, 9, '2020-04-08 09:00:00', '2020-04-08 11:00:00', 2, 'Tư vấn khách hàng hồng thuần refer c Nga', NULL);
INSERT INTO `todo` VALUES (348, 9, '2020-04-08 11:00:00', '2020-04-08 00:00:00', 2, 'Hỗ trợ quầy dịch vụ viết ủy quyền sỗ tiết kiệm ', NULL);
INSERT INTO `todo` VALUES (349, 9, '2020-04-08 01:00:00', '2020-04-08 02:00:00', 2, 'Tư vấn sản phẩm chị Hương khách hàng cũ chị dag thắc mắt mail và giấy công ty gửi.', NULL);
INSERT INTO `todo` VALUES (350, 9, '2020-04-08 02:00:00', '2020-04-08 03:00:00', 2, 'Gửi sỗ tiết kiệm cho c Kim ', NULL);
INSERT INTO `todo` VALUES (351, 9, '2020-04-08 03:00:00', '2020-04-08 05:00:00', 2, 'Hỗ trợ quầy dịch vụ và làm.báo cáo', NULL);
INSERT INTO `todo` VALUES (352, 3, '2020-04-08 08:30:00', '2020-04-08 09:00:00', 2, 'Trình hs góp lương và thẻ tín dụng KH Nguyễn Phạm Tố Quyên', NULL);
INSERT INTO `todo` VALUES (353, 3, '2020-04-08 09:00:00', '2020-04-08 10:00:00', 2, 'Trình HS thẻ tín dụng KH Hứa Thị Anh Đào', NULL);
INSERT INTO `todo` VALUES (354, 3, '2020-04-08 13:30:00', '2020-04-08 14:00:00', 2, 'Nhắc nợ quá hạn', NULL);
INSERT INTO `todo` VALUES (355, 3, '2020-04-08 14:30:00', '2020-04-08 15:30:00', 2, 'Soạn HS vay góp lương và thẻ tín dụng KH Lê Tuấn Tú', NULL);
INSERT INTO `todo` VALUES (356, 3, '2020-04-08 15:30:00', '2020-04-08 16:30:00', 2, 'Soạn HS thẻ tín dụng KH Trần Thị Hồng Hoa', NULL);
INSERT INTO `todo` VALUES (357, 3, '2020-04-13 08:00:00', '2020-04-13 08:30:00', 2, 'Ghé CN Cần Thơ nhận 3 HS vay góp lương đã có phê duyệt của GĐ vùng.', 'accepted');
INSERT INTO `todo` VALUES (358, 3, '2020-04-13 09:00:00', '2020-04-13 10:00:00', 2, 'GN HS vay góp lương KH Trần Hồng Hoa', NULL);
INSERT INTO `todo` VALUES (359, 3, '2020-04-13 10:00:00', '2020-04-13 11:00:00', 2, 'GN HS vay góp lương KH Nguyễn Phạm Tố Quyên', NULL);
INSERT INTO `todo` VALUES (360, 3, '2020-04-15 10:30:00', '2020-04-15 11:30:00', 2, 'Bổ sung HS cơ cấu nợ KH Nguyễn Văn Ý', NULL);
INSERT INTO `todo` VALUES (361, 3, '2020-04-13 13:30:00', '2020-04-13 14:00:00', 2, 'Làm giấy đi đường cho KH Nguyễn Hữu Hoá', NULL);
INSERT INTO `todo` VALUES (362, 3, '2020-04-13 14:00:00', '2020-04-13 15:00:00', 2, 'GN HS vay góp lương Lê Hiếu Tú', NULL);
INSERT INTO `todo` VALUES (363, 3, '2020-04-13 08:30:00', '2020-04-13 11:00:00', 2, 'Gọi ĐT nhắc nợ', NULL);
INSERT INTO `todo` VALUES (364, 9, '2020-04-13 08:30:00', '2020-04-13 10:00:00', 2, 'Lấy hd Lê Danh Đồng. Gặp khách cho khách kí hs', NULL);
INSERT INTO `todo` VALUES (365, 9, '2020-04-13 10:00:00', '2020-04-13 00:00:00', 2, 'Điện thoại tue vấn khách hàng. Huỳnh Quang Phú sp cuộc sống bình an. ', NULL);
INSERT INTO `todo` VALUES (366, 9, '2020-04-13 13:30:00', '2020-04-13 16:00:00', 2, 'Điện thoại kháh hàng tiềm nange của phòng theo file sdt của gdv. Cố gắng hẹn đ khách', NULL);
INSERT INTO `todo` VALUES (367, 9, '2020-04-13 16:00:00', '2020-04-13 17:00:00', 2, 'Báo cáo', NULL);
INSERT INTO `todo` VALUES (368, 9, '2020-04-14 09:00:00', '2020-04-14 10:00:00', 2, 'Dt khách hàng ', NULL);
INSERT INTO `todo` VALUES (369, 9, '2020-04-14 10:00:00', '2020-04-14 00:00:00', 2, 'Tue van khách hang trần ngọc yến mơ tiết kiệm cho bé + sp bao hỉm tuong lai tuoi sáng 12tr', NULL);
INSERT INTO `todo` VALUES (370, 9, '2020-04-14 01:00:00', '2020-04-14 02:00:00', 2, 'Tue vấn lại khách hàng yến phượng. Gói sp dau tư 15tr ', 'accepted');
INSERT INTO `todo` VALUES (371, 9, '2020-04-14 02:00:00', '2020-04-14 08:00:00', 2, 'Điện thoại khách hang', NULL);
INSERT INTO `todo` VALUES (372, 9, '2020-04-14 04:00:00', '2020-04-14 05:00:00', 2, 'Báo cáo', NULL);
INSERT INTO `todo` VALUES (373, 9, '2020-04-14 08:00:00', '2020-04-14 09:00:00', 2, 'Em xin đi trể e sữa xe. ', 'accepted');
INSERT INTO `todo` VALUES (374, 3, '2020-04-14 08:30:00', '2020-04-14 09:30:00', 2, 'Giải ngân HS vay góp lương KH Lê Hiếu Tú', NULL);
INSERT INTO `todo` VALUES (375, 3, '2020-04-14 09:30:00', '2020-04-14 10:00:00', 2, 'Làm giấy đi đường cho KH Nguyễn Hữu Hoá', NULL);
INSERT INTO `todo` VALUES (376, 3, '2020-04-14 13:30:00', '2020-04-14 14:00:00', 2, 'Gọi nhắc nợ quá hạn', NULL);
INSERT INTO `todo` VALUES (377, 3, '2020-04-14 16:00:00', '2020-04-14 17:00:00', 2, 'Làm bàn giao HS quá hạn KH Nguyễn Văn Luốc', NULL);
INSERT INTO `todo` VALUES (378, 3, '2020-04-14 14:00:00', '2020-04-14 16:00:00', 2, 'Gặp KH Nguyễn Ngọc Thúy ( Cờ đỏ) cho KH ký hs hạn mức.', NULL);
INSERT INTO `todo` VALUES (379, 8, '2020-04-15 09:00:00', '2020-04-15 10:30:00', 1, 'Trình hồ sơ Phan Tăng Cui', NULL);
INSERT INTO `todo` VALUES (380, 9, '2020-04-15 08:30:00', '2020-04-15 08:45:00', 2, 'Báo cáo kết quả Refer Bảo hiểm', NULL);
INSERT INTO `todo` VALUES (381, 3, '2020-04-15 08:30:00', '2020-04-15 09:30:00', 2, 'Giải ngân HS vay góp lương KH Trần Hồng Hoa', NULL);
INSERT INTO `todo` VALUES (382, 3, '2020-04-15 09:30:00', '2020-04-15 10:30:00', 2, 'Giải ngân HS vay hạn mức KH Nguyễn Ngọc Thúy', NULL);
INSERT INTO `todo` VALUES (383, 3, '2020-04-15 13:30:00', '2020-04-15 14:00:00', 2, 'Gọi đt nhắc nợ', NULL);
INSERT INTO `todo` VALUES (384, 3, '2020-04-15 14:00:00', '2020-04-15 14:30:00', 2, 'Trình HS phát hành thẻ KH Lê Hiếu Tú', NULL);
INSERT INTO `todo` VALUES (385, 9, '2020-04-15 09:00:00', '2020-04-15 11:00:00', 2, 'Đien thoai khách hàng ', NULL);
INSERT INTO `todo` VALUES (386, 9, '2020-04-15 11:00:00', '2020-04-15 00:00:00', 2, 'Tư vấn khách hàng thu dung refer chị nga', NULL);
INSERT INTO `todo` VALUES (387, 9, '2020-04-15 13:00:00', '2020-04-15 14:00:00', 2, 'Tư vấn khách hàng yến. ', NULL);
INSERT INTO `todo` VALUES (388, 9, '2020-04-15 14:01:00', '2020-04-15 16:00:00', 2, 'Điện thoại khách hàng', NULL);
INSERT INTO `todo` VALUES (389, 12, '2020-04-16 17:24:00', '2020-04-20 17:24:00', 1, 'Thực hiện gặp KH A', NULL);
INSERT INTO `todo` VALUES (390, 3, '2020-04-16 08:00:00', '2020-04-16 08:30:00', 2, 'Định giá hs cơ cấu nợ Nguyễn Văn Ý', NULL);
INSERT INTO `todo` VALUES (391, 3, '2020-04-16 09:00:00', '2020-04-16 09:30:00', 2, 'Bổ sung HS sau giải ngân KH Trần Ngọc Thúy', NULL);
INSERT INTO `todo` VALUES (392, 3, '2020-04-17 10:00:00', '2020-04-17 11:00:00', 2, 'Làm bàn giao hs Nguyễn Văn Luốc', NULL);
INSERT INTO `todo` VALUES (393, 3, '2020-04-16 10:30:00', '2020-04-16 00:00:00', 2, 'Làm bàn giao các hồ sơ đã giải ngân', NULL);
INSERT INTO `todo` VALUES (394, 3, '2020-04-16 13:30:00', '2020-04-16 14:00:00', 2, 'Gọi ĐT nhắc nợ quá hạn', NULL);
INSERT INTO `todo` VALUES (395, 9, '2020-04-16 08:00:00', '2020-04-16 10:00:00', 2, 'Điện thoại khách hàng', NULL);
INSERT INTO `todo` VALUES (396, 9, '2020-04-16 10:00:00', '2020-04-16 00:00:00', 2, 'Đi văn phòng.  Gửi giấy hủy sp bổ trợ cho khách ánh xuân', NULL);
INSERT INTO `todo` VALUES (397, 9, '2020-04-16 13:00:00', '2020-04-16 14:00:00', 2, 'Tư vấn khách hàng. Hồng thuần refer c Nga khách đến nhận lãi. ', NULL);
INSERT INTO `todo` VALUES (398, 9, '2020-04-16 14:00:00', '2020-04-16 16:00:00', 2, 'Điện thoai tv khách', NULL);
INSERT INTO `todo` VALUES (399, 9, '2020-04-16 16:00:00', '2020-04-16 17:00:00', 2, 'Báo cáo', NULL);
INSERT INTO `todo` VALUES (400, 3, '2020-04-17 09:00:00', '2020-04-17 10:00:00', 2, 'Bổ sung tờ trình cơ cấu nợ KH Nguyễn Văn Ý', NULL);
INSERT INTO `todo` VALUES (401, 3, '2020-04-17 11:00:00', '2020-04-17 11:30:00', 2, 'Gọi ĐT nhắc nợ quá hạn', NULL);
INSERT INTO `todo` VALUES (402, 3, '2020-04-17 13:30:00', '2020-04-17 14:00:00', 2, 'Trình HS phát hành thẻ KH Nguyễn phạm tố quyên', NULL);
INSERT INTO `todo` VALUES (403, 3, '2020-04-21 08:30:00', '2020-04-21 09:30:00', 2, 'Gặp KH Đặng Thành Long cho ký hs vay và đi chụp hình các nhà cho thuê ', 'accepted');
INSERT INTO `todo` VALUES (404, 3, '2020-04-21 10:00:00', '2020-04-21 10:30:00', 2, 'Gửi định giá hs vay KH Đặng Thanh Long', NULL);
INSERT INTO `todo` VALUES (405, 3, '2020-04-21 10:30:00', '2020-04-21 11:30:00', 2, 'Trình hs thẻ KH Trần Thị Hồng Hoa', NULL);
INSERT INTO `todo` VALUES (406, 3, '2020-04-21 13:30:00', '2020-04-21 14:00:00', 2, 'Gọi ĐT nhắc nợ quá hạn', NULL);
INSERT INTO `todo` VALUES (407, 3, '2020-04-22 15:30:00', '2020-04-22 16:30:00', 2, 'Hoàn thiện HS KH Đặng Thanh Long', NULL);
INSERT INTO `todo` VALUES (408, 9, '2020-04-21 08:00:00', '2020-04-21 09:00:00', 2, 'Gửi báo cáo cho bsm Sơn về số tháng 04. ', NULL);
INSERT INTO `todo` VALUES (409, 9, '2020-04-21 09:00:00', '2020-04-21 11:00:00', 2, 'Hướng dẫn a Đồng nhận lại tiền bh. Gặp anh đến văn phòng kí giấy', NULL);
INSERT INTO `todo` VALUES (410, 9, '2020-04-21 02:00:00', '2020-04-21 04:00:00', 2, 'Tư vấn khách hàng qua điện thoại.khách tiền gửi', NULL);
INSERT INTO `todo` VALUES (411, 9, '2020-04-21 04:00:00', '2020-04-21 05:00:00', 2, 'Xin 2 refer cua p.khcn điền và Hưng để xin tiến độ hs lên trong tháng. Báo cáo\r\n', NULL);
INSERT INTO `todo` VALUES (412, 9, '2020-04-22 08:00:00', '2020-04-22 10:00:00', 2, 'Điện thoại tư vấn khách hàng', NULL);
INSERT INTO `todo` VALUES (413, 9, '2020-04-22 10:00:00', '2020-04-22 11:00:00', 2, 'Tư vấn khách Yến refer c Nga', NULL);
INSERT INTO `todo` VALUES (414, 9, '2020-04-22 11:00:00', '2020-04-22 00:00:00', 2, 'Cho a Đồng kí bsung giấy cônh ty mới yêu cầu', NULL);
INSERT INTO `todo` VALUES (415, 9, '2020-04-22 02:00:00', '2020-04-22 04:00:00', 2, 'Dt tư vấn khách hàng', NULL);
INSERT INTO `todo` VALUES (416, 9, '2020-04-22 20:00:00', '2020-04-22 17:00:00', 2, 'Bao cao', NULL);
INSERT INTO `todo` VALUES (417, 3, '2020-04-22 08:30:00', '2020-04-22 09:00:00', 2, 'Bổ sung chứng từ cho bên định giá', NULL);
INSERT INTO `todo` VALUES (418, 3, '2020-04-22 09:00:00', '2020-04-22 10:00:00', 2, 'Làm bàn giao các HS giải ngân', NULL);
INSERT INTO `todo` VALUES (419, 3, '2020-04-22 10:00:00', '2020-04-22 11:00:00', 2, 'Gửi yêu cầu lên khối vận hành soạn hồ sơ cơ cấu KH Nguyễn Văn Ý', NULL);
INSERT INTO `todo` VALUES (420, 3, '2020-04-22 13:30:00', '2020-04-22 14:00:00', 2, 'Gọi nhắc nợ quá hạn', NULL);
INSERT INTO `todo` VALUES (421, 9, '2020-04-23 08:00:00', '2020-04-23 09:00:00', 2, 'Hop huddel', NULL);
INSERT INTO `todo` VALUES (422, 9, '2020-04-23 09:00:00', '2020-04-23 10:30:00', 2, 'Đt khách hàng ', NULL);
INSERT INTO `todo` VALUES (423, 9, '2020-04-23 10:30:00', '2020-04-23 00:00:00', 2, 'Đi khách hàng với c Nga ( c nga nt e hòi khuya nnee e chua kịp hỏi thông tin chúc e hỏi xong rồi e cập nhật thêm )', NULL);
INSERT INTO `todo` VALUES (424, 9, '2020-04-23 14:00:00', '2020-04-23 16:00:00', 2, 'Tư vấn khách qua đt ', NULL);
INSERT INTO `todo` VALUES (425, 9, '2020-04-23 16:00:00', '2020-04-23 17:00:00', 2, 'Bao cao', NULL);
INSERT INTO `todo` VALUES (426, 9, '2020-04-24 08:30:00', '2020-04-24 10:00:00', 2, 'Thi onl test kiến thức của pvcombank  ', NULL);
INSERT INTO `todo` VALUES (427, 9, '2020-04-24 10:00:00', '2020-04-24 11:00:00', 2, 'Điên thoai khach hang ', NULL);
INSERT INTO `todo` VALUES (428, 9, '2020-04-24 13:00:00', '2020-04-24 16:00:00', 2, 'Xin sdt tu quầy dvkh đt khách', NULL);
INSERT INTO `todo` VALUES (429, 9, '2020-04-24 16:00:00', '2020-04-24 17:00:00', 2, 'Bao cao', NULL);
INSERT INTO `todo` VALUES (430, 9, '2020-04-24 08:00:00', '2020-04-24 08:30:00', 2, 'E có việc xin đi trể 30p', 'accepted');
INSERT INTO `todo` VALUES (431, 3, '2020-04-24 14:00:00', '2020-04-24 14:30:00', 2, 'Gọi nhắc nợ quá hạn', NULL);
INSERT INTO `todo` VALUES (432, 3, '2020-04-24 16:00:00', '2020-04-24 17:00:00', 2, 'Đi định giá hồ sơ KH Đặng Thành Long ở hẻm 9  đường xô viết nghệ tĩnh', NULL);
INSERT INTO `todo` VALUES (433, 6, '2020-04-27 10:26:00', '2020-04-27 00:00:00', 2, 'Mở gói tk KH Nguyễn Thị Yến Nhi', NULL);
INSERT INTO `todo` VALUES (434, 6, '2020-04-27 11:00:00', '2020-04-27 00:00:00', 2, 'Trình cơ cấu nợ KH Nguyễn Thanh Tùng', NULL);
INSERT INTO `todo` VALUES (435, 6, '2020-04-27 13:28:00', '2020-04-27 00:00:00', 2, 'Soạn tờ trình cơ cấu nợ KH Nguyễn Phú Bình', NULL);
INSERT INTO `todo` VALUES (436, 6, '2020-04-27 15:29:00', '2020-04-27 00:00:00', 2, 'Xem nợ quán hạn gọi KH quá hạn', NULL);
INSERT INTO `todo` VALUES (437, 3, '2020-04-27 08:00:00', '2020-04-27 08:30:00', 2, 'Ghé TTCTXH gửi chứng từ giùm chị Oanh và ghé CN Cần Thơ gửi biên bản khảo sát hiện trạng 3 cho bên định giá', 'accepted');
INSERT INTO `todo` VALUES (438, 3, '2020-04-27 09:15:00', '2020-04-27 09:45:00', 2, 'Gọi KH Dương Xuân Chuyển tư vấn vay ', NULL);
INSERT INTO `todo` VALUES (439, 3, '2020-04-27 10:00:00', '2020-04-27 11:00:00', 2, 'Gọi KH Hoàng Dũng tư vấn vay', NULL);
INSERT INTO `todo` VALUES (440, 3, '2020-04-27 11:00:00', '2020-04-27 11:30:00', 2, 'Gọi nhắc nợ quá hạn', NULL);
INSERT INTO `todo` VALUES (441, 3, '2020-04-27 16:30:00', '2020-04-27 17:00:00', 2, 'Bàn giao các HS đã giải ngân và HS phát hành thẻ', NULL);
INSERT INTO `todo` VALUES (442, 3, '2020-04-27 14:00:00', '2020-04-27 15:00:00', 2, 'Làm việc với chị Phương & Gia đình KH Thanh Long chốt hồ sơ và phương án giải ngân', NULL);
INSERT INTO `todo` VALUES (443, 6, '2020-04-27 16:00:00', '2020-04-27 16:30:00', 2, 'Chốt case Bảo hiểm Anh của Thành. Hiểu phối hợp xử lý', NULL);
INSERT INTO `todo` VALUES (444, 9, '2020-04-27 16:00:00', '2020-04-27 16:30:00', 2, 'Chốt case Bảo hiểm Anh của Thành. Hiểu phối hợp xử lý', NULL);
INSERT INTO `todo` VALUES (445, 8, '2020-04-27 15:00:00', '2020-04-27 15:30:00', 1, 'Kích hoạt thẻ Thu Em', NULL);
INSERT INTO `todo` VALUES (446, 3, '2020-04-27 16:30:00', '2020-04-27 16:45:00', 2, 'Kích hoạt tất cả thẻ tín dụng còn tồn đọng.', NULL);
INSERT INTO `todo` VALUES (447, 3, '2020-04-28 08:30:00', '2020-04-28 09:00:00', 2, 'Úp soạn HS KH Đặng Thanh Long', NULL);
INSERT INTO `todo` VALUES (448, 3, '2020-04-28 09:30:00', '2020-04-28 10:00:00', 2, 'Gửi định giá HS anh Hoàng Dũng', NULL);
INSERT INTO `todo` VALUES (449, 3, '2020-04-28 10:30:00', '2020-04-28 11:00:00', 2, 'Gửi định giá KH Dương Xuân Chuyển', NULL);
INSERT INTO `todo` VALUES (450, 3, '2020-04-28 13:30:00', '2020-04-28 02:00:00', 2, 'Gọi nhắc nợ quá hạn', NULL);
INSERT INTO `todo` VALUES (451, 6, '2020-04-28 11:00:00', '2020-04-28 00:00:00', 2, 'Trình hs cơ cấu KH Nguyễn Phú Bình', NULL);
INSERT INTO `todo` VALUES (452, 6, '2020-04-28 15:16:00', '2020-04-28 00:00:00', 2, 'Xem bảng quá hạn gọi đt nhắc nợ', NULL);
INSERT INTO `todo` VALUES (453, 6, '2020-04-28 08:34:00', '2020-04-28 08:34:00', 2, 'Gửi giấy đi đường cho KH Trần Hữu Phước', NULL);
INSERT INTO `todo` VALUES (454, 6, '2020-04-28 13:38:00', '2020-04-28 00:00:00', 2, 'Làm lại xăng xe giúp chị Oanh', NULL);
INSERT INTO `todo` VALUES (455, 3, '2020-04-28 16:10:00', '2020-04-28 17:00:00', 2, 'Đi gặp KH quá hạn Nguyễn Ngọc Điệp với anh Bình Dương', NULL);
INSERT INTO `todo` VALUES (456, 3, '2020-04-29 08:30:00', '2020-04-29 09:30:00', 2, 'Soạn HS thẻ tín dụng KH Trần Thị Hồng Hoa', NULL);
INSERT INTO `todo` VALUES (457, 3, '2020-04-29 09:30:00', '2020-04-29 10:30:00', 2, 'Soạn HS Giải ngân KH Đặng Thanh Long', NULL);
INSERT INTO `todo` VALUES (458, 3, '2020-04-29 10:30:00', '2020-04-29 11:00:00', 2, 'Gọi KH Trần Ngọc Thúy tư vấn vay', NULL);
INSERT INTO `todo` VALUES (459, 3, '2020-04-29 13:30:00', '2020-04-29 14:00:00', 2, 'Gọi nhắc nợ quá hạn', NULL);
INSERT INTO `todo` VALUES (460, 3, '2020-04-29 14:00:00', '2020-04-29 15:00:00', 2, 'Làm bàn giao các HS giải ngân và HS thẻ ', NULL);
INSERT INTO `todo` VALUES (461, 3, '2020-05-04 08:00:00', '2020-05-04 08:30:00', 2, 'Họp Huddle', NULL);
INSERT INTO `todo` VALUES (462, 6, '2020-05-04 08:00:00', '2020-05-04 08:30:00', 2, 'Họp Huddle', NULL);
INSERT INTO `todo` VALUES (465, 3, '2020-05-04 16:30:00', '2020-05-04 16:30:00', 2, 'Họp kinh doanh Tháng 4/2020', NULL);
INSERT INTO `todo` VALUES (469, 3, '2020-05-04 08:30:00', '2020-05-04 09:00:00', 2, 'Đi định giá HS KH Dương Xuân Chuyển', NULL);
INSERT INTO `todo` VALUES (470, 3, '2020-05-04 09:30:00', '2020-05-04 11:00:00', 2, 'Đi công chứng HS KH Đặng Thanh Long', NULL);
INSERT INTO `todo` VALUES (471, 3, '2020-05-04 13:30:00', '2020-05-04 14:00:00', 2, 'Gọi nhắc nợ quá hạn', NULL);
INSERT INTO `todo` VALUES (472, 3, '2020-05-05 08:30:00', '2020-05-05 09:00:00', 2, 'Trình HS thẻ tín dụng KH Trần Thị Hồng Hoa', NULL);
INSERT INTO `todo` VALUES (473, 6, '2020-05-04 14:30:00', '2020-05-04 15:30:00', 2, 'Đi định giá hồ sơ KH Nguyễn Hoàng Dũng', NULL);
INSERT INTO `todo` VALUES (474, 3, '2020-05-04 14:00:00', '2020-05-04 15:30:00', 2, 'Đi công chứng HS KH Đặng Thanh Long', NULL);
INSERT INTO `todo` VALUES (475, 6, '2020-05-04 14:00:00', '2020-05-04 14:30:00', 2, 'Thu nợ KH Đỗ Hữu Thuận', NULL);
INSERT INTO `todo` VALUES (476, 3, '2020-05-05 09:00:00', '2020-05-05 10:00:00', 2, 'Gọi 2 KH Bên TTCTXH tư vấn vay', NULL);
INSERT INTO `todo` VALUES (477, 3, '2020-05-05 14:00:00', '2020-05-05 16:00:00', 2, 'Đi cờ đỏ bàn giao HS quá hạn KH Nguyễn Văn Luốc qua bên xử lý nợ', NULL);
INSERT INTO `todo` VALUES (478, 3, '2020-05-05 11:00:00', '2020-05-05 11:30:00', 2, 'Gọi nhắc nợ quá hạn', NULL);
INSERT INTO `todo` VALUES (479, 3, '2020-05-08 16:00:00', '2020-05-08 17:00:00', 2, 'Làm bàn giao các HS đã giải ngân và thẻ tín dụng', NULL);
INSERT INTO `todo` VALUES (480, 6, '2020-05-05 13:20:00', '2020-05-05 00:00:00', 2, 'Đt tư vấn lại cho KH Trần Văn Năm vay góp lươbg 200tr', NULL);
INSERT INTO `todo` VALUES (481, 6, '2020-05-05 15:20:00', '2020-05-05 00:00:00', 2, 'Xem quá hạn đt nhắc nợ KH', NULL);
INSERT INTO `todo` VALUES (482, 6, '2020-05-05 14:21:00', '2020-05-05 00:00:00', 2, 'Trình hs cơ cấu KH Nguyễn Phú Bình', NULL);
INSERT INTO `todo` VALUES (483, 3, '2020-05-05 14:12:00', '2020-05-05 14:12:00', 2, 'Gặp KH', NULL);
INSERT INTO `todo` VALUES (485, 3, '2020-05-05 17:00:00', '2020-05-05 18:00:00', 2, 'Họp kinh doanh Phòng', NULL);
INSERT INTO `todo` VALUES (487, 8, '2020-05-05 17:00:00', '2020-05-05 18:00:00', 2, 'Họp kinh doanh Phòng', NULL);
INSERT INTO `todo` VALUES (489, 3, '2020-05-06 07:30:00', '2020-05-06 08:20:00', 2, 'Gặp KH A', 'accepted');
INSERT INTO `todo` VALUES (490, 3, '2020-05-06 08:30:00', '2020-05-06 09:00:00', 2, 'Bổ sung HS thẻ tín dụng KH Trần Thị Hồng Hoa', NULL);
INSERT INTO `todo` VALUES (491, 3, '2020-05-06 09:00:00', '2020-05-06 09:30:00', 2, 'Gửi yêu cầu chuyển mã core KH Nguyễn Văn Luốc  qua xử lý nợ ', NULL);
INSERT INTO `todo` VALUES (492, 3, '2020-05-06 09:30:00', '2020-05-06 10:00:00', 2, 'Lọc danh sách các KH thấu chi tới hạn tháng 5,6', NULL);
INSERT INTO `todo` VALUES (493, 6, '2020-05-06 13:31:00', '2020-05-06 00:00:00', 2, 'C.b check list KH Hoàng', NULL);
INSERT INTO `todo` VALUES (494, 6, '2020-05-06 14:41:00', '2020-05-06 00:00:00', 2, 'Xem nhắc nợ quá hạn', NULL);
INSERT INTO `todo` VALUES (495, 3, '2020-05-06 13:30:00', '2020-05-06 14:00:00', 2, 'Gọi nhắc nợ quá hạn', NULL);
INSERT INTO `todo` VALUES (496, 3, '2020-05-06 15:00:00', '2020-05-06 15:30:00', 2, 'Thu nợ trước hạn một phần gốc KH Nguyễn Phương Huyền', NULL);
INSERT INTO `todo` VALUES (497, 3, '2020-05-08 09:00:00', '2020-05-08 09:30:00', 2, 'Bổ sung HS KH Vũ Quyết Tiến cho pháp chế', NULL);
INSERT INTO `todo` VALUES (498, 3, '2020-05-07 10:00:00', '2020-05-07 10:30:00', 2, 'Gọi 2 KH bên TTCTXH tư vấn vay', NULL);
INSERT INTO `todo` VALUES (499, 3, '2020-05-07 10:30:00', '2020-05-07 11:30:00', 2, 'Bổ sung, điều chỉnh định giá xe KH cũ Tăng Võ Duy An', NULL);
INSERT INTO `todo` VALUES (500, 3, '2020-05-07 13:30:00', '2020-05-07 14:00:00', 2, 'Gọi nhắc nợ quá hạn', NULL);
INSERT INTO `todo` VALUES (501, 3, '2020-05-08 10:00:00', '2020-05-08 10:30:00', 2, 'Gọi tư vấn vay chị Linh bên TTCTXH', NULL);
INSERT INTO `todo` VALUES (502, 6, '2020-05-08 15:00:00', '2020-05-08 00:00:00', 2, 'Làm hs bàn giao HTTD KH Nguyễn Thị Thùy Mỵ, Nguyễn Thị Diễm Trinh', NULL);
INSERT INTO `todo` VALUES (503, 6, '2020-05-08 10:21:00', '2020-05-08 00:00:00', 2, 'Đt tư vấn KH vay cô Tư', NULL);
INSERT INTO `todo` VALUES (504, 6, '2020-05-08 15:30:00', '2020-05-08 00:00:00', 2, 'Xem bảng quá hạn đt nhắc nợ KH', NULL);
INSERT INTO `todo` VALUES (505, 52, '2020-05-08 15:30:00', '2020-05-08 00:00:00', 2, 'Trình hs thẻ tín dụng KH A', NULL);
INSERT INTO `todo` VALUES (506, 53, '2020-05-09 20:21:00', '2020-05-09 21:21:00', 2, 'Gặp kh a', NULL);
INSERT INTO `todo` VALUES (507, 53, '2020-05-09 09:00:00', '2020-05-09 22:00:00', 2, 'Gọi dt nhắc phí và mất hiệu lực hđ của khách hàng ', NULL);
INSERT INTO `todo` VALUES (508, 6, '2020-05-11 20:00:00', '2020-05-11 00:00:00', 2, 'Họp huddle ', NULL);
INSERT INTO `todo` VALUES (509, 6, '2020-05-11 14:00:00', '2020-05-11 00:00:00', 2, 'Gọi đt lại cho chị Mỵ tư vấn thêm case bảo hiểm', NULL);
INSERT INTO `todo` VALUES (510, 6, '2020-05-11 23:22:00', '2020-05-11 00:00:00', 2, 'Đt cho KH vay cô Tư để chốt gói BH', NULL);
INSERT INTO `todo` VALUES (511, 6, '2020-05-12 03:23:00', '2020-05-11 00:00:00', 2, 'Lên xem bảng quá hạn đt nhắc nợ ', NULL);
INSERT INTO `todo` VALUES (512, 3, '2020-05-11 08:30:00', '2020-05-11 09:30:00', 2, 'Soạn HS KH Dương Xuân Chuyển, chốt bảo hiểm', NULL);
INSERT INTO `todo` VALUES (513, 3, '2020-05-11 09:30:00', '2020-05-11 10:00:00', 2, 'Gọi chị Thúy tư vấn vay', NULL);
INSERT INTO `todo` VALUES (514, 3, '2020-05-11 10:30:00', '2020-05-11 11:30:00', 2, 'Soạn HS vay của chị Loan, chị Thu, chị linh TTCTXH', NULL);
INSERT INTO `todo` VALUES (515, 3, '2020-05-11 13:30:00', '2020-05-11 14:00:00', 2, 'Gọi nhắc nợ quá hạn', NULL);
INSERT INTO `todo` VALUES (516, 3, '2020-05-11 14:30:00', '2020-05-11 15:30:00', 2, 'Gặp chị Khương tư vấn vay', NULL);
INSERT INTO `todo` VALUES (517, 3, '2020-05-11 15:30:00', '2020-05-11 16:30:00', 2, 'Gặp chị Loan, chị Thu, chị Linh ký HS vay', NULL);
INSERT INTO `todo` VALUES (518, 3, '2020-05-11 16:30:00', '2020-05-11 17:00:00', 2, 'Bàn giao HS cho chị Tuyết', NULL);
INSERT INTO `todo` VALUES (519, 53, '2020-05-11 10:30:00', '2020-05-11 11:15:00', 2, 'Dt hỏi thăm khách hàng bị mất hiệu lực hợp đồng', NULL);
INSERT INTO `todo` VALUES (520, 53, '2020-05-11 09:30:00', '2020-05-11 10:00:00', 2, 'Đánh BMH cho KH của anh Điền', NULL);
INSERT INTO `todo` VALUES (521, 8, '2020-05-11 08:00:00', '2020-05-11 09:00:00', 2, 'Họp Huddle', NULL);
INSERT INTO `todo` VALUES (522, 8, '2020-05-11 09:00:00', '2020-05-11 10:00:00', 1, '- Liên hệ chị Linh Giang bổ sung hồ sơ định giá\r\n- Chuyển định giá KH Thạch Thị Hồng', NULL);
INSERT INTO `todo` VALUES (523, 8, '2020-05-11 11:00:00', '2020-05-11 14:00:00', 1, 'Phát hành thẻ Visa KH Phan Tăng Cui', NULL);
INSERT INTO `todo` VALUES (524, 8, '2020-05-11 14:00:00', '2020-05-11 16:00:00', 1, 'Xử lý hồ sơ KH Thạch Thị Hồng 400M', NULL);
INSERT INTO `todo` VALUES (525, 8, '2020-05-11 16:00:00', '2020-05-11 17:00:00', 1, 'Gặp KH Trần Hoàng Vũ phát hành thẻ visa theo STK', NULL);
INSERT INTO `todo` VALUES (526, 53, '2020-05-11 14:20:00', '2020-05-11 15:00:00', 2, 'Kiểm tra thông tin DSKH của Ngọc Hiểu', NULL);
INSERT INTO `todo` VALUES (527, 53, '2020-05-11 15:15:00', '2020-05-11 16:00:00', 2, 'Tìm hiểu thêm về thông tin sp đầu tư', NULL);
INSERT INTO `todo` VALUES (528, 53, '2020-05-11 16:20:00', '2020-05-11 16:45:00', 2, 'Làm báo cáo refer từ đầu tháng tới bây giờ ', NULL);
INSERT INTO `todo` VALUES (529, 52, '1970-01-01 00:00:00', '1970-01-01 00:00:00', 2, 'Nộp lại hồ sơ thẻ tín dụng Khách hàng Võ Nguyên Hoàng Phuc', NULL);
INSERT INTO `todo` VALUES (530, 52, '2020-05-08 15:30:00', '2020-05-12 00:00:00', 2, 'Nộp lại hồ sơ tín dụng Võ Nguyên Hoàng Phúc', NULL);
INSERT INTO `todo` VALUES (532, 53, '2020-05-12 08:30:00', '2020-05-12 09:30:00', 2, 'Chuẩn bị giấy tờ để ký HĐ BH cho a Điền', NULL);
INSERT INTO `todo` VALUES (533, 3, '2020-05-12 08:00:00', '2020-05-12 08:30:00', 2, 'Gặp KH Đặng Thanh Long ký ủy nhiệm chi', 'accepted');
INSERT INTO `todo` VALUES (534, 3, '2020-05-12 08:30:00', '2020-05-12 09:00:00', 2, 'Bổ sung hs giải ngân KH Đặng Thanh Long', NULL);
INSERT INTO `todo` VALUES (535, 3, '2020-05-13 08:30:00', '2020-05-13 09:30:00', 2, 'Trình hs vay góp lương KH Võ Thị xuân Thu và KH Võ Thị Cẩm Loan', NULL);
INSERT INTO `todo` VALUES (536, 3, '2020-05-13 09:30:00', '2020-05-13 10:30:00', 2, 'Trình hs KH Trần Thị Mỹ Linh và KH Lê Thị Thanh Mai', NULL);
INSERT INTO `todo` VALUES (537, 6, '2020-05-12 08:00:00', '2020-05-12 00:00:00', 2, 'Đi chứng từ Tây Đô giúp chị Oanh', 'accepted');
INSERT INTO `todo` VALUES (540, 6, '2020-05-12 10:28:00', '2020-05-12 00:00:00', 2, 'Làm định giá chỗ cô Trang', NULL);
INSERT INTO `todo` VALUES (541, 6, '2020-05-12 11:10:00', '2020-05-12 00:00:00', 2, 'Soạn sẵn tờ trình cô Trang', NULL);
INSERT INTO `todo` VALUES (542, 53, '2020-05-12 10:30:00', '2020-05-12 11:20:00', 2, 'Đánh BMH cho a Thành', NULL);
INSERT INTO `todo` VALUES (543, 52, '2020-05-12 00:00:00', '2020-05-12 00:00:00', 2, 'Trình lại hồ sơ thẻ tín dụng Võ Nguyên Hoàng Phúc', NULL);
INSERT INTO `todo` VALUES (544, 52, '2020-05-12 00:00:00', '2020-05-12 00:00:00', 2, 'Gặp khách hàng Lê Thị Thảo yêu cầu cung cấp bổ sung hố sơ vay', NULL);
INSERT INTO `todo` VALUES (546, 53, '2020-05-12 14:03:00', '2020-05-12 15:35:00', 2, 'ôn lại kiến thức của sp đầu tư', NULL);
INSERT INTO `todo` VALUES (547, 53, '2020-05-12 15:45:00', '2020-05-12 16:30:00', 2, 'làm HĐ BH cho khách hàng vay của a Điền', NULL);
INSERT INTO `todo` VALUES (548, 6, '2020-05-15 15:11:00', '2020-05-15 00:00:00', 2, 'Trình hồ sơ cô Trang cho anh Nhân ký.', NULL);
INSERT INTO `todo` VALUES (549, 52, '2020-05-13 05:57:00', '2020-05-13 00:00:00', 2, 'Gặp khách Lê Thi Thảo hướng dẫn bổ sung hồ sơ', 'accepted');
INSERT INTO `todo` VALUES (550, 52, '2020-05-13 06:00:00', '2020-05-13 06:00:00', 2, 'Làm báo cáo định hướng hội nhập dành cho cán bộ mới', NULL);
INSERT INTO `todo` VALUES (551, 52, '2020-05-13 00:00:00', '2020-05-13 06:00:00', 2, 'Đi tìm khách hàng đang có nhu cầu sử dụng  dịch vu pvbank', 'accepted');
INSERT INTO `todo` VALUES (552, 6, '2020-05-13 13:30:00', '2020-05-13 00:00:00', 2, 'Đi định giá cô Trang', NULL);
INSERT INTO `todo` VALUES (553, 6, '2020-05-13 10:26:00', '2020-05-13 00:00:00', 2, 'Đt cho a Năm vay góp lương', NULL);
INSERT INTO `todo` VALUES (554, 53, '2020-05-13 08:45:00', '2020-05-13 10:00:00', 2, 'Hỗ trợ tv bh chốt lại phí 15tr của khách hàng cho a Điền', NULL);
INSERT INTO `todo` VALUES (555, 53, '2020-05-13 10:20:00', '2020-05-13 11:30:00', 2, 'Làm hợp đồng bh cho khách hàng của a Điền', NULL);
INSERT INTO `todo` VALUES (556, 3, '2020-05-13 10:30:00', '2020-05-13 11:00:00', 2, 'Gọi anh thiệt tư vấn vay vốn', NULL);
INSERT INTO `todo` VALUES (557, 3, '2020-05-13 13:30:00', '2020-05-13 14:00:00', 2, 'Gọi nhắc nợ quá hạn', NULL);
INSERT INTO `todo` VALUES (558, 53, '2020-05-13 09:45:00', '2020-05-13 11:30:00', 2, 'Tìm hiểu thêm về các nổi bật của các sản phẩm', NULL);
INSERT INTO `todo` VALUES (559, 3, '2020-05-13 15:00:00', '2020-05-13 16:00:00', 2, 'Trình hồ sơ vay KH Dương Xuân Chuyển', NULL);
INSERT INTO `todo` VALUES (560, 3, '2020-05-14 08:30:00', '2020-05-14 09:00:00', 2, 'Gửi định giá hồ sơ vay Nguyễn Ngọc Diện', NULL);
INSERT INTO `todo` VALUES (561, 3, '2020-05-14 09:00:00', '2020-05-14 09:30:00', 2, 'Gửi định giá HS vay KH Đỗ Văn Tiến', NULL);
INSERT INTO `todo` VALUES (562, 3, '2020-05-14 14:30:00', '2020-05-14 15:30:00', 2, 'Trình hồ sơ vay KH Dương Xuân Chuyển', NULL);
INSERT INTO `todo` VALUES (563, 3, '2020-05-14 10:30:00', '2020-05-14 11:30:00', 2, 'Trình 4 HS bên TTCTXH', NULL);
INSERT INTO `todo` VALUES (564, 53, '2020-05-14 10:30:00', '2020-05-14 11:15:00', 2, 'Đi nộp 2 thư bàn giao HĐ BH của anh Điền và anh Hưng', NULL);
INSERT INTO `todo` VALUES (565, 6, '2020-05-14 08:07:00', '2020-05-14 08:05:00', 2, 'Họp huddle', NULL);
INSERT INTO `todo` VALUES (566, 6, '2020-05-14 15:25:00', '2020-05-14 00:00:00', 2, 'Lên xem bảng quá hạn đt nhắc nợ KH', NULL);
INSERT INTO `todo` VALUES (567, 6, '2020-05-14 10:07:00', '2020-05-14 00:00:00', 2, 'Thu thập hồ sơ cô Trang', NULL);
INSERT INTO `todo` VALUES (568, 53, '2020-05-14 14:30:00', '2020-05-14 03:30:00', 2, 'Gọi dt CSKH', NULL);
INSERT INTO `todo` VALUES (569, 3, '2020-05-14 15:30:00', '2020-05-14 16:00:00', 2, 'Soạn HS Nguyễn Ngọc Diện', NULL);
INSERT INTO `todo` VALUES (570, 3, '2020-05-14 16:00:00', '2020-05-14 16:30:00', 2, 'Soạn HS Đỗ Văn Tiến', NULL);
INSERT INTO `todo` VALUES (571, 8, '2020-05-15 08:00:00', '2020-05-15 10:00:00', 2, 'Giao hợp đồng bảo hiểm và mở thẻ tín dụng kh Phan Tăng Cui', NULL);
INSERT INTO `todo` VALUES (572, 8, '2020-05-15 10:00:00', '2020-05-15 13:30:00', 2, 'Định giá kh Thạch Thị Hồng và bổ sung hồ sơ vay vốn', NULL);
INSERT INTO `todo` VALUES (573, 8, '2020-05-15 14:00:00', '2020-05-15 15:00:00', 1, 'Xử lý bàn giao kh Lê Danh Đồng và Phan Tăng Cui', NULL);
INSERT INTO `todo` VALUES (574, 8, '2020-05-15 15:00:00', '2020-05-15 15:30:00', 2, 'Gặp chị Cẩm Hiền về việc  cấp mới Giấy chứng nhận thế chấp', NULL);
INSERT INTO `todo` VALUES (575, 8, '2020-05-15 16:00:00', '2020-05-15 17:00:00', 2, 'Gặp chị Kim thống nhất khoản vay mới', NULL);
INSERT INTO `todo` VALUES (576, 3, '2020-05-15 08:30:00', '2020-05-15 09:20:00', 2, 'Đi định giá HS Đỗ Văn Tiến', 'accepted');
INSERT INTO `todo` VALUES (577, 3, '2020-05-15 09:20:00', '2020-05-15 10:30:00', 2, 'Đi định giá HS Nguyễn Ngọc Diện', NULL);
INSERT INTO `todo` VALUES (578, 3, '2020-05-15 15:00:00', '2020-05-15 16:00:00', 2, 'Trình hồ sơ Nguyễn ngọc diện', NULL);
INSERT INTO `todo` VALUES (579, 3, '2020-05-15 13:30:00', '2020-05-15 14:00:00', 2, 'Gọi nhắc nợ quá hạn', NULL);
INSERT INTO `todo` VALUES (580, 3, '2020-05-15 14:00:00', '2020-05-15 15:00:00', 2, 'Trình hs Đỗ Văn Tiến', NULL);
INSERT INTO `todo` VALUES (581, 53, '2020-05-15 11:00:00', '2020-05-15 09:36:00', 2, 'Gọi điện chăm sóc khách hàng gửi tiền tiết kiệm', NULL);
INSERT INTO `todo` VALUES (582, 6, '2020-05-15 11:12:00', '2020-05-15 00:00:00', 2, 'Đi hoàn thiện xong hs cô Trang', NULL);
INSERT INTO `todo` VALUES (583, 52, '2020-05-15 00:00:00', '2020-05-15 00:00:00', 2, 'Thi online chương trình định hướng hội nhập', NULL);
INSERT INTO `todo` VALUES (584, 52, '2020-05-15 00:00:00', '2020-05-15 00:00:00', 2, 'Liên hê anh hoàng cung cấp hs làm thẻ tín dụng', NULL);
INSERT INTO `todo` VALUES (585, 52, '1970-01-01 00:00:00', '2020-05-15 00:00:00', 2, 'Đôn đốc khách hàng Thảo trích lục hướng ', NULL);
INSERT INTO `todo` VALUES (586, 52, '2020-05-15 00:00:00', '2020-05-15 08:21:00', 2, 'đôn đốc khách hàng thảo trích lục hướng sớm', NULL);
INSERT INTO `todo` VALUES (587, 53, '2020-05-15 01:30:00', '2020-05-15 02:30:00', 2, 'Lại nhà tư vấn bh khách hàng tên Trang của anh Thành', NULL);
INSERT INTO `todo` VALUES (588, 53, '2020-05-15 15:15:00', '2020-05-15 03:55:00', 2, 'Gọi dt hẹn khách hàng ', NULL);
INSERT INTO `todo` VALUES (589, 8, '2020-05-18 09:00:00', '2020-05-18 09:30:00', 2, 'Gửi danh mục hồ sơ cho chị Kim', NULL);
INSERT INTO `todo` VALUES (590, 53, '2020-05-16 09:00:00', '2020-05-16 10:30:00', 2, 'Đi Tư vấn khách hàng cho a Điền ', NULL);
INSERT INTO `todo` VALUES (591, 53, '2020-05-18 08:00:00', '2020-05-18 10:00:00', 2, '1 to 1 với anh Sơn hỗ trợ về sản phẩm và kỹ năng', NULL);
INSERT INTO `todo` VALUES (592, 53, '2020-05-18 10:20:00', '2020-05-18 11:20:00', 2, 'Đánh lại BMH cho Cô Diện khách của anh Điền', NULL);
INSERT INTO `todo` VALUES (593, 53, '2020-05-18 02:30:00', '2020-05-18 03:30:00', 2, 'Gọi dt CSKH ', NULL);
INSERT INTO `todo` VALUES (594, 8, '2020-05-18 08:00:00', '2020-05-18 09:00:00', 2, 'Họp đầu ngày', NULL);
INSERT INTO `todo` VALUES (595, 8, '2020-05-18 09:30:00', '2020-05-18 10:00:00', 2, 'Gửi định giá KH Vương Mỹ Kim', NULL);
INSERT INTO `todo` VALUES (596, 8, '2020-05-18 10:00:00', '2020-05-18 00:00:00', 2, 'Xử lý hồ sơ KH Thạch Thị Hồng', NULL);
INSERT INTO `todo` VALUES (597, 8, '2020-05-18 13:00:00', '2020-05-18 02:00:00', 2, 'Gặp anh Trai bổ sung hồ sơ KH Vương Mỹ Kim, Gặp anh Thành Thịnh bổ sung chữ ký trên HĐ mua bán', NULL);
INSERT INTO `todo` VALUES (598, 8, '2020-05-18 14:00:00', '2020-05-18 14:30:00', 2, 'Gặp chị Linh Giang nhận hồ sơ bổ sung', NULL);
INSERT INTO `todo` VALUES (599, 8, '2020-05-18 14:30:00', '2020-05-18 17:00:00', 2, 'Soạn tờ trình KH Vương Mỹ Kim', NULL);
INSERT INTO `todo` VALUES (600, 6, '2020-05-18 09:24:00', '2020-05-18 00:00:00', 2, 'Up soạn hồ sơ cô Trang', NULL);
INSERT INTO `todo` VALUES (601, 3, '2020-05-18 08:30:00', '2020-05-18 09:30:00', 2, 'Úp soạn hồ sơ Dương xuân chuyển', NULL);
INSERT INTO `todo` VALUES (602, 3, '2020-05-18 09:30:00', '2020-05-18 10:30:00', 2, 'Trình hồ sơ KH nguyễn ngọc diện', NULL);
INSERT INTO `todo` VALUES (603, 3, '2020-05-18 10:30:00', '2020-05-18 11:00:00', 2, 'Gọi nhắc nợ quá hạn', NULL);
INSERT INTO `todo` VALUES (604, 3, '2020-05-18 13:30:00', '2020-05-18 14:00:00', 2, 'Gọi anh thiệt nhiệt điện tư vấn vay', NULL);
INSERT INTO `todo` VALUES (606, 3, '2020-05-18 14:30:00', '2020-05-18 15:00:00', 2, 'Làm giấy đi đường KH Đỗ Thanh Nhàn', NULL);
INSERT INTO `todo` VALUES (607, 6, '2020-05-18 13:56:00', '2020-05-18 00:00:00', 2, 'Thu nợ trước hạn Trần Văn Năm', NULL);
INSERT INTO `todo` VALUES (608, 52, '2020-05-18 00:00:00', '2020-05-18 00:00:00', 2, 'Họp đầu ngày', NULL);
INSERT INTO `todo` VALUES (609, 52, '2020-05-18 00:00:00', '2020-05-18 00:00:00', 2, 'Làm hồ sơ thẻ tín dụng Lê Hoàng', NULL);
INSERT INTO `todo` VALUES (610, 52, '2020-05-18 00:00:00', '2020-05-18 00:00:00', 2, 'Hỗ trơ các bạn cùng phòng gửi hồ sơ định giá', NULL);
INSERT INTO `todo` VALUES (611, 3, '2020-05-19 08:30:00', '2020-05-19 09:30:00', 2, 'Soạn hồ sơ giải ngân hạn mức KH Trần Ngọc Thúy', NULL);
INSERT INTO `todo` VALUES (612, 3, '2020-05-19 09:30:00', '2020-05-19 10:00:00', 2, 'Làm giấy đi đường KH Nguyễn Văn Chí Linh', NULL);
INSERT INTO `todo` VALUES (613, 3, '2020-05-19 10:00:00', '2020-05-19 11:00:00', 2, 'Trình HS KH Nguyễn Ngọc Diện', NULL);
INSERT INTO `todo` VALUES (614, 3, '2020-05-19 13:30:00', '2020-05-19 14:00:00', 2, 'Giải chấp HS Dương Xuân Chuyển', NULL);
INSERT INTO `todo` VALUES (615, 3, '2020-05-19 16:00:00', '2020-05-19 17:00:00', 2, 'Trình HS Đỗ Văn Tiến', NULL);
INSERT INTO `todo` VALUES (616, 53, '2020-05-19 09:30:00', '2020-05-19 10:30:00', 2, 'Gọi dt cskh ', NULL);
INSERT INTO `todo` VALUES (617, 6, '2020-05-19 14:16:00', '2020-05-19 00:00:00', 2, 'Đi công chứng hs cô Trang', NULL);
INSERT INTO `todo` VALUES (618, 6, '2020-05-19 15:17:00', '2020-05-19 00:00:00', 2, 'Mở gói tài khoản KH Đoàn Văn Trung', NULL);
INSERT INTO `todo` VALUES (619, 6, '2020-05-19 15:24:00', '2020-05-19 00:00:00', 2, 'Mở gói tk  Lê Ngọc Loan', NULL);
INSERT INTO `todo` VALUES (620, 53, '2020-05-19 10:45:00', '2020-05-19 11:20:00', 2, 'soạn hồ sơ chuẩn bị cho cô Trang ký hđ', NULL);
INSERT INTO `todo` VALUES (621, 53, '2020-05-19 03:00:00', '2020-05-19 04:00:00', 2, 'Gặp cô Trang ký hđ', NULL);
INSERT INTO `todo` VALUES (622, 3, '2020-05-20 08:00:00', '2020-05-20 08:30:00', 2, 'Ghé CN Cần Thơ trình 2 HS góp lương TTCTXH', 'accepted');
INSERT INTO `todo` VALUES (623, 3, '2020-05-20 08:30:00', '2020-05-20 09:00:00', 2, 'Gặp KH Đỗ Văn Tiến nhận HS bổ sung và tư vấn bảo hiểm', NULL);
INSERT INTO `todo` VALUES (624, 3, '2020-05-20 10:00:00', '2020-05-20 11:00:00', 2, 'Trình HS Nguyễn Ngọc Diện và úp soạn HS', NULL);
INSERT INTO `todo` VALUES (625, 3, '2020-05-20 09:30:00', '2020-05-20 10:00:00', 2, 'Giải chấp HS Dương Xuân Chuyển', NULL);
INSERT INTO `todo` VALUES (626, 3, '2020-05-20 13:30:00', '2020-05-20 14:00:00', 2, 'Gọi nhắc nợ quá hạn', NULL);
INSERT INTO `todo` VALUES (628, 52, '2020-05-20 07:50:00', '2020-05-20 00:00:00', 2, 'Gặp khách ở ngoài lấy tiền huy động', 'accepted');
INSERT INTO `todo` VALUES (629, 52, '2020-05-20 00:00:00', '2020-05-20 00:00:00', 2, 'Gặp cô thảo ký giấy đề nghị định giá và thu thập hồ sơ', NULL);
INSERT INTO `todo` VALUES (630, 52, '2020-05-20 00:00:00', '2020-05-20 00:00:00', 2, 'Gởi hồ sơ định giá KH Thảo', NULL);
INSERT INTO `todo` VALUES (631, 52, '2020-05-20 00:00:00', '2020-05-20 00:00:00', 2, 'Úp hồ sơ thẻ Lê Hoàng', NULL);
INSERT INTO `todo` VALUES (632, 53, '2020-05-20 09:30:00', '2020-05-20 11:00:00', 2, 'Gọi dt cskh ', NULL);
INSERT INTO `todo` VALUES (634, 53, '2020-05-20 14:00:00', '2020-05-20 15:00:00', 2, 'Gọi dt cskh', NULL);
INSERT INTO `todo` VALUES (635, 53, '2020-05-20 15:45:00', '2020-05-20 16:15:00', 2, 'Đánh BMH cho khách của a Thành', NULL);
INSERT INTO `todo` VALUES (636, 6, '2020-05-20 13:00:00', '2020-05-20 00:00:00', 2, 'Thu thập hs giải ngân cô Trang', NULL);
INSERT INTO `todo` VALUES (637, 6, '2020-05-20 13:20:00', '2020-05-20 00:00:00', 2, 'Đt chỗ a Hoàng chốt vay', NULL);
INSERT INTO `todo` VALUES (638, 8, '2020-05-20 08:30:00', '2020-05-20 10:00:00', 2, 'Định giá KH Võ Thị Phương', NULL);
INSERT INTO `todo` VALUES (639, 3, '2020-05-21 08:30:00', '2020-05-21 09:30:00', 2, 'Trình hs góp lương KH Huỳnh Tuấn Kiệt', NULL);
INSERT INTO `todo` VALUES (640, 3, '2020-05-21 09:30:00', '2020-05-21 10:00:00', 2, 'Gọi KH Nguyễn Văn Thanh từ vấn vay', NULL);
INSERT INTO `todo` VALUES (641, 3, '2020-05-21 10:00:00', '2020-05-21 10:30:00', 2, 'Gọi anh Thiệt từ vấn vay', NULL);
INSERT INTO `todo` VALUES (642, 3, '2020-05-21 14:00:00', '2020-05-21 14:30:00', 2, 'Gọi nhắc nợ quá hạn', NULL);
INSERT INTO `todo` VALUES (643, 53, '2020-05-21 09:30:00', '2020-05-21 11:00:00', 2, 'Gọi dt cskh', NULL);
INSERT INTO `todo` VALUES (644, 53, '2020-05-21 08:30:00', '2020-05-21 09:15:00', 2, 'Soạn lại BMH cho khách A Thành ', NULL);
INSERT INTO `todo` VALUES (645, 53, '2020-05-21 01:30:00', '2020-05-21 03:00:00', 2, 'Soạn giấy tờ để ký hđ bh cho a Thành khách hàng tên Phúc', NULL);
INSERT INTO `todo` VALUES (646, 53, '2020-05-21 03:15:00', '2020-05-21 04:20:00', 2, 'Đi nộp hồ sơ cho a Thành', NULL);
INSERT INTO `todo` VALUES (647, 53, '2020-05-21 04:40:00', '2020-05-21 05:30:00', 2, 'Báo cáo áp phí cho hđ bh ', NULL);
INSERT INTO `todo` VALUES (648, 6, '2020-05-21 10:00:00', '2020-05-21 00:00:00', 2, 'Đẩy hs định giá Muội', NULL);
INSERT INTO `todo` VALUES (649, 6, '2020-05-21 13:11:00', '2020-05-21 00:00:00', 2, 'Đt KH Trần Mỹ Duyên làm bảo hiểm xe', NULL);
INSERT INTO `todo` VALUES (650, 6, '2020-05-21 14:01:00', '2020-05-21 00:00:00', 2, 'Đt KH Lê Đại Lợi làm lại BH xe', NULL);
INSERT INTO `todo` VALUES (651, 6, '2020-05-21 15:01:00', '2020-05-21 00:00:00', 2, 'Đt tư vấn BH KH Phạm Thị Kiều My', NULL);
INSERT INTO `todo` VALUES (652, 52, '2020-05-21 00:00:00', '2020-05-21 00:00:00', 2, 'Ra ngoài gặp khách thu thập hồ sơ làm thẻ tín dụng', NULL);
INSERT INTO `todo` VALUES (653, 53, '2020-05-21 11:15:00', '2020-05-21 11:30:00', 2, 'Đánh BMH cho khách tên Nguyễn Thị Phúc cho chị Hằng phí 15tr và 20tr ', NULL);
INSERT INTO `todo` VALUES (654, 52, '2020-05-22 00:00:00', '2020-05-22 00:00:00', 2, 'Ra ngoài gặp khách hàng tư vấn làm thẻ tín dung', 'accepted');
INSERT INTO `todo` VALUES (655, 52, '2020-05-22 00:00:00', '2020-05-22 00:00:00', 2, 'Thẩm định tài sản Lê Thị Thảo', NULL);
INSERT INTO `todo` VALUES (656, 52, '2020-05-22 00:00:00', '2020-05-22 00:00:00', 2, 'Họp đầu ngày', NULL);
INSERT INTO `todo` VALUES (657, 52, '2020-05-22 00:00:00', '2020-05-22 00:00:00', 2, 'Xử lý HS Lê Thị Thảo', NULL);
INSERT INTO `todo` VALUES (658, 53, '2020-05-22 08:45:00', '2020-05-22 09:30:00', 2, 'Đánh BMH khách vãng lai tên Nguyễn Văn Dự', NULL);
INSERT INTO `todo` VALUES (659, 53, '2020-05-22 09:50:00', '2020-05-22 11:00:00', 2, 'Gọi dt cskh', NULL);
INSERT INTO `todo` VALUES (660, 53, '2020-05-22 01:40:00', '2020-05-22 02:30:00', 2, 'Bám sát các KH vay của phòng KHCN ', NULL);
INSERT INTO `todo` VALUES (661, 53, '2020-05-22 03:02:00', '2020-05-22 04:03:00', 2, 'Đánh BMH cho khách hàng của Chị Nga', NULL);
INSERT INTO `todo` VALUES (662, 3, '2020-05-22 13:30:00', '2020-05-22 14:00:00', 2, 'Tất toán HS Lê Hoàng Nam', NULL);
INSERT INTO `todo` VALUES (663, 3, '2020-05-22 15:00:00', '2020-05-22 16:00:00', 2, 'Thu nợ trước hạn 300tr KH Huỳnh Thứ Phát', NULL);
INSERT INTO `todo` VALUES (664, 3, '2020-05-22 16:00:00', '2020-05-22 17:00:00', 2, 'Trình HS Đỗ Văn Tiến', NULL);
INSERT INTO `todo` VALUES (665, 3, '2020-05-22 14:30:00', '2020-05-22 15:00:00', 2, 'Gọi nhắc nợ quá hạn', NULL);
INSERT INTO `todo` VALUES (666, 6, '2020-05-22 09:00:00', '2020-05-22 00:00:00', 2, 'Họp ở lầu 7', NULL);
INSERT INTO `todo` VALUES (667, 8, '2020-05-22 08:00:00', '2020-05-22 00:00:00', 1, 'Đào tạo tại vùng 6', NULL);
INSERT INTO `todo` VALUES (668, 6, '2020-05-22 11:28:00', '2020-05-22 00:00:00', 2, 'Đi định giá KH Nguyễn Thị Muội', NULL);
INSERT INTO `todo` VALUES (669, 8, '2020-05-22 13:00:00', '2020-05-22 14:00:00', 1, 'Gặp chị Nga bs hồ sơ vay vốn', NULL);
INSERT INTO `todo` VALUES (670, 6, '2020-05-22 15:28:00', '2020-05-22 00:00:00', 2, 'Đt KH Huỳnh Diệu Phúc chốt BH', NULL);
INSERT INTO `todo` VALUES (671, 3, '2020-05-25 09:00:00', '2020-05-25 09:40:00', 2, 'Soạn hồ sơ giải ngân KH Dương Xuân Chuyển và Nguyễn Ngọc Diện', NULL);
INSERT INTO `todo` VALUES (672, 3, '2020-05-25 14:00:00', '2020-05-25 15:00:00', 2, 'Gặp KH Huỳnh Thứ Phát ở cần thơ ký thu nợ trước hạn và HS giải ngân', NULL);
INSERT INTO `todo` VALUES (673, 3, '2020-05-25 13:30:00', '2020-05-25 14:00:00', 2, 'Gọi nhắc nợ quá hạn', NULL);
INSERT INTO `todo` VALUES (674, 3, '2020-05-25 15:00:00', '2020-05-25 16:00:00', 2, 'Trình HS Đỗ Văn tiến', NULL);
INSERT INTO `todo` VALUES (675, 3, '2020-05-25 16:00:00', '2020-05-25 17:00:00', 2, 'Soạn hs giải ngân 3 KH bên TTCTXH', NULL);
INSERT INTO `todo` VALUES (676, 6, '2020-05-25 13:07:00', '2020-05-25 00:00:00', 2, 'Giải ngân hs Nguyễn Thị Thu Trang', NULL);
INSERT INTO `todo` VALUES (677, 6, '2020-05-25 08:08:00', '2020-05-25 00:00:00', 2, 'Họp hudle', NULL);
INSERT INTO `todo` VALUES (678, 6, '2020-05-25 10:19:00', '2020-05-25 00:00:00', 2, 'Định giá Nguyễn Thị Muội', NULL);
INSERT INTO `todo` VALUES (679, 53, '2020-05-25 14:30:00', '2020-05-25 15:45:00', 2, 'gọi dt cskh', NULL);
INSERT INTO `todo` VALUES (680, 3, '2020-05-26 08:00:00', '2020-05-26 08:30:00', 2, 'Gặp KH Huỳnh Thứ Phát ký HS giải ngân hạn mức', 'accepted');
INSERT INTO `todo` VALUES (681, 3, '2020-05-26 08:30:00', '2020-05-26 21:00:00', 2, 'Gặp 3 KH bên TTCTXH ký chứng từ giải ngân', NULL);
INSERT INTO `todo` VALUES (682, 3, '2020-05-26 09:00:00', '2020-05-26 10:00:00', 2, 'Giải ngân hồ sơ góp lương KH Võ Thị Xuân Thu', NULL);
INSERT INTO `todo` VALUES (683, 3, '2020-05-26 10:00:00', '2020-05-26 11:00:00', 2, 'Giải ngân hồ sơ góp lương KH Võ Thị Cẩm Loan', NULL);
INSERT INTO `todo` VALUES (684, 53, '2020-05-26 09:30:00', '2020-05-26 10:15:00', 2, 'Soạn lại BMH để ký hđ cho a Thành 15tr', NULL);
INSERT INTO `todo` VALUES (685, 53, '2020-05-26 10:30:00', '2020-05-26 11:15:00', 2, 'Làm hồ sơ hđ bh 15tr của Thành', NULL);
INSERT INTO `todo` VALUES (686, 53, '2020-05-26 01:30:00', '2020-05-26 02:15:00', 2, 'Đi nộp hồ sơ hđ bh ở vp pru mậu thân', NULL);
INSERT INTO `todo` VALUES (687, 53, '2020-05-26 04:00:00', '2020-05-26 05:30:00', 2, 'Đi tv KH cho a Thành ', NULL);
INSERT INTO `todo` VALUES (688, 6, '2020-05-26 15:00:00', '2020-05-26 16:00:00', 2, 'Lên case bảo biểm 15tr', NULL);
INSERT INTO `todo` VALUES (689, 52, '2020-05-26 00:00:00', '2020-05-26 00:00:00', 2, 'Ra ngoài gặp khách hàng thu thập bổ sung hồ sơ Lê Thị Thảo', NULL);
INSERT INTO `todo` VALUES (690, 52, '2020-05-26 00:00:00', '2020-05-26 00:00:00', 2, 'Gặp khách hàng có nhu cầu làm thẻ tín dụng', NULL);
INSERT INTO `todo` VALUES (691, 52, '2020-05-26 00:00:00', '2020-05-26 00:00:00', 2, 'Làm tờ trình hoàn thiện hồ sơ Lê Thị Thảo', NULL);
INSERT INTO `todo` VALUES (692, 6, '2020-05-26 10:51:00', '2020-05-26 00:00:00', 2, 'Mở gói TK KH Huỳnh Diệu Phúc', NULL);
INSERT INTO `todo` VALUES (693, 3, '2020-05-26 13:30:00', '2020-05-26 14:00:00', 2, 'Gọi nhắc nợ quá hạn', NULL);
INSERT INTO `todo` VALUES (694, 3, '2020-05-26 14:00:00', '2020-05-26 15:00:00', 2, 'Giải ngân HS vay hạn mức KH Huỳnh Thứ Phát', NULL);
INSERT INTO `todo` VALUES (695, 6, '2020-05-26 14:34:00', '2020-05-26 00:00:00', 2, 'Trình ký hs thẻ TD KH Nguyễn Thị Thu Trang', NULL);
INSERT INTO `todo` VALUES (696, 3, '2020-05-27 08:30:00', '2020-05-26 09:00:00', 2, 'Trình hồ sơ KH Đỗ Văn Tiến', NULL);
INSERT INTO `todo` VALUES (697, 3, '2020-05-27 09:00:00', '2020-05-27 09:30:00', 2, 'Giải ngân hs góp lương KH Huỳnh Tuấn Kiệt', NULL);
INSERT INTO `todo` VALUES (698, 3, '2020-05-27 09:30:00', '2020-05-27 10:00:00', 2, 'Xác nhận giấy đất thế chấp KH Trầm Thế Vinh', NULL);
INSERT INTO `todo` VALUES (699, 3, '2020-05-27 10:00:00', '2020-05-26 10:30:00', 2, 'Giải ngân HS hạn mức Huỳnh Thứ Phát', NULL);
INSERT INTO `todo` VALUES (701, 3, '2020-05-27 15:00:00', '2020-05-27 16:00:00', 2, 'Gặp chị Diện ký hợp đồng bảo hiểm và nộp phí', NULL);
INSERT INTO `todo` VALUES (702, 52, '2020-05-27 07:52:00', '1970-01-01 00:00:00', 2, 'Khách hẹn gặp có nhu cầu vay', NULL);
INSERT INTO `todo` VALUES (703, 52, '1970-01-01 00:00:00', '2020-05-27 00:00:00', 2, 'Xử lý hồ sơ Lê Thị Thảo', NULL);
INSERT INTO `todo` VALUES (704, 52, '2020-05-27 00:00:00', '2020-05-27 00:00:00', 2, 'Thu thập thông tin khách hàng làm thẻ tín dụng', NULL);
INSERT INTO `todo` VALUES (705, 53, '2020-05-27 08:20:00', '2020-05-27 09:35:00', 2, 'Lấy bộ hđ bàn giao cho khách Nguyễn Thị Thu Trang của a Thành ', NULL);
INSERT INTO `todo` VALUES (706, 53, '2020-05-27 10:15:00', '2020-05-27 11:35:00', 2, 'Xử lý bổ sung giấy tờ hđ LÂM QUANG VINH mới ký hôm qua ', NULL);
INSERT INTO `todo` VALUES (707, 53, '2020-05-27 02:30:00', '2020-05-27 03:45:00', 2, 'Gọi dt cskh', NULL);
INSERT INTO `todo` VALUES (708, 6, '2020-05-27 10:08:00', '2020-05-27 00:00:00', 2, 'Soạn HS Trần Văn Năm', NULL);
INSERT INTO `todo` VALUES (709, 6, '2020-05-27 11:08:00', '2020-05-27 00:00:00', 2, 'Đt tư vấn lãi suất gửi tiết kiệm Dương Kim Lến', NULL);
INSERT INTO `todo` VALUES (710, 6, '2020-05-27 13:09:00', '2020-05-27 00:00:00', 2, 'Đt hẹn Phạm Thị Kiều My tư vấn case BH 15tr', NULL);
INSERT INTO `todo` VALUES (711, 53, '2020-05-27 03:50:00', '2020-05-27 04:30:00', 2, 'Chuẩn bị hồ sơ để ký hđ bh của cô Diện khách a Điền', NULL);
INSERT INTO `todo` VALUES (712, 53, '2020-05-27 17:00:00', '2020-05-27 18:45:00', 2, 'Đi gặp Cô Diện KH của a Điền', NULL);
INSERT INTO `todo` VALUES (713, 53, '2020-05-28 08:15:00', '2020-05-27 21:00:00', 2, 'Điều chỉnh bổ sung hồ sơ cho khách a Thành', NULL);
INSERT INTO `todo` VALUES (714, 53, '2020-05-28 01:00:00', '2020-05-28 03:45:00', 2, 'Đi gặp bên bảo hiểm xe với a Nhân ', NULL);
INSERT INTO `todo` VALUES (715, 53, '2020-05-28 09:45:00', '2020-05-28 10:30:00', 2, 'Đi nộp thư bàn giao hđ cho khách a Thành, vì hôm qua nộp hệ thống chưa lên nên k nộp được', NULL);
INSERT INTO `todo` VALUES (716, 3, '2020-05-28 08:30:00', '2020-05-28 09:30:00', 2, 'Gặp cô ở phong điền tư vấn vay', 'accepted');
INSERT INTO `todo` VALUES (717, 3, '2020-05-28 10:00:00', '2020-05-28 10:30:00', 2, 'Gọi ĐT cho a thiệt tư vấn vay', NULL);
INSERT INTO `todo` VALUES (718, 6, '2020-05-28 16:13:00', '2020-05-28 00:00:00', 2, 'Trình ký hs Trần Văn Năm', NULL);
INSERT INTO `todo` VALUES (719, 6, '2020-05-28 11:13:00', '2020-05-28 00:00:00', 2, 'Đt cho KH Nguyễn Văn Toàn hẹn tv BH', NULL);
INSERT INTO `todo` VALUES (720, 3, '2020-05-28 11:00:00', '2020-05-28 11:30:00', 2, 'Gọi ĐT nhắc nợ quá hạn', NULL);
INSERT INTO `todo` VALUES (721, 3, '2020-05-28 13:30:00', '2020-05-28 14:30:00', 2, 'Làm bàn giao các HS đã giải ngân', NULL);
INSERT INTO `todo` VALUES (722, 52, '2020-05-28 00:00:00', '2020-05-28 00:00:00', 2, 'Xử lý hồ sơ khách Nguyễn Thanh Trúc', NULL);
INSERT INTO `todo` VALUES (723, 52, '2020-05-28 00:00:00', '2020-05-28 00:00:00', 2, 'Hẹn gặp khách hàng có nhu cầu vay 300 triêu', NULL);
INSERT INTO `todo` VALUES (724, 52, '2020-05-28 00:00:00', '2020-05-28 00:00:00', 2, 'Ra ngoài tìm khách hàng mới', NULL);
INSERT INTO `todo` VALUES (725, 6, '2020-05-28 13:28:00', '2020-05-28 00:00:00', 2, 'Mở gói TK KH Lâm Quang Vinh', NULL);
INSERT INTO `todo` VALUES (726, 6, '2020-05-29 10:22:00', '2020-05-29 00:00:00', 2, 'Up trình hs Trần Văn Năm', NULL);
INSERT INTO `todo` VALUES (727, 6, '2020-05-29 15:22:00', '2020-05-29 00:00:00', 2, 'Đt nhắc nợ quá hạn', NULL);
INSERT INTO `todo` VALUES (728, 6, '2020-05-29 13:23:00', '2020-05-29 00:00:00', 2, 'Hẹn kh Toàn ra tư vấn thêm về BH', NULL);
INSERT INTO `todo` VALUES (729, 52, '2020-05-29 00:00:00', '2020-05-29 00:00:00', 2, 'Gặp khách chào giá máy post', 'accepted');
INSERT INTO `todo` VALUES (730, 52, '2020-05-29 00:00:00', '2020-05-29 00:00:00', 2, 'Tìm kiếm khách hàng', NULL);
INSERT INTO `todo` VALUES (731, 3, '2020-05-29 08:30:00', '2020-05-29 09:00:00', 2, 'Soạn hồ sơ giải ngân HS vay KH Nguyễn Ngọc Diện', NULL);
INSERT INTO `todo` VALUES (732, 3, '2020-05-29 10:00:00', '2020-05-29 11:00:00', 2, 'Đi công chứng HS KH Nguyễn Ngọc Diện', NULL);
INSERT INTO `todo` VALUES (733, 53, '2020-05-29 02:15:00', '2020-05-29 03:30:00', 2, 'Đi gặp khách với chị Nga ', NULL);
INSERT INTO `todo` VALUES (734, 3, '2020-05-29 13:30:00', '2020-05-29 14:00:00', 2, 'Soạn HS giải ngân KH Dương Xuân Chuyển', NULL);
INSERT INTO `todo` VALUES (735, 3, '2020-05-29 14:00:00', '2020-05-29 14:30:00', 2, 'Gọi ĐT nhắc nợ quá hạn', NULL);
INSERT INTO `todo` VALUES (736, 53, '2020-05-29 09:30:00', '2020-05-29 11:00:00', 2, 'Đi ký hđ bh cô Diện khách của a Điền', NULL);
INSERT INTO `todo` VALUES (737, 53, '2020-05-29 01:25:00', '2020-05-29 01:50:00', 2, 'nộp giấy thư xác nhận ký hđ cho vp pru ở mậu thân', NULL);
INSERT INTO `todo` VALUES (738, 53, '2020-05-29 03:50:00', '2020-05-29 04:36:00', 2, 'làm báo cáo áp phí hđ của a Điền', NULL);
INSERT INTO `todo` VALUES (739, 53, '2020-05-29 08:30:00', '2020-05-29 09:15:00', 2, 'đánh BMH cho khách của chị Nga', NULL);
INSERT INTO `todo` VALUES (740, 53, '2020-05-30 08:00:00', '2020-05-30 08:40:00', 2, 'Nộp thư xác nhận điện tử của hđ a Hưng', NULL);
INSERT INTO `todo` VALUES (741, 53, '2020-05-30 08:45:00', '2020-05-30 09:30:00', 2, 'Điều chỉnh lại BMH cho chị Nga', NULL);
INSERT INTO `todo` VALUES (742, 53, '2020-06-01 08:30:00', '2020-06-01 09:00:00', 2, 'In Giấy CN Bảo hiểm cho KH', NULL);
INSERT INTO `todo` VALUES (743, 3, '2020-06-01 08:30:00', '2020-06-01 09:00:00', 2, 'Bổ sung hồ sơ soạn KH Đỗ Văn Tiến', NULL);
INSERT INTO `todo` VALUES (744, 3, '2020-06-01 09:00:00', '2020-06-01 10:00:00', 2, 'Giải ngân HS Nguyễn Ngọc Diện', NULL);
INSERT INTO `todo` VALUES (745, 3, '2020-06-01 10:00:00', '2020-06-01 10:30:00', 2, 'Gọi ĐT KH Trần Thị Ngọc tư vấn vay', NULL);
INSERT INTO `todo` VALUES (746, 3, '2020-06-01 10:30:00', '2020-06-01 11:00:00', 2, 'Gọi lại KH thiệt tư vấn vay', NULL);
INSERT INTO `todo` VALUES (747, 3, '2020-06-01 13:15:00', '2020-06-01 14:15:00', 2, 'Đi công chứng HS Đỗ Văn Tiến', NULL);
INSERT INTO `todo` VALUES (748, 3, '2020-06-01 14:30:00', '2020-06-01 15:00:00', 2, 'Gọi ĐT nhắc nợ quá hạn', NULL);
INSERT INTO `todo` VALUES (749, 52, '2020-06-01 07:47:00', '2020-06-01 00:00:00', 2, 'Họp đầu tuần', NULL);
INSERT INTO `todo` VALUES (750, 52, '2020-06-01 00:00:00', '2020-06-01 00:00:00', 2, 'Thu thập hồ sơ làm thẻ tín dụng Võ Anh Khoa', NULL);
INSERT INTO `todo` VALUES (751, 52, '2020-06-01 00:00:00', '2020-06-01 00:00:00', 2, 'Ra ngoài tìm khách hàng mới', NULL);
INSERT INTO `todo` VALUES (752, 53, '2020-06-01 10:09:00', '2020-06-01 10:45:00', 2, 'Họp với a Nhân bàn về chương trình tặng nón BH và áo mưa ', NULL);
INSERT INTO `todo` VALUES (753, 53, '2020-06-01 01:30:00', '2020-06-01 02:15:00', 2, 'Nộp thư xác nhận điện tử cho khách a Thành', NULL);
INSERT INTO `todo` VALUES (755, 65, '2020-06-01 09:00:00', '2020-06-01 09:30:00', 1, '- Nộp phí định giá Nguyễn Thị Thanh Loan', NULL);
INSERT INTO `todo` VALUES (756, 65, '2020-06-01 09:30:00', '2020-06-01 11:30:00', 1, '- Thẻ tín dụng Nguyễn Thị Thùy Trang', NULL);
INSERT INTO `todo` VALUES (757, 53, '2020-06-01 08:35:00', '2020-06-01 10:30:00', 2, 'Tập cách in làm bh xe ', NULL);
INSERT INTO `todo` VALUES (760, 53, '2020-06-01 03:00:00', '2020-06-01 04:30:00', 2, 'Làm bh xe cho khách ', NULL);
INSERT INTO `todo` VALUES (762, 63, '2020-06-01 09:00:00', '2020-06-01 09:30:00', 1, 'Nhắc nợ ngày 01/06/2020', NULL);
INSERT INTO `todo` VALUES (763, 63, '2020-06-01 09:30:00', '2020-06-01 00:00:00', 1, 'làm hồ sơ kh Lại Quyết Chiến', NULL);
INSERT INTO `todo` VALUES (764, 63, '2020-06-01 00:00:00', '2020-06-01 00:00:00', 1, 'đi thẩm định kh Giang Ngọc Thúy.KH hẹn lại thứ 2 thẩm định', NULL);
INSERT INTO `todo` VALUES (765, 67, '2020-06-01 08:55:00', '2020-06-01 11:55:00', 1, 'Bàn giao hồ sơ', NULL);
INSERT INTO `todo` VALUES (766, 67, '1970-01-01 00:00:00', '1970-01-01 00:00:00', 1, 'Liên hệ khách hàng nhận bổ sung HS, trình HS', NULL);
INSERT INTO `todo` VALUES (767, 71, '2020-06-01 09:13:00', '2020-06-01 11:00:00', 1, 'Điện thoại tư vấn khách hàng tiềm năng', NULL);
INSERT INTO `todo` VALUES (768, 6, '2020-06-01 08:28:00', '2020-06-01 00:00:00', 2, 'Họp hudle', NULL);
INSERT INTO `todo` VALUES (769, 6, '2020-06-01 13:28:00', '2020-06-01 00:00:00', 2, 'Đi gặp KH vay a Hòa', NULL);
INSERT INTO `todo` VALUES (771, 68, '2020-06-01 08:00:00', '2020-06-01 08:30:00', 1, '-	Đọc mail đầu ngày', NULL);
INSERT INTO `todo` VALUES (772, 68, '2020-06-01 08:00:00', '2020-06-01 09:30:00', 1, '-	Điện thoại cho khách hàng Trần Thúy Kiều bổ sung hình chụp sổ hộ khẩu (KH đang có nhu cầu vay mua xe kinh doanh)', NULL);
INSERT INTO `todo` VALUES (773, 68, '2020-06-01 10:00:00', '2020-06-01 00:00:00', 1, '-	Gọi điện thoại tiếp thị khách hàng theo danh sách data tự thu thập được (tối thiểu là 5 KH)', NULL);
INSERT INTO `todo` VALUES (774, 68, '2020-06-01 10:00:00', '2020-06-01 10:30:00', 1, '-	Trao đổi, tương tác với sale xe bên Trường Xuân về khách hàng mới của bên sale xe', NULL);
INSERT INTO `todo` VALUES (775, 68, '2020-06-01 13:00:00', '2020-06-01 14:30:00', 1, '-	Làm bàn giao hồ sơ', NULL);
INSERT INTO `todo` VALUES (776, 64, '0202-01-06 00:00:00', '2020-01-06 00:00:00', 1, 'định giá hs Đỗ Huỳnh Anh', NULL);
INSERT INTO `todo` VALUES (777, 64, '0202-01-06 00:00:00', '2020-01-06 00:00:00', 1, 'Nhận quà 1/06 cho cbnv', NULL);
INSERT INTO `todo` VALUES (778, 53, '2020-06-02 08:00:00', '2020-06-02 21:45:00', 2, 'Họp với A Sơn', NULL);
INSERT INTO `todo` VALUES (779, 52, '2020-06-02 00:00:00', '2020-06-02 00:00:00', 2, 'Đi định giá nhà khách hàng Bảo Trân', NULL);
INSERT INTO `todo` VALUES (780, 52, '2020-06-02 07:38:00', '2020-06-02 00:00:00', 2, 'Hẹn gặp khách hàng có nhu cầu gởi tiền ', NULL);
INSERT INTO `todo` VALUES (781, 52, '2020-06-02 07:39:00', '2020-06-02 00:00:00', 2, 'Xử lý hồ sơ Bảo Trân', NULL);
INSERT INTO `todo` VALUES (782, 68, '1970-01-01 00:00:00', '1970-01-01 00:00:00', 1, 'Họp định hướng phát triển cho vay tín chấp có liên kết', NULL);
INSERT INTO `todo` VALUES (783, 64, '2020-02-06 00:00:00', '2020-02-06 00:00:00', 1, 'hoàn thành kế hoạch làm việc 06/202-11/2020', NULL);
INSERT INTO `todo` VALUES (784, 64, '2020-02-06 00:00:00', '2020-02-06 00:00:00', 1, 'up định giá hs phạm thị ngọc châu', NULL);
INSERT INTO `todo` VALUES (785, 64, '0202-02-06 00:00:00', '2020-02-06 00:00:00', 1, 'nhắc nợ khách hàng nguyễn anh thư, lê văn truyền', NULL);
INSERT INTO `todo` VALUES (786, 3, '2020-06-02 08:30:00', '2020-06-02 09:00:00', 2, 'Bổ sung HS giải ngân KH Nguyễn Ngọc Diện', NULL);
INSERT INTO `todo` VALUES (787, 3, '2020-06-02 09:00:00', '2020-06-02 10:00:00', 2, 'Giải ngân HS KH Đỗ Văn Tiến', NULL);
INSERT INTO `todo` VALUES (788, 3, '2020-06-02 10:00:00', '2020-06-02 10:30:00', 2, 'Làm giấy đi đường KH Trần Văn Trung', NULL);
INSERT INTO `todo` VALUES (789, 3, '2020-06-02 13:30:00', '2020-06-02 14:00:00', 2, 'Gọi ĐT nhắc nợ quá hạn', NULL);
INSERT INTO `todo` VALUES (790, 3, '2020-06-02 14:00:00', '2020-06-02 15:00:00', 2, 'Làm bàn giao HS quá hạn cho bên xử lý nợ', NULL);
INSERT INTO `todo` VALUES (791, 53, '2020-06-02 10:00:00', '2020-06-02 11:30:00', 2, 'Gọi dt nhắc phí khách hàng ', NULL);
INSERT INTO `todo` VALUES (792, 53, '2020-06-02 01:30:00', '2020-06-02 02:30:00', 2, 'Làm bh xe khách 2case', NULL);
INSERT INTO `todo` VALUES (793, 53, '2020-06-02 03:00:00', '2020-06-02 04:00:00', 2, 'Gọi dt cskh ', NULL);
INSERT INTO `todo` VALUES (794, 63, '2020-06-02 00:00:00', '2020-06-02 00:00:00', 1, 'Nhắc nợ ngày 02/06/2020', NULL);
INSERT INTO `todo` VALUES (795, 63, '2020-06-02 00:00:00', '2020-06-02 00:00:00', 1, 'Gọi đt chào bán sản phẩm KH Vay', NULL);
INSERT INTO `todo` VALUES (796, 62, '2020-06-02 08:49:00', '2020-06-02 16:00:00', 1, 'Đt bán hàng theo data lựa chọn trước và ƯT (5 -10 KH)', NULL);
INSERT INTO `todo` VALUES (797, 6, '2020-06-02 09:00:00', '2020-06-02 10:00:00', 2, 'Gửi checklist hs Chị Trang - Ninh Kiều 2', NULL);
INSERT INTO `todo` VALUES (798, 62, '2020-06-02 09:30:00', '2020-06-02 00:00:00', 1, 'Tư vấn KH TG Thanh Quyên', NULL);
INSERT INTO `todo` VALUES (799, 62, '2020-06-02 08:49:00', '2020-06-02 00:00:00', 1, 'Thu thập hs thẻ KH Nguyễn Vân Nhi', NULL);
INSERT INTO `todo` VALUES (800, 65, '2020-06-02 09:00:00', '2020-06-02 10:30:00', 2, '- Định giá Nguyễn Thị Thanh Loan', NULL);
INSERT INTO `todo` VALUES (801, 65, '2020-06-02 11:11:00', '2020-06-02 00:00:00', 2, '- Trình thẻ tín dụng Nguyễn Thị Thùy Trang', NULL);
INSERT INTO `todo` VALUES (803, 65, '2020-06-02 14:35:00', '2020-06-02 14:35:00', 2, '- Bàn giao hồ sơ tín dụng', NULL);
INSERT INTO `todo` VALUES (804, 68, '2020-06-02 08:30:00', '2020-06-02 00:00:00', 2, '-	Họp định hướng phát triển cho vay tín chấp có liên kết', NULL);
INSERT INTO `todo` VALUES (805, 68, '1970-01-01 00:00:00', '2020-06-02 14:00:00', 1, '-	Xem lại thông báo 358 và  536 để xem xét cấp tín dụng cho Khách hàng Nguyễn Thúy Kiều', NULL);
INSERT INTO `todo` VALUES (806, 68, '2020-06-02 13:00:00', '2020-06-02 14:00:00', 2, '-	Xem lại thông báo 358 và  536 để xem xét cấp tín dụng cho Khách hàng Nguyễn Thúy Kiều', NULL);
INSERT INTO `todo` VALUES (807, 68, '2020-06-02 14:00:00', '1970-01-01 00:00:00', 2, '-	Điện thoại trao đổi với sale xe về tỷ lệ tài trợ cho vay xe của khách hàng Trương Kim Khuê', NULL);
INSERT INTO `todo` VALUES (808, 68, '1970-01-01 00:00:00', '1970-01-01 00:00:00', 1, '-	Điện thoại tiếp thị, tư vấn sản phẩm đến khách hàng theo danh sách data tự thu thập', NULL);
INSERT INTO `todo` VALUES (809, 68, '2020-06-02 14:30:00', '2020-06-02 16:00:00', 2, '-	Điện thoại tiếp thị, tư vấn sản phẩm đến khách hàng theo danh sách data tự thu thập', NULL);
INSERT INTO `todo` VALUES (810, 3, '2020-06-03 08:30:00', '2020-06-03 09:30:00', 2, 'Làm bàn giao HS quá hạn cho bên xử lý nợ', NULL);
INSERT INTO `todo` VALUES (811, 3, '2020-06-03 09:30:00', '2020-06-03 10:00:00', 2, 'Gửi định giá HS Trần Thị Ngọc', NULL);
INSERT INTO `todo` VALUES (812, 3, '2020-06-03 10:00:00', '2020-06-03 10:30:00', 2, 'Làm giấy đi đường KH Trần Văn Trung', NULL);
INSERT INTO `todo` VALUES (813, 3, '2020-06-03 11:00:00', '2020-06-03 11:30:00', 2, 'Gọi ĐT nhắc nợ quá hạn', NULL);
INSERT INTO `todo` VALUES (814, 63, '2020-06-03 00:00:00', '2020-06-03 00:00:00', 1, 'Nhắc nợ ngày 03/06/2020', NULL);
INSERT INTO `todo` VALUES (815, 63, '2020-06-03 00:00:00', '2020-06-03 00:00:00', 1, 'Làm hồ sơ bàn giao ', NULL);
INSERT INTO `todo` VALUES (816, 64, '2020-06-03 08:00:00', '2020-06-03 09:00:00', 1, 'Gặp tư vấn bh cho bạn Anh Võ Hoàng Hà', NULL);
INSERT INTO `todo` VALUES (817, 6, '2020-06-03 15:12:00', '2020-06-03 00:00:00', 2, 'Đi định giá KH a Hòa', NULL);
INSERT INTO `todo` VALUES (818, 6, '2020-06-03 10:12:00', '2020-06-03 00:00:00', 2, 'Thay đổi ls KH Nguyễn Hữu Quý', NULL);
INSERT INTO `todo` VALUES (819, 53, '2020-06-03 09:30:00', '2020-06-03 10:45:00', 2, 'Gọi dt nhắc phí', NULL);
INSERT INTO `todo` VALUES (820, 66, '2020-06-03 08:16:00', '2020-06-03 11:30:00', 2, 'Trình hồ sơ thẻ tín dụng NGUYỄN THỊ MỸ LOAN', NULL);
INSERT INTO `todo` VALUES (821, 53, '2020-06-03 08:40:00', '2020-06-03 09:15:00', 2, 'Tập in bh xe ', NULL);
INSERT INTO `todo` VALUES (822, 66, '1970-01-01 00:00:00', '1970-01-01 00:00:00', 1, 'Hẹn gặp KH LÊ VĂN GIÀU. Nhu cầu vay bổ sung vốn KD.', NULL);
INSERT INTO `todo` VALUES (823, 66, '2020-06-03 13:30:00', '1970-01-01 00:00:00', 2, 'Hẹn gặp KH LÊ VĂN GIÀU. KH nhu cầu vay bổ sung VKD.\r\nKH bận việc không đến NH.\r\nNhắc nợ KH quá hạn.', NULL);
INSERT INTO `todo` VALUES (824, 66, '2020-06-03 11:00:00', '2020-06-03 00:00:00', 2, 'Gặp bạn Vy Xuân Khánh nhận hồ sơ', NULL);
INSERT INTO `todo` VALUES (825, 66, '1970-01-01 00:00:00', '1970-01-01 00:00:00', 1, 'Trình hồ sơ thẻ KH NGUYỄN THỊ MỸ LOAN lên SD.', NULL);
INSERT INTO `todo` VALUES (826, 66, '1970-01-01 00:00:00', '1970-01-01 00:00:00', 1, 'Trình hồ sơ KH Mỹ Loan lên SD', NULL);
INSERT INTO `todo` VALUES (827, 66, '2020-06-03 15:00:00', '2020-06-03 17:00:00', 2, 'Trình hồ sơ Mỹ Loan lên SD', NULL);
INSERT INTO `todo` VALUES (829, 62, '2020-06-03 08:31:00', '2020-06-03 00:00:00', 1, 'ĐT CSKH và tư vấn sp', NULL);
INSERT INTO `todo` VALUES (830, 71, '2020-06-03 08:59:00', '2020-06-03 10:00:00', 1, 'Điện thoại chào bán sản phẩm tiền gửi', NULL);
INSERT INTO `todo` VALUES (831, 53, '2020-06-03 02:30:00', '2020-06-03 03:50:00', 2, 'Gọi dt cskh', NULL);
INSERT INTO `todo` VALUES (833, 65, '2020-06-03 09:09:00', '2020-06-03 11:30:00', 2, '- Tra soát hồ sơ Khách hàng cũ ', NULL);
INSERT INTO `todo` VALUES (834, 52, '2020-06-03 00:00:00', '2020-06-03 00:00:00', 2, 'Xử lý hồ sơ khách Bảo Trân', NULL);
INSERT INTO `todo` VALUES (835, 52, '2020-06-03 00:00:00', '2020-06-03 00:00:00', 2, 'Gặp khách lấy tiền huy động', NULL);
INSERT INTO `todo` VALUES (836, 52, '2020-06-03 09:36:00', '2020-06-03 00:00:00', 2, 'Gặp khách nộp tiền huy động', NULL);
INSERT INTO `todo` VALUES (837, 71, '2020-06-03 10:33:00', '2020-06-03 11:59:00', 1, 'Đi gặp khách hàng tư vấn', NULL);
INSERT INTO `todo` VALUES (838, 68, '2020-06-03 08:00:00', '2020-06-03 08:30:00', 2, '-	Đọc mail đầu ngày, lên kế hoạch cho ngày làm việc', NULL);
INSERT INTO `todo` VALUES (839, 68, '2020-06-03 09:00:00', '2020-06-03 10:30:00', 2, '-	Nhờ chạy bảng minh họa cho KH Võ Hoàng Sang và nghiên cứu để tư vấn cho KH', NULL);
INSERT INTO `todo` VALUES (840, 68, '2020-06-03 10:30:00', '2020-06-03 11:30:00', 2, '-	Điện thoại trao đổi về khách hàng với sale xe bên Trường Xuân (1 KH Nguyễn Thúy Kiều đã mua xe bằng tiền mặt, 1 KH Nguyễn Văn Cuốt đang chờ phản hồi từ sale xe khi trao đổi với khách hàng xong)', NULL);
INSERT INTO `todo` VALUES (841, 68, '2020-06-03 13:00:00', '2020-06-03 14:00:00', 2, '-	Làm bàn giao và đi bàn giao hồ sơ', NULL);
INSERT INTO `todo` VALUES (842, 68, '2020-06-03 14:30:00', '2020-06-03 16:00:00', 2, '-	Tìm kiếm KH tiềm năng (từ KH cũ, zalo, FB), gọi điện tiếp thị KH theo danh sách data tự thu thập được (tối thiểu 5 KH)', NULL);
INSERT INTO `todo` VALUES (843, 67, '2020-06-03 14:00:00', '2020-06-03 16:00:00', 1, 'Qua trường Quốc Văn Cần Thơ để hướng dẫn mở TK cho GV và theo dõi nhận bản ký thỏa thuận liên kết và chi lương của Trường.', NULL);
INSERT INTO `todo` VALUES (844, 64, '2020-06-03 16:00:00', '2020-06-03 16:30:00', 1, 'Hẹn gặp tư  vấn KH Hoàng Thúy Hằng (dự kiến vay bù đắp mua BĐS, nhu cầu vay 2,5 tỷ). Thu thập Hồ sơ để định giá.', NULL);
INSERT INTO `todo` VALUES (845, 6, '2020-06-04 08:00:00', '2020-06-04 12:18:00', 2, 'Workshop', 'accepted');
INSERT INTO `todo` VALUES (846, 3, '2020-06-04 13:30:00', '2020-06-04 14:30:00', 2, 'Làm bàn giao HS xử lý nợ', NULL);
INSERT INTO `todo` VALUES (847, 53, '2020-06-04 08:00:00', '2020-06-04 00:00:00', 2, 'Học workshop', NULL);
INSERT INTO `todo` VALUES (848, 6, '2020-06-04 14:19:00', '2020-06-04 00:00:00', 2, 'Trình lại hs a Quý', NULL);
INSERT INTO `todo` VALUES (849, 6, '2020-06-04 16:19:00', '2020-06-04 00:00:00', 2, 'Đt lại cô Trang lấy hs', NULL);
INSERT INTO `todo` VALUES (850, 3, '2020-06-04 08:00:00', '2020-06-04 00:00:00', 2, 'Học workshop', NULL);
INSERT INTO `todo` VALUES (851, 53, '2020-06-04 02:30:00', '2020-06-04 03:45:00', 2, 'Gọi dt nhắc phí và cksh ', NULL);
INSERT INTO `todo` VALUES (852, 64, '2020-06-04 09:00:00', '2020-06-04 12:00:00', 1, 'Giải ngân hs khách hàng Phạm Di Linh', NULL);
INSERT INTO `todo` VALUES (853, 64, '2020-06-04 10:00:00', '2020-06-04 10:30:00', 1, 'trình hs thẻ Kh Huỳnh Thị Bảo Trân', NULL);
INSERT INTO `todo` VALUES (854, 3, '2020-06-04 15:00:00', '2020-06-04 16:00:00', 2, 'Gặp KH Võ Thị Cẩm Loan từ vấn bảo hiểm', NULL);
INSERT INTO `todo` VALUES (855, 53, '2020-06-04 03:00:00', '2020-06-04 04:30:00', 2, 'Đi tv KH của a Điền', NULL);
INSERT INTO `todo` VALUES (856, 52, '2020-06-04 00:00:00', '2020-06-04 00:00:00', 2, 'Làm tờ trình Hồ sơ Bảo Trân', NULL);
INSERT INTO `todo` VALUES (857, 52, '2020-06-04 00:00:00', '2020-06-04 00:00:00', 2, 'Găp Khách hàng Trúc Ký đề nghị định giá', NULL);
INSERT INTO `todo` VALUES (858, 52, '2020-06-04 10:16:00', '2020-06-04 10:16:00', 2, 'Gặp Khách hàng có nhu cầu vay vốn', NULL);
INSERT INTO `todo` VALUES (859, 66, '2020-06-04 08:00:00', '1970-01-01 00:00:00', 2, 'Tham gia Workshop bảo hiểm.', NULL);
INSERT INTO `todo` VALUES (860, 68, '2020-06-04 08:00:00', '2020-06-04 12:00:00', 2, '-	Tham gia Workshop bảo hiểm “Lan tỏa giá trị vững bền”', NULL);
INSERT INTO `todo` VALUES (861, 68, '2020-06-04 13:00:00', '2020-06-04 15:30:00', 2, '-	Tham gia giao lưu với những Anh/Chị  bên Fru', NULL);
INSERT INTO `todo` VALUES (862, 68, '2020-06-04 16:00:00', '2020-06-04 16:30:00', 2, '-	Đọc mail', NULL);
INSERT INTO `todo` VALUES (863, 65, '2020-06-04 16:56:00', '2020-06-04 16:56:00', 2, '- Tham gia Workshop Pru', NULL);
INSERT INTO `todo` VALUES (864, 3, '2020-06-05 08:30:00', '2020-06-05 09:00:00', 2, 'Gọi tư vấn bảo hiểm Chị Thu', NULL);
INSERT INTO `todo` VALUES (865, 3, '2020-06-05 09:00:00', '2020-06-05 09:30:00', 2, 'Gọi ĐT chốt BH chị Loan', NULL);
INSERT INTO `todo` VALUES (866, 3, '2020-06-05 10:30:00', '2020-06-05 11:00:00', 2, 'Gọi điện thoại nhắc nợ quá hạn', NULL);
INSERT INTO `todo` VALUES (867, 6, '2020-06-05 08:20:00', '2020-06-05 00:00:00', 2, 'Cho a Quý ký lại hs thay đổi LS', 'accepted');
INSERT INTO `todo` VALUES (868, 6, '2020-06-05 13:04:00', '2020-06-05 00:00:00', 2, 'Soạn hs vay góp lương Nguyễn Hữu Quý', NULL);
INSERT INTO `todo` VALUES (869, 6, '2020-06-05 15:05:00', '2020-06-05 00:00:00', 2, 'Đưa mẫu xác nhận kinh doanh cho a Hòa', NULL);
INSERT INTO `todo` VALUES (870, 53, '2020-06-05 08:35:00', '2020-06-05 09:30:00', 2, 'Chỉnh sửa lại BMH cho khách của a Điền', NULL);
INSERT INTO `todo` VALUES (871, 53, '2020-06-05 09:40:00', '2020-06-05 10:45:00', 2, 'Gọi dt nhắc phí', NULL);
INSERT INTO `todo` VALUES (872, 53, '2020-06-05 02:30:00', '2020-06-05 03:45:00', 2, 'Gọi dt Cskh ', NULL);
INSERT INTO `todo` VALUES (873, 53, '2020-06-05 05:05:00', '2020-06-05 06:45:00', 2, 'Gặp KH của a Điền ', NULL);
INSERT INTO `todo` VALUES (874, 65, '2020-06-05 08:57:00', '2020-06-05 08:57:00', 1, '- Gọi điện thoại tư vấn Khách hàng', NULL);
INSERT INTO `todo` VALUES (875, 68, '2020-06-05 08:00:00', '2020-06-05 08:30:00', 2, '-	Đọc mail đầu ngày', NULL);
INSERT INTO `todo` VALUES (876, 68, '2020-06-05 09:00:00', '2020-06-05 10:00:00', 2, '-	Làm thanh toán yêu cầu đăng ký giao dịch đảm bảo', NULL);
INSERT INTO `todo` VALUES (877, 68, '2020-06-05 10:30:00', '2020-06-05 11:30:00', 2, '-	Tiếp thị, tìm kiếm khách hàng ', NULL);
INSERT INTO `todo` VALUES (878, 68, '2020-06-05 10:00:00', '2020-06-05 10:40:00', 2, '-	Điện thoại cho KH Trần Trung Hữu đến nhận thẻ tín dụng và hướng dẫn kích hoạt', NULL);
INSERT INTO `todo` VALUES (879, 68, '2020-06-05 13:00:00', '2020-06-05 14:00:00', 2, '-	Xử lý các công việc phát sinh, lập kế hoạch tìm kiếm khách hàng', NULL);
INSERT INTO `todo` VALUES (880, 68, '2020-06-05 15:00:00', '2020-06-05 16:30:00', 2, '-	Hẹn gặp KH Võ Hoàng Sang để tư vấn bảo hiểm', NULL);
INSERT INTO `todo` VALUES (881, 68, '2020-06-05 16:30:00', '2020-06-05 17:00:00', 2, '-	Tổng kết lại các công việc trong ngày và một số vấn đề phát sinh', NULL);
INSERT INTO `todo` VALUES (882, 3, '2020-06-05 17:00:00', '2020-06-05 18:00:00', 2, 'Gặp anh Kiệt tư vấn bảo hiểm', NULL);
INSERT INTO `todo` VALUES (883, 52, '2020-06-06 00:00:00', '2020-06-06 00:00:00', 2, 'Gặp khách nhận tiền huy động', 'accepted');
INSERT INTO `todo` VALUES (884, 6, '2020-06-06 09:45:00', '2020-06-06 11:00:00', 2, 'Dự testdrive và giới thiệu sp Mitsubishi', NULL);
INSERT INTO `todo` VALUES (885, 8, '2020-06-06 09:45:00', '2020-06-06 11:00:00', 1, 'Dự testdrive và giới thiệu sp Mitsubishi', NULL);
INSERT INTO `todo` VALUES (886, 53, '2020-06-06 09:45:00', '2020-06-06 11:00:00', 2, 'Dự testdrive và giới thiệu sp Mitsubishi', NULL);
INSERT INTO `todo` VALUES (887, 64, '2020-06-08 07:00:00', '2020-06-08 08:30:00', 2, 'Hẹn cf khách hàng Võ Hoàng Hà', NULL);
INSERT INTO `todo` VALUES (888, 3, '2020-06-08 08:30:00', '2020-06-08 09:00:00', 2, 'Gọi ĐT chị Loan hẹn gặp chốt case BH', NULL);
INSERT INTO `todo` VALUES (889, 3, '2020-06-08 09:00:00', '2020-06-08 09:30:00', 2, 'Gọi ĐT cho anh Xuân Chuyển chốt ngày đi công chứng ', NULL);
INSERT INTO `todo` VALUES (890, 3, '2020-06-08 09:30:00', '2020-06-08 10:30:00', 2, 'Gọi ĐT anh Kiệt hẹn gặp tư vấn BH', NULL);
INSERT INTO `todo` VALUES (891, 3, '2020-06-08 10:30:00', '2020-06-08 11:00:00', 2, 'Gọi ĐT nhắc nợ quá hạn', NULL);
INSERT INTO `todo` VALUES (894, 53, '2020-06-08 07:40:00', '2020-06-08 08:11:00', 2, 'Chị Cẩm Loan khách của a Điền gọi dt hỏi về sp', 'accepted');
INSERT INTO `todo` VALUES (895, 68, '2020-06-08 08:00:00', '2020-06-08 08:30:00', 2, '-	Đọc mail đầu ngày', NULL);
INSERT INTO `todo` VALUES (896, 68, '2020-06-08 09:00:00', '2020-06-08 10:30:00', 2, '-	Làm bàn giao hồ sơ', NULL);
INSERT INTO `todo` VALUES (897, 68, '2020-06-08 10:30:00', '2020-06-08 11:30:00', 2, '-	Tiếp thị KH theo danh sách data có sẵn hoặc tiếp cận nguồn khách hàng từ các trang mạng xã hội', NULL);
INSERT INTO `todo` VALUES (898, 68, '2020-06-08 13:00:00', '2020-06-08 14:30:00', 2, '-	Tiếp tục làm bàn giao hồ sơ', NULL);
INSERT INTO `todo` VALUES (899, 68, '2020-06-08 15:00:00', '2020-06-08 16:30:00', 2, '-	Tiếp tục tiếp thị KH theo danh sách data có sẵn hoặc tiếp cận nguồn kH từ các trang mạng xã hội', NULL);
INSERT INTO `todo` VALUES (900, 68, '2020-06-08 17:00:00', '2020-06-08 18:00:00', 2, '-	Hẹn gặp KH Nguyễn Văn Thượng để thu thập thông tin và thẩm định sơ KH (có sự hỗ trợ của Anh Tú)', NULL);
INSERT INTO `todo` VALUES (901, 62, '2020-06-08 09:49:00', '2020-06-08 00:00:00', 1, 'Trình xin số TK Đẹp cho KH Liên Hương', NULL);
INSERT INTO `todo` VALUES (902, 62, '2020-06-08 09:50:00', '2020-06-08 09:50:00', 1, 'Điện thoại CSKH và bán hàng', NULL);
INSERT INTO `todo` VALUES (903, 53, '2020-06-08 15:45:00', '2020-06-08 16:15:00', 2, 'Đánh BMH chị Loan và anh Kiệt khách của a Điền', NULL);
INSERT INTO `todo` VALUES (904, 53, '2020-06-08 18:30:00', '2020-06-08 19:30:00', 2, 'Đi tv kh của a Điền tên Huỳnh Tuấn Kiệt ', NULL);
INSERT INTO `todo` VALUES (905, 53, '2020-06-09 08:45:00', '2020-06-09 09:30:00', 2, 'Điều chỉnh lại BMH của chị Loan KH a Điền', NULL);
INSERT INTO `todo` VALUES (906, 6, '2020-06-09 11:01:00', '2020-06-09 00:00:00', 2, 'Soạn hs góp lương a Quý', NULL);
INSERT INTO `todo` VALUES (907, 52, '2020-06-09 08:02:00', '2020-06-09 00:00:00', 2, 'Thu thập hồ sơ làm thẻ tín dụng', NULL);
INSERT INTO `todo` VALUES (908, 53, '2020-06-09 02:30:00', '2020-06-09 04:00:00', 2, 'Đi tv chị Loan KH của a Điền ', NULL);
INSERT INTO `todo` VALUES (909, 52, '2020-06-09 00:00:00', '2020-06-09 00:00:00', 2, 'Xử lý hồ sơ trúc và trân', NULL);
INSERT INTO `todo` VALUES (911, 3, '2020-06-09 09:30:00', '2020-06-09 10:30:00', 2, 'Soạn HS giải ngân hạn mức KH Huỳnh Thứ Phát', NULL);
INSERT INTO `todo` VALUES (912, 3, '2020-06-09 10:30:00', '2020-06-09 11:00:00', 2, 'Gọi ĐT nhắc nợ quá hạn', NULL);
INSERT INTO `todo` VALUES (913, 3, '2020-06-09 14:00:00', '2020-06-09 15:00:00', 2, 'Gặp KH Võ Thị Cẩm Loan chốt bảo hiểm ', NULL);
INSERT INTO `todo` VALUES (914, 3, '2020-06-09 16:00:00', '2020-06-09 16:30:00', 2, 'Thu nợ trước hạn KH Huỳnh Thứ Phát', NULL);
INSERT INTO `todo` VALUES (915, 6, '2020-06-09 10:31:00', '2020-06-09 00:00:00', 2, 'Liên hệ Đức ngân hàng chính sách tư vấn thẻ tín dụng', NULL);
INSERT INTO `todo` VALUES (916, 6, '2020-06-09 13:32:00', '2020-06-09 00:00:00', 2, 'Thu thập hs chỗ a Hòa', NULL);
INSERT INTO `todo` VALUES (917, 53, '2020-06-09 09:45:00', '2020-06-09 10:20:00', 2, 'Gọi dt cskh ', NULL);
INSERT INTO `todo` VALUES (918, 64, '2020-09-06 00:00:00', '2020-09-06 00:00:00', 2, 'Họp team m.SME', NULL);
INSERT INTO `todo` VALUES (919, 65, '2020-06-09 17:27:00', '2020-06-09 17:27:00', 2, '- Điện thoại tư vấn khách hàng', NULL);
INSERT INTO `todo` VALUES (920, 65, '2020-06-09 17:28:00', '2020-06-09 17:28:00', 2, '- Họp kinh doanh M.SME', NULL);
INSERT INTO `todo` VALUES (921, 65, '2020-06-10 17:28:00', '2020-06-10 17:28:00', 1, '- Xử lý nợ', NULL);
INSERT INTO `todo` VALUES (922, 68, '2020-06-09 08:00:00', '2020-06-09 09:00:00', 2, '- Họp team KHCN', NULL);
INSERT INTO `todo` VALUES (923, 68, '2020-06-09 09:00:00', '2020-06-09 10:00:00', 2, '- Tiếp nhận và lên lịch thẩm định khách hàng Đào Trường Giang', NULL);
INSERT INTO `todo` VALUES (924, 68, '2020-06-09 10:30:00', '2020-06-09 11:40:00', 2, '- Đi thẩm định khách hàng Đào Trường Giang (có sự hỗ trợ của Anh Lê Xuân Sang)', NULL);
INSERT INTO `todo` VALUES (925, 68, '2020-06-09 13:00:00', '2020-06-09 14:00:00', 2, '- Chuẩn bị hồ sơ để trình', NULL);
INSERT INTO `todo` VALUES (926, 68, '2020-06-09 16:00:00', '2020-06-09 16:30:00', 2, '- Trình hồ sơ ', NULL);
INSERT INTO `todo` VALUES (928, 3, '2020-06-10 08:00:00', '2020-06-10 09:00:00', 2, 'Gặp KH Huỳnh Thứ Phát ký HS giải ngân hạn mức', 'accepted');
INSERT INTO `todo` VALUES (929, 3, '2020-06-10 09:30:00', '2020-06-10 10:00:00', 2, 'Gọi anh Xuân Chuyển đi công chứng HS và nộp phí bảo hiểm', NULL);
INSERT INTO `todo` VALUES (930, 3, '2020-06-10 10:00:00', '2020-06-10 10:30:00', 2, 'Kiểm tra các HS cũ và HS mới đã giải ngân để phát hành thẻ tín dụng', NULL);
INSERT INTO `todo` VALUES (931, 6, '2020-06-10 10:02:00', '2020-06-10 00:00:00', 2, 'Đt tư vấn vay góp lương KH Hồng Thanh Đình', NULL);
INSERT INTO `todo` VALUES (932, 6, '2020-06-10 13:05:00', '2020-06-10 00:00:00', 2, 'Đt hướng dẫn cô Trang xác nhận giáp đường đi', NULL);
INSERT INTO `todo` VALUES (933, 6, '2020-06-10 15:03:00', '2020-06-10 00:00:00', 2, 'Đt nhắc nợ quá hạn', NULL);
INSERT INTO `todo` VALUES (934, 53, '2020-06-10 09:30:00', '2020-06-10 11:00:00', 2, 'Gọi dt cskh ', NULL);
INSERT INTO `todo` VALUES (935, 53, '2020-06-10 01:45:00', '2020-06-10 02:50:00', 2, 'Đi nộp thư xác nhận điện tử cho a Điền ', NULL);
INSERT INTO `todo` VALUES (936, 52, '2020-06-10 00:00:00', '2020-06-10 00:00:00', 2, 'Đi định giá tại ô Môn', NULL);
INSERT INTO `todo` VALUES (937, 52, '2020-06-10 00:00:00', '2020-06-10 00:00:00', 2, 'Xử lý hồ sơ Nguyễn Thanh Trúc', NULL);
INSERT INTO `todo` VALUES (938, 3, '2020-06-10 13:30:00', '2020-06-10 14:00:00', 2, 'Gọi ĐT nhắc nợ quá hạn', NULL);
INSERT INTO `todo` VALUES (939, 3, '2020-06-10 16:30:00', '2020-06-10 17:00:00', 2, 'Làm bàn giao HS giải ngân', NULL);
INSERT INTO `todo` VALUES (940, 64, '2020-10-06 00:00:00', '2020-10-06 00:00:00', 1, 'Xử lý nợ hs Lê Nguyễn Hoài Thương', NULL);
INSERT INTO `todo` VALUES (941, 68, '2020-06-10 08:00:00', '2020-06-10 09:00:00', 2, '- Trao đổi công việc với các Anh/Chị trong cơ quan', NULL);
INSERT INTO `todo` VALUES (942, 68, '2020-06-10 09:20:00', '2020-06-10 10:30:00', 2, '- Tiếp thị, tư vấn khách hàng', NULL);
INSERT INTO `todo` VALUES (944, 52, '2020-06-18 00:00:00', '2020-06-11 00:00:00', 2, 'Làm thẻ tín dụng Võ Anh Khoa', NULL);
INSERT INTO `todo` VALUES (945, 53, '2020-06-11 09:15:00', '2020-06-11 11:15:00', 2, 'Họp với a Sơn ', NULL);
INSERT INTO `todo` VALUES (946, 3, '2020-06-11 08:30:00', '2020-06-11 09:00:00', 2, 'Giải ngân HS KH Huỳnh Thứ Phát', NULL);
INSERT INTO `todo` VALUES (948, 3, '2020-06-11 09:30:00', '2020-06-11 10:30:00', 2, 'Làm bàn giao HS cho xử lý nợ', NULL);
INSERT INTO `todo` VALUES (949, 3, '2020-06-11 11:00:00', '2020-06-11 11:30:00', 2, 'Gọi ĐT nhắc nợ quá hạn', NULL);
INSERT INTO `todo` VALUES (950, 6, '2020-06-11 10:50:00', '2020-06-11 00:00:00', 2, 'Gặp KH Đình thu thập hs', NULL);
INSERT INTO `todo` VALUES (951, 6, '2020-06-11 13:42:00', '2020-06-11 00:00:00', 2, 'Đt a Hòa xử lý hs', NULL);
INSERT INTO `todo` VALUES (952, 6, '2020-06-11 14:46:00', '2020-06-11 00:00:00', 2, 'Mở gói tài khoản chị Mai', NULL);
INSERT INTO `todo` VALUES (953, 6, '2020-06-11 15:46:00', '2020-06-11 00:00:00', 2, 'Đt nhắc nợ quá hạn', NULL);
INSERT INTO `todo` VALUES (954, 53, '2020-06-11 01:35:00', '2020-06-11 02:45:00', 2, 'Đánh BMH cho chị Nga và chị Hằng', NULL);
INSERT INTO `todo` VALUES (955, 53, '2020-06-11 02:45:00', '2020-06-11 04:00:00', 2, 'Gọi dt cskh ', NULL);
INSERT INTO `todo` VALUES (956, 68, '2020-06-11 08:00:00', '2020-06-11 09:00:00', 2, '- Trao đổi công việc với các Anh/Chị ở team KHCN', NULL);
INSERT INTO `todo` VALUES (957, 68, '2020-06-11 09:30:00', '2020-06-11 11:00:00', 2, '- Điện thoại tiếp thị tư vấn KH vay từ data tự thu thập được và tìm kiếm KH trên các trang mạng xã hội ', NULL);
INSERT INTO `todo` VALUES (958, 68, '2020-06-11 13:00:00', '2020-06-11 14:00:00', 2, '- Tham gia hướng dẫn truyền thông KPIs', NULL);
INSERT INTO `todo` VALUES (959, 68, '2020-06-11 14:30:00', '2020-06-11 16:00:00', 2, '- Tìm kiếm, tiếp thị, tư vấn khách hàng', NULL);
INSERT INTO `todo` VALUES (960, 52, '2020-06-12 07:42:00', '2020-06-12 07:42:00', 2, 'Hẹn gặp khách', 'accepted');
INSERT INTO `todo` VALUES (961, 52, '2020-06-12 00:00:00', '2020-06-12 00:00:00', 2, 'Trình hồ sơ thẻ tín dụng Võ Anh Khoa', NULL);
INSERT INTO `todo` VALUES (962, 53, '2020-06-12 08:30:00', '2020-06-12 09:30:00', 2, 'Ôn lại kiến thức sp ', NULL);
INSERT INTO `todo` VALUES (963, 53, '2020-06-12 09:45:00', '2020-06-12 11:00:00', 2, 'Gọi dt chào sp cho KH mới', NULL);
INSERT INTO `todo` VALUES (964, 53, '2020-06-12 01:30:00', '2020-06-12 02:40:00', 2, 'Nộp giấy thư bàn giao của 4hđ ', NULL);
INSERT INTO `todo` VALUES (965, 53, '2020-06-12 03:00:00', '2020-06-12 03:30:00', 2, 'Điều chỉnh lại BMH cho khách chị Nga ', NULL);
INSERT INTO `todo` VALUES (966, 53, '2020-06-12 03:45:00', '2020-06-12 04:30:00', 2, 'Học sp hành trang vui khoẻ ', NULL);
INSERT INTO `todo` VALUES (967, 6, '2020-06-12 10:16:00', '2020-06-12 00:00:00', 2, 'Mở gói tài khoản Hồng Thanh Đình', NULL);
INSERT INTO `todo` VALUES (968, 6, '2020-06-12 13:16:00', '2020-06-12 00:00:00', 2, 'Soạn hs KH Đình', NULL);
INSERT INTO `todo` VALUES (969, 6, '2020-06-12 09:16:00', '2020-06-12 00:00:00', 2, 'Lấy BH xe KH Triệu Tử Long', NULL);
INSERT INTO `todo` VALUES (970, 6, '2020-06-12 15:17:00', '2020-06-12 00:00:00', 2, 'Đt nhắc nợ quá hạn', NULL);
INSERT INTO `todo` VALUES (971, 3, '2020-06-12 08:30:00', '2020-06-12 09:30:00', 2, 'Kiểm tra danh sách KH vay cũ mở thẻ tín dụng', NULL);
INSERT INTO `todo` VALUES (972, 3, '2020-06-12 09:30:00', '2020-06-12 10:00:00', 2, 'Thu nợ một phần KH Trương Thanh Phương', NULL);
INSERT INTO `todo` VALUES (973, 3, '2020-06-12 10:00:00', '2020-06-12 10:30:00', 2, 'Gọi ĐT tư vấn vay anh Chính', NULL);
INSERT INTO `todo` VALUES (974, 3, '2020-06-12 11:00:00', '2020-06-12 11:30:00', 2, 'Gọi nhắc nợ quá hạn', NULL);
INSERT INTO `todo` VALUES (975, 3, '2020-06-12 17:00:00', '2020-06-12 17:30:00', 2, 'Bàn giao HS giải ngân', NULL);
INSERT INTO `todo` VALUES (976, 53, '2020-06-15 08:00:00', '2020-06-15 10:15:00', 2, 'Họp với phòng khcn', NULL);
INSERT INTO `todo` VALUES (977, 53, '2020-06-15 14:00:00', '2020-06-15 15:45:00', 2, 'A Sơn test lại sp ở toà nhà sacom tầng 10', NULL);
INSERT INTO `todo` VALUES (978, 3, '2020-06-15 08:30:00', '2020-06-15 09:00:00', 2, 'Gọi anh Chính tư vấn vay vốn', NULL);
INSERT INTO `todo` VALUES (979, 53, '2020-06-15 10:30:00', '2020-06-15 11:15:00', 2, 'Nộp giấy yêu cầu cấp bộ hợp đồng giấy cho khách A Thành ', NULL);
INSERT INTO `todo` VALUES (980, 3, '2020-06-15 09:00:00', '2020-06-15 09:30:00', 2, 'Gọi anh Út tư vấn vay vốn', NULL);
INSERT INTO `todo` VALUES (981, 3, '2020-06-15 09:30:00', '2020-06-15 10:00:00', 2, 'Gọi ĐT anh Chí Linh tư vấn mở thẻ tín dụng', NULL);
INSERT INTO `todo` VALUES (982, 3, '2020-06-15 10:30:00', '2020-06-15 11:00:00', 2, 'Gọi ĐT nhắc nợ quá hạn', NULL);
INSERT INTO `todo` VALUES (983, 3, '2020-06-15 17:00:00', '2020-06-15 17:30:00', 2, 'Bàn giao HS giải ngân', NULL);
INSERT INTO `todo` VALUES (984, 52, '2020-06-15 00:00:00', '2020-06-15 00:00:00', 2, 'Họp đầu ngày', NULL);
INSERT INTO `todo` VALUES (985, 52, '2020-06-15 00:00:00', '2020-06-15 00:00:00', 2, 'Gặp khách hàng có nhu cầu vay', NULL);
INSERT INTO `todo` VALUES (986, 52, '2020-06-15 08:28:00', '2020-06-15 00:00:00', 2, 'Xử lý hồ sơ thẻ tín dụng', NULL);
INSERT INTO `todo` VALUES (987, 3, '2020-06-16 08:30:00', '2020-06-16 09:30:00', 2, 'Bàn giao các HS quá hạn cho xử lý nợ', 'accepted');
INSERT INTO `todo` VALUES (988, 3, '2020-06-16 10:00:00', '2020-06-16 11:00:00', 2, 'Gọi danh sách KH đã giải ngân cũ mở thẻ tín dụng', NULL);
INSERT INTO `todo` VALUES (989, 3, '2020-06-16 11:00:00', '2020-06-16 11:30:00', 2, 'Gọi nhắc nợ quá hạn', NULL);
INSERT INTO `todo` VALUES (990, 52, '2020-06-16 00:00:00', '2020-06-16 00:00:00', 2, 'Gặp khách lấy hs làm thẻ tín dụng', NULL);
INSERT INTO `todo` VALUES (991, 52, '2020-06-16 00:00:00', '2020-06-16 00:00:00', 2, 'Trinh hs Nguyễn Thanh Trúc', NULL);
INSERT INTO `todo` VALUES (992, 53, '2020-06-16 09:30:00', '2020-06-16 10:45:00', 2, 'Gọi dt cskh ', NULL);
INSERT INTO `todo` VALUES (993, 53, '2020-06-16 08:30:00', '2020-06-16 09:20:00', 2, 'Học sp hành trang vui khoẻ', NULL);
INSERT INTO `todo` VALUES (994, 53, '2020-06-16 01:30:00', '2020-06-16 02:30:00', 2, 'Đi nộp giấy yêu cầu cấp bộ hồ sơ giấy cho khách hàng ', NULL);
INSERT INTO `todo` VALUES (995, 53, '2020-06-16 02:45:00', '2020-06-16 04:00:00', 2, 'Gọi dt chào kh mới ', NULL);
INSERT INTO `todo` VALUES (996, 53, '2020-06-16 16:10:00', '2020-06-16 17:00:00', 2, 'Ôn lại những kiến thức về đầu tư', NULL);
INSERT INTO `todo` VALUES (997, 6, '2020-06-16 13:00:00', '2020-06-16 00:00:00', 2, 'Trình hs a Đình', NULL);
INSERT INTO `todo` VALUES (998, 6, '2020-06-16 14:00:00', '2020-06-16 00:00:00', 2, 'Bàn giao hs Huỳnh Minh Vũ', NULL);
INSERT INTO `todo` VALUES (999, 6, '2020-06-16 15:00:00', '2020-06-16 00:00:00', 2, 'Soạn hs a Hòa', NULL);
INSERT INTO `todo` VALUES (1001, 3, '2020-06-16 16:00:00', '2020-06-16 16:30:00', 2, 'Gọi lại anh chính tư vấn vay', NULL);
INSERT INTO `todo` VALUES (1002, 52, '2020-06-17 00:00:00', '2020-06-17 00:00:00', 2, 'Làm tờ trình hồ sơ mua xe KH như', NULL);
INSERT INTO `todo` VALUES (1003, 52, '2020-06-17 00:00:00', '2020-06-17 00:00:00', 2, 'Up hố sơ thẻ tín dụng Nguyễn Tấn Đạt', NULL);
INSERT INTO `todo` VALUES (1004, 52, '2020-06-17 00:00:00', '2020-06-17 00:00:00', 2, 'Trình HS Nguyễn Thanh Trúc', NULL);
INSERT INTO `todo` VALUES (1005, 52, '2020-06-17 00:00:00', '2020-06-17 00:00:00', 2, 'Trình HS Nguyễn Thanh Trúc', NULL);
INSERT INTO `todo` VALUES (1006, 52, '2020-06-17 06:28:00', '2020-06-17 08:28:00', 2, 'Gặp Khách hàng', 'accepted');
INSERT INTO `todo` VALUES (1007, 6, '2020-06-17 14:05:00', '2020-06-17 00:00:00', 2, 'Làm thẻ TD kh Huỳnh Trúc Ngân', NULL);
INSERT INTO `todo` VALUES (1008, 6, '2020-06-17 10:06:00', '2020-06-17 00:00:00', 2, 'Làm giấy đi đường KH Lê Đại Lợi', NULL);
INSERT INTO `todo` VALUES (1009, 3, '2020-06-17 08:30:00', '2020-06-17 09:30:00', 2, 'Soạn HS giải ngân hạn mức KH Trần Hoàng Hạnh', NULL);
INSERT INTO `todo` VALUES (1010, 3, '2020-06-17 09:30:00', '2020-06-17 10:30:00', 2, 'Soạn HS giải ngân hạn mức KH Đỗ Văn Tiến', NULL);
INSERT INTO `todo` VALUES (1011, 3, '2020-06-17 10:30:00', '2020-06-17 11:00:00', 2, 'Rà soát KH vay cũ mở thẻ tín dụng', NULL);
INSERT INTO `todo` VALUES (1012, 3, '2020-06-17 14:00:00', '2020-06-17 14:30:00', 2, 'Gọi nhắc nợ quá hạn', NULL);
INSERT INTO `todo` VALUES (1013, 6, '2020-06-17 09:12:00', '2020-06-17 00:00:00', 2, 'Bổ sung hs KH Đình', NULL);
INSERT INTO `todo` VALUES (1014, 6, '2020-06-17 15:12:00', '2020-06-17 00:00:00', 2, 'Đt nhắc nợ KH quá hạn', NULL);
INSERT INTO `todo` VALUES (1015, 53, '2020-06-17 08:10:00', '2020-06-17 09:00:00', 2, 'Đánh BMH khách Trần Văn Đại của chị Hằng', NULL);
INSERT INTO `todo` VALUES (1016, 53, '2020-06-17 09:45:00', '2020-06-17 11:00:00', 2, 'Gọi dt chào sp', NULL);
INSERT INTO `todo` VALUES (1017, 53, '2020-06-17 01:30:00', '2020-06-17 02:30:00', 2, 'Nộp giấy tờ bổ sung yêu cầu cấp hợp đồng giấy cho KH của a Thành 2 khách do bữa hỗm mưa nên hong đi ct dc ', NULL);
INSERT INTO `todo` VALUES (1018, 53, '2020-06-17 14:50:00', '2020-06-17 04:00:00', 2, 'Gọi dt cskh ', NULL);
INSERT INTO `todo` VALUES (1019, 3, '2020-06-18 08:30:00', '2020-06-18 09:30:00', 2, 'Soạn HS giải ngân hạn mức KH Đỗ Văn Tiến', NULL);
INSERT INTO `todo` VALUES (1020, 3, '2020-06-18 09:30:00', '2020-06-18 10:00:00', 2, 'Rà soát KH vay cũ mở thẻ tín dụng', NULL);
INSERT INTO `todo` VALUES (1021, 3, '2020-06-18 16:30:00', '2020-06-18 17:30:00', 2, 'Gặp anh Thanh tư vấn vay', NULL);
INSERT INTO `todo` VALUES (1022, 3, '2020-06-18 14:00:00', '2020-06-18 14:30:00', 2, 'Gọi nhắc nợ quá hạn', NULL);
INSERT INTO `todo` VALUES (1023, 6, '2020-06-18 10:23:00', '2020-06-18 00:00:00', 2, 'Trình ký hs a Quý', NULL);
INSERT INTO `todo` VALUES (1024, 53, '2020-06-18 08:20:00', '2020-06-18 10:30:00', 2, 'Họp huddle', NULL);
INSERT INTO `todo` VALUES (1025, 53, '2020-06-18 02:45:00', '2020-06-18 03:45:00', 2, 'Gọi dt KH ', NULL);
INSERT INTO `todo` VALUES (1026, 6, '2020-06-18 11:25:00', '2020-06-18 00:00:00', 2, 'Bổ sung HS a Đình', NULL);
INSERT INTO `todo` VALUES (1027, 6, '2020-06-18 15:53:00', '2020-06-18 00:00:00', 2, 'Đt nhắc nợ quá hạn', NULL);
INSERT INTO `todo` VALUES (1028, 3, '2020-06-19 08:30:00', '2020-06-19 09:00:00', 2, 'Gọi ĐT KH Hoàng Dũng tư vấn vay', NULL);
INSERT INTO `todo` VALUES (1029, 6, '2020-06-19 13:07:00', '2020-06-19 00:00:00', 1, 'Trình hồ sơ thẻ Huỳnh Trúc Ngân', NULL);
INSERT INTO `todo` VALUES (1030, 6, '2020-06-19 11:07:00', '2020-06-19 00:00:00', 2, 'Đi ô môn thẩm định KH xe', NULL);
INSERT INTO `todo` VALUES (1031, 6, '2020-06-19 14:08:00', '2020-06-19 00:00:00', 1, 'Trình hs a Quý', NULL);
INSERT INTO `todo` VALUES (1032, 3, '2020-06-19 09:00:00', '2020-06-19 09:30:00', 2, 'Gọi anh Linh tư vấn mở thẻ tín dụng', NULL);
INSERT INTO `todo` VALUES (1033, 53, '2020-06-19 09:45:00', '2020-06-19 10:30:00', 2, 'Gọi dt kh ', NULL);
INSERT INTO `todo` VALUES (1034, 3, '2020-06-19 10:00:00', '2020-06-19 10:30:00', 2, 'Rà soát lại KH vay cũ tư vấn bán thêm sp', NULL);
INSERT INTO `todo` VALUES (1035, 3, '2020-06-19 10:30:00', '2020-06-19 11:00:00', 2, 'Gọi ĐT nhắc nợ quá hạn', NULL);
INSERT INTO `todo` VALUES (1036, 53, '2020-06-19 08:30:00', '2020-06-19 09:20:00', 2, 'Hỏi thông tin mấy anh chị về các case bảo hiểm', NULL);
INSERT INTO `todo` VALUES (1037, 53, '2020-06-19 14:00:00', '2020-06-19 03:45:00', 2, 'Gọi dt KH ', NULL);
INSERT INTO `todo` VALUES (1038, 53, '2020-06-19 16:00:00', '2020-06-19 17:00:00', 2, 'Học sp hành trang vui khoẻ', NULL);
INSERT INTO `todo` VALUES (1039, 52, '2020-06-19 00:00:00', '2020-06-19 00:00:00', 2, 'Trình HS xe', NULL);
INSERT INTO `todo` VALUES (1040, 52, '1970-01-01 00:00:00', '1970-01-01 00:00:00', 2, 'Trình HS the', NULL);
INSERT INTO `todo` VALUES (1041, 52, '2020-06-19 00:00:00', '2020-06-19 00:00:00', 2, 'Trinh HS the', NULL);
INSERT INTO `todo` VALUES (1042, 3, '2020-06-19 15:00:00', '2020-06-19 16:00:00', 2, 'Gặp KH quá hạn Nguyễn Thị Hằng làm biến bản làm việc', NULL);
INSERT INTO `todo` VALUES (1043, 52, '2020-06-19 16:00:00', '2020-06-19 16:30:00', 2, 'Ký bộ hs giải ngân KH Như mua xe', NULL);
INSERT INTO `todo` VALUES (1044, 3, '2020-06-22 08:30:00', '2020-06-22 09:00:00', 2, 'Gặp KH Đỗ Văn Tiến ký HS mở thẻ tín dụng và ký giấy thu nợ trước hạn HS hạn mức', 'accepted');
INSERT INTO `todo` VALUES (1045, 3, '2020-06-22 09:30:00', '2020-06-22 10:00:00', 2, 'Hạch toán HS ân hạn KH Nguyễn Văn Ý', NULL);
INSERT INTO `todo` VALUES (1046, 3, '2020-06-22 11:00:00', '2020-06-22 11:30:00', 2, 'Gọi ĐT nhắc nợ quá hạn', NULL);
INSERT INTO `todo` VALUES (1047, 3, '2020-06-22 13:30:00', '2020-06-22 14:00:00', 2, 'Thu nợ trước hạn KH Đỗ Văn Tiến', NULL);
INSERT INTO `todo` VALUES (1048, 6, '2020-06-22 09:21:00', '2020-06-22 00:00:00', 2, 'Bổ sung hs a Quý', NULL);
INSERT INTO `todo` VALUES (1049, 6, '2020-06-22 10:21:00', '2020-06-22 00:00:00', 2, 'Bổ sung hs thẻ chị Ngân', NULL);
INSERT INTO `todo` VALUES (1050, 53, '2020-06-22 09:45:00', '2020-06-22 10:30:00', 2, 'Họp huddle', NULL);
INSERT INTO `todo` VALUES (1051, 53, '2020-06-22 08:50:00', '2020-06-22 09:15:00', 2, 'Liên hệ IT đky sdt bàn ', NULL);
INSERT INTO `todo` VALUES (1052, 53, '2020-06-22 14:20:00', '2020-06-22 15:50:00', 2, 'Gọi dt kh ', NULL);
INSERT INTO `todo` VALUES (1053, 53, '2020-06-22 14:20:00', '2020-06-22 15:50:00', 2, 'Gọi dt kh ', NULL);
INSERT INTO `todo` VALUES (1054, 3, '2020-06-22 14:30:00', '2020-06-22 15:00:00', 2, 'Trình HS thẻ tín dụng KH Đỗ Văn Tiến', NULL);
INSERT INTO `todo` VALUES (1055, 53, '2020-06-23 07:00:00', '2020-06-23 10:30:00', 2, 'Đi khám bệnh ', 'accepted');
INSERT INTO `todo` VALUES (1056, 53, '2020-06-23 14:20:00', '2020-06-23 15:45:00', 2, 'Gọi dt KH', NULL);
INSERT INTO `todo` VALUES (1057, 52, '2020-06-23 00:00:00', '2020-06-23 00:00:00', 2, 'Úp hồ sơ giải ngân Lý Ngọc Như', NULL);
INSERT INTO `todo` VALUES (1058, 52, '2020-06-23 00:00:00', '2020-06-23 00:00:00', 2, 'Đi gặp khách có nhu cầu vay', NULL);
INSERT INTO `todo` VALUES (1059, 52, '2020-06-23 00:00:00', '2020-06-23 00:00:00', 2, 'Thu thập hồ sơ làm thẻ tín dụng', NULL);
INSERT INTO `todo` VALUES (1060, 3, '2020-06-23 14:00:00', '2020-06-23 14:30:00', 2, 'Gọi nhắc nợ quá hạn', NULL);
INSERT INTO `todo` VALUES (1061, 3, '2020-06-23 15:00:00', '2020-06-23 15:30:00', 2, 'Gọi anh Chính tư vấn vay', NULL);
INSERT INTO `todo` VALUES (1062, 3, '2020-06-23 09:30:00', '2020-06-23 10:00:00', 2, 'Gọi anh Linh tư vấn mở thẻ tín dụng', NULL);
INSERT INTO `todo` VALUES (1063, 3, '2020-06-23 10:30:00', '2020-06-23 11:00:00', 2, 'Gọi anh Xuân chuyển chốt ngày đi công chứng HS vay', NULL);
INSERT INTO `todo` VALUES (1064, 6, '2020-06-23 10:39:00', '2020-06-23 00:00:00', 2, 'Up giải ngân hs a Quý', NULL);
INSERT INTO `todo` VALUES (1065, 6, '2020-06-23 13:39:00', '2020-06-23 00:00:00', 2, 'Gặp KH a Chiến', NULL);
INSERT INTO `todo` VALUES (1066, 6, '2020-06-23 12:39:00', '2020-06-23 00:00:00', 2, 'Gặp cô Trang', NULL);
INSERT INTO `todo` VALUES (1067, 52, '2020-06-24 09:00:00', '2020-06-24 09:19:00', 2, 'Trình hồ sỏ thẻ tín dụng', NULL);
INSERT INTO `todo` VALUES (1068, 6, '2020-06-24 09:00:00', '2020-06-24 00:00:00', 2, 'Hẹn gặp a Chiến', NULL);
INSERT INTO `todo` VALUES (1069, 6, '2020-06-24 09:20:00', '2020-06-24 00:00:00', 2, 'Đi gặp a Linh ký mở TK số đẹp', NULL);
INSERT INTO `todo` VALUES (1070, 6, '2020-06-24 11:00:00', '2020-06-24 00:00:00', 2, 'Gặp a Long lý mở thẻ TD', NULL);
INSERT INTO `todo` VALUES (1071, 6, '2020-06-24 13:21:00', '2020-06-24 00:00:00', 2, 'Đi hs cho cô Trang', NULL);
INSERT INTO `todo` VALUES (1072, 52, '1970-01-01 00:00:00', '1970-01-01 00:00:00', 2, 'Đi định giá Cờ Đỏ', NULL);
INSERT INTO `todo` VALUES (1073, 52, '1970-01-01 00:00:00', '1970-01-01 00:00:00', 2, 'Đi định giá Cờ Đỏ', NULL);
INSERT INTO `todo` VALUES (1074, 52, '2020-06-24 02:24:00', '2020-06-24 04:24:00', 2, 'Định giá tài sản Cờ Đỏ', NULL);
INSERT INTO `todo` VALUES (1075, 3, '2020-06-24 09:00:00', '2020-06-24 09:30:00', 2, 'Hạch toán HS ân hạn KH Nguyễn Văn Ý', NULL);
INSERT INTO `todo` VALUES (1076, 53, '2020-06-24 09:45:00', '2020-06-24 11:00:00', 2, 'Gọi dt KH ', NULL);
INSERT INTO `todo` VALUES (1078, 53, '2020-06-24 01:30:00', '2020-06-24 02:00:00', 2, 'Nộp giấy yêu cầu cấp hđ bh giấy ', NULL);
INSERT INTO `todo` VALUES (1079, 53, '2020-06-24 14:30:00', '2020-06-24 15:50:00', 2, 'Gọi dt KH ', NULL);
INSERT INTO `todo` VALUES (1080, 53, '2020-06-24 10:00:00', '2020-06-24 10:30:00', 2, 'Gọi dt KH của Chị Hằng ', NULL);
INSERT INTO `todo` VALUES (1081, 53, '2020-06-24 09:30:00', '2020-06-24 10:00:00', 2, 'Chị Oanh nhờ lọc ds KH tiền gửi của phòng trà nóc  để gọi chào sp mới cho KH ', NULL);
INSERT INTO `todo` VALUES (1082, 3, '2020-06-24 11:00:00', '2020-06-24 11:30:00', 2, 'Gọi ĐT nhắc nợ quá hạn', NULL);
INSERT INTO `todo` VALUES (1083, 52, '2020-06-25 07:29:00', '2020-06-25 08:29:00', 2, 'Gặp khách có nhu cầu vay', 'accepted');
INSERT INTO `todo` VALUES (1084, 52, '2020-06-25 09:00:00', '2020-06-25 00:00:00', 2, 'Xử lý hồ sơ Nguyễn Thị Sửa', NULL);
INSERT INTO `todo` VALUES (1085, 53, '2020-06-25 09:30:00', '2020-06-25 11:00:00', 2, 'Gọi dt KH ', NULL);
INSERT INTO `todo` VALUES (1087, 53, '2020-06-25 13:15:00', '2020-06-25 14:00:00', 2, 'Lấy bộ hđ giấy cho khách của a Thành ', NULL);
INSERT INTO `todo` VALUES (1088, 53, '2020-06-25 14:30:00', '2020-06-25 15:50:00', 2, 'Gọi dt KH ', NULL);
INSERT INTO `todo` VALUES (1089, 3, '2020-06-25 11:00:00', '2020-06-25 11:30:00', 2, 'Gọi ĐT nhắc nợ quá hạn', NULL);
INSERT INTO `todo` VALUES (1090, 3, '2020-06-25 15:00:00', '2020-06-25 15:30:00', 2, 'Trình HS thẻ tín dụng KH Đinh Hoàng Bảo Long', NULL);
INSERT INTO `todo` VALUES (1091, 3, '2020-06-25 17:00:00', '2020-06-25 17:30:00', 2, 'Gặp cô Diện đi chứng từ cho chị Oanh và lấy chứng từ hồ sơ vay sau giải ngân ', NULL);
INSERT INTO `todo` VALUES (1092, 6, '2020-06-25 14:16:00', '2020-06-25 00:00:00', 2, 'Làm hs thẻ TD Vinh', NULL);
INSERT INTO `todo` VALUES (1093, 6, '2020-06-25 15:17:00', '2020-06-25 00:00:00', 2, 'Đt nhắc nợ quá', NULL);
INSERT INTO `todo` VALUES (1094, 6, '2020-06-25 11:21:00', '2020-06-25 00:00:00', 2, 'Liên hệ hs a Chiến', NULL);
INSERT INTO `todo` VALUES (1095, 3, '2020-06-26 08:30:00', '2020-06-26 09:00:00', 2, 'Gọi ĐT chị Hân tư vấn vay thêm', NULL);
INSERT INTO `todo` VALUES (1096, 3, '2020-06-26 09:30:00', '2020-06-26 10:00:00', 2, 'Gọi ĐT anh Dũng tư vấn vay', NULL);
INSERT INTO `todo` VALUES (1097, 3, '2020-06-26 11:00:00', '2020-06-26 11:30:00', 2, 'Gọi ĐT nhắc nợ quá hạn', NULL);
INSERT INTO `todo` VALUES (1098, 3, '2020-06-26 16:30:00', '2020-06-26 17:00:00', 2, 'Bàn giao HS đã giải ngân', NULL);
INSERT INTO `todo` VALUES (1099, 6, '2020-06-26 10:42:00', '2020-06-26 00:00:00', 2, 'Đưa giấy đi đường a Toàn và tư vấn BH thêm', NULL);
INSERT INTO `todo` VALUES (1100, 6, '2020-06-26 13:42:00', '2020-06-26 00:00:00', 2, 'Liên hệ a Chiến về hồ sơ', NULL);
INSERT INTO `todo` VALUES (1101, 53, '2020-06-26 09:00:00', '2020-06-26 10:30:00', 2, 'Gọi dt KH ', NULL);
INSERT INTO `todo` VALUES (1102, 6, '2020-06-26 14:43:00', '2020-06-26 00:00:00', 2, 'Đt nhắc nợ quá hạn', NULL);
INSERT INTO `todo` VALUES (1103, 53, '2020-06-26 10:40:00', '2020-06-26 11:45:00', 2, 'Đi đưa giấy cho KH ký thư xác nhận điện tử và đi nộp giấy thư xác nhận điện tử của kh a Hưng và a Phương ', NULL);
INSERT INTO `todo` VALUES (1104, 53, '2020-06-26 08:20:00', '2020-06-26 08:30:00', 2, 'Đánh BMH cho khách a Thành tên Trần Văn Toàn ', NULL);
INSERT INTO `todo` VALUES (1105, 53, '2020-06-26 14:20:00', '2020-06-26 03:55:00', 2, 'Gọi dt chào sp mới ', NULL);
INSERT INTO `todo` VALUES (1106, 3, '2020-06-29 08:30:00', '2020-06-29 09:00:00', 2, 'Gặp KH Đỗ Văn Tiến trả thẻ tín dụng và hướng dẫn KH kích hoạt thẻ', 'accepted');
INSERT INTO `todo` VALUES (1107, 3, '2020-06-29 09:30:00', '2020-06-29 10:00:00', 2, 'Gửi định giá KH Nguyễn Ngọc Hân vay thêm', NULL);
INSERT INTO `todo` VALUES (1108, 3, '2020-06-29 10:00:00', '2020-06-29 11:00:00', 2, 'Làm HS vay góp lương KH Nguyễn Xuân Thiện', NULL);
INSERT INTO `todo` VALUES (1109, 3, '2020-06-29 11:00:00', '2020-06-29 11:30:00', 2, 'Gọi ĐT nhắc nợ quá hạn', NULL);
INSERT INTO `todo` VALUES (1110, 52, '2020-06-29 08:32:00', '2020-06-29 09:32:00', 2, 'Họp đầu ngày', NULL);
INSERT INTO `todo` VALUES (1111, 52, '2020-06-29 09:33:00', '1970-01-01 00:00:00', 2, 'Xử lý hồ sơ Nguyễn Thị Sửa', NULL);
INSERT INTO `todo` VALUES (1112, 53, '2020-06-29 09:00:00', '2020-06-29 10:30:00', 2, 'Họp huddle', NULL);
INSERT INTO `todo` VALUES (1113, 53, '2020-06-29 10:50:00', '2020-06-29 11:30:00', 2, 'Nộp thư xác nhận OTP của cô Trang khách a Thành ', NULL);
INSERT INTO `todo` VALUES (1114, 53, '2020-06-29 14:30:00', '2020-06-29 15:50:00', 2, 'Gọi dt KH ', NULL);
INSERT INTO `todo` VALUES (1115, 53, '2020-06-29 10:20:00', '2020-06-29 10:45:00', 2, 'Gọi dt cho Cô Phúc ', NULL);
INSERT INTO `todo` VALUES (1116, 6, '2020-06-29 13:21:00', '2020-06-29 00:00:00', 2, 'Đi làm xác nhận cô Trang', NULL);
INSERT INTO `todo` VALUES (1117, 6, '2020-06-29 13:22:00', '2020-06-29 00:00:00', 2, 'Đt nhắc nợ quá hạn', NULL);
INSERT INTO `todo` VALUES (1118, 53, '2020-06-30 07:30:00', '2020-06-30 09:00:00', 2, 'Gặp cô hiệu trưởng tuổi hoa với a Nhân ', NULL);
INSERT INTO `todo` VALUES (1119, 53, '2020-06-30 09:30:00', '2020-06-30 11:00:00', 2, 'Gọi dt KH ', NULL);
INSERT INTO `todo` VALUES (1120, 53, '2020-06-30 13:20:00', '2020-06-30 01:50:00', 2, 'Đánh lại BMH chị Yến cho chị Nga để 5tay chốt KH ', NULL);
INSERT INTO `todo` VALUES (1121, 53, '2020-06-30 02:30:00', '2020-06-30 03:45:00', 2, 'Gọi dt KH ', NULL);
INSERT INTO `todo` VALUES (1122, 3, '2020-06-30 08:30:00', '2020-06-30 09:00:00', 2, 'Gặp KH Nguyễn Xuân Thiện cho ký HS vay', 'accepted');
INSERT INTO `todo` VALUES (1123, 3, '2020-06-30 17:00:00', '2020-06-30 17:30:00', 2, 'Bàn giao HS đã giải ngân', NULL);
INSERT INTO `todo` VALUES (1124, 3, '2020-06-30 14:00:00', '2020-06-30 14:30:00', 2, 'Gọi ĐT nhắc nợ quá hạn', NULL);
INSERT INTO `todo` VALUES (1125, 6, '2020-06-30 10:29:00', '2020-06-30 00:00:00', 2, 'Đt a Chiến xem ký thỏa thuận hợp tác', NULL);
INSERT INTO `todo` VALUES (1126, 6, '2020-06-30 15:29:00', '2020-06-30 00:00:00', 2, 'Đt nhắc nợ quá hạn', NULL);
INSERT INTO `todo` VALUES (1127, 6, '2020-06-30 14:30:00', '2020-06-30 00:00:00', 2, 'Đt KH My tư vấn gửi tiền quay số trúng thưởng', NULL);
INSERT INTO `todo` VALUES (1128, 3, '2020-07-01 08:30:00', '2020-07-01 09:30:00', 2, 'Đi định giá HS KH Nguyễn Ngọc Hân', 'accepted');
INSERT INTO `todo` VALUES (1129, 3, '2020-07-01 14:00:00', '2020-07-01 14:30:00', 2, 'Trình HS vay góp lương KH Nguyễn Xuân Thiện', NULL);
INSERT INTO `todo` VALUES (1130, 3, '2020-07-01 11:00:00', '2020-07-01 11:30:00', 2, 'Gọi ĐT nhắc nợ quá hạn', NULL);
INSERT INTO `todo` VALUES (1131, 53, '2020-07-01 09:15:00', '2020-07-01 10:45:00', 2, 'Gọi dt KH', NULL);
INSERT INTO `todo` VALUES (1132, 53, '2020-07-01 11:00:00', '2020-07-01 11:45:00', 2, 'Hỏi thông tin mấy anh/chị dự báo các case bh trong tháng 7', NULL);
INSERT INTO `todo` VALUES (1133, 52, '1970-01-01 00:00:00', '1970-01-01 00:00:00', 1, 'Trình HS Nguyễn Thị Sửa', NULL);
INSERT INTO `todo` VALUES (1134, 53, '2020-07-01 14:15:00', '2020-07-01 15:50:00', 2, 'Gọi dt chào sp ', NULL);
INSERT INTO `todo` VALUES (1135, 3, '2020-07-01 10:30:00', '2020-07-01 11:00:00', 2, 'Làm giấy đi đường KH Trần Văn Hải', NULL);
INSERT INTO `todo` VALUES (1136, 52, '2020-06-30 07:52:00', '2020-07-02 08:32:00', 1, 'Gặp khách hàng', 'denied');
INSERT INTO `todo` VALUES (1137, 53, '2020-07-02 15:36:00', '2020-07-02 16:36:00', 2, 'Đánh BMH', NULL);
INSERT INTO `todo` VALUES (1138, 3, '2020-07-03 14:00:00', '2020-07-03 14:30:00', 2, 'Trình HS vay góp lương KH Nguyễn Xuân Thiện', NULL);
INSERT INTO `todo` VALUES (1139, 3, '2020-07-03 08:30:00', '2020-07-03 09:00:00', 2, 'Gọi ĐT KH Lê Minh Út tư vấn vay', NULL);
INSERT INTO `todo` VALUES (1140, 3, '2020-07-03 09:30:00', '2020-07-03 10:00:00', 2, 'Gọi ĐT KH Nguyễn Hoàng Dũng tư vấn vay', NULL);
INSERT INTO `todo` VALUES (1141, 3, '2020-07-03 11:00:00', '2020-07-03 11:30:00', 2, 'Gọi ĐT nhắc nợ quá hạn', NULL);
INSERT INTO `todo` VALUES (1142, 3, '2020-07-03 15:30:00', '2020-07-03 16:30:00', 2, 'Gặp chị Khương tư vấn vay', NULL);
INSERT INTO `todo` VALUES (1143, 52, '2020-07-03 09:33:00', '2020-07-03 11:33:00', 1, 'Up hồ sơ Nguyễn Thị Sửa', NULL);
INSERT INTO `todo` VALUES (1144, 52, '1970-01-01 00:00:00', '2020-07-03 09:34:00', 1, 'Ra ngoài tìm khách hàng', NULL);
INSERT INTO `todo` VALUES (1145, 53, '2020-07-03 09:25:00', '2020-07-03 09:45:00', 2, 'Đánh BMH cho khách chị Nga tên Lê Quang Vinh', NULL);
INSERT INTO `todo` VALUES (1146, 52, '2020-07-03 10:33:00', '1970-01-01 00:00:00', 1, 'Hẹn gặp khách hàng', NULL);
INSERT INTO `todo` VALUES (1147, 53, '2020-07-03 10:00:00', '2020-07-03 11:00:00', 2, 'Gọi dt kh', NULL);
INSERT INTO `todo` VALUES (1148, 53, '2020-07-03 14:00:00', '2020-07-03 18:00:00', 2, 'Học bảo hiểm phi nhân thọ của Bảo Việt', NULL);
INSERT INTO `todo` VALUES (1149, 3, '2020-07-06 08:30:00', '2020-07-06 09:00:00', 2, 'Gửi định giá HS KH Nguyễn Hoàng Đức', NULL);
INSERT INTO `todo` VALUES (1150, 3, '2020-07-06 09:00:00', '2020-07-06 09:30:00', 2, 'Gọi ĐT KH Lê Minh Út thu thập HS vay', NULL);
INSERT INTO `todo` VALUES (1151, 3, '2020-07-06 10:00:00', '2020-07-06 10:30:00', 2, 'Soạn HS vay KH Nguyễn Ngọc Hân', NULL);
INSERT INTO `todo` VALUES (1152, 3, '2020-07-06 11:00:00', '2020-07-06 11:30:00', 2, 'Gọi ĐT nhắc nợ quá hạn', NULL);
INSERT INTO `todo` VALUES (1153, 3, '2020-07-06 17:00:00', '2020-07-06 17:30:00', 2, 'Bàn giao HS giải ngân', NULL);
INSERT INTO `todo` VALUES (1154, 53, '2020-07-06 08:00:00', '2020-07-06 09:30:00', 2, 'Họp huddle', NULL);
INSERT INTO `todo` VALUES (1155, 53, '2020-07-06 09:45:00', '2020-07-06 11:00:00', 2, 'Gọi dt KH ', NULL);
INSERT INTO `todo` VALUES (1156, 53, '2020-07-06 13:15:00', '2020-07-06 01:45:00', 2, 'Đánh BMH cho chị Nga ', NULL);
INSERT INTO `todo` VALUES (1157, 53, '2020-07-06 14:20:00', '2020-07-06 15:00:00', 2, 'Gọi dt KH ', NULL);
INSERT INTO `todo` VALUES (1160, 52, '1970-01-01 00:00:00', '1970-01-01 00:00:00', 1, 'Đi gặp khách hàng làm thẻ tín dụng', NULL);
INSERT INTO `todo` VALUES (1161, 52, '1970-01-01 00:00:00', '1970-01-01 00:00:00', 1, 'Đi gặp khách hàng có nhu cầu làm thẻ tín dụng', NULL);
INSERT INTO `todo` VALUES (1162, 52, '1970-01-01 00:00:00', '1970-01-01 00:00:00', 1, 'Đi gặp khách hàng có nhu cầu làm thẻ tín dụng', NULL);
INSERT INTO `todo` VALUES (1163, 52, '2020-07-07 05:58:00', '2020-07-07 10:58:00', 2, 'Đi cờ đỏ lấy ts thế chấp', NULL);
INSERT INTO `todo` VALUES (1164, 52, '2020-07-07 11:00:00', '1970-01-01 00:00:00', 2, 'Giải ngân HS Nguyễn Thị Sửa', NULL);
INSERT INTO `todo` VALUES (1165, 3, '2020-07-07 08:30:00', '2020-07-07 09:00:00', 2, 'Bổ sung HS vay KH Nguyễn Xuân Thiện', NULL);
INSERT INTO `todo` VALUES (1166, 3, '2020-07-07 09:00:00', '2020-07-07 09:30:00', 2, 'Đi định giá HS KH Hoàng Văn Đức', NULL);
INSERT INTO `todo` VALUES (1167, 3, '2020-07-07 11:00:00', '2020-07-07 11:30:00', 2, 'Gọi ĐT nhắc nợ quá hạn', NULL);
INSERT INTO `todo` VALUES (1168, 3, '2020-07-07 15:45:00', '2020-07-07 16:30:00', 2, 'Gặp KH Anh Vinh tư vấn vay', NULL);
INSERT INTO `todo` VALUES (1169, 3, '2020-07-07 16:50:00', '2020-07-07 17:15:00', 2, 'Bàn giao HS giải ngân', NULL);
INSERT INTO `todo` VALUES (1170, 3, '2020-07-08 08:30:00', '2020-07-08 09:00:00', 2, 'Soạn hồ sơ KH Hoàng Văn Đức', NULL);
INSERT INTO `todo` VALUES (1171, 3, '2020-07-08 10:00:00', '2020-07-08 11:00:00', 2, 'Gặp anh Phước Nhân thẩm định tài sản và thu thập HS', NULL);
INSERT INTO `todo` VALUES (1172, 3, '2020-07-08 11:00:00', '2020-07-08 11:30:00', 2, 'Gọi ĐT nhắc nợ quá hạn', NULL);
INSERT INTO `todo` VALUES (1173, 3, '2020-07-08 14:00:00', '2020-07-08 14:30:00', 2, 'Giải ngân HS Nguyễn Xuân Thiện', NULL);
INSERT INTO `todo` VALUES (1174, 52, '2020-07-08 09:21:00', '2020-07-08 08:21:00', 2, 'Gặp khách hàng', 'accepted');
INSERT INTO `todo` VALUES (1175, 52, '2020-07-08 09:21:00', '2020-07-08 11:22:00', 1, 'Xử lý hs thẻ tín dụng', NULL);
INSERT INTO `todo` VALUES (1176, 52, '2020-07-08 01:22:00', '1970-01-01 00:00:00', 2, 'Hen gặp khách huy động tien gửi', NULL);
INSERT INTO `todo` VALUES (1177, 52, '1970-01-01 00:00:00', '1970-01-01 00:00:00', 1, 'Úp hồ sơ định giá', NULL);
INSERT INTO `todo` VALUES (1178, 3, '2020-07-09 08:30:00', '2020-07-09 09:00:00', 2, 'Thu nợ trước hạn HS KH Nguyễn Xuân Thiện', NULL);
INSERT INTO `todo` VALUES (1179, 3, '2020-07-09 09:00:00', '2020-07-09 09:30:00', 2, 'Gọi ĐT KH Dương tư vấn vay vốn', NULL);
INSERT INTO `todo` VALUES (1180, 3, '2020-07-09 10:30:00', '2020-07-09 11:00:00', 2, 'Gọi ĐT nhắc nợ quá hạn', NULL);
INSERT INTO `todo` VALUES (1181, 3, '2020-07-10 08:00:00', '2020-07-10 08:30:00', 1, 'Gặp KH Phước Nhân thẩm định HS', 'accepted');
INSERT INTO `todo` VALUES (1182, 3, '2020-07-10 09:00:00', '2020-07-10 09:30:00', 1, 'Gọi ĐT KH Anh Út thu thập HS', NULL);
INSERT INTO `todo` VALUES (1183, 3, '2020-07-10 11:00:00', '2020-07-10 11:30:00', 1, 'Gọi ĐT nhắc nợ quá hạn', NULL);
INSERT INTO `todo` VALUES (1184, 3, '2020-07-10 10:00:00', '2020-07-10 10:30:00', 1, 'Gọi KH Anh Vương thẩm định tài sản và thu nhập HS', NULL);
INSERT INTO `todo` VALUES (1185, 52, '2020-07-10 07:42:00', '2020-07-10 08:42:00', 2, 'Gặp khách hàng', 'accepted');
INSERT INTO `todo` VALUES (1186, 52, '2020-07-10 09:42:00', '2020-07-10 10:42:00', 2, 'Gởi hồ sơ định giá', NULL);
INSERT INTO `todo` VALUES (1187, 53, '2020-07-10 09:30:00', '2020-07-10 10:30:00', 2, 'Gọi dt nhắc phí KH ', NULL);
INSERT INTO `todo` VALUES (1188, 53, '2020-07-10 14:30:00', '2020-07-10 16:00:00', 2, 'Gọi dt KH ', NULL);
INSERT INTO `todo` VALUES (1189, 53, '2020-07-10 09:40:00', '2020-07-10 10:15:00', 2, 'Đánh BMH cho KH chị Muội', NULL);
INSERT INTO `todo` VALUES (1190, 3, '2020-07-10 14:30:00', '2020-07-10 15:00:00', 1, 'Gửi định giá KH Nguyễn Phước Nhân', NULL);
INSERT INTO `todo` VALUES (1191, 3, '2020-07-13 09:00:00', '2020-07-13 10:30:00', 2, 'Soạn HS KH Hoàng Văn Đức', NULL);
INSERT INTO `todo` VALUES (1192, 3, '2020-07-13 11:00:00', '2020-07-13 11:30:00', 2, 'Gọi ĐT nhắc nợ quá hạn', NULL);
INSERT INTO `todo` VALUES (1193, 3, '2020-07-13 14:00:00', '2020-07-13 14:30:00', 2, 'Gọi ĐT KH Dương tư vấn vay', NULL);
INSERT INTO `todo` VALUES (1194, 3, '2020-07-13 15:00:00', '2020-07-13 15:30:00', 2, 'Thu nợ một phần KH Huỳnh Thứ Phát', NULL);
INSERT INTO `todo` VALUES (1195, 3, '2020-07-13 16:00:00', '2020-07-13 16:30:00', 2, 'Gọi ĐT KH Nguyễn Quốc Thảo tư vấn vay', NULL);
INSERT INTO `todo` VALUES (1196, 52, '2020-07-13 08:00:00', '2020-07-13 08:47:00', 2, 'Họp đầu ngày', NULL);
INSERT INTO `todo` VALUES (1197, 52, '2020-07-13 10:00:00', '2020-07-13 00:00:00', 2, 'Trình lại hồ sơ Nguyễn Thanh Trúc', NULL);
INSERT INTO `todo` VALUES (1198, 3, '2020-07-13 13:30:00', '2020-07-13 14:00:00', 2, 'Thu nợ một phần KH Nguyễn Ngọc Phúc', NULL);
INSERT INTO `todo` VALUES (1199, 52, '2020-07-13 14:03:00', '2020-07-13 15:34:00', 2, 'Gặp khách hàng ', NULL);
INSERT INTO `todo` VALUES (1200, 53, '2020-07-14 08:35:00', '2020-07-14 08:45:00', 2, 'Đánh BMH Chị Nhàn Khách của chị Hằng', NULL);
INSERT INTO `todo` VALUES (1201, 53, '2020-07-14 09:30:00', '2020-07-14 10:45:00', 2, 'Gọi dt chào KH ', NULL);
INSERT INTO `todo` VALUES (1202, 53, '2020-07-14 08:50:00', '2020-07-14 09:00:00', 2, 'Đánh BMH Chị Châu khách gửi tiền ', NULL);
INSERT INTO `todo` VALUES (1203, 53, '2020-07-14 14:30:00', '2020-07-14 15:45:00', 2, 'Gọi dt khách hàng', NULL);
INSERT INTO `todo` VALUES (1204, 3, '2020-07-14 09:00:00', '2020-07-14 09:30:00', 2, 'Hỗ trợ anh Hưng đi định giá', NULL);
INSERT INTO `todo` VALUES (1205, 3, '2020-07-14 10:30:00', '2020-07-14 11:30:00', 2, 'Gặp KH vay a Hiếu tư vấn vay', NULL);
INSERT INTO `todo` VALUES (1206, 3, '2020-07-14 14:00:00', '2020-07-14 14:30:00', 2, 'Gọi ĐT nhắc nợ quá hạn', NULL);
INSERT INTO `todo` VALUES (1207, 3, '2020-07-14 15:00:00', '2020-07-14 15:30:00', 2, 'Thu nợ trước hạn KH Huỳnh Thứ Phát', NULL);
INSERT INTO `todo` VALUES (1208, 3, '2020-07-14 16:30:00', '2020-07-14 17:00:00', 2, 'Bàn giao HS nguyễn hữu thạnh cho xử lý nợ', NULL);
INSERT INTO `todo` VALUES (1209, 52, '2020-07-15 07:54:00', '2020-07-15 08:30:00', 2, 'Lên chi nhánh lấy đồ dùm Hương', 'accepted');
INSERT INTO `todo` VALUES (1210, 52, '2020-07-15 09:00:00', '2020-07-15 11:56:00', 2, ' Soạn tờ trinh thẻ tin dụng', NULL);
INSERT INTO `todo` VALUES (1211, 52, '2020-07-15 14:00:00', '2020-07-15 15:30:00', 2, 'Đi công chứng hồ sơ bảo đảm Trúc', NULL);
INSERT INTO `todo` VALUES (1212, 53, '2020-07-15 09:20:00', '2020-07-15 10:45:00', 2, 'Gọi dt cho khách ', NULL);
INSERT INTO `todo` VALUES (1213, 3, '2020-07-15 08:30:00', '2020-07-15 09:00:00', 2, 'Hỗ trợ bạn thành đi định giá', 'accepted');
INSERT INTO `todo` VALUES (1214, 3, '2020-07-15 09:00:00', '2020-07-15 09:30:00', 2, 'Gọi ĐT KH anh Chiêu để thu thập HS', NULL);
INSERT INTO `todo` VALUES (1215, 3, '2020-07-15 10:30:00', '2020-07-15 11:00:00', 2, 'Gọi ĐT nhắc nợ quá hạn', NULL);
INSERT INTO `todo` VALUES (1216, 53, '2020-07-15 08:25:00', '2020-07-15 09:15:00', 2, 'Làm sổ sách cho chị Hương', NULL);
INSERT INTO `todo` VALUES (1217, 53, '2020-07-15 14:30:00', '2020-07-15 15:45:00', 2, 'Gọi dt khách hàng mới ', NULL);
INSERT INTO `todo` VALUES (1218, 3, '2020-07-15 14:00:00', '2020-07-15 14:30:00', 2, 'Gọi ĐT KH Minh Út thu thập HS', NULL);
INSERT INTO `todo` VALUES (1219, 3, '2020-07-15 14:30:00', '2020-07-15 15:30:00', 2, 'Gặp KH anh lý tư vấn vay', NULL);
INSERT INTO `todo` VALUES (1220, 3, '2020-07-16 08:15:00', '2020-07-16 09:00:00', 2, 'Đi định giá HS KH Nguyễn Phước Nhân', NULL);
INSERT INTO `todo` VALUES (1221, 3, '2020-07-16 09:00:00', '2020-07-16 09:30:00', 2, 'Gọi ĐT anh Hiếu bổ sung HS còn thiếu', NULL);
INSERT INTO `todo` VALUES (1222, 3, '2020-07-16 15:00:00', '2020-07-16 16:30:00', 2, 'Hỗ trợ anh Phương đi định giá', NULL);
INSERT INTO `todo` VALUES (1223, 3, '2020-07-16 11:00:00', '2020-07-16 11:30:00', 2, 'Gọi ĐT nhắc nợ quá hạn', NULL);
INSERT INTO `todo` VALUES (1224, 52, '2020-07-16 08:00:00', '2020-07-16 10:07:00', 2, 'Soạn hồ sơ thẻ tín dụng', NULL);
INSERT INTO `todo` VALUES (1225, 52, '2020-07-16 10:11:00', '2020-07-16 00:02:00', 2, 'Gặp khách hàng huy động vốn', NULL);
INSERT INTO `todo` VALUES (1226, 52, '2020-07-16 14:03:00', '2020-07-16 17:03:00', 2, 'Đi định giá tài sản ', NULL);
INSERT INTO `todo` VALUES (1227, 52, '2020-07-17 08:23:00', '2020-07-17 10:23:00', 1, 'Giải ngân hồ sơ Nguyễn Thanh Trúc', NULL);
INSERT INTO `todo` VALUES (1228, 52, '2020-07-17 10:24:00', '2020-07-17 00:00:00', 1, 'Úp hồ sơ thẻ tín dụng ', NULL);
INSERT INTO `todo` VALUES (1229, 3, '2020-07-17 09:00:00', '2020-07-17 09:30:00', 2, 'Gọi anh Quốc Thảo tư vấn vay', NULL);
INSERT INTO `todo` VALUES (1230, 53, '2020-07-17 08:00:00', '2020-07-17 10:00:00', 2, 'Họp huddle', NULL);
INSERT INTO `todo` VALUES (1231, 53, '2020-07-17 10:10:00', '2020-07-17 11:00:00', 2, 'Nộp thư bàn giao hđ của khách a Hưng ', NULL);
INSERT INTO `todo` VALUES (1232, 53, '2020-07-17 02:15:00', '2020-07-17 03:45:00', 2, 'Gọi dt KH ', NULL);
INSERT INTO `todo` VALUES (1233, 3, '2020-07-17 09:30:00', '2020-07-17 10:00:00', 2, 'Gọi ĐT anh Vương tư vấn vay', NULL);
INSERT INTO `todo` VALUES (1234, 3, '2020-07-17 11:00:00', '2020-07-17 11:30:00', 2, 'Gọi ĐT nhắc nợ quá hạn', NULL);
INSERT INTO `todo` VALUES (1235, 3, '2020-07-17 15:00:00', '2020-07-17 16:00:00', 1, 'Gặp anh út thu thập HS', NULL);
INSERT INTO `todo` VALUES (1236, 3, '2020-07-20 08:30:00', '2020-07-20 09:00:00', 2, 'Gửi định giá HS KH Lê Minh Út', NULL);
INSERT INTO `todo` VALUES (1237, 6, '2020-07-20 07:46:00', '2020-07-20 08:10:00', 2, 'Gặp cô Trang đưa hs xác nhận đất', 'denied');
INSERT INTO `todo` VALUES (1238, 52, '2020-07-20 08:07:00', '2020-07-20 10:07:00', 2, 'Trình hs thẻ tín dụng', NULL);
INSERT INTO `todo` VALUES (1239, 52, '2020-07-20 10:18:00', '1970-01-01 00:00:00', 2, 'Xử lý hồ sơ Huỳnh Văn Điền', NULL);
INSERT INTO `todo` VALUES (1240, 52, '2020-07-20 08:00:00', '2020-07-20 08:10:00', 2, 'Họp đầu tuần', NULL);
INSERT INTO `todo` VALUES (1241, 3, '2020-07-20 11:00:00', '2020-07-20 11:30:00', 2, 'Gọi ĐT nhắc nợ quá hạn', NULL);
INSERT INTO `todo` VALUES (1242, 53, '2020-07-20 08:20:00', '2020-07-20 09:09:00', 2, 'Đánh BMH và tv cho khách đến gửi tiền tk', NULL);
INSERT INTO `todo` VALUES (1243, 53, '2020-07-20 17:00:00', '2020-07-20 18:00:00', 2, 'Làm hđ bh cho khách chị Hương', NULL);
INSERT INTO `todo` VALUES (1244, 53, '2020-07-20 14:20:00', '2020-07-20 15:45:00', 2, 'GỌI DT KH', NULL);
INSERT INTO `todo` VALUES (1245, 53, '2020-07-20 09:30:00', '2020-07-20 10:10:00', 2, 'HỌP HUDDLE Ở QUÁN', NULL);
INSERT INTO `todo` VALUES (1246, 53, '2020-07-21 08:00:00', '2020-07-21 09:00:00', 2, 'Nộp giấy tờ để huỷ hđ cho Chị Nga ', 'accepted');
INSERT INTO `todo` VALUES (1247, 53, '2020-07-21 09:30:00', '2020-07-21 11:00:00', 2, 'Gọi dt KH', NULL);
INSERT INTO `todo` VALUES (1248, 53, '2020-07-21 11:05:00', '2020-07-21 11:45:00', 2, 'Làm hđ 20tr cho chị Hương', NULL);
INSERT INTO `todo` VALUES (1249, 53, '2020-07-21 14:20:00', '2020-07-21 15:45:00', 2, 'Gọi dt KH', NULL);
INSERT INTO `todo` VALUES (1250, 53, '2020-07-21 17:00:00', '2020-07-21 06:00:00', 2, 'Gặp kh tại ngân hàng để bổ sung lại hđ 16tr Khách Trương Bùi Vân Anh hôm qua ', NULL);
INSERT INTO `todo` VALUES (1251, 52, '2020-07-22 07:46:00', '2020-07-22 08:16:00', 2, 'Lên chi nhánh lấy máy in', 'accepted');
INSERT INTO `todo` VALUES (1253, 3, '2020-07-23 09:15:00', '2020-07-23 10:15:00', 2, 'Soạn hồ sơ góp lương KH Phan Công Quyền', NULL);
INSERT INTO `todo` VALUES (1255, 3, '2020-07-23 10:15:00', '2020-07-23 11:15:00', 2, 'Soạn hồ sơ vay thấu chi CBNV chị Nga và chị Hằng', NULL);
INSERT INTO `todo` VALUES (1256, 3, '2020-07-23 11:15:00', '2020-07-23 00:00:00', 2, 'Gọi ĐT nhắc nợ quá hạn', NULL);
INSERT INTO `todo` VALUES (1257, 3, '2020-07-23 14:00:00', '2020-07-23 14:30:00', 2, 'Gọi ĐT anh Chiêu chốt HS vay', NULL);
INSERT INTO `todo` VALUES (1258, 3, '2020-07-23 15:00:00', '2020-07-23 16:00:00', 2, 'Bàn giao HS quá hạn cho xử lý nợ', NULL);
INSERT INTO `todo` VALUES (1259, 52, '2020-07-23 08:04:00', '2020-07-23 00:00:00', 2, 'Trình và giải ngân hs thâu chi Huỳnh Văn Điền', NULL);
INSERT INTO `todo` VALUES (1260, 52, '1970-01-01 00:00:00', '1970-01-01 00:00:00', 1, 'Ra ngoài tìm khách hàng huy động và mở gói tk', NULL);
INSERT INTO `todo` VALUES (1261, 52, '1970-01-01 00:00:00', '1970-01-01 00:00:00', 1, 'Ra ngoài tìm khách huu động và mở gói tk', NULL);
INSERT INTO `todo` VALUES (1262, 52, '2020-07-23 13:35:00', '2020-07-23 14:35:00', 2, 'Gặp khách mở gói tk và huy động', NULL);
INSERT INTO `todo` VALUES (1263, 53, '2020-07-23 11:00:00', '2020-07-23 00:00:00', 2, 'Đi nộp hồ sơ của khách NGUYỄN THỊ MUỘI', NULL);
INSERT INTO `todo` VALUES (1264, 6, '2020-07-23 09:37:00', '2020-07-23 00:00:00', 2, 'Họp hubdle', NULL);
INSERT INTO `todo` VALUES (1265, 6, '2020-07-23 11:37:00', '2020-07-23 00:00:00', 2, 'Thu thập hs cô Trang', NULL);
INSERT INTO `todo` VALUES (1266, 6, '2020-07-23 14:38:00', '2020-07-23 00:00:00', 2, 'Làm bàn giao hs Trần Thái Sơn', NULL);
INSERT INTO `todo` VALUES (1267, 6, '2020-07-23 15:38:00', '2020-07-23 00:00:00', 2, 'Gọi đt nhắc nợ quá hạn KH', NULL);
INSERT INTO `todo` VALUES (1268, 53, '2020-07-23 14:00:00', '2020-07-23 16:00:00', 2, 'Gọi dt Trường MN tuổi hoa ', NULL);
INSERT INTO `todo` VALUES (1269, 53, '2020-07-23 20:00:00', '2020-07-23 21:30:00', 2, 'Gặp KH tv bh ở quán cfe Diamond ', NULL);
INSERT INTO `todo` VALUES (1270, 8, '2020-07-23 08:00:00', '2020-07-23 09:00:00', 2, 'Họp huddle đầu ngày', NULL);
INSERT INTO `todo` VALUES (1271, 8, '2020-07-23 09:00:00', '2020-07-23 11:00:00', 1, 'Gặp KH anh Trần Văn Tâm nhu cầu vay mua đất 700trđ', NULL);
INSERT INTO `todo` VALUES (1272, 8, '2020-07-23 11:00:00', '2020-07-23 00:00:00', 1, 'Chụp hình thực tế các nguồn thu KH Vương Mỹ Kim', NULL);
INSERT INTO `todo` VALUES (1273, 8, '2020-07-23 13:00:00', '2020-07-23 13:30:00', 1, 'Gặp KH Ngô Xuân Hiến ký đề nghị thu nợ', NULL);
INSERT INTO `todo` VALUES (1274, 8, '2020-07-23 13:30:00', '2020-07-23 15:00:00', 1, 'Trình hồ sơ KH Vương Mỹ Kim', NULL);
INSERT INTO `todo` VALUES (1275, 8, '2020-07-23 15:00:00', '2020-07-23 05:00:00', 1, 'Xử lý hồ sơ KH Đỗ Thị Bé Năm', NULL);
INSERT INTO `todo` VALUES (1276, 52, '2020-07-24 09:02:00', '2020-07-24 11:02:00', 2, 'Hẹn gặp khách', NULL);
INSERT INTO `todo` VALUES (1277, 53, '2020-07-24 08:45:00', '2020-07-24 10:30:00', 2, 'Gọi dt KH ', NULL);
INSERT INTO `todo` VALUES (1278, 52, '2020-07-24 11:04:00', '1970-01-01 00:00:00', 2, 'Soạn hồ sơ KH Nguyễn Tấn Trọng', NULL);
INSERT INTO `todo` VALUES (1279, 53, '2020-07-24 10:45:00', '2020-07-24 11:30:00', 2, 'Nộp thư xác nhận điện tử của KH chị Nga mới ký hđ hôm qua', NULL);
INSERT INTO `todo` VALUES (1280, 53, '2020-07-24 14:15:00', '2020-07-24 15:50:00', 2, 'Gọi dt KH ', NULL);
INSERT INTO `todo` VALUES (1281, 53, '2020-07-24 09:00:00', '2020-07-24 09:15:00', 2, 'Gọi dt lại chị Thuỷ KH hôm bữa tv ', NULL);
INSERT INTO `todo` VALUES (1282, 6, '2020-07-24 13:32:00', '2020-07-24 00:00:00', 1, 'Soạn tờ trình cô Trang', NULL);
INSERT INTO `todo` VALUES (1283, 6, '2020-07-24 15:32:00', '2020-07-24 00:00:00', 1, 'Đt nhắc nợ quá hạn ', NULL);
INSERT INTO `todo` VALUES (1284, 3, '2020-07-27 08:30:00', '2020-07-27 09:00:00', 2, 'Viếng nghĩa trang TP Cần Thơ', 'accepted');
INSERT INTO `todo` VALUES (1285, 3, '2020-07-27 09:30:00', '2020-07-27 10:30:00', 2, 'Soạn HS giải ngân hạn mức KH Đỗ Văn Tiến và Trần Hoàng Hạnh', NULL);
INSERT INTO `todo` VALUES (1286, 3, '2020-07-27 11:00:00', '2020-07-27 11:30:00', 2, 'Gọi ĐT nhắc nợ quá hạn', NULL);
INSERT INTO `todo` VALUES (1288, 53, '2020-07-27 09:00:00', '2020-07-27 10:45:00', 2, 'Gọi dt KH', NULL);
INSERT INTO `todo` VALUES (1289, 53, '2020-07-27 11:00:00', '2020-07-27 11:45:00', 2, 'Nộp thư bàn giao hđ giấy của khách Nguyễn Thị Sửa ở vp Mậu Thân ', NULL);
INSERT INTO `todo` VALUES (1290, 53, '2020-07-27 14:00:00', '2020-07-27 15:50:00', 2, 'Gọi dt ', NULL);
INSERT INTO `todo` VALUES (1291, 53, '2020-07-28 09:00:00', '2020-07-28 10:30:00', 2, 'Gặp KH ở quán cfe Bích Kiều đường Hoàng Văn Thụ khách tên Trần Quang Vinh phụ huynh ở trường tuổi hoa ', NULL);
INSERT INTO `todo` VALUES (1292, 53, '2020-07-28 11:00:00', '2020-07-28 00:14:00', 2, 'Nộp giấy thư bàn của khách Nguyễn Thị Muội ', NULL);
INSERT INTO `todo` VALUES (1293, 52, '2020-07-28 08:14:00', '2020-07-28 11:15:00', 2, 'Biên bản giao nhận hồ sơ tín dụng cho phòng QLTD', NULL);
INSERT INTO `todo` VALUES (1294, 53, '2020-07-28 14:00:00', '2020-07-28 15:55:00', 2, 'Gọi dt cho KH', NULL);
INSERT INTO `todo` VALUES (1295, 53, '2020-07-28 10:30:00', '2020-07-28 10:50:00', 2, 'Liên hệ lại hẹn với Khách tên Chung Văn Nhứt phụ huynh bên trường tuổi hoa', NULL);
INSERT INTO `todo` VALUES (1296, 52, '2020-07-28 08:25:00', '1970-01-01 00:00:00', 2, 'Đinh giá hồ sơ KH Nguyễn Tấn Trọng', NULL);
INSERT INTO `todo` VALUES (1297, 3, '2020-07-28 09:00:00', '2020-07-28 09:30:00', 2, 'Làm báo cáo gửi chi nhánh tây đô', NULL);
INSERT INTO `todo` VALUES (1298, 3, '2020-07-28 15:00:00', '2020-07-28 16:00:00', 2, 'Trình HS thấu chi chị Nga, chị Hằng', NULL);
INSERT INTO `todo` VALUES (1299, 3, '2020-07-28 14:00:00', '2020-07-28 14:30:00', 2, 'Gọi ĐT nhắc nợ quá hạn', NULL);
INSERT INTO `todo` VALUES (1300, 3, '2020-07-28 10:30:00', '2020-07-28 11:00:00', 2, 'Gọi ĐT anh Dương tư vấn vay', NULL);
INSERT INTO `todo` VALUES (1301, 52, '2020-07-29 07:47:00', '2020-07-29 08:47:00', 1, 'Gặp khách mở gói tk', 'denied');
INSERT INTO `todo` VALUES (1302, 52, '2020-07-29 09:00:00', '2020-07-29 02:50:00', 1, 'Tờ trình hs Nguyễn Tấn Trọng', NULL);
INSERT INTO `todo` VALUES (1303, 53, '2020-07-29 08:30:00', '2020-07-29 10:00:00', 2, 'Đi gặp KH  với chị Hương', NULL);
INSERT INTO `todo` VALUES (1304, 53, '2020-07-29 10:00:00', '2020-07-29 11:30:00', 2, 'Gọi dt KH ', NULL);
INSERT INTO `todo` VALUES (1305, 53, '2020-07-29 14:00:00', '2020-07-29 16:00:00', 2, 'Gọi DT KH', NULL);
INSERT INTO `todo` VALUES (1306, 3, '2020-07-29 08:30:00', '2020-07-29 09:00:00', 2, 'Gọi ĐT anh Quốc Thảo tư vấn vay', NULL);
INSERT INTO `todo` VALUES (1307, 3, '2020-07-29 09:00:00', '2020-07-29 09:30:00', 2, 'Gọi ĐT KH Thanh Mai tư vấn vay', NULL);
INSERT INTO `todo` VALUES (1308, 3, '2020-07-29 10:30:00', '2020-07-29 11:00:00', 2, 'Gọi ĐT nhắc nợ quá hạn', NULL);
INSERT INTO `todo` VALUES (1309, 3, '2020-07-29 15:30:00', '2020-07-29 16:00:00', 2, 'Trình HS vay thấu chi CBNV chị Nga, chị Hằng', NULL);
INSERT INTO `todo` VALUES (1310, 3, '2020-07-29 14:00:00', '2020-07-29 15:00:00', 2, 'Gặp KH ký giấy mở TKTT', NULL);
INSERT INTO `todo` VALUES (1311, 53, '2020-07-30 08:40:00', '2020-07-30 09:00:00', 2, 'Đánh BMH cho khách Mai Công Thắng và gửi mail cho KH tham khảo xem ', NULL);
INSERT INTO `todo` VALUES (1312, 53, '2020-07-30 09:15:00', '2020-07-30 11:00:00', 2, 'Gọi dt KH ', NULL);
INSERT INTO `todo` VALUES (1313, 53, '2020-07-30 13:00:00', '2020-07-30 14:00:00', 2, 'Làm chứng từ cho chị Hương', NULL);
INSERT INTO `todo` VALUES (1314, 53, '2020-07-30 14:20:00', '2020-07-30 16:00:00', 2, 'Gọi DT KH', NULL);
INSERT INTO `todo` VALUES (1315, 3, '2020-08-10 09:00:00', '2020-08-10 09:30:00', 2, 'Giải ngân HS hạn mức KH Trần Hoàng Hạnh', NULL);
INSERT INTO `todo` VALUES (1316, 3, '2020-08-10 09:30:00', '2020-08-10 10:30:00', 2, 'Gọi ĐT anh Thanh tư vấn vay', NULL);
INSERT INTO `todo` VALUES (1317, 3, '2020-08-10 10:00:00', '2020-08-10 10:30:00', 2, 'Gọi ĐT anh Việt tư vấn vay', NULL);
INSERT INTO `todo` VALUES (1318, 3, '2020-08-10 11:00:00', '2020-08-10 11:30:00', 2, 'Gọi ĐT nhắc nợ quá hạn', NULL);
INSERT INTO `todo` VALUES (1319, 3, '2020-08-10 13:30:00', '2020-08-10 14:00:00', 2, 'Soạn HS giải ngân hạn mức KH Đỗ Văn Tiến', NULL);
INSERT INTO `todo` VALUES (1320, 52, '2020-08-10 08:46:00', '2020-08-10 09:46:00', 2, 'Họp đầu ngày', NULL);
INSERT INTO `todo` VALUES (1321, 52, '2020-08-10 10:00:00', '2020-08-10 11:47:00', 2, 'Tra số dt danh sách khách hàng lựa chọn trước làm thẻ td', NULL);
INSERT INTO `todo` VALUES (1322, 52, '1970-01-01 00:00:00', '1970-01-01 00:00:00', 1, 'Gặp khách hàng huy động tiền gửi', NULL);
INSERT INTO `todo` VALUES (1323, 52, '1970-01-01 00:00:00', '1970-01-01 00:00:00', 1, 'Gặp khách hàng huy động tiền gửi', NULL);
INSERT INTO `todo` VALUES (1324, 52, '1970-01-01 00:00:00', '1970-01-01 00:00:00', 1, 'Gặp khách huy động tiền gửi', NULL);
INSERT INTO `todo` VALUES (1326, 52, '2020-08-10 13:52:00', '2020-08-10 14:52:00', 2, 'Gặp khách huy động tiền gửi', NULL);
INSERT INTO `todo` VALUES (1327, 3, '2020-08-11 09:00:00', '2020-08-11 09:30:00', 2, 'Thu nợ trước hạn KH Đỗ Văn Tiến', NULL);
INSERT INTO `todo` VALUES (1328, 3, '2020-08-11 09:30:00', '2020-08-11 10:30:00', 2, 'Trình 2 HS vay thấu chi CBNV', NULL);
INSERT INTO `todo` VALUES (1329, 3, '2020-08-11 10:30:00', '2020-08-11 11:00:00', 2, 'Soạn HS vay thấu chi CBNV Thành', NULL);
INSERT INTO `todo` VALUES (1330, 3, '2020-08-11 11:00:00', '2020-08-11 11:30:00', 2, 'Gọi ĐT nhắc nợ quá hạn', NULL);
INSERT INTO `todo` VALUES (1331, 3, '2020-08-11 16:30:00', '2020-08-11 17:30:00', 2, 'Gặp KH chị Ngân và chị Sen mở gói tk', NULL);
INSERT INTO `todo` VALUES (1332, 3, '2020-08-11 14:00:00', '2020-08-11 16:00:00', 2, 'Bổ sung hồ sơ cho Thanh tra NHNN', NULL);
INSERT INTO `todo` VALUES (1333, 6, '2020-08-11 14:00:00', '2020-08-11 16:00:00', 2, 'Bổ sung hồ sơ cho Thanh tra NHNN', NULL);
INSERT INTO `todo` VALUES (1334, 3, '2020-08-12 08:30:00', '2020-08-12 09:00:00', 2, 'Trình 2 HS vay thấu chi CBNV', NULL);
INSERT INTO `todo` VALUES (1335, 3, '2020-08-12 09:00:00', '2020-08-12 09:30:00', 2, 'Giải ngân HS hạn mức KH Đỗ Văn Tiến', NULL);
INSERT INTO `todo` VALUES (1336, 3, '2020-08-12 09:30:00', '2020-08-12 10:00:00', 2, 'Thu nợ trước hạn HS vay hạn mức KH Trần Thị Hồng Hoa', NULL);
INSERT INTO `todo` VALUES (1337, 3, '2020-08-12 10:00:00', '2020-08-12 11:00:00', 2, 'Soạn HS giải ngân hạn mức KH Trần Ngọc Thúy', NULL);
INSERT INTO `todo` VALUES (1338, 3, '2020-08-12 14:00:00', '2020-08-12 14:30:00', 2, 'Gọi ĐT nhắc nợ quá hạn', NULL);
INSERT INTO `todo` VALUES (1339, 3, '2020-08-12 14:30:00', '2020-08-12 15:30:00', 2, 'Soạn HS giải ngân hạn mức KH Trần Thị Hồng Hoa', NULL);
INSERT INTO `todo` VALUES (1340, 52, '2020-08-12 07:49:00', '2020-08-12 08:49:00', 2, 'Gặp khách hàng', NULL);
INSERT INTO `todo` VALUES (1342, 52, '2020-08-12 09:00:00', '2020-08-12 11:50:00', 2, 'Soạn hồ sơ thấu chi Huỳnh Minh Thành', NULL);
INSERT INTO `todo` VALUES (1343, 52, '2020-08-12 13:51:00', '2020-08-12 14:52:00', 2, 'Gọi danh sách khách hàng lựa chọn làm thẻ tín dụng', NULL);
INSERT INTO `todo` VALUES (1344, 53, '2020-08-12 09:00:00', '2020-08-12 10:20:00', 2, 'Họp huddle', NULL);
INSERT INTO `todo` VALUES (1345, 53, '2020-08-12 10:30:00', '2020-08-12 11:15:00', 2, 'Gọi dt KH ', NULL);
INSERT INTO `todo` VALUES (1346, 53, '2020-08-12 13:00:00', '2020-08-12 14:00:00', 2, 'Làm chứng từ cho chị Hương ', NULL);
INSERT INTO `todo` VALUES (1347, 53, '2020-08-12 14:30:00', '2020-08-12 16:00:00', 2, 'Gọi dt KH ', NULL);
INSERT INTO `todo` VALUES (1348, 52, '2020-08-13 08:27:00', '2020-08-13 10:27:00', 2, 'Trinh hồ sơ thấu chi Thành', NULL);
INSERT INTO `todo` VALUES (1349, 52, '2020-08-13 11:48:00', '2020-08-13 14:48:00', 2, 'Tìm kiếm khách hàng', NULL);
INSERT INTO `todo` VALUES (1350, 3, '2020-08-13 08:30:00', '2020-08-13 09:00:00', 2, 'Thu nợ trước hạn HS KH Trần Thị Hồng Hoa', NULL);
INSERT INTO `todo` VALUES (1351, 3, '2020-08-13 09:00:00', '2020-08-13 09:30:00', 2, 'Trình HS thấu chi CBNV', NULL);
INSERT INTO `todo` VALUES (1352, 3, '2020-08-13 10:00:00', '2020-08-13 11:00:00', 2, 'Soạn HS giải ngân hạn mức KH Trần Thị Hồng Hoa', NULL);
INSERT INTO `todo` VALUES (1353, 3, '2020-08-13 14:00:00', '2020-08-13 14:30:00', 2, 'Gọi ĐT nhắc nợ quá hạn', NULL);
INSERT INTO `todo` VALUES (1354, 3, '2020-08-13 15:00:00', '2020-08-13 16:00:00', 2, 'Soạn HS giải ngân hạn mức KH Trần Ngọc Thúy', NULL);
INSERT INTO `todo` VALUES (1355, 52, '2020-08-14 07:47:00', '2020-08-14 08:47:00', 2, 'Hẹn gặp khách', NULL);
INSERT INTO `todo` VALUES (1356, 52, '2020-08-14 07:48:00', '2020-08-14 11:48:00', 2, 'Soạn hs bàn giao lại phòng hỗ trợ tín dụng\r\n', NULL);
INSERT INTO `todo` VALUES (1357, 3, '2020-08-14 09:30:00', '2020-08-14 10:00:00', 1, 'Bổ sung HS vay thấu chi CBNV', NULL);
INSERT INTO `todo` VALUES (1358, 3, '2020-08-14 10:00:00', '2020-08-14 10:30:00', 1, 'Thu nợ trước hạn KH Huỳnh Thanh Xuân', NULL);
INSERT INTO `todo` VALUES (1359, 3, '2020-08-14 10:30:00', '2020-08-14 11:00:00', 1, 'Gọi ĐT nhắc nợ quá hạn', NULL);
INSERT INTO `todo` VALUES (1360, 3, '2020-08-14 14:00:00', '2020-08-14 14:30:00', 1, 'Soạn HS giải ngân hạn mức KH Huỳnh Thanh Xuân', NULL);
INSERT INTO `todo` VALUES (1361, 3, '2020-08-14 15:00:00', '2020-08-14 15:30:00', 2, 'Gửi định giá HS KH Nguyễn Văn Bon', NULL);
INSERT INTO `todo` VALUES (1362, 53, '2020-08-14 09:30:00', '2020-08-14 11:00:00', 2, 'KH hẹn quán cf milano lúc 10h gặp tv BH ', NULL);
INSERT INTO `todo` VALUES (1363, 53, '2020-08-14 14:30:00', '2020-08-14 16:00:00', 2, 'Gọi dt KH ', NULL);
INSERT INTO `todo` VALUES (1364, 53, '2020-08-14 08:45:00', '2020-08-14 09:25:00', 2, 'Gọi dt kh', NULL);
INSERT INTO `todo` VALUES (1365, 6, '2020-08-14 10:48:00', '2020-08-14 00:00:00', 2, 'Soạn hs thấu chi Loan', NULL);
INSERT INTO `todo` VALUES (1366, 6, '2020-08-14 10:38:00', '2020-08-14 00:00:00', 2, 'Soạn hs thấu chi Thu', NULL);
INSERT INTO `todo` VALUES (1368, 52, '2020-08-17 09:08:00', '2020-08-17 11:48:00', 2, 'Úp hồ sơ yêu cầu định giá', NULL);
INSERT INTO `todo` VALUES (1369, 53, '2020-08-17 08:30:00', '2020-08-17 10:00:00', 2, 'Họp huddle ở quán Hub', NULL);
INSERT INTO `todo` VALUES (1370, 53, '2020-08-17 10:30:00', '2020-08-17 11:30:00', 2, 'Gặp KH cũ Nguyễn Thị Hồng Thắm để thay đổi thông tin hợp đồng lại ở cơ quan cách mạng tháng 8 ', NULL);
INSERT INTO `todo` VALUES (1371, 53, '2020-08-17 14:30:00', '2020-08-17 16:00:00', 2, 'Gọi dt KH ', NULL);
INSERT INTO `todo` VALUES (1372, 3, '2020-08-17 10:30:00', '2020-08-17 11:00:00', 2, 'Soạn HS giải ngân hạn mức KH Huỳnh Thanh Xuân', NULL);
INSERT INTO `todo` VALUES (1373, 53, '2020-08-17 23:15:00', '2020-08-17 11:45:00', 2, 'Nộp giấy thư bàn giao bộ hợp đồng giấy của KH Trần Lưu Mạnh Hào ', NULL);
INSERT INTO `todo` VALUES (1374, 3, '2020-08-17 11:00:00', '2020-08-17 11:30:00', 2, 'Soạn HS giải ngân hạn mức KH Trần Thị Hồng Hoa', NULL);
INSERT INTO `todo` VALUES (1375, 3, '2020-08-17 14:00:00', '2020-08-17 14:30:00', 2, 'Gọi ĐT nhắc nợ quá hạn', NULL);
INSERT INTO `todo` VALUES (1376, 3, '2020-08-17 09:30:00', '2020-08-17 10:00:00', 2, 'Thu nợ một phần KH Đỗ Văn Tiến', NULL);
INSERT INTO `todo` VALUES (1377, 53, '2020-08-18 08:15:00', '2020-08-18 08:40:00', 2, 'Đánh BMH Chồng KH cũ tên Nguyễn Thị Hồng Thắm', NULL);
INSERT INTO `todo` VALUES (1378, 53, '2020-08-18 09:30:00', '2020-08-18 11:00:00', 2, 'Gọi DT chào thẻ tín dụng cho kh bh ', NULL);
INSERT INTO `todo` VALUES (1379, 53, '2020-08-18 11:30:00', '2020-08-19 13:00:00', 2, 'Họp phòng ', NULL);
INSERT INTO `todo` VALUES (1380, 53, '2020-08-17 14:30:00', '2020-08-17 15:45:00', 2, 'Gọi dt KH ', NULL);
INSERT INTO `todo` VALUES (1381, 52, '2020-08-18 08:12:00', '2020-08-18 00:12:00', 2, 'Soạn tờ trình hồ sơ vay mua xe', NULL);
INSERT INTO `todo` VALUES (1382, 53, '2020-08-18 09:00:00', '2020-08-18 09:45:00', 2, '9h cô Liên lại làm thẻ tín dụng', NULL);
INSERT INTO `todo` VALUES (1383, 6, '2020-08-18 08:00:00', '2020-08-18 00:00:00', 2, 'Đi giao chứng từ và nhận chứng từ thanh toán Tây Đô ', 'accepted');
INSERT INTO `todo` VALUES (1384, 6, '2020-08-18 09:35:00', '2020-08-18 00:00:00', 2, 'Qua chi nhánh CT lấy 2 hs chỗ a Bình', NULL);
INSERT INTO `todo` VALUES (1385, 6, '2020-08-18 11:30:00', '2020-08-18 00:00:00', 2, 'Họp phòng', NULL);
INSERT INTO `todo` VALUES (1386, 6, '2020-08-18 10:00:00', '2020-08-18 00:00:00', 2, 'Ghé chị Như cho ký hs thẻ', NULL);
INSERT INTO `todo` VALUES (1387, 52, '2020-08-18 07:39:00', '2020-08-18 08:39:00', 2, 'Gặp khách hàng', NULL);
INSERT INTO `todo` VALUES (1388, 3, '2020-08-18 08:30:00', '2020-08-18 09:00:00', 2, 'Thu nợ trước hạn HS KH Đỗ Văn Tiến', NULL);
INSERT INTO `todo` VALUES (1389, 3, '2020-08-18 09:30:00', '2020-08-18 10:00:00', 2, 'Giải ngân HS thấu chi CBNV nguyễn thị Hằng', NULL);
INSERT INTO `todo` VALUES (1390, 3, '2020-08-18 10:00:00', '2020-08-18 10:30:00', 2, 'Soạn HS giải ngân hạn mức KH Trần Thị Hồng Hoa', NULL);
INSERT INTO `todo` VALUES (1391, 3, '2020-08-18 14:00:00', '2020-08-18 14:30:00', 2, 'Gọi ĐT nhắc nợ quá hạn', NULL);
INSERT INTO `todo` VALUES (1392, 3, '2020-08-18 16:30:00', '2020-08-18 17:00:00', 2, 'Bàn giao các HS giải ngân ', NULL);
INSERT INTO `todo` VALUES (1393, 8, '2020-08-18 08:00:00', '2020-08-18 09:00:00', 2, 'Trao đổi với KH về hồ sơ Phạm Thị Kiều Oanh vay vốn 250trđ ở Vị Thủy', NULL);
INSERT INTO `todo` VALUES (1394, 8, '2020-08-18 10:00:00', '2020-08-18 11:00:00', 2, 'Nhắc nợ và báo cáo nợ quá hạn', NULL);
INSERT INTO `todo` VALUES (1395, 8, '2020-08-18 11:00:00', '2020-08-18 00:00:00', 2, 'Họp phòng', NULL);
INSERT INTO `todo` VALUES (1396, 8, '2020-08-18 13:00:00', '2020-08-18 02:30:00', 2, 'Phát hành thẻ tín dụng theo chương trình BH Pru KH Trần Thị Linh Giang', NULL);
INSERT INTO `todo` VALUES (1397, 8, '2020-08-18 14:30:00', '2020-08-18 03:30:00', 2, 'Gặp KH Ngô Xuân Hiến ký hồ sơ thu nợ, tái cấp hạn mức', NULL);
INSERT INTO `todo` VALUES (1398, 53, '2020-08-19 08:00:00', '2020-08-19 00:00:00', 2, 'Đi học sản phẩm bộ trợ ở sacom lầu 10', NULL);
INSERT INTO `todo` VALUES (1399, 53, '2020-08-19 13:20:00', '2020-08-19 13:45:00', 2, 'Điều chỉnh lại hồ sơ BH cũ cho KH Nguyễn Thị Hồng Thắm', NULL);
INSERT INTO `todo` VALUES (1400, 53, '2020-08-19 14:20:00', '2020-08-19 16:00:00', 2, 'Gọi dt KH ', NULL);
INSERT INTO `todo` VALUES (1401, 53, '2020-08-19 15:15:00', '2020-08-19 15:30:00', 2, 'Dt hẹn KH Nguyễn Thị Hồng Thắm để tv BH chỉ định tham gia thêm cho chồng ', NULL);
INSERT INTO `todo` VALUES (1402, 3, '2020-08-19 08:00:00', '2020-08-19 08:30:00', 2, 'Gặp chị Thu Phương gửi vocher và ký HS mở thẻ tín dụng', 'accepted');
INSERT INTO `todo` VALUES (1403, 3, '2020-08-19 09:00:00', '2020-08-19 09:30:00', 2, 'Giải ngân HS vay thấu chi CBNV Đỗ Huyền Nga', NULL);
INSERT INTO `todo` VALUES (1404, 3, '2020-08-19 10:00:00', '2020-08-19 10:30:00', 2, 'Gặp KH Trần Thị Hồng Hoa ký HS giải ngân hạn mức', NULL);
INSERT INTO `todo` VALUES (1405, 3, '2020-08-19 13:30:00', '2020-08-19 14:00:00', 2, 'Gọi ĐT nhắc nợ quá hạn', NULL);
INSERT INTO `todo` VALUES (1406, 3, '2020-08-19 14:00:00', '2020-08-19 14:30:00', 2, 'Giải ngân HS vay hạn mức KH Trần Thị Hồng Hoa', NULL);
INSERT INTO `todo` VALUES (1407, 52, '2020-08-19 08:00:00', '2020-08-19 09:00:00', 2, 'Vào trường hoc mầm non có nhu cầu vay tin châp', NULL);
INSERT INTO `todo` VALUES (1408, 8, '2020-08-19 08:00:00', '2020-08-19 09:00:00', 1, 'Gặp KH Nguyễn Hoàng Thông và sale xe Mitsubisi Ánh Dương', NULL);
INSERT INTO `todo` VALUES (1409, 8, '2020-08-19 09:00:00', '2020-08-19 10:00:00', 1, 'Cập nhật nợ quá hạn', NULL);
INSERT INTO `todo` VALUES (1410, 52, '2020-08-20 07:30:00', '2020-08-20 08:30:00', 2, 'Gặp khách hàng', 'accepted');
INSERT INTO `todo` VALUES (1411, 52, '2020-08-20 09:03:00', '2020-08-20 00:03:00', 2, 'Giải ngân hồ sơ thấu chi Huỳnh Minh Thành', NULL);
INSERT INTO `todo` VALUES (1412, 52, '2020-08-20 13:04:00', '2020-08-20 04:04:00', 2, 'Trinh hồ sơ thẻ tín dụng', NULL);
INSERT INTO `todo` VALUES (1414, 3, '2020-08-20 08:00:00', '2020-08-20 08:30:00', 2, 'Làm giấy đi đường cho KH Huỳnh Minh Khương', NULL);
INSERT INTO `todo` VALUES (1415, 53, '2020-08-20 08:00:00', '2020-08-20 08:45:00', 2, 'Đi gặp chị Oanh cho ký tên chứng từ rồi nộp ở CN Tây Đô và nộp giấy ở vp Pru Mậu Thân ', 'accepted');
INSERT INTO `todo` VALUES (1416, 53, '2020-08-20 08:45:00', '2020-08-20 09:45:00', 2, 'Gặp KH cũ vay  Nguyễn Thị Hồng Thắm  để tv BH chỉ dự định mua thêm cho chồng', NULL);
INSERT INTO `todo` VALUES (1417, 53, '2020-08-20 10:00:00', '2020-08-20 11:20:00', 2, 'Lên hđ BH 15tr Kiều Anh tự mua ', NULL);
INSERT INTO `todo` VALUES (1418, 53, '2020-08-20 14:20:00', '2020-08-20 16:00:00', 2, 'Gọi DT KH', NULL);
INSERT INTO `todo` VALUES (1419, 3, '2020-08-20 09:00:00', '2020-08-20 09:30:00', 2, 'Giải ngân HS vay hạn mức KH Trần Thị Hồng Hoa', NULL);
INSERT INTO `todo` VALUES (1420, 3, '2020-08-20 10:30:00', '2020-08-20 11:00:00', 2, 'Gọi ĐT nhắc nợ quá hạn', NULL);
INSERT INTO `todo` VALUES (1421, 6, '2020-08-20 10:44:00', '2020-08-20 00:00:00', 1, 'Trình hs thẻ chị Như', NULL);
INSERT INTO `todo` VALUES (1422, 6, '2020-08-20 13:44:00', '2020-08-20 00:00:00', 1, 'Soạn hs thẻ Muội', NULL);
INSERT INTO `todo` VALUES (1423, 3, '2020-08-20 16:30:00', '2020-08-20 17:00:00', 2, 'Gặp KH Nguyễn Thị Diễm My ký giấy mở gói TK', NULL);
INSERT INTO `todo` VALUES (1424, 53, '2020-08-21 09:00:00', '2020-08-21 10:50:00', 2, 'Gọi dt kh', NULL);
INSERT INTO `todo` VALUES (1425, 53, '2020-08-21 08:20:00', '2020-08-21 08:45:00', 2, 'Rà sát lại những Refer cũ để dt hỏi thăm', NULL);
INSERT INTO `todo` VALUES (1426, 53, '2020-08-21 14:15:00', '2020-08-21 15:50:00', 2, 'Gọi dt kh ', NULL);
INSERT INTO `todo` VALUES (1427, 53, '2020-08-21 13:15:00', '2020-08-21 13:35:00', 2, 'Đóng phí BH chênh lệch để hđ phát hành', NULL);
INSERT INTO `todo` VALUES (1428, 52, '2020-08-21 07:54:00', '2020-08-21 08:54:00', 1, 'Gặp khách và tìm khách hàng mới', 'denied');
INSERT INTO `todo` VALUES (1429, 52, '2020-08-21 11:55:00', '2020-08-21 15:55:00', 1, 'Trình 02 bộ hồ sơ thẻ tín dụng', NULL);
INSERT INTO `todo` VALUES (1430, 3, '2020-08-21 08:30:00', '2020-08-21 09:00:00', 2, 'Làm giấy đi đường KH Thái Đức Ba', NULL);
INSERT INTO `todo` VALUES (1431, 3, '2020-08-21 09:00:00', '2020-08-21 09:30:00', 2, 'Hạch toán thay đổi tài khoản thanh toán KH Lê Thị Thanh Mai', NULL);
INSERT INTO `todo` VALUES (1432, 3, '2020-08-21 10:30:00', '2020-08-21 11:00:00', 2, 'Gọi ĐT nhắc nợ quá hạn', NULL);
INSERT INTO `todo` VALUES (1433, 3, '2020-08-21 14:00:00', '2020-08-21 14:30:00', 2, 'Gọi anh Thanh tư vấn vay', NULL);
INSERT INTO `todo` VALUES (1434, 53, '2020-08-24 08:00:00', '2020-08-24 10:00:00', 2, 'Họp Huddle ', NULL);
INSERT INTO `todo` VALUES (1435, 53, '2020-08-24 10:00:00', '2020-08-24 11:15:00', 2, 'Gọi dt KH', NULL);
INSERT INTO `todo` VALUES (1436, 53, '2020-08-24 14:15:00', '2020-08-24 15:45:00', 2, 'Gọi data kiếm KH ', NULL);
INSERT INTO `todo` VALUES (1437, 3, '2020-08-24 08:30:00', '2020-08-24 09:00:00', 2, 'Trình HS vay thấu chi và thẻ tín dụng CBNV Nguyễn Thanh Phương', NULL);
INSERT INTO `todo` VALUES (1438, 3, '2020-08-24 09:30:00', '2020-08-24 10:00:00', 2, 'Soạn HS tất nợ khoản vay xe KH Huỳnh Phú Quí', NULL);
INSERT INTO `todo` VALUES (1439, 3, '2020-08-24 10:30:00', '2020-08-24 11:00:00', 2, 'Gọi ĐT nhắc nợ quá hạn', NULL);
INSERT INTO `todo` VALUES (1440, 3, '2020-08-24 16:00:00', '2020-08-24 16:30:00', 2, 'Bàn giao HS giải ngân', NULL);
INSERT INTO `todo` VALUES (1441, 3, '2020-08-24 13:30:00', '2020-08-24 14:30:00', 2, 'Điều chỉnh phụ lục hạch toán các khoản vay tín chấp', NULL);
INSERT INTO `todo` VALUES (1442, 52, '2020-08-24 08:16:00', '2020-08-24 09:16:00', 2, 'Họp đầu ngày', NULL);
INSERT INTO `todo` VALUES (1443, 52, '2020-08-24 09:16:00', '2020-08-24 00:16:00', 2, 'Trinh hs thẻ tín dụng', NULL);
INSERT INTO `todo` VALUES (1444, 52, '2020-08-24 01:19:00', '2020-08-24 16:20:00', 2, 'Bàn giao hồ sơ lại phòng hỗ trợ tín dụng', NULL);
INSERT INTO `todo` VALUES (1445, 53, '2020-08-25 08:20:00', '2020-08-25 08:35:00', 2, 'Áp phí cho hđ TRẦN ANH DŨNG ', NULL);
INSERT INTO `todo` VALUES (1446, 53, '2020-08-25 09:00:00', '2020-08-25 11:00:00', 2, 'Gọi dt KH ', NULL);
INSERT INTO `todo` VALUES (1447, 53, '2020-08-25 10:45:00', '2020-08-25 11:50:00', 2, 'Nộp thư bàn giao cho hđ TRẦN ANH DŨNG ', NULL);
INSERT INTO `todo` VALUES (1448, 53, '2020-08-25 14:15:00', '2020-08-25 03:45:00', 2, 'Gọi dt KH ', NULL);
INSERT INTO `todo` VALUES (1449, 3, '2020-08-25 08:30:00', '2020-08-25 09:00:00', 2, 'Soạn HS thu nợ trước hạn KH Trần Anh Năng', NULL);
INSERT INTO `todo` VALUES (1451, 3, '2020-08-25 10:00:00', '2020-08-25 10:30:00', 2, 'Soạn HS giải ngân hạn mức KH Trần Ngọc Thúy', NULL);
INSERT INTO `todo` VALUES (1452, 3, '2020-08-25 10:30:00', '2020-08-25 11:00:00', 2, 'Gọi ĐT nhắc nợ quá hạn', NULL);
INSERT INTO `todo` VALUES (1453, 3, '2020-08-25 14:00:00', '2020-08-25 16:00:00', 2, 'Gặp KH Trần Ngọc Thúy ký HS giải ngân hạn mức', NULL);
INSERT INTO `todo` VALUES (1454, 53, '2020-08-26 09:00:00', '2020-08-26 10:45:00', 2, 'Gọi dt kh ', NULL);
INSERT INTO `todo` VALUES (1455, 53, '2020-08-26 11:00:00', '2020-08-26 00:00:00', 2, 'Nộp thư bàn giao hđ giấy của Trần Thị Linh Giang', NULL);
INSERT INTO `todo` VALUES (1456, 53, '2020-08-26 08:15:00', '2020-08-26 08:48:00', 2, 'Đánh BMH cho khách của chị Hằng ', NULL);
INSERT INTO `todo` VALUES (1457, 53, '2020-08-26 14:00:00', '2020-08-26 15:50:00', 2, 'Gọi dt KH', NULL);
INSERT INTO `todo` VALUES (1458, 52, '2020-08-26 07:17:00', '2020-08-26 08:17:00', 2, 'Gặp khách mở gói tk', 'accepted');
INSERT INTO `todo` VALUES (1459, 52, '2020-08-26 09:19:00', '2020-08-26 10:19:00', 2, 'Gởi hồ sơ định giá', NULL);
INSERT INTO `todo` VALUES (1460, 3, '2020-08-26 08:30:00', '2020-08-26 09:00:00', 2, 'Soạn HS giải ngân KH Nguyễn Thanh Phương', NULL);
INSERT INTO `todo` VALUES (1461, 3, '2020-08-26 09:00:00', '2020-08-26 09:30:00', 2, 'Gọi ĐT các KH chưa kích hoạt thẻ tín dụng', NULL);
INSERT INTO `todo` VALUES (1462, 3, '2020-08-26 09:30:00', '2020-08-26 10:30:00', 2, 'Xem HS anh Hạnh tư vấn vay thêm', NULL);
INSERT INTO `todo` VALUES (1463, 3, '2020-08-26 10:30:00', '2020-08-26 11:00:00', 2, 'Gọi ĐT nhắc nợ quá hạn', NULL);
INSERT INTO `todo` VALUES (1464, 3, '2020-08-26 15:00:00', '2020-08-26 16:00:00', 2, 'Gặp KH Nguyễn Thanh Chúc ký HS vay góp lương ', NULL);
INSERT INTO `todo` VALUES (1465, 8, '2020-08-26 07:30:00', '2020-08-26 08:30:00', 1, 'Gặp a Hiếu công tác tại Petromekong nhu cầu vay xây nhà', 'accepted');
INSERT INTO `todo` VALUES (1466, 8, '2020-08-26 09:30:00', '2020-08-26 11:00:00', 1, 'Gặp A Thuận giới thiệu hồ sơ KH vay vốn tại quốc lộ 54', NULL);
INSERT INTO `todo` VALUES (1467, 53, '2020-08-27 09:00:00', '2020-08-27 10:45:00', 2, 'Gọi dt kh', NULL);
INSERT INTO `todo` VALUES (1468, 53, '2020-08-27 10:45:00', '2020-08-27 11:40:00', 2, 'Nộp thư xác nhận OTP của hđ mới ký của a Hưng ', NULL);
INSERT INTO `todo` VALUES (1469, 53, '2020-08-27 14:20:00', '2020-08-27 16:00:00', 2, 'Gọi dt ', NULL);
INSERT INTO `todo` VALUES (1470, 53, '2020-08-27 13:15:00', '2020-08-27 13:40:00', 2, 'Nộp 30tr cho hđ của a Hưng ', NULL);
INSERT INTO `todo` VALUES (1471, 53, '2020-08-28 09:00:00', '2020-08-28 10:50:00', 2, 'Gọi dt KH ', NULL);
INSERT INTO `todo` VALUES (1472, 53, '2020-08-28 10:55:00', '2020-08-28 11:45:00', 2, 'Nộp thư bàn giao hđ giấy của khách Ngô Xuân Hiến', NULL);
INSERT INTO `todo` VALUES (1473, 53, '2020-08-28 14:20:00', '2020-08-28 16:00:00', 2, 'Gọi data ', NULL);
INSERT INTO `todo` VALUES (1474, 52, '2020-08-28 08:14:00', '2020-08-28 11:14:00', 1, 'Đi định giá Hậu Giang', NULL);
INSERT INTO `todo` VALUES (1475, 52, '2020-08-28 14:15:00', '2020-08-28 16:15:00', 1, 'Đi định giá tại Bình thủy', NULL);
INSERT INTO `todo` VALUES (1476, 53, '2020-08-31 08:00:00', '2020-08-31 10:00:00', 2, 'Họp huddle', NULL);
INSERT INTO `todo` VALUES (1477, 53, '2020-08-31 09:45:00', '2020-08-31 11:00:00', 2, 'Gọi dt KH', NULL);
INSERT INTO `todo` VALUES (1478, 53, '2020-08-31 14:20:00', '2020-08-31 15:45:00', 2, 'Gọi dt KH ', NULL);
INSERT INTO `todo` VALUES (1479, 53, '2020-08-31 13:15:00', '2020-08-31 14:00:00', 2, 'Làm ds hoa hồng ', NULL);
INSERT INTO `todo` VALUES (1480, 3, '2020-08-31 08:30:00', '2020-08-31 09:00:00', 2, 'Giải ngân HS vay hạn mức KH Trần Ngọc Thúy', NULL);
INSERT INTO `todo` VALUES (1481, 3, '2020-08-31 09:00:00', '2020-08-31 09:30:00', 2, 'Xem lại HS Trần Hoàng Hạnh, KH vay thêm', NULL);
INSERT INTO `todo` VALUES (1482, 3, '2020-08-31 10:00:00', '2020-08-31 10:30:00', 2, 'Gửi định giá HS vay KH Linh', NULL);
INSERT INTO `todo` VALUES (1483, 3, '2020-08-31 10:30:00', '2020-08-31 11:00:00', 2, 'Gọi ĐT nhắc nợ quá hạn', NULL);
INSERT INTO `todo` VALUES (1484, 3, '2020-08-31 13:30:00', '2020-08-31 14:00:00', 2, 'Soạn HS vay góp lương KH Nguyễn Thị Thanh Chúc ', NULL);
INSERT INTO `todo` VALUES (1485, 52, '2020-08-31 08:35:00', '2020-08-31 09:35:00', 2, 'Họp đầu ngày', NULL);
INSERT INTO `todo` VALUES (1486, 52, '2020-08-31 11:35:00', '2020-08-31 00:35:00', 2, 'Găp khách có nhu cầu làm thẻ tín dụng', NULL);
INSERT INTO `todo` VALUES (1487, 52, '2020-08-31 13:35:00', '2020-08-31 16:35:00', 2, 'Xử ly hồ sơ vay vốn', NULL);
INSERT INTO `todo` VALUES (1488, 3, '2020-09-03 08:00:00', '2020-09-03 08:30:00', 2, 'Gặp KH chị ngân và chị Sen ký giấy mở gói tài khoản', 'accepted');
INSERT INTO `todo` VALUES (1489, 3, '2020-09-03 09:00:00', '2020-09-03 09:30:00', 2, 'Giải ngân HS Nguyễn Thanh Phương', NULL);
INSERT INTO `todo` VALUES (1490, 3, '2020-09-03 10:30:00', '2020-09-03 11:00:00', 2, 'Trình GD vùng HS góp lương KH Nguyễn Thị Thanh Chúc ', NULL);
INSERT INTO `todo` VALUES (1491, 3, '2020-09-03 13:30:00', '2020-09-03 14:00:00', 2, 'Gọi ĐT nhắc nợ quá hạn', NULL);
INSERT INTO `todo` VALUES (1492, 3, '2020-09-03 14:00:00', '2020-09-03 14:30:00', 2, 'Gọi ĐT chú Hạnh tư vấn vay', NULL);
INSERT INTO `todo` VALUES (1493, 6, '2020-09-03 08:00:00', '2020-09-03 00:00:00', 2, 'Đi lấy đồ cho phòng với Kiều Anh', 'accepted');
INSERT INTO `todo` VALUES (1494, 53, '2020-09-03 09:52:00', '2020-09-03 11:00:00', 2, 'Họp huddle ', NULL);
INSERT INTO `todo` VALUES (1495, 6, '2020-09-03 13:00:00', '2020-09-03 00:00:00', 2, 'Ký giấy mở gói tài khoản Ngọc', NULL);
INSERT INTO `todo` VALUES (1496, 53, '2020-09-03 14:20:00', '2020-09-03 16:00:00', 2, 'Gọi dt ', NULL);
INSERT INTO `todo` VALUES (1497, 6, '2020-09-03 15:53:00', '2020-09-03 00:00:00', 2, 'Gọi đt nhắc nợ quá hạn', NULL);
INSERT INTO `todo` VALUES (1498, 6, '2020-09-03 13:53:00', '2020-09-03 00:00:00', 2, 'Gọi đt lại a Phú nhu cầu vay mua xe', NULL);
INSERT INTO `todo` VALUES (1499, 53, '2020-09-03 13:00:00', '2020-09-03 14:00:00', 2, 'Làm bảng tóm tắt lại về sp Đầu Tư ', NULL);
INSERT INTO `todo` VALUES (1500, 53, '2020-09-03 11:00:00', '2020-09-03 00:00:00', 2, 'Thống kê ds KH có thể ký hđ bh trong tháng 9 ', NULL);
INSERT INTO `todo` VALUES (1501, 52, '2020-09-03 13:19:00', '2020-09-03 15:19:00', 2, 'Gặp khách hàng', NULL);
INSERT INTO `todo` VALUES (1502, 52, '1970-01-01 00:00:00', '2020-09-03 05:20:00', 1, 'Xử lý hồ sơ thẻ tín dụng', NULL);
INSERT INTO `todo` VALUES (1504, 52, '2020-09-03 15:21:00', '2020-09-02 17:21:00', 2, 'Xử lý hồ sơ thẻ tín dụng', NULL);
INSERT INTO `todo` VALUES (1505, 53, '2020-09-04 09:30:00', '2020-09-04 11:00:00', 2, 'Gọi dt ', NULL);
INSERT INTO `todo` VALUES (1506, 53, '2020-09-04 08:15:00', '2020-09-04 09:15:00', 2, 'Thống kê dự báo các case BH ', NULL);
INSERT INTO `todo` VALUES (1507, 53, '2020-09-04 14:30:00', '2020-09-04 16:00:00', 2, 'Gọi dt ', NULL);
INSERT INTO `todo` VALUES (1508, 53, '2020-09-04 13:15:00', '2020-09-03 14:00:00', 2, 'Dt nhắc hỏi a Phường  chính sách chương trình thi đua trong tháng 9', NULL);
INSERT INTO `todo` VALUES (1509, 3, '2020-09-04 08:00:00', '2020-09-04 08:30:00', 2, 'Ghé CN Cần Thơ nhận HS KH Nguyễn Thị Thanh Chúc', 'accepted');
INSERT INTO `todo` VALUES (1510, 52, '2020-09-04 07:53:00', '2020-09-04 09:03:00', 2, 'Găp khách hàng với Hưng', NULL);
INSERT INTO `todo` VALUES (1511, 52, '2020-09-04 09:04:00', '2020-09-03 11:04:00', 2, 'Gặp khách có nhu cầu vay', NULL);
INSERT INTO `todo` VALUES (1512, 52, '1970-01-01 00:00:00', '2020-09-04 04:05:00', 1, 'Gặp khách làm thẻ td', NULL);
INSERT INTO `todo` VALUES (1513, 52, '1970-01-01 00:00:00', '2020-09-04 16:05:00', 1, 'Gặp khách làm thẻ td', NULL);
INSERT INTO `todo` VALUES (1514, 52, '2020-09-04 02:00:00', '2020-09-04 03:56:00', 2, 'Gặp khách có nhu cầu làm thẻ tin dụng', NULL);
INSERT INTO `todo` VALUES (1515, 3, '2020-09-04 09:00:00', '2020-09-04 09:30:00', 2, 'Giải ngân HS vay góp lương KH Nguyễn Thị Thanh Chúc', NULL);
INSERT INTO `todo` VALUES (1516, 3, '2020-09-04 09:30:00', '2020-09-04 10:00:00', 1, 'Làm báo cáo trích lập dự phòng', NULL);
INSERT INTO `todo` VALUES (1517, 3, '2020-09-04 10:30:00', '2020-09-04 11:00:00', 1, 'Gọi ĐT nhắc nợ quá hạn', NULL);
INSERT INTO `todo` VALUES (1518, 3, '2020-09-04 13:30:00', '2020-09-04 15:30:00', 1, 'Lấy hs từ Thanh tra bàn giao cho QLTD', NULL);
INSERT INTO `todo` VALUES (1519, 6, '2020-09-04 13:30:00', '2020-09-04 15:30:00', 1, 'Lấy hs từ Thanh tra bàn giao cho QLTD', NULL);
INSERT INTO `todo` VALUES (1520, 52, '2020-09-04 13:30:00', '2020-09-04 15:30:00', 2, 'Lấy hs từ Thanh tra bàn giao cho QLTD', NULL);
INSERT INTO `todo` VALUES (1521, 53, '2020-09-07 08:00:00', '2020-09-07 10:00:00', 2, 'Họp huddle', NULL);
INSERT INTO `todo` VALUES (1522, 53, '2020-09-07 10:00:00', '2020-09-07 11:00:00', 2, 'Gọi dt', NULL);
INSERT INTO `todo` VALUES (1523, 53, '2020-09-07 10:45:00', '2020-09-07 11:45:00', 2, 'Nộp hồ sơ cho hđ mới của khách chị Hằng', NULL);
INSERT INTO `todo` VALUES (1524, 53, '2020-09-07 13:15:00', '2020-09-07 16:00:00', 2, 'Đánh BMH và lập ds đky thi liên quân ', NULL);
INSERT INTO `todo` VALUES (1525, 53, '2020-09-07 15:35:00', '2020-09-07 16:40:00', 2, 'Gửi mail ds đky cho a Phường ', NULL);
INSERT INTO `todo` VALUES (1526, 3, '2020-09-07 08:00:00', '2020-09-07 08:30:00', 2, 'Ghé CN Cần Thơ nhận HS KH Nguyễn Thị Thanh Chúc', 'accepted');
INSERT INTO `todo` VALUES (1527, 3, '2020-09-07 09:00:00', '2020-09-07 09:30:00', 2, 'Giải ngân HS vay góp lương KH Nguyễn Thị Thanh Chúc', NULL);
INSERT INTO `todo` VALUES (1528, 3, '2020-09-07 09:30:00', '2020-09-07 10:00:00', 2, 'Xem HS anh Hạnh vay thêm', NULL);
INSERT INTO `todo` VALUES (1529, 3, '2020-09-07 10:30:00', '2020-09-07 11:00:00', 2, 'Gọi ĐT nhắc nợ quá hạn', NULL);
INSERT INTO `todo` VALUES (1530, 8, '2020-09-07 08:00:00', '2020-09-07 08:30:00', 2, 'Gặp chị Tuyền kí hs ĐNVV, mở tài khoản, nhận sổ sách ghi chép', 'accepted');
INSERT INTO `todo` VALUES (1531, 52, '2020-09-07 07:56:00', '2020-09-07 08:30:00', 2, 'Gặp khách có nhu cầu vay vôn', NULL);
INSERT INTO `todo` VALUES (1532, 52, '2020-09-07 08:57:00', '2020-09-07 00:57:00', 2, 'Xử lý hồ sơ vay chị Tuyền', NULL);
INSERT INTO `todo` VALUES (1533, 52, '1970-01-01 00:00:00', '1970-01-01 00:00:00', 1, 'Nộp bàn giao hồ sơ khách hàng cho phòng quản lý tín dung', NULL);
INSERT INTO `todo` VALUES (1534, 52, '2020-09-07 04:00:00', '2020-09-07 05:00:00', 2, 'Nộp bàn giao hồ sơ khách hàng cho phòng quản lý tín dung', NULL);
INSERT INTO `todo` VALUES (1535, 6, '2020-09-07 10:24:00', '2020-09-07 00:00:00', 2, 'Xem tất nợ KH Châu Dũng Sĩ', NULL);
INSERT INTO `todo` VALUES (1536, 6, '2020-09-07 15:30:00', '2020-09-07 00:00:00', 2, 'Đt nhắc nợ KH quá hạn', NULL);
INSERT INTO `todo` VALUES (1537, 6, '2020-09-07 16:05:00', '2020-09-07 00:00:00', 2, 'Làm bàn giao hồ sơ Quản lý tín dụng', NULL);
INSERT INTO `todo` VALUES (1538, 6, '2020-09-08 08:05:00', '2020-09-08 00:00:00', 2, 'Bàn giao hs quản lý tín dụng', 'accepted');
INSERT INTO `todo` VALUES (1539, 6, '2020-09-08 11:00:00', '2020-09-08 00:00:00', 2, 'Up hs giải ngân Anh', NULL);
INSERT INTO `todo` VALUES (1540, 6, '2020-09-08 15:01:00', '2020-09-08 00:00:00', 2, 'Đt nhắc nợ KH quá hạn', NULL);
INSERT INTO `todo` VALUES (1541, 6, '2020-09-08 10:01:00', '2020-09-08 00:00:00', 2, 'Đt chị Muội chụp SHK bổ sung', NULL);
INSERT INTO `todo` VALUES (1542, 52, '2020-09-08 07:25:00', '1970-01-01 00:00:00', 2, 'Trình hồ sơ khách hàng Tuyên', NULL);
INSERT INTO `todo` VALUES (1543, 53, '2020-09-08 09:15:00', '2020-09-08 10:45:00', 2, 'Gọi dt kh tiền gửi của ds chị Hương đưa ', NULL);
INSERT INTO `todo` VALUES (1544, 53, '2020-09-08 10:55:00', '2020-09-07 11:40:00', 2, 'Nộp giấy điều chỉnh lại số cmnd của KH  Phạm Thị Liên', NULL);
INSERT INTO `todo` VALUES (1545, 53, '2020-09-08 14:30:00', '2020-09-08 16:00:00', 2, 'Gọi dt KH ', NULL);
INSERT INTO `todo` VALUES (1546, 53, '2020-09-08 13:20:00', '2020-09-08 14:15:00', 2, 'Làm ds hoa hồng tháng 8 cho phòng ', NULL);
INSERT INTO `todo` VALUES (1547, 3, '2020-09-08 09:00:00', '2020-09-08 09:30:00', 2, 'Gọi ĐT KH Mỹ Linh tư vấn vay', NULL);
INSERT INTO `todo` VALUES (1548, 3, '2020-09-08 09:30:00', '2020-09-08 10:00:00', 2, 'Gọi ĐT anh Hạnh chốt HS vay', NULL);
INSERT INTO `todo` VALUES (1549, 3, '2020-09-08 10:30:00', '2020-09-08 11:00:00', 2, 'Gọi ĐT nhắc nợ quá hạn', NULL);
INSERT INTO `todo` VALUES (1550, 52, '2020-09-09 08:34:00', '2020-09-09 10:34:00', 2, 'In hồ sơ chuẩn bị công chứng tsbd', NULL);
INSERT INTO `todo` VALUES (1551, 52, '2020-09-08 01:08:00', '2020-09-09 04:38:00', 2, 'Công chứng TSBĐ tại Hậu Giang', NULL);
INSERT INTO `todo` VALUES (1552, 3, '2020-09-09 08:00:00', '2020-09-09 08:30:00', 2, 'Gặp anh Thanh tư vấn vay', 'accepted');
INSERT INTO `todo` VALUES (1553, 3, '2020-09-09 09:00:00', '2020-09-09 09:30:00', 2, 'Gọi ĐT chú Hạnh tư vấn vay', NULL);
INSERT INTO `todo` VALUES (1554, 6, '2020-09-09 10:37:00', '2020-09-09 00:00:00', 2, 'Đt tư vấn nở thẻ td KH Hào', NULL);
INSERT INTO `todo` VALUES (1555, 3, '2020-09-09 09:30:00', '2020-09-09 10:00:00', 2, 'Gọi ĐT chị Hân tư vấn vay thêm', NULL);
INSERT INTO `todo` VALUES (1556, 3, '2020-09-09 10:30:00', '2020-09-09 11:00:00', 2, 'Gọi ĐT nhắc nợ quá hạn', NULL);
INSERT INTO `todo` VALUES (1557, 53, '2020-09-09 08:30:00', '2020-09-09 09:00:00', 2, 'Điều chỉnh lại BMH cho chị Nga để sáng nay KH lại tv ', NULL);
INSERT INTO `todo` VALUES (1558, 52, '2020-09-09 08:05:00', '2020-09-09 08:25:00', 2, 'Găp khách hang', 'accepted');
INSERT INTO `todo` VALUES (1559, 53, '2020-09-09 09:05:00', '2020-09-09 10:45:00', 2, 'Gọi dt KH ', NULL);
INSERT INTO `todo` VALUES (1560, 53, '2020-09-09 14:30:00', '2020-09-09 16:00:00', 2, 'Gọi dt KH tiền gửi ', NULL);
INSERT INTO `todo` VALUES (1561, 53, '2020-09-09 13:15:00', '2020-09-09 14:15:00', 2, 'Theo dõi hđ mới lên hôm qua cần bổ sung gì hong ', NULL);
INSERT INTO `todo` VALUES (1562, 53, '2020-09-10 08:16:00', '2020-09-10 10:00:00', 2, 'Họp huddle', NULL);
INSERT INTO `todo` VALUES (1563, 53, '2020-09-10 09:16:00', '2020-09-10 10:50:00', 2, 'Gọi dt kh tiền gửi', NULL);
INSERT INTO `todo` VALUES (1564, 53, '2020-09-10 13:15:00', '2020-09-10 14:00:00', 2, 'Đi nộp giấy thư xác nhận OTP của hđ 40tr hôm qua ký ', NULL);
INSERT INTO `todo` VALUES (1565, 53, '2020-09-10 14:30:00', '2020-09-10 15:45:00', 2, 'Gọi dt KH', NULL);
INSERT INTO `todo` VALUES (1566, 53, '2020-09-10 13:15:00', '2020-09-10 14:00:00', 2, 'Đánh BMH cho chị Hương để chị đi tv ', NULL);
INSERT INTO `todo` VALUES (1567, 52, '2020-09-10 08:03:00', '2020-09-10 09:03:00', 2, 'Họp đầu ngày', NULL);
INSERT INTO `todo` VALUES (1568, 52, '2020-09-10 09:03:00', '2020-09-10 03:03:00', 2, 'Soạn hồ sơ chuẩn bị giải ngân', NULL);
INSERT INTO `todo` VALUES (1569, 8, '2020-09-10 08:00:00', '2020-09-10 10:00:00', 2, 'Xử lý hồ sơ Thạch Tấn vay 350trđ', NULL);
INSERT INTO `todo` VALUES (1570, 8, '2020-09-10 10:00:00', '2020-09-10 11:00:00', 2, 'Bổ sung hồ sơ thẻ Vương Mỹ Kim', NULL);
INSERT INTO `todo` VALUES (1571, 8, '2020-09-10 11:00:00', '2020-09-10 14:00:00', 2, 'Xử lý hồ sơ thẻ KH Trần Thị Linh Giang', NULL);
INSERT INTO `todo` VALUES (1572, 8, '2020-09-10 14:00:00', '2020-09-10 15:00:00', 2, 'Trình ký hồ sơ Thạch Tấn', NULL);
INSERT INTO `todo` VALUES (1573, 8, '2020-09-10 15:00:00', '2020-09-10 17:00:00', 2, 'Họp phòng', NULL);
INSERT INTO `todo` VALUES (1574, 3, '2020-09-10 17:00:00', '2020-09-10 17:30:00', 2, 'Bàn giao HS giải ngân còn thiếu', NULL);
INSERT INTO `todo` VALUES (1575, 3, '2020-09-10 10:30:00', '2020-09-10 11:00:00', 2, 'Gọi ĐT nhắc nợ quá hạn', NULL);
INSERT INTO `todo` VALUES (1576, 3, '2020-09-10 08:30:00', '2020-09-10 09:00:00', 2, 'Gọi ĐT KH Chí Linh mở thẻ tín dụng', NULL);
INSERT INTO `todo` VALUES (1577, 52, '2020-09-10 09:28:00', '2020-09-10 10:28:00', 2, 'Găp khách lấy hồ sơ', NULL);
INSERT INTO `todo` VALUES (1578, 3, '2020-09-10 09:00:00', '2020-09-10 09:30:00', 2, 'Gọi ĐT anh Chiêu chốt HS vay', NULL);
INSERT INTO `todo` VALUES (1579, 6, '2020-09-10 10:40:00', '2020-09-10 00:00:00', 2, 'Đt KH Phú nhu cầu vay mua xe', NULL);
INSERT INTO `todo` VALUES (1580, 6, '2020-09-10 13:30:00', '2020-09-10 00:00:00', 2, 'Đi cho KH Hào ký hs mở thẻ tín đụng', NULL);
INSERT INTO `todo` VALUES (1581, 6, '2020-09-10 15:30:00', '2020-09-10 00:00:00', 2, 'Đt nhắc nợ quá hạn ', NULL);
INSERT INTO `todo` VALUES (1582, 53, '2020-09-11 09:00:00', '2020-09-11 10:45:00', 2, 'Gọi KH tiền gửi', NULL);
INSERT INTO `todo` VALUES (1583, 53, '2020-09-11 11:00:00', '2020-09-11 11:30:00', 2, 'Nhập LTS gắn hoa hồng cho mấy chị', NULL);
INSERT INTO `todo` VALUES (1584, 53, '2020-09-11 14:20:00', '2020-09-11 15:50:00', 2, 'Gọi dt nhắc phí ', NULL);
INSERT INTO `todo` VALUES (1585, 53, '2020-09-11 13:15:00', '2020-09-11 14:00:00', 2, 'Cập nhật lại ds liên quân DVKH', NULL);
INSERT INTO `todo` VALUES (1586, 52, '2020-09-11 07:58:00', '2020-09-11 08:58:00', 1, 'Gặp khách làm thẻ td', NULL);
INSERT INTO `todo` VALUES (1587, 52, '2020-09-11 08:58:00', '2020-09-11 00:58:00', 1, 'Bố sung hồ sơ vay', NULL);
INSERT INTO `todo` VALUES (1588, 52, '2020-09-11 03:00:00', '2020-09-11 05:00:00', 1, 'Bàn giao hồ sơ lại QLTD', NULL);
INSERT INTO `todo` VALUES (1589, 8, '2020-09-11 08:00:00', '2020-09-11 08:30:00', 1, 'Soạn thảo VKTD KH Thạch Tấn', NULL);
INSERT INTO `todo` VALUES (1590, 6, '2020-09-11 10:10:00', '2020-09-11 00:00:00', 2, 'Mở gói tài khoản Châu', NULL);
INSERT INTO `todo` VALUES (1591, 6, '2020-09-11 14:10:00', '2020-09-11 00:00:00', 2, 'Mở gói tài khoản Ngọc', NULL);
INSERT INTO `todo` VALUES (1592, 6, '2020-09-11 12:00:00', '2020-09-11 00:00:00', 2, 'Đi cà phê vs bên môi giới hồ sơ', NULL);
INSERT INTO `todo` VALUES (1593, 53, '2020-09-14 08:00:00', '2020-09-14 10:00:00', 2, 'Họp huddle', NULL);
INSERT INTO `todo` VALUES (1594, 53, '2020-09-14 10:00:00', '2020-09-14 11:00:00', 2, 'Gọi dt', NULL);
INSERT INTO `todo` VALUES (1595, 53, '2020-09-14 11:00:00', '2020-09-14 00:15:00', 2, 'Đi lấy hđ bh ở sacom', NULL);
INSERT INTO `todo` VALUES (1596, 53, '2020-09-14 14:30:00', '2020-09-14 15:45:00', 2, 'Gọi dt kh tiền gửi', NULL);
INSERT INTO `todo` VALUES (1597, 53, '2020-09-14 13:15:00', '2020-09-14 13:50:00', 2, 'Tra sdt kh tiền gửi trên t24 ', NULL);
INSERT INTO `todo` VALUES (1598, 8, '2020-09-14 07:45:00', '2020-09-14 08:15:00', 2, 'Gặp chị Giang ký lại đề nghị mở tk', 'accepted');
INSERT INTO `todo` VALUES (1599, 8, '2020-09-14 08:15:00', '2020-09-14 09:00:00', 2, 'Họp đầu ngày', NULL);
INSERT INTO `todo` VALUES (1600, 8, '2020-09-14 09:00:00', '2020-09-14 09:15:00', 2, 'In và trình ký VKTD KH Thạch Tấn', NULL);
INSERT INTO `todo` VALUES (1601, 8, '2020-09-14 09:15:00', '2020-09-14 00:00:00', 2, 'Công chứng và ĐKTC hồ sơ Thạch Tấn', NULL);
INSERT INTO `todo` VALUES (1602, 8, '2020-09-14 13:00:00', '2020-09-14 17:00:00', 2, 'Thẩm 02 KH tại Cờ Đỏ', NULL);
INSERT INTO `todo` VALUES (1603, 3, '2020-09-14 08:30:00', '2020-09-14 09:00:00', 2, 'Mở 3 gói tài khoản KH Sen, Ngân, My', NULL);
INSERT INTO `todo` VALUES (1604, 3, '2020-09-14 09:00:00', '2020-09-14 09:30:00', 2, 'Kiểm tra thẻ tín dụng KH Nguyễn Thị Thanh Chúc đã chuyển thẻ tín dụng về chưa', NULL);
INSERT INTO `todo` VALUES (1605, 3, '2020-09-14 09:30:00', '2020-09-14 10:00:00', 2, 'Gọi ĐT anh Hạnh bổ sung chứng từ để gửi định giá', NULL);
INSERT INTO `todo` VALUES (1606, 3, '2020-09-14 10:30:00', '2020-09-14 11:00:00', 2, 'Gọi ĐT nhắc nợ quá hạn', NULL);
INSERT INTO `todo` VALUES (1607, 52, '2020-09-14 08:08:00', '2020-09-14 11:09:00', 2, 'Làm hồ sơ thẻ tín dụng ', NULL);
INSERT INTO `todo` VALUES (1608, 3, '2020-09-14 14:30:00', '2020-09-14 15:30:00', 2, 'Hẹn gặp anh Lợi nhận HS vay', NULL);
INSERT INTO `todo` VALUES (1609, 53, '2020-09-14 08:06:00', '2020-09-14 08:11:00', 2, 'Do xe e hư đề k được nên lại phòng trễ 1phút đến lúc 8h06', 'accepted');
INSERT INTO `todo` VALUES (1610, 3, '2020-09-14 17:00:00', '2020-09-14 17:30:00', 2, 'Bàn giao các HS giải ngân', NULL);
INSERT INTO `todo` VALUES (1611, 52, '2020-09-14 01:14:00', '2020-09-14 02:14:00', 2, 'Gặp khách hàng ký  hồ sơ làm thẻ td', NULL);
INSERT INTO `todo` VALUES (1612, 52, '2020-09-14 03:15:00', '2020-09-14 04:15:00', 2, 'Bàn giao hồ sơ cho phòng QLTD', NULL);
INSERT INTO `todo` VALUES (1613, 6, '2020-09-14 08:15:00', '2020-09-14 00:00:00', 2, 'Họp hudle', NULL);
INSERT INTO `todo` VALUES (1614, 6, '2020-09-14 11:30:00', '2020-09-14 00:00:00', 2, 'Làm giấy đi đường Lâm Ngọc Thảo', NULL);
INSERT INTO `todo` VALUES (1615, 6, '2020-09-14 16:15:00', '2020-09-14 00:00:00', 2, 'Gọi đt nhắc nợ quá hạn', NULL);
INSERT INTO `todo` VALUES (1616, 53, '2020-09-15 08:15:00', '2020-09-15 09:15:00', 2, 'Nhập LTS cho quầy ', NULL);
INSERT INTO `todo` VALUES (1617, 53, '2020-09-15 09:20:00', '2020-09-15 11:00:00', 2, 'Gọi dt kh ', NULL);
INSERT INTO `todo` VALUES (1618, 53, '2020-09-15 11:00:00', '2020-09-15 00:00:00', 2, 'Đi nộp thư bàn giao hđ', NULL);
INSERT INTO `todo` VALUES (1619, 53, '2020-09-15 14:20:00', '2020-09-15 16:00:00', 2, 'Gọi dt kh', NULL);
INSERT INTO `todo` VALUES (1620, 53, '2020-09-15 13:15:00', '2020-09-15 14:00:00', 2, 'Tra sdt t24 kh tiền gửi', NULL);
INSERT INTO `todo` VALUES (1621, 6, '2020-09-15 13:00:00', '2020-09-15 00:00:00', 2, 'Ký hồ sơ thẻ tín dụng a Quý', NULL);
INSERT INTO `todo` VALUES (1622, 52, '2020-09-15 08:12:00', '2020-09-15 00:13:00', 2, 'Định giá hồ sơ Nguyễn Bé Năm', NULL);
INSERT INTO `todo` VALUES (1623, 52, '2020-09-15 01:13:00', '2020-09-15 04:14:00', 2, 'Lâp tờ trình mở thẻ tín dụng', NULL);
INSERT INTO `todo` VALUES (1624, 8, '2020-09-15 07:30:00', '2020-09-15 09:00:00', 1, 'Đưa hồ sơ công chứng KH Thạch Tấn', 'accepted');
INSERT INTO `todo` VALUES (1625, 8, '2020-09-15 09:00:00', '2020-09-15 11:00:00', 1, 'Nhập tự định giá KH Đỗ Thị Bé Năm', NULL);
INSERT INTO `todo` VALUES (1626, 8, '2020-09-15 11:00:00', '2020-09-15 15:00:00', 1, 'Thẩm định KH Nguyễn Minh Quốc vay 600tr', NULL);
INSERT INTO `todo` VALUES (1627, 8, '2020-09-15 15:00:00', '2020-09-15 16:00:00', 1, 'Đào tạo bảo hiểm tại Phòng', NULL);
INSERT INTO `todo` VALUES (1628, 8, '2020-09-15 16:00:00', '2020-09-15 17:00:00', 1, 'Chuẩn bị giải ngân hồ sơ Thạch Tấn', NULL);
INSERT INTO `todo` VALUES (1629, 3, '2020-09-15 10:30:00', '2020-09-15 11:30:00', 2, 'Gặp KH Thư (Nguyễn văn Toàn) làm biên bản làm việc', NULL);
INSERT INTO `todo` VALUES (1630, 3, '2020-09-15 13:30:00', '2020-09-15 14:00:00', 2, 'Gọi ĐT nhắc nợ quá hạn', NULL);
INSERT INTO `todo` VALUES (1631, 6, '2020-09-15 11:00:00', '2020-09-15 00:00:00', 2, 'Tất nợ KH Châu Dũng Sỉ', NULL);
INSERT INTO `todo` VALUES (1633, 53, '2020-09-16 08:15:00', '2020-09-16 09:00:00', 2, 'Soạn BMH KH Thạch Tấn 15tr', NULL);
INSERT INTO `todo` VALUES (1634, 53, '2020-09-16 09:00:00', '2020-09-16 11:00:00', 2, 'Làm hđ cho khách Thạch Tấn 15tr của a Hưng ', NULL);
INSERT INTO `todo` VALUES (1635, 53, '2020-09-16 14:30:00', '2020-09-16 16:00:00', 2, 'Gọi KH ', NULL);
INSERT INTO `todo` VALUES (1636, 53, '2020-09-16 13:15:00', '2020-09-16 14:15:00', 2, 'Tra Sdt kh trên t24', NULL);
INSERT INTO `todo` VALUES (1637, 53, '2020-09-16 16:00:00', '2020-09-16 17:00:00', 2, 'Soạn bảng tóm tắt sp đầu tư ', NULL);
INSERT INTO `todo` VALUES (1638, 3, '2020-09-16 08:30:00', '2020-09-16 09:30:00', 2, 'Gặp KH anh Lợi giới thiệu HS vay', 'accepted');
INSERT INTO `todo` VALUES (1639, 3, '2020-09-16 10:00:00', '2020-09-16 10:30:00', 2, 'Gọi ĐT chị Thanh Chúc tư vấn mua bảo hiểm nhân thọ', NULL);
INSERT INTO `todo` VALUES (1640, 3, '2020-09-16 10:30:00', '2020-09-16 11:00:00', 2, 'Gọi ĐT nhắc nợ quá hạn', NULL);
INSERT INTO `todo` VALUES (1641, 6, '2020-09-16 10:32:00', '2020-09-16 00:00:00', 2, 'Giải chấp lấy tài sản KH Châu Dũng Sỉ', NULL);
INSERT INTO `todo` VALUES (1642, 6, '2020-09-16 11:00:00', '2020-09-16 00:00:00', 2, 'Đt a Trường về hs vay mua BDS', NULL);
INSERT INTO `todo` VALUES (1643, 53, '2020-09-17 09:00:00', '2020-09-17 11:00:00', 2, 'Gọi KH tiền gửi ', NULL);
INSERT INTO `todo` VALUES (1644, 53, '2020-09-17 08:15:00', '2020-09-17 09:00:00', 2, 'Điều chỉnh thêm về bảng tóm tắt ', NULL);
INSERT INTO `todo` VALUES (1645, 53, '2020-09-17 13:30:00', '2020-09-17 14:45:00', 2, 'Soạn BMH và làm hđ cho a Hưng ', NULL);
INSERT INTO `todo` VALUES (1646, 53, '2020-09-17 15:00:00', '2020-09-17 16:00:00', 2, 'Nhập mail áp phí cho hđ ', NULL);
INSERT INTO `todo` VALUES (1647, 52, '2020-09-17 08:40:00', '2020-09-17 10:40:00', 1, 'Gặp khách ký hồ sơ làm thẻ tín dung', NULL);
INSERT INTO `todo` VALUES (1648, 52, '2020-09-17 11:40:00', '2020-09-17 02:40:00', 1, 'Lập hồ sơ đinh giá', NULL);
INSERT INTO `todo` VALUES (1649, 6, '2020-09-17 11:15:00', '2020-09-17 00:00:00', 2, 'Liên hệ chị Tuyết vay mua Bđs', NULL);
INSERT INTO `todo` VALUES (1650, 6, '2020-09-17 09:00:00', '2020-09-17 00:00:00', 2, 'Họp hudle', NULL);
INSERT INTO `todo` VALUES (1651, 6, '2020-09-17 13:20:00', '2020-09-17 00:00:00', 2, 'Soạn hs thẻ tín dụng a Quý', NULL);
INSERT INTO `todo` VALUES (1652, 53, '2020-09-18 09:00:00', '2020-09-18 10:45:00', 2, 'Gọi dt ', NULL);
INSERT INTO `todo` VALUES (1653, 53, '2020-09-18 11:00:00', '2020-09-18 00:00:00', 2, 'Đi lấy hđ ở sacom lầu 10', NULL);
INSERT INTO `todo` VALUES (1654, 53, '2020-09-18 14:20:00', '2020-09-18 15:50:00', 2, 'Gọi dt kh ', NULL);
INSERT INTO `todo` VALUES (1655, 53, '2020-09-18 08:15:00', '2020-09-18 09:00:00', 2, 'Lên danh sách tiềm năng', NULL);
INSERT INTO `todo` VALUES (1656, 3, '2020-09-18 08:00:00', '2020-09-18 08:30:00', 2, 'Ghé CN Tây Đô gửi chứng từ thanh tra nhà nước', 'accepted');
INSERT INTO `todo` VALUES (1657, 53, '2020-09-21 08:00:00', '2020-09-21 10:00:00', 2, 'Họp huddle', NULL);
INSERT INTO `todo` VALUES (1658, 53, '2020-09-21 10:00:00', '2020-09-21 11:30:00', 2, 'Coi lại danh sách để chốt hđ trong tháng này ', NULL);
INSERT INTO `todo` VALUES (1659, 53, '2020-09-21 14:20:00', '2020-09-21 15:45:00', 2, 'Gọi dt kh', NULL);
INSERT INTO `todo` VALUES (1660, 53, '2020-09-21 13:16:00', '2020-09-21 14:00:00', 2, 'Dõi hđ ', NULL);
INSERT INTO `todo` VALUES (1661, 6, '2020-09-21 08:30:00', '2020-09-21 00:00:00', 2, 'Họp hudle', NULL);
INSERT INTO `todo` VALUES (1662, 6, '2020-09-21 11:30:00', '2020-09-21 00:00:00', 2, 'Liên hệ KH Trinh như cầu vay góp lương', NULL);
INSERT INTO `todo` VALUES (1663, 6, '2020-09-21 16:15:00', '2020-09-21 00:00:00', 2, 'Đt nhắc nợ quá hạn', NULL);
INSERT INTO `todo` VALUES (1664, 53, '2020-09-21 08:00:00', '2020-09-21 08:14:00', 2, 'Do sáng KH cũ Nguyễn Thị Hồng thắm dt hỏi thông tin đã cập nhật lại giấy tờ hỗm điều chỉnh có gửi thư về cho KH không, trễ 9phút', 'accepted');
INSERT INTO `todo` VALUES (1665, 53, '2020-09-22 09:00:00', '2020-09-22 11:00:00', 2, 'Gọi dt giới thiệu dịch vụ ck nhanh 24/7', NULL);
INSERT INTO `todo` VALUES (1666, 53, '2020-09-22 08:15:00', '2020-09-22 08:45:00', 2, 'Kiểm tra thông tin hđ mới lên hôm qua của a Hưng ', NULL);
INSERT INTO `todo` VALUES (1667, 53, '2020-09-22 02:20:00', '2020-09-22 04:00:00', 2, 'Gọi data ', NULL);
INSERT INTO `todo` VALUES (1668, 53, '2020-09-22 13:30:00', '2020-09-22 14:00:00', 2, 'Nộp tiền cho hđbh hôm qua ', NULL);
INSERT INTO `todo` VALUES (1669, 3, '2020-09-22 08:00:00', '2020-09-22 08:30:00', 2, 'Cấp giấy đi đường KH Phạm Ngọc Quốc', NULL);
INSERT INTO `todo` VALUES (1670, 3, '2020-09-22 08:30:00', '2020-09-22 09:00:00', 2, 'Gửi định giá HS vay KH Nguyễn Thị Lan Hương', NULL);
INSERT INTO `todo` VALUES (1671, 3, '2020-09-22 16:30:00', '2020-09-22 20:00:00', 2, 'Họp ở chi nhánh Cần Thơ', NULL);
INSERT INTO `todo` VALUES (1672, 3, '2020-09-22 14:00:00', '2020-09-22 14:30:00', 2, 'Gửi định giá HS vay KH Trần Hoàng Hạnh', NULL);
INSERT INTO `todo` VALUES (1673, 3, '2020-09-23 08:00:00', '2020-09-23 00:00:00', 2, 'Đi định giá HS KH Nguyễn Thị Lan Hương ở Vĩnh Thạnh', 'accepted');
INSERT INTO `todo` VALUES (1674, 3, '2020-09-23 13:30:00', '2020-09-23 14:00:00', 2, 'Gọi ĐT nhắc nợ quá hạn', NULL);
INSERT INTO `todo` VALUES (1675, 3, '2020-09-23 14:00:00', '2020-09-23 15:00:00', 2, 'Soạn HS vay KH Nguyễn Thị Lan Hương', NULL);
INSERT INTO `todo` VALUES (1676, 3, '2020-09-23 15:00:00', '2020-09-23 16:00:00', 2, 'Trình HS vay thấu chi Phạm Minh Dũng (Yến Lê)', NULL);
INSERT INTO `todo` VALUES (1677, 53, '2020-09-23 09:00:00', '2020-09-23 10:50:00', 2, 'Gọi dt kh ', NULL);
INSERT INTO `todo` VALUES (1678, 53, '2020-09-23 11:00:00', '2020-09-23 00:00:00', 2, 'Đi nộp tiền cho hđ của a Hưng, hôm qua khách mới ck ', NULL);
INSERT INTO `todo` VALUES (1679, 53, '2020-09-23 14:30:00', '2020-09-23 16:00:00', 2, 'Gọi dt ', NULL);
INSERT INTO `todo` VALUES (1680, 53, '2020-09-23 13:15:00', '2020-09-23 14:00:00', 2, 'Nhập LTS gắn hoa hồng cho phòng ', NULL);
INSERT INTO `todo` VALUES (1681, 53, '2020-09-24 09:00:00', '2020-09-24 10:45:00', 2, 'Gọi dt KH ', NULL);
INSERT INTO `todo` VALUES (1682, 53, '2020-09-24 08:00:00', '2020-09-24 08:30:00', 2, 'Mở gtk cho a Hưng  để huỷ hđ', NULL);
INSERT INTO `todo` VALUES (1683, 53, '2020-09-24 11:00:00', '2020-09-24 00:00:00', 2, 'Đi nộp giấy huỷ hđ và thư bàn giao hđ của khách chị Nga ', NULL);
INSERT INTO `todo` VALUES (1684, 53, '2020-09-24 14:30:00', '2020-09-24 16:00:00', 2, 'Gọi dt kh ', NULL);
INSERT INTO `todo` VALUES (1685, 6, '2020-09-24 08:05:00', '2020-09-24 00:00:00', 2, 'Lấy chứng từ ttctxh chị Hằng', 'accepted');
INSERT INTO `todo` VALUES (1686, 6, '2020-09-24 09:30:00', '2020-09-24 00:00:00', 2, 'Đi thẩm định xe cờ đỏ', NULL);
INSERT INTO `todo` VALUES (1687, 53, '2020-09-25 09:00:00', '2020-09-25 10:45:00', 1, 'Gọi dt giới thiệu dịch vụ sd app miễn phí ', NULL);
INSERT INTO `todo` VALUES (1688, 53, '2020-09-25 08:20:00', '2020-09-25 09:00:00', 1, 'Kiểm tra thông tin kh của a Hưng ', NULL);
INSERT INTO `todo` VALUES (1689, 53, '2020-09-25 14:30:00', '2020-09-25 15:45:00', 1, 'Gọi dt kh ', NULL);
INSERT INTO `todo` VALUES (1690, 53, '2020-09-25 13:15:00', '2020-09-25 14:00:00', 1, 'Cpi BMH và hồ sơ để lên lại hđ của a Hưng ', NULL);
INSERT INTO `todo` VALUES (1691, 6, '2020-09-25 11:00:00', '2020-09-25 00:00:00', 1, 'Đt a Sĩ nhu cầu vay mua BDS lấy TS thế chấp', NULL);
INSERT INTO `todo` VALUES (1692, 6, '2020-09-25 16:00:00', '2020-09-25 00:00:00', 1, 'Gọi đt kh quá hạn', NULL);
INSERT INTO `todo` VALUES (1693, 53, '2020-09-28 08:00:00', '2020-09-28 10:00:00', 2, 'Họp huddle', NULL);
INSERT INTO `todo` VALUES (1694, 53, '2020-09-28 10:00:00', '2020-09-28 11:00:00', 2, 'Gọi dt kh ', NULL);
INSERT INTO `todo` VALUES (1695, 53, '2020-09-28 11:00:00', '2020-09-28 11:45:00', 2, 'Theo dõi hđ của a Hưng hệ thống đã huỷ chưa ', NULL);
INSERT INTO `todo` VALUES (1696, 53, '2020-09-28 14:30:00', '2020-09-28 16:00:00', 2, 'Gọi dt kh chào DVU app trên dt ', NULL);
INSERT INTO `todo` VALUES (1697, 6, '2020-09-28 08:30:00', '2020-09-28 00:00:00', 2, 'Họp hudle', NULL);
INSERT INTO `todo` VALUES (1698, 6, '2020-09-28 10:30:00', '2020-09-28 00:00:00', 2, 'Làm giấy đi đường KH Võ Hồng Nhanh', NULL);
INSERT INTO `todo` VALUES (1699, 6, '2020-09-28 14:00:00', '2020-09-28 00:00:00', 2, 'Trùnh thẻ tín dụng a Quý', NULL);
INSERT INTO `todo` VALUES (1700, 3, '2020-09-28 08:30:00', '2020-09-28 09:00:00', 2, 'Thu nợ trước hạn KH Hoàng Văn Đức', NULL);
INSERT INTO `todo` VALUES (1701, 3, '2020-09-28 09:00:00', '2020-09-28 10:00:00', 2, 'Trình HS KH Nguyễn Thị Lan Hương', NULL);
INSERT INTO `todo` VALUES (1702, 3, '2020-09-28 13:30:00', '2020-09-28 14:00:00', 2, 'Gọi ĐT nhắc nợ quá hạn', NULL);
INSERT INTO `todo` VALUES (1704, 53, '2020-09-29 09:00:00', '2020-09-29 10:45:00', 2, 'Gọi dt kh ', NULL);
INSERT INTO `todo` VALUES (1705, 53, '2020-09-29 08:15:00', '2020-09-29 09:00:00', 2, 'Theo dõi hđ huỷ của a Hưng ', NULL);
INSERT INTO `todo` VALUES (1706, 53, '2020-09-29 11:00:00', '2020-09-29 00:00:00', 2, 'Lấy bộ hđ bh khách Đào Thị Hoa của a Hưng', NULL);
INSERT INTO `todo` VALUES (1707, 53, '2020-09-29 14:30:00', '2020-09-29 16:00:00', 2, 'Gọi dt kh ', NULL);
INSERT INTO `todo` VALUES (1708, 53, '2020-09-29 15:30:00', '2020-09-29 16:30:00', 2, 'Lên lại case 30tr cho a Hưng', NULL);
INSERT INTO `todo` VALUES (1709, 6, '2020-09-30 08:00:00', '2020-09-30 00:00:00', 2, 'Gặp kh Minh tư vấn mua BĐS', 'accepted');
INSERT INTO `todo` VALUES (1710, 6, '2020-09-30 11:00:00', '2020-09-30 00:00:00', 2, 'Gửi định giá KH Trung', NULL);
INSERT INTO `todo` VALUES (1711, 6, '2020-09-30 15:30:00', '2020-09-30 00:00:00', 2, 'Gọi đt KH quá hạn', NULL);
INSERT INTO `todo` VALUES (1712, 8, '2020-09-30 07:45:00', '2020-09-30 08:20:00', 1, 'Gặp KH Võ Minh Sang vay thêm 150tr', 'accepted');
INSERT INTO `todo` VALUES (1713, 8, '2020-09-30 08:20:00', '2020-09-30 00:00:00', 1, 'Giải ngân KH Đỗ Thị Bé Năm và hỗ trợ KH tham gia bảo hiểm', NULL);
INSERT INTO `todo` VALUES (1714, 8, '2020-09-30 13:00:00', '2020-09-30 05:00:00', 1, 'Báo cáo đến hạn HĐLĐ', NULL);
INSERT INTO `todo` VALUES (1715, 53, '2020-09-30 08:30:00', '2020-09-30 09:45:00', 2, 'Đi nộp giấy thư OTP cho hđ của a Hưng và đi nộp chứng từ dùm cho c Hương ', NULL);
INSERT INTO `todo` VALUES (1716, 53, '2020-09-30 14:30:00', '2020-09-30 15:20:00', 2, 'Lên hđ cho a Điền', NULL);
INSERT INTO `todo` VALUES (1717, 53, '2020-09-30 13:30:00', '2020-09-30 14:00:00', 2, 'Nộp tiền trực tuyến cho hđ a Hưng', NULL);
INSERT INTO `todo` VALUES (1718, 53, '2020-09-30 10:15:00', '2020-09-30 10:40:00', 2, 'Lên hđ cho chị Hằng ', NULL);
INSERT INTO `todo` VALUES (1719, 3, '2020-09-30 08:30:00', '2020-09-30 09:00:00', 1, 'Trình HS vay KH Phạm Minh Dũng', NULL);
INSERT INTO `todo` VALUES (1720, 3, '2020-09-30 09:00:00', '2020-09-30 09:30:00', 1, 'Trình HS vay KH Nguyễn Thị Lan Hương', NULL);
INSERT INTO `todo` VALUES (1721, 3, '2020-09-30 10:30:00', '2020-09-30 11:00:00', 1, 'Gọi ĐT nhắc nợ quá hạn', NULL);
INSERT INTO `todo` VALUES (1722, 53, '2020-10-02 08:28:00', '2020-10-02 09:00:00', 2, 'Gắn hoa hồng cho mn ', NULL);
INSERT INTO `todo` VALUES (1723, 53, '2020-10-02 09:15:00', '2020-10-02 10:50:00', 2, 'Gọi dt ', NULL);
INSERT INTO `todo` VALUES (1724, 53, '2020-10-02 14:30:00', '2020-10-02 15:45:00', 2, 'Gọi data', NULL);
INSERT INTO `todo` VALUES (1725, 53, '2020-10-02 16:00:00', '2020-10-02 17:00:00', 2, 'Làm bảng theo dõi refer mấy tháng vừa rồi ', NULL);
INSERT INTO `todo` VALUES (1726, 3, '2020-10-05 08:30:00', '2020-10-05 09:30:00', 2, 'Soạn HS giải ngân KH Nguyễn Thị Lan Hương', NULL);
INSERT INTO `todo` VALUES (1727, 3, '2020-10-05 10:30:00', '2020-10-05 11:00:00', 2, 'Gọi ĐT nhắc nợ quá hạn', NULL);
INSERT INTO `todo` VALUES (1728, 3, '2020-10-05 14:30:00', '2020-10-05 15:30:00', 2, 'Gặp anh nhơn tư vấn vay thế chấp', NULL);
INSERT INTO `todo` VALUES (1729, 6, '2020-10-05 09:30:00', '2020-10-05 00:00:00', 2, 'Đt chị Dao chủ tịch hội phụ nữ Phong Điền vay', NULL);
INSERT INTO `todo` VALUES (1730, 6, '2020-10-05 14:00:00', '2020-10-05 00:00:00', 2, 'Gặp a Phú vay mua xe', NULL);
INSERT INTO `todo` VALUES (1731, 6, '2020-10-05 16:00:00', '2020-10-05 00:00:00', 2, 'Đt nhắc nợ quá hạn', NULL);
INSERT INTO `todo` VALUES (1732, 53, '2020-10-06 09:00:00', '2020-10-06 10:50:00', 2, 'Gọi dt KH ', NULL);
INSERT INTO `todo` VALUES (1733, 53, '2020-10-06 14:30:00', '2020-10-06 15:45:00', 2, 'Gọi dt ', NULL);
INSERT INTO `todo` VALUES (1734, 53, '2020-10-06 08:01:00', '2020-10-06 09:45:00', 2, 'Họp huddle', NULL);
INSERT INTO `todo` VALUES (1735, 3, '2020-10-06 08:30:00', '2020-10-06 09:00:00', 2, 'Gọi ĐT KH Trần Thị Mỹ Linh tư vấn vay ', NULL);
INSERT INTO `todo` VALUES (1736, 3, '2020-10-06 09:00:00', '2020-10-06 10:00:00', 2, 'Thu thập HS KH Trần Hoàng Hạnh để hoàn thiện HS', NULL);
INSERT INTO `todo` VALUES (1737, 3, '2020-10-06 10:30:00', '2020-10-06 11:00:00', 2, 'Gọi ĐT nhắc nợ quá hạn', NULL);
INSERT INTO `todo` VALUES (1738, 3, '2020-10-06 15:00:00', '2020-10-06 16:00:00', 2, 'Gặp KH Nguyễn Thị Thanh Chúc tư vấn bảo hiểm', NULL);
INSERT INTO `todo` VALUES (1739, 53, '2020-10-07 09:00:00', '2020-10-07 10:50:00', 2, 'Gọi những hđ bị mất hiệu lực', NULL);
INSERT INTO `todo` VALUES (1740, 53, '2020-10-07 11:00:00', '2020-10-07 00:00:00', 2, 'Lấy hđ của KH Nguyễn Thị Lan Hương ', NULL);
INSERT INTO `todo` VALUES (1741, 53, '2020-10-07 14:30:00', '2020-10-07 15:50:00', 2, 'Gọi dt KH ', NULL);
INSERT INTO `todo` VALUES (1742, 53, '2020-10-07 13:15:00', '2020-10-07 14:00:00', 2, 'KT lại những thông tin refer cũ', NULL);
INSERT INTO `todo` VALUES (1743, 6, '2020-10-07 09:00:00', '2020-10-07 00:00:00', 2, 'Đi định giá thới lai phan văn trung', NULL);
INSERT INTO `todo` VALUES (1744, 53, '2020-10-08 08:11:00', '2020-10-08 10:00:00', 2, 'Họp huddle', NULL);
INSERT INTO `todo` VALUES (1745, 53, '2020-10-08 10:00:00', '2020-10-08 11:00:00', 2, 'Gọi dt ', NULL);
INSERT INTO `todo` VALUES (1746, 53, '2020-10-08 11:00:00', '2020-10-08 00:00:00', 2, 'Đi nộp giấy huỷ hđ của khách chị Hằng', NULL);
INSERT INTO `todo` VALUES (1747, 53, '2020-10-08 14:30:00', '2020-10-08 15:45:00', 2, 'Gọi KH ', NULL);
INSERT INTO `todo` VALUES (1748, 53, '2020-10-09 09:00:00', '2020-10-09 10:30:00', 2, 'Gọi dt nhắc phí kh tháng 10 ', NULL);
INSERT INTO `todo` VALUES (1749, 53, '2020-10-09 10:45:00', '2020-10-09 11:30:00', 2, 'Nộp giấy huỷ hđ của chị Hằng vì hôm qua chị Hằng nhờ ghi sổ vô kho để cho kịp ngta xuống kiểm tra ', NULL);
INSERT INTO `todo` VALUES (1750, 53, '2020-10-09 14:30:00', '2020-10-09 15:45:00', 2, 'Gọi dt ', NULL);
INSERT INTO `todo` VALUES (1751, 6, '2020-10-09 08:15:00', '2020-10-09 00:00:00', 2, 'Gặp anh Tín vay tín chấp', 'accepted');
INSERT INTO `todo` VALUES (1752, 6, '2020-10-09 11:15:00', '2020-10-09 00:00:00', 2, 'Làm hs thẻ tín dụng chị Yến', NULL);
INSERT INTO `todo` VALUES (1753, 6, '2020-10-09 15:30:00', '2020-10-09 00:00:00', 2, 'Gọi đt KH quá hạn', NULL);
INSERT INTO `todo` VALUES (1754, 8, '2020-10-09 07:45:00', '2020-10-09 09:00:00', 1, 'Gặp a Hiệp nhận hs KH Văn Tuấn Hùng vay vốn 500tr', 'request');
INSERT INTO `todo` VALUES (1755, 6, '2020-10-12 08:00:00', '2020-10-12 00:00:00', 2, 'Đau bụng, đau bao tử', 'accepted');
INSERT INTO `todo` VALUES (1756, 6, '2020-10-12 08:30:00', '2020-10-12 00:00:00', 2, 'Họp hudle', NULL);
INSERT INTO `todo` VALUES (1757, 6, '2020-10-12 10:45:00', '2020-10-12 00:00:00', 2, 'Soạn hs Trung', NULL);
INSERT INTO `todo` VALUES (1758, 6, '2020-10-12 15:35:00', '2020-10-12 00:00:00', 2, 'Đt kh quá hạn', NULL);
INSERT INTO `todo` VALUES (1759, 53, '2020-10-12 08:12:00', '2020-10-12 10:00:00', 2, 'Họp huddle', NULL);
INSERT INTO `todo` VALUES (1760, 3, '2020-10-12 08:30:00', '2020-10-12 09:30:00', 2, 'Giải ngân HS KH Phạm Minh dũng', NULL);
INSERT INTO `todo` VALUES (1761, 53, '2020-10-12 10:00:00', '2020-10-12 11:00:00', 2, 'Gọi dt ', NULL);
INSERT INTO `todo` VALUES (1762, 3, '2020-10-12 09:30:00', '2020-10-12 10:00:00', 2, 'Gửi định giá HS vay KH Trần Hoàng Hạnh', NULL);
INSERT INTO `todo` VALUES (1763, 3, '2020-10-12 10:30:00', '2020-10-12 11:00:00', 2, 'Gọi ĐT nhắc nợ quá hạn', NULL);
INSERT INTO `todo` VALUES (1764, 53, '2020-10-12 14:30:00', '2020-10-12 15:45:00', 2, 'Gọi dt kh ', NULL);
INSERT INTO `todo` VALUES (1765, 3, '2020-10-12 16:00:00', '2020-10-12 16:30:00', 2, 'Đi định giá HS KH Nguyễn Thị Hằng', NULL);
INSERT INTO `todo` VALUES (1766, 3, '2020-10-13 08:00:00', '2020-10-13 09:00:00', 2, 'Gặp anh nhơn tư vấn vay thế chấp', 'accepted');
INSERT INTO `todo` VALUES (1767, 3, '2020-10-13 09:30:00', '2020-10-13 10:00:00', 2, 'Soạn trước HS vay chị Hằng', NULL);
INSERT INTO `todo` VALUES (1768, 3, '2020-10-13 10:30:00', '2020-10-13 11:00:00', 2, 'Gọi ĐT nhắc nợ quá hạn', NULL);
INSERT INTO `todo` VALUES (1769, 3, '2020-10-13 13:00:00', '2020-10-13 13:30:00', 2, 'Gặp chị diện ký mở thẻ tín dụng', NULL);
INSERT INTO `todo` VALUES (1770, 3, '2020-10-13 14:00:00', '2020-10-13 15:00:00', 2, 'Đi định giá HS vay KH Trần Hoàng Hạnh', NULL);
INSERT INTO `todo` VALUES (1771, 53, '2020-10-13 09:00:00', '2020-10-13 10:50:00', 2, 'Gọi dt ', NULL);
INSERT INTO `todo` VALUES (1772, 53, '2020-10-13 08:20:00', '2020-10-13 08:45:00', 2, 'Theo dõi HĐBH của khách chị Hằng hệ thống huỷ chưa ', NULL);
INSERT INTO `todo` VALUES (1773, 53, '2020-10-13 14:30:00', '2020-10-13 16:00:00', 2, 'Gọi dt ', NULL);
INSERT INTO `todo` VALUES (1774, 53, '2020-10-13 13:15:00', '2020-10-13 14:15:00', 2, 'Tra sdt KHTK trên t24', NULL);
INSERT INTO `todo` VALUES (1775, 53, '2020-10-14 09:00:00', '2020-10-14 10:45:00', 2, 'Gọi dt ', NULL);
INSERT INTO `todo` VALUES (1776, 53, '2020-10-14 14:30:00', '2020-10-14 16:00:00', 2, 'Gọi dt ', NULL);
INSERT INTO `todo` VALUES (1777, 53, '2020-10-14 11:00:00', '2020-10-13 23:45:00', 2, 'Lọc những sdt KH ', NULL);
INSERT INTO `todo` VALUES (1779, 3, '2020-10-15 08:00:00', '2020-10-15 08:30:00', 1, 'Gặp anh Nhơn ký HS vay', 'accepted');
INSERT INTO `todo` VALUES (1780, 3, '2020-10-15 09:00:00', '2020-10-15 10:00:00', 1, 'Giải ngân HS vay KH Nguyễn Thị Lan Hương', NULL);
INSERT INTO `todo` VALUES (1781, 3, '2020-10-15 10:00:00', '2020-10-15 11:00:00', 1, 'Trình HS vay thấu chi KH Nguyễn ngọc Diện', NULL);
INSERT INTO `todo` VALUES (1782, 3, '2020-10-15 13:30:00', '2020-10-15 14:00:00', 1, 'Gọi ĐT nhắc nợ quá hạn', NULL);
INSERT INTO `todo` VALUES (1783, 3, '2020-10-15 14:00:00', '2020-10-15 15:00:00', 1, 'Soạn HS vay KH Trần Hoàng Hạnh', NULL);
INSERT INTO `todo` VALUES (1784, 6, '2020-10-15 08:00:00', '2020-10-15 00:00:00', 2, 'Gặp KH chị Dao lấy thỏa thuận hợp tác', 'accepted');
INSERT INTO `todo` VALUES (1785, 6, '2020-10-15 10:58:00', '2020-10-15 00:00:00', 2, 'Trình hs thẻ tín dụng Yến, Điền', NULL);
INSERT INTO `todo` VALUES (1786, 53, '2020-10-15 08:00:00', '2020-10-15 10:00:00', 2, 'Họp huddle', NULL);
INSERT INTO `todo` VALUES (1787, 53, '2020-10-15 10:10:00', '2020-10-15 11:30:00', 2, 'Soạn hđ bh cho khách chị Nga lên case 20tr', NULL);
INSERT INTO `todo` VALUES (1788, 53, '2020-10-15 14:30:00', '2020-10-15 16:00:00', 2, 'Gọi dt kh ', NULL);
INSERT INTO `todo` VALUES (1789, 53, '2020-10-15 11:00:00', '2020-10-15 11:45:00', 2, 'Đưa thư bàn giao hđ cho chị Hương KH của a Điền ký ', NULL);
INSERT INTO `todo` VALUES (1790, 53, '2020-10-16 08:30:00', '2020-10-16 09:30:00', 2, 'Đi nộp thư bàn giao gấp KH của a Điền, do hỗm rài chị Hương bận k gặp chỉ dc nên hôm qua giải ngân mới đưa cho ký ', NULL);
INSERT INTO `todo` VALUES (1791, 53, '2020-10-16 09:45:00', '2020-10-16 10:45:00', 2, 'Gọi dt KH ', NULL);
INSERT INTO `todo` VALUES (1792, 53, '2020-10-16 11:00:00', '2020-10-16 11:30:00', 2, 'Nộp phí trực tuyến cho HĐBH mới ký hôm qua ', NULL);
INSERT INTO `todo` VALUES (1793, 53, '2020-10-16 14:30:00', '2020-10-16 15:45:00', 2, 'Gọi dt KH ', NULL);
INSERT INTO `todo` VALUES (1794, 8, '2020-10-19 07:45:00', '2020-10-19 08:45:00', 1, 'Gặp chị Ngọc nhu cầu vay 350tr', 'accepted');
INSERT INTO `todo` VALUES (1795, 8, '2020-10-19 08:45:00', '2020-10-19 10:00:00', 1, 'Họp phòng', NULL);
INSERT INTO `todo` VALUES (1796, 53, '2020-10-19 07:55:00', '2020-10-19 08:11:00', 2, 'Đường cmt8 ngập với kẹt xe nên đi trễ ', 'accepted');
INSERT INTO `todo` VALUES (1797, 53, '2020-10-19 08:22:00', '2020-10-19 10:00:00', 2, 'Họp huddle ', NULL);
INSERT INTO `todo` VALUES (1798, 53, '2020-10-19 10:00:00', '2020-10-19 11:15:00', 2, 'Gọi dt ', NULL);
INSERT INTO `todo` VALUES (1799, 53, '2020-10-19 14:30:00', '2020-10-19 15:50:00', 2, 'Gọi dt kh ', NULL);
INSERT INTO `todo` VALUES (1800, 53, '2020-10-19 13:15:00', '2020-10-19 14:00:00', 2, 'Kiểm tra thông tin nhập LTS ', NULL);
INSERT INTO `todo` VALUES (1801, 6, '2020-10-20 08:15:00', '2020-10-20 00:00:00', 2, 'Ghé cn CT lấy đồ 20.10', 'accepted');
INSERT INTO `todo` VALUES (1802, 6, '2020-10-20 10:30:00', '2020-10-20 00:00:00', 2, 'Bs hs a Lưu Đức Điền', NULL);
INSERT INTO `todo` VALUES (1803, 6, '2020-10-20 13:20:00', '2020-10-20 00:00:00', 2, 'Làm hs góp lương a Nhơn', NULL);
INSERT INTO `todo` VALUES (1804, 6, '2020-10-20 14:00:00', '2020-10-20 00:00:00', 2, 'Làm hs chị Nhân ttctxh', NULL);
INSERT INTO `todo` VALUES (1805, 6, '2020-10-20 15:30:00', '2020-10-20 00:00:00', 2, 'Đt nhắc nợ quá hạn', NULL);
INSERT INTO `todo` VALUES (1806, 53, '2020-10-20 08:00:00', '2020-10-20 08:35:00', 1, 'Gặp khách mở gói tk sẵn gt gửi tiền tk ', 'accepted');
INSERT INTO `todo` VALUES (1807, 53, '2020-10-20 09:00:00', '2020-10-20 10:45:00', 2, 'Gọi dt ', NULL);
INSERT INTO `todo` VALUES (1808, 53, '2020-10-20 14:30:00', '2020-10-20 15:45:00', 2, 'Gọi chào thẻ TD ', NULL);
INSERT INTO `todo` VALUES (1809, 3, '2020-10-26 08:30:00', '2020-10-26 09:00:00', 2, 'Trình HS KH nguyễn Ngọc Diện', NULL);
INSERT INTO `todo` VALUES (1810, 3, '2020-10-26 09:00:00', '2020-10-26 09:30:00', 2, 'Gọi ĐT KH Nguyễn Ngọc Hân tư vấn vay thêm', NULL);
INSERT INTO `todo` VALUES (1811, 3, '2020-10-26 14:00:00', '2020-10-26 15:00:00', 2, 'Soạn HS vay KH Trần Hoàng Hạnh', NULL);
INSERT INTO `todo` VALUES (1812, 3, '2020-10-26 10:30:00', '2020-10-26 11:00:00', 2, 'Gọi ĐT nhắc nợ quá hạn', NULL);
INSERT INTO `todo` VALUES (1813, 3, '2020-10-26 17:00:00', '2020-10-26 17:30:00', 2, 'Bàn giao HS giải ngân', NULL);
INSERT INTO `todo` VALUES (1814, 6, '2020-10-28 08:10:00', '2020-10-28 00:00:00', 2, 'Đi chụp hình thẩm định KH Tín', 'accepted');
INSERT INTO `todo` VALUES (1815, 6, '2020-10-28 10:30:00', '2020-10-28 00:00:00', 2, 'Soạn hs góp lương KH Tín', NULL);
INSERT INTO `todo` VALUES (1816, 6, '2020-10-28 15:30:00', '2020-10-28 00:00:00', 2, 'Gọi đt nhắc nợ quá hạn', NULL);
INSERT INTO `todo` VALUES (1817, 53, '2020-10-29 08:04:00', '2020-10-29 10:00:00', 2, 'Họp huddle', NULL);
INSERT INTO `todo` VALUES (1818, 53, '2020-10-29 10:15:00', '2020-10-29 13:30:00', 2, 'Đi nộp hồ sơ của hđ a Điền ở mậu thân và lấy hđ ở sacom', NULL);
INSERT INTO `todo` VALUES (1819, 53, '2020-10-29 14:30:00', '2020-10-29 15:45:00', 2, 'Gọi dt ', NULL);
INSERT INTO `todo` VALUES (1820, 53, '2020-10-29 13:20:00', '2020-10-29 14:07:00', 2, 'Kt thông tin hđ ', NULL);
INSERT INTO `todo` VALUES (1821, 3, '2020-10-30 08:00:00', '2020-10-30 08:30:00', 1, 'Giải ngân HS vay Trần Hoàng Hạnh', NULL);
INSERT INTO `todo` VALUES (1822, 3, '2020-10-30 09:00:00', '2020-10-29 09:30:00', 1, 'Gọi ĐT KH anh Út tư vấn vay', NULL);
INSERT INTO `todo` VALUES (1823, 3, '2020-10-30 10:00:00', '2020-10-30 00:00:00', 1, 'Đi xử lý nợ vs anh duy HS KH Trần Văn Trung', NULL);
INSERT INTO `todo` VALUES (1824, 3, '2020-10-30 13:30:00', '2020-10-30 15:00:00', 1, 'Đi định giá hs vay KH nguyễn ngọc hân', NULL);
INSERT INTO `todo` VALUES (1825, 3, '2020-10-30 17:00:00', '2020-10-30 17:30:00', 1, 'Bàn giao HS đã giải ngân', NULL);
INSERT INTO `todo` VALUES (1826, 6, '2020-10-30 08:15:00', '2020-10-30 00:00:00', 2, 'Trả thẻ tín dụng chị Tuyền', 'accepted');
INSERT INTO `todo` VALUES (1827, 6, '2020-10-30 10:25:00', '2020-10-30 00:00:00', 2, 'Up hs A Tín', NULL);
INSERT INTO `todo` VALUES (1828, 6, '2020-10-30 15:30:00', '2020-10-30 00:00:00', 2, 'Đt nhắc nợ quá hạn', NULL);
INSERT INTO `todo` VALUES (1829, 6, '2020-10-30 13:30:00', '2020-10-30 00:00:00', 2, 'Soạn hs góp lương a Nhơn', NULL);
INSERT INTO `todo` VALUES (1830, 53, '2020-10-30 08:00:00', '2020-10-30 09:00:00', 1, 'Nộp thư bàn giao hđ cho hđ của chị Nga', 'accepted');
INSERT INTO `todo` VALUES (1831, 53, '2020-10-30 09:15:00', '2020-10-30 10:50:00', 1, 'Gọi dt kh ', NULL);
INSERT INTO `todo` VALUES (1832, 53, '2020-10-30 14:30:00', '2020-10-30 15:45:00', 1, 'Gọi dt ', NULL);
INSERT INTO `todo` VALUES (1833, 53, '2020-10-30 13:15:00', '2020-10-30 14:00:00', 1, 'Nhập LTS ', NULL);
INSERT INTO `todo` VALUES (1834, 8, '2020-10-30 08:00:00', '2020-10-30 08:15:00', 1, 'Liên hệ Chị Ngọc trích lục sơ đồ vị trí GCN', NULL);
INSERT INTO `todo` VALUES (1835, 8, '2020-10-30 08:15:00', '2020-10-30 09:30:00', 1, 'Xử lý tờ trình KH Nguyễn Thanh Hải vay 350trđ', NULL);
INSERT INTO `todo` VALUES (1836, 8, '2020-10-30 09:30:00', '2020-10-30 10:00:00', 1, 'Liên hệ chị Giang và chị Kim kích hoạt thẻ tín dụng', NULL);
INSERT INTO `todo` VALUES (1837, 8, '2020-10-30 10:00:00', '2020-10-30 00:00:00', 1, 'Gặp KH Trần Văn Tiết nhu cầu vay vốn 200trđ', NULL);
INSERT INTO `todo` VALUES (1838, 8, '2020-11-02 07:45:00', '2020-11-02 08:30:00', 1, 'Gặp a Quân trả hồ sơ vay vốn và thu phí tạm ứng định giá', 'accepted');
INSERT INTO `todo` VALUES (1839, 8, '2020-11-02 08:30:00', '2020-11-02 10:00:00', 1, 'Họp phòng', NULL);
INSERT INTO `todo` VALUES (1840, 8, '2020-11-02 10:00:00', '2020-11-02 00:00:00', 1, 'Xử lý hồ sơ Nguyễn Thanh Hải và trình hồ sơ', NULL);
INSERT INTO `todo` VALUES (1841, 8, '2020-11-02 13:00:00', '2020-11-02 02:00:00', 1, 'Gặp chị Nương thống nhất phương án vay vốn', NULL);
INSERT INTO `todo` VALUES (1842, 8, '2020-11-02 14:00:00', '2020-11-02 15:00:00', 1, 'Gặp a Hậu bổ sung hồ sơ vay mua xe', NULL);
INSERT INTO `todo` VALUES (1843, 8, '2020-11-02 15:00:00', '2020-11-02 17:00:00', 1, 'Bàn giao hồ sơ cho quản lý tín dụng', NULL);
INSERT INTO `todo` VALUES (1844, 3, '2020-11-02 08:30:00', '2020-11-02 09:00:00', 2, 'Gọi ĐT anh Vương tư vấn vay', NULL);
INSERT INTO `todo` VALUES (1845, 3, '2020-11-02 09:00:00', '2020-11-02 09:30:00', 2, 'Gọi ĐT anh Út hẹn đi định giá', NULL);
INSERT INTO `todo` VALUES (1846, 3, '2020-11-02 09:30:00', '2020-11-02 10:00:00', 2, 'Gọi ĐT các HS tái cấp HMTC ', NULL);
INSERT INTO `todo` VALUES (1847, 3, '2020-11-02 10:30:00', '2020-11-02 11:00:00', 2, 'Gọi ĐT nhắc nợ quá hạn', NULL);
INSERT INTO `todo` VALUES (1848, 3, '2020-11-02 17:00:00', '2020-11-02 17:30:00', 2, 'Bàn giao HS đã giải ngân', NULL);
INSERT INTO `todo` VALUES (1849, 53, '2020-11-03 08:00:00', '2020-11-03 09:00:00', 2, 'Giao thẻ và hướng dẫn khách kích hoạt thẻ và nộp giấy bổ sung người thụ hưởng cho khách cũ', 'accepted');
INSERT INTO `todo` VALUES (1850, 53, '2020-11-03 09:15:00', '2020-11-03 10:50:00', 2, 'Gọi dt kh ', NULL);
INSERT INTO `todo` VALUES (1851, 53, '2020-11-03 14:30:00', '2020-11-03 16:00:00', 2, 'Gọi dt', NULL);
INSERT INTO `todo` VALUES (1852, 6, '2020-11-03 08:30:00', '2020-11-03 00:00:00', 2, 'Bổ sung hs Tín', NULL);
INSERT INTO `todo` VALUES (1853, 6, '2020-11-03 11:30:00', '2020-11-03 00:00:00', 2, 'Trả giấy đi đường KH Phước và tư vấn thêm vay xe', NULL);
INSERT INTO `todo` VALUES (1854, 6, '2020-11-03 13:30:00', '2020-11-03 00:00:00', 2, 'Đt chị Dao để bổ sung thêm hs', NULL);
INSERT INTO `todo` VALUES (1855, 6, '2020-11-03 16:00:00', '2020-11-03 00:00:00', 2, 'Đt nhắc nợ quá hạn', NULL);
INSERT INTO `todo` VALUES (1856, 6, '2020-11-04 08:00:00', '2020-11-04 00:00:00', 2, 'Gặp chị Nga tư vấn nhu cầu vay mua xe', 'accepted');
INSERT INTO `todo` VALUES (1857, 6, '2020-11-04 10:00:00', '2020-11-04 00:00:00', 2, 'Soạn hs chị Dao', NULL);
INSERT INTO `todo` VALUES (1858, 6, '2020-11-04 15:30:00', '2020-11-04 00:00:00', 2, 'Đt nhắc nợ quá hạn', NULL);
INSERT INTO `todo` VALUES (1859, 3, '2020-11-04 08:00:00', '2020-11-04 09:00:00', 2, 'Gặp KH Lê Minh Út thu thập hồ sơ vay', 'accepted');
INSERT INTO `todo` VALUES (1860, 3, '2020-11-04 09:30:00', '2020-11-04 10:30:00', 2, 'Soạn HS vay thấu chi KH Nguyễn Duy Quang', NULL);
INSERT INTO `todo` VALUES (1861, 3, '2020-11-04 10:30:00', '2020-11-04 11:00:00', 2, 'Gọi ĐT nhắc nợ quá hạn', NULL);
INSERT INTO `todo` VALUES (1862, 3, '2020-11-04 13:30:00', '2020-11-04 14:30:00', 2, 'Soạn HS vay KH Nguyễn Ngọc Hân', NULL);
INSERT INTO `todo` VALUES (1863, 3, '2020-11-04 17:00:00', '2020-11-04 17:30:00', 2, 'Bàn giao các HS giải ngân còn lại', NULL);
INSERT INTO `todo` VALUES (1864, 53, '2020-11-04 09:00:00', '2020-11-04 10:45:00', 2, 'Gọi dt ', NULL);
INSERT INTO `todo` VALUES (1865, 53, '2020-11-04 08:30:00', '2020-11-04 09:00:00', 2, 'Làm ds hoa hồng ', NULL);
INSERT INTO `todo` VALUES (1866, 53, '2020-11-04 14:30:00', '2020-11-04 16:00:00', 2, 'Gọi dt nhắc phí', NULL);
INSERT INTO `todo` VALUES (1867, 53, '2020-11-05 08:30:00', '2020-11-05 10:00:00', 2, 'Họp huddle ', NULL);
INSERT INTO `todo` VALUES (1868, 53, '2020-11-05 10:00:00', '2020-11-05 11:00:00', 2, 'Gọi dt nhắc phí ', NULL);
INSERT INTO `todo` VALUES (1869, 53, '2020-11-05 14:30:00', '2020-11-05 15:45:00', 2, 'Gọi dt ', NULL);
INSERT INTO `todo` VALUES (1870, 53, '2020-11-05 13:30:00', '2020-11-05 14:00:00', 2, 'Chỉnh hoa hồng cho phòng ', NULL);
INSERT INTO `todo` VALUES (1871, 3, '2020-11-06 08:00:00', '2020-11-06 00:00:00', 1, 'Đi thẩm định KH vay ở Trần Đề, Sóc Trăng nhờ anh Hưng hỗ trợ đi chung', NULL);
INSERT INTO `todo` VALUES (1872, 3, '2020-11-06 13:30:00', '2020-11-05 14:00:00', 1, 'Gọi ĐT nhắc nợ quá hạn', NULL);
INSERT INTO `todo` VALUES (1873, 3, '2020-11-06 14:00:00', '2020-11-06 15:00:00', 1, 'Trình HS vay thấu chi Nguyễn Duy Quang', NULL);
INSERT INTO `todo` VALUES (1874, 53, '2020-11-06 09:00:00', '2020-11-06 10:45:00', 2, 'Gọi dt kh ', NULL);
INSERT INTO `todo` VALUES (1875, 53, '2020-11-06 10:30:00', '2020-11-06 11:45:00', 2, 'Lấy bộ hđ của kh a Điền ở sacom ', NULL);
INSERT INTO `todo` VALUES (1876, 53, '2020-11-06 14:40:00', '2020-11-06 16:00:00', 2, 'Gọi dt kh ', NULL);
INSERT INTO `todo` VALUES (1877, 53, '2020-11-06 13:30:00', '2020-11-06 14:11:00', 2, 'Gặp kh chị Hương ký giấy thư bàn giao hđ ', NULL);
INSERT INTO `todo` VALUES (1878, 53, '2020-11-09 08:12:00', '2020-11-09 10:00:00', 2, 'Họp huddle ', NULL);
INSERT INTO `todo` VALUES (1879, 53, '2020-11-09 10:00:00', '2020-11-09 11:00:00', 2, 'Gọi dt ', NULL);
INSERT INTO `todo` VALUES (1880, 53, '2020-11-09 11:00:00', '2020-11-09 00:15:00', 2, 'Nộp thư bàn giao hđ ', NULL);
INSERT INTO `todo` VALUES (1881, 53, '2020-11-09 14:30:00', '2020-11-09 15:45:00', 2, 'Gọi dt ', NULL);
INSERT INTO `todo` VALUES (1882, 3, '2020-11-09 08:30:00', '2020-11-09 09:30:00', 2, 'Gọi ĐT KH nguyễn thị lan hương bổ sung chứng từ trình HS vay lại', NULL);
INSERT INTO `todo` VALUES (1884, 3, '2020-11-09 10:30:00', '2020-11-09 11:00:00', 2, 'Gọi ĐT nhắc nợ quá hạn', NULL);
INSERT INTO `todo` VALUES (1885, 3, '2020-11-09 13:30:00', '2020-11-09 14:30:00', 2, 'Trình HS vay thấu chi Nguyễn Duy Quang', NULL);
INSERT INTO `todo` VALUES (1886, 3, '2020-11-09 14:30:00', '2020-11-09 15:30:00', 2, 'Đi xử lý nợ quá hạn trên 90 ngày KH Trần Văn Trung với anh Duy THN vùng', NULL);
INSERT INTO `todo` VALUES (1887, 6, '2020-11-10 08:05:00', '2020-11-10 00:00:00', 2, 'Bàn giao hs quản lý tín dụng', 'accepted');
INSERT INTO `todo` VALUES (1888, 6, '2020-11-10 10:30:00', '2020-11-10 00:00:00', 2, 'Gọi đt a Dũng nhu cầu vay mua xe', NULL);
INSERT INTO `todo` VALUES (1889, 6, '2020-11-10 15:30:00', '2020-11-10 00:00:00', 2, 'Trình hs chị Dao', NULL);
INSERT INTO `todo` VALUES (1890, 6, '2020-11-10 16:00:00', '2020-11-10 00:00:00', 2, 'Gọibđt nhắc nợ quán hạn', NULL);
INSERT INTO `todo` VALUES (1891, 53, '2020-11-10 09:00:00', '2020-11-10 10:45:00', 2, 'Gọi dt kh ', NULL);
INSERT INTO `todo` VALUES (1892, 53, '2020-11-10 11:00:00', '2020-11-10 11:50:00', 2, 'Kiểm tra lại những kh cũ đã tv ', NULL);
INSERT INTO `todo` VALUES (1893, 53, '2020-11-10 14:30:00', '2020-11-10 15:45:00', 2, 'Gọi dt ', NULL);
INSERT INTO `todo` VALUES (1894, 8, '2020-11-10 07:45:00', '2020-11-10 08:45:00', 1, 'Nhận hồ sơ KH Nguyễn Văn Quí mua BĐS 800tr', 'accepted');
INSERT INTO `todo` VALUES (1895, 8, '2020-11-10 08:45:00', '2020-11-10 09:30:00', 1, 'Tra cic và chuyển định giá KH Nguyễn Văn Quí', NULL);
INSERT INTO `todo` VALUES (1896, 8, '2020-11-10 09:30:00', '2020-11-10 00:00:00', 1, 'Liên hệ chị Ngọc bs ủy quyền công chứng soạn thảo hs KH Võ Thị Ái Nga', NULL);
INSERT INTO `todo` VALUES (1897, 3, '2020-11-10 08:00:00', '2020-11-10 00:00:00', 2, 'Đi học định giá ở chi nhánh Cần Thơ', 'accepted');
INSERT INTO `todo` VALUES (1898, 3, '2020-11-10 13:30:00', '2020-11-10 14:30:00', 2, 'Gặp KH Nguyễn Ngọc Hân cho ký HS vay thêm và thu thập chứng từ', NULL);
INSERT INTO `todo` VALUES (1899, 3, '2020-11-10 15:00:00', '2020-11-10 16:00:00', 2, 'Trình HS vay thấu chi KH Nguyễn Duy Quang', NULL);
INSERT INTO `todo` VALUES (1900, 3, '2020-11-10 16:00:00', '2020-11-10 17:00:00', 2, 'Hoàn thiện HS vay KH Nguyễn Thị Lan Hương', NULL);
INSERT INTO `todo` VALUES (1901, 76, '1970-01-01 00:00:00', '1970-01-01 00:00:00', 1, '9h-11h: call đặt lịch hẹn, tìm kiếm kh\r\n11h-12h: làm hso vay\r\n13h-14h: làm hso\r\n14h-16h30: đi gặp kh tư vấn bh\r\n16h30-17h30: giải quyết hso ', NULL);
INSERT INTO `todo` VALUES (1902, 76, '1970-01-01 00:00:00', '1970-01-01 00:00:00', 1, '9h-11h: call đặt lịch hẹn, tìm kiếm kh\r\n11h-12h: làm hso vayy\r\n13h-14h: làm hso\r\n14h-16h30: đi gặp kh tư vấn bh\r\n16h30-17h30: giải quyết hso ', NULL);
INSERT INTO `todo` VALUES (1903, 73, '1970-01-01 00:00:00', '1970-01-01 00:00:00', 1, 'Nhắc nợ khách hàng quá hạn', NULL);
INSERT INTO `todo` VALUES (1904, 73, '1970-01-01 00:00:00', '1970-01-01 00:00:00', 1, 'Gọi điện, Nt khai thác kết nối lại với các sale cũ, và khách hàng hiện hữu', NULL);
INSERT INTO `todo` VALUES (1905, 73, '1970-01-01 00:00:00', '1970-01-01 00:00:00', 1, 'Làm hồ sơ khách Nguyễn Thanh Hiếu', NULL);
INSERT INTO `todo` VALUES (1906, 73, '1970-01-01 00:00:00', '1970-01-01 00:00:00', 1, 'Hẹn cf với bạn cúc sale bất động sản', NULL);
INSERT INTO `todo` VALUES (1907, 73, '1970-01-01 00:00:00', '1970-01-01 00:00:00', 1, 'Gọi điện Nt kết nối với các bạn sale cũ, gọi khai thác khách hàng hiện hữu', NULL);
INSERT INTO `todo` VALUES (1908, 77, '2020-11-11 08:30:00', '2020-11-11 11:00:00', 1, 'Tư vấn BH cho KH', NULL);
INSERT INTO `todo` VALUES (1909, 76, '2020-11-11 10:16:00', '1970-01-01 00:00:00', 2, 'tìm kiếm kh, lên lịch hẹn gặp các sale bss, xe cho ngày hôm sau. \r\nGiải quyết hồ sơ ', NULL);
INSERT INTO `todo` VALUES (1910, 73, '2020-11-11 12:30:00', '1970-01-01 00:00:00', 1, '12h30- 13h : nhắc nợ khách hàng và làm xuất mượn tài sản khách\r\n13h-14: gọi điện khai thác , kết nối với các bạn sale cũ, và khách hàng hiện hữu\r\n14h - 16h : làm hồ sơ kh nguyễn thanh hiếu\r\n16- 18h: gặp bạn cúc sale bds cafe', NULL);
INSERT INTO `todo` VALUES (1911, 78, '1970-01-01 00:00:00', '1970-01-01 00:00:00', 1, '1. Sáng 8h - 8h30: Gặp chị Nguyễn Thị Vân Hạt ký giấy tờ bổ sung\r\n8h30 - 10h30: Gặp khách hàng anh Đăng tư vấn thẻ visa và tiết kiệm\r\n10h30-12h: Gặp sales BDS anh Dũng - Quận 1\r\n2. Chiều 13h - 15h: Gọi điện, nhắn tin chắm sóc khách hàng\r\n15h-17h: Xử lý cô', NULL);
INSERT INTO `todo` VALUES (1916, 78, '1970-01-01 00:00:00', '1970-01-01 00:00:00', 1, 'Gặp sales BDS anh Dũng - Quận 1', NULL);
INSERT INTO `todo` VALUES (1917, 78, '1970-01-01 00:00:00', '1970-01-01 00:00:00', 1, 'Gặp sales BDS anh Dũng - Quận 1', NULL);
INSERT INTO `todo` VALUES (1918, 78, '1970-01-01 00:00:00', '1970-01-01 00:00:00', 1, 'Gặp sales BDS anh Dũng - Quận 1', NULL);
INSERT INTO `todo` VALUES (1919, 78, '1970-01-01 00:00:00', '1970-01-01 00:00:00', 1, 'Gặp sales BDS anh Dũng - Quận 1', NULL);
INSERT INTO `todo` VALUES (1920, 78, '1970-01-01 00:00:00', '1970-01-01 00:00:00', 1, 'Gọi điện, nhắn tin chắm sóc khách hàng', NULL);
INSERT INTO `todo` VALUES (1921, 78, '1970-01-01 00:00:00', '1970-01-01 00:00:00', 1, 'Gặp sales BDS anh Dũng - Quận 1', NULL);
INSERT INTO `todo` VALUES (1922, 78, '1970-01-01 00:00:00', '1970-01-01 00:00:00', 1, 'Gặp sales BDS anh Dũng - Quận 1', NULL);
INSERT INTO `todo` VALUES (1924, 78, '1970-01-01 00:00:00', '1970-01-01 00:00:00', 1, 'Gặp sales BDS anh Dũng - Quận 1', NULL);
INSERT INTO `todo` VALUES (1925, 78, '1970-01-01 00:00:00', '1970-01-01 00:00:00', 1, 'Gặp sales BDS anh Dũng - Quận 1', NULL);
INSERT INTO `todo` VALUES (1928, 3, '2020-11-12 08:00:00', '2020-11-12 09:00:00', 2, 'Gặp chị Hân chụp hình nơi kinh doanh và sổ sách ghi chép', 'accepted');
INSERT INTO `todo` VALUES (1929, 3, '2020-11-12 09:30:00', '2020-11-12 10:30:00', 2, 'Trình HS vay thấu chi KH Nguyễn Duy Quang', NULL);
INSERT INTO `todo` VALUES (1930, 3, '2020-11-12 10:30:00', '2020-11-12 11:30:00', 2, 'Trình tờ trình giữ lại khoản vay quá hạn KH Trần Văn Trung', NULL);
INSERT INTO `todo` VALUES (1931, 3, '2020-11-12 13:30:00', '2020-11-12 14:00:00', 2, 'Gọi ĐT nhắc nợ quá hạn', NULL);
INSERT INTO `todo` VALUES (1932, 6, '2020-11-12 08:00:00', '2020-11-12 00:00:00', 2, 'Gặp a Hải ttctxh ký hs vay', 'accepted');
INSERT INTO `todo` VALUES (1933, 3, '2020-11-12 15:00:00', '2020-11-12 16:00:00', 2, 'Trình HS vay bù đắp BDS KH Nguyễn Thị Lan Hương', NULL);
INSERT INTO `todo` VALUES (1934, 6, '2020-11-12 10:30:00', '2020-11-12 00:00:00', 2, 'Cb hs giải ngân KH chị Dao', NULL);
INSERT INTO `todo` VALUES (1935, 53, '2020-11-12 08:30:00', '2020-11-12 10:00:00', 2, 'Họp huddle ', NULL);
INSERT INTO `todo` VALUES (1936, 53, '2020-11-12 10:15:00', '2020-11-12 11:45:00', 2, 'Đi gặp a Trung bên BH Xe Mic trả lại phiếu bh ', NULL);
INSERT INTO `todo` VALUES (1937, 53, '2020-11-12 14:30:00', '2020-11-12 15:45:00', 2, 'Gọi dt KH ', NULL);
INSERT INTO `todo` VALUES (1938, 53, '2020-11-12 13:00:00', '2020-11-12 14:00:00', 2, 'Đi lấy hđ BH của KH Đỗ Thị Thanh Hương ', NULL);
INSERT INTO `todo` VALUES (1939, 77, '2020-11-12 09:00:00', '2020-11-12 17:30:00', 1, 'Học sản phẩm An Tâm Trọn Đời ', NULL);
INSERT INTO `todo` VALUES (1940, 76, '2020-11-12 08:00:00', '1970-01-01 00:00:00', 1, '8h: sắp xếp cv\r\n9h: qua q5 ki hdld\r\n10h-12h: liên hệ các sale bds và sale xe\r\n13h-15h: gặp a toàn sale bds\r\n15h17h: gặp chị chi sale xe', NULL);
INSERT INTO `todo` VALUES (1941, 73, '2020-11-12 12:00:00', '1970-01-01 00:00:00', 1, '12h - 14h: ở văn phòng xem lại hồ sơ chị Phượng.\r\n14h- 16h ; có hẹn với các bạn chuyên viên bank khác khái thác bán chéo thẻ tín dụng\r\n16h-20 : ở bank xử lý hồ sơ.\r\n', NULL);
INSERT INTO `todo` VALUES (1942, 72, '2020-11-12 20:05:00', '2020-11-12 16:06:00', 1, 'sale tại phòng và sale bên ngoài', NULL);
INSERT INTO `todo` VALUES (1944, 53, '2020-11-13 09:15:00', '2020-11-13 10:45:00', 2, 'Nhắc phí KH tháng 11', NULL);
INSERT INTO `todo` VALUES (1945, 53, '2020-11-13 14:30:00', '2020-11-13 16:00:00', 1, 'Gọi dt ', NULL);
INSERT INTO `todo` VALUES (1946, 53, '2020-11-13 08:10:00', '2020-11-13 09:00:00', 2, 'Nộp thư bàn giao hđ của KH Đỗ Thị Thanh Hương ở văn phòng Pru Mậu Thân ', 'denied');
INSERT INTO `todo` VALUES (1947, 53, '2020-11-13 13:20:00', '2020-11-13 14:00:00', 2, 'Đánh BMH cho KH của  a Điền ', NULL);
INSERT INTO `todo` VALUES (1948, 73, '2020-11-13 08:00:00', '1970-01-01 00:00:00', 1, '8:30 -12h giải ngân cho vay trả góp cbnv\r\n13h- 13h30 : kiểm tra khách hàng quá hạn\r\n13h30- 14h : gọi tư vấn 2 khách đang có nhu cầu vay\r\n14h - 15h: gọi khai thác kh hàng tiết kiệm, kh hiện hữu, thẻ tín dụng.\r\n15-18h : làm hồ sơ chị phượng', NULL);
INSERT INTO `todo` VALUES (1949, 78, '2020-11-13 08:41:00', '1970-01-01 00:00:00', 1, 'Gặp khách vay BDS ở Bình Tân', NULL);
INSERT INTO `todo` VALUES (1950, 78, '2020-11-13 08:42:00', '1970-01-01 00:00:00', 1, 'Tư vấn thẻ a Long', NULL);
INSERT INTO `todo` VALUES (1951, 78, '2020-11-13 00:00:00', '1970-01-01 00:00:00', 1, 'Gọi điện nhắn tin, chăm sóc khách hàng cũ', NULL);
INSERT INTO `todo` VALUES (1952, 53, '2020-11-16 08:00:00', '2020-11-16 10:00:00', 2, 'Họp huddle ', NULL);
INSERT INTO `todo` VALUES (1953, 53, '2020-11-16 10:10:00', '2020-11-16 11:10:00', 2, 'Gọi dt nhắc phí ', NULL);
INSERT INTO `todo` VALUES (1954, 53, '2020-11-16 14:30:00', '2020-11-16 16:00:00', 2, 'Gọi dt ', NULL);
INSERT INTO `todo` VALUES (1955, 8, '2020-11-16 07:45:00', '2020-11-16 10:00:00', 1, 'Định giá KH Nguyễn Văn Quí cùng AMC', 'accepted');
INSERT INTO `todo` VALUES (1956, 8, '2020-11-16 10:00:00', '2020-11-16 00:00:00', 1, 'Gặp a Hậu trao đổi hồ sơ mua xe', NULL);
INSERT INTO `todo` VALUES (1957, 8, '2020-11-16 13:00:00', '2020-11-16 14:00:00', 1, 'Gặp chị Nga trao đổi hồ sơ bổ sung trích lục sơ đồ vị trí', NULL);
INSERT INTO `todo` VALUES (1958, 3, '2020-11-16 08:30:00', '2020-11-16 09:30:00', 2, 'Trình HS vay thế chấp KH Nguyễn Thị Lan Hương', NULL);
INSERT INTO `todo` VALUES (1959, 3, '2020-11-16 09:30:00', '2020-11-16 10:30:00', 2, 'Trình HS vay thấu chi KH Nguyễn Duy Quang', NULL);
INSERT INTO `todo` VALUES (1960, 3, '2020-11-16 10:30:00', '2020-11-16 11:00:00', 2, 'Gọi ĐT nhắc nợ quá hạn', NULL);
INSERT INTO `todo` VALUES (1961, 3, '2020-11-16 14:00:00', '2020-11-16 15:00:00', 2, 'Trình HS vay tiêu dùng thế chấp KH Nguyễn Ngọc Hân', NULL);
INSERT INTO `todo` VALUES (1962, 3, '2020-11-16 17:00:00', '2020-11-16 17:30:00', 2, 'Bàn giao các HS đã giải ngân', NULL);
INSERT INTO `todo` VALUES (1963, 73, '2020-11-16 08:30:00', '1970-01-01 00:00:00', 1, '8:30 - 10:30: ở văn phòng xử lý việc hành chính, giấy đi đường, bảo hiểm, gọi điện cho khách nhắc nợ, gọi kết nói các khách hàng cũ, các bạn môi giới.\r\n10h30 - 12h ; hẹn cafe với chị trinh kh hiện hữu, làm sale bds chị có nhu cầu mở thẻ tín dụng cho nhân ', NULL);
INSERT INTO `todo` VALUES (1964, 76, '2020-11-16 08:00:00', '1970-01-01 00:00:00', 1, '8h-9h: rà lại công việc cần làm\r\n9h-11h: đi gặp c dung tư vấn thẻ td. \r\n11h-12h: liên hệ lại một số kh cũ nt chào bán các sp.  \r\n13h-15h: telesale và nt cho các sale bds, xe, \r\n15h-16h30: đi gặp bạn Nhung tư vấn mở gói tk, và mở thẻ td. \r\n16h30-17h30: lên', NULL);
INSERT INTO `todo` VALUES (1965, 78, '2020-11-17 08:08:00', '2020-11-17 00:00:00', 1, '- Gọi điện, nhắn tin chăm sóc khách hàng và sale BDS, showroom xe\r\n- Tư vấn 02 khách hàng thẻ tín dụng anh Long và a Lâm\r\n\r\n', NULL);
INSERT INTO `todo` VALUES (1966, 78, '2020-11-17 08:10:00', '1970-01-01 00:00:00', 1, '- Xử lý các công việc hành chính, nhập kho, làm tờ trình, nhắc nợ,...', NULL);
INSERT INTO `todo` VALUES (1968, 3, '2020-11-18 08:00:00', '2020-11-18 08:30:00', 2, 'Gặp KH Nguyễn Ngọc Hân nhận chứng từ bổ sung', 'accepted');
INSERT INTO `todo` VALUES (1969, 3, '2020-11-18 09:00:00', '2020-11-18 09:30:00', 2, 'Thu nợ trước hạn HS vay KH Hà Văn Nhường', NULL);
INSERT INTO `todo` VALUES (1970, 3, '2020-11-18 10:00:00', '2020-11-18 11:00:00', 2, 'Trình HS vay thấu chi KH Nguyễn Duy Quang', NULL);
INSERT INTO `todo` VALUES (1971, 3, '2020-11-18 13:30:00', '2020-11-18 14:00:00', 2, 'Gọi ĐT nhắc nợ quá hạn', NULL);
INSERT INTO `todo` VALUES (1972, 3, '2020-11-18 14:00:00', '2020-11-18 15:00:00', 2, 'Trình HS vay KH Nguyễn Ngọc Hân', NULL);
INSERT INTO `todo` VALUES (1973, 6, '2020-11-18 08:30:00', '2020-11-18 00:00:00', 2, 'Trả thẻ tín dụng KH Đức Tín, đi lấy thẻ tên ở chinnhasnh CT', 'accepted');
INSERT INTO `todo` VALUES (1974, 6, '2020-11-18 10:40:00', '2020-11-18 00:00:00', 2, 'Trình hs thẻ tín dụng KH Phương', NULL);
INSERT INTO `todo` VALUES (1975, 6, '2020-11-18 13:30:00', '2020-11-18 00:00:00', 2, 'Soạn hs a Trung', NULL);
INSERT INTO `todo` VALUES (1976, 6, '2020-11-18 16:30:00', '2020-11-18 00:00:00', 2, 'Gọi đt nhắc nợ quá hạn', NULL);
INSERT INTO `todo` VALUES (1977, 53, '2020-11-19 08:00:00', '2020-11-19 10:00:00', 2, 'Họp huddle', NULL);
INSERT INTO `todo` VALUES (1978, 53, '2020-11-19 10:10:00', '2020-11-19 11:15:00', 2, 'Gọi dt ', NULL);
INSERT INTO `todo` VALUES (1979, 53, '2020-11-19 13:30:00', '2020-11-19 14:00:00', 2, 'Gọi khách cũ của chị Nga hẹn gặp để trao đổi giải thích lại sp cũ của anh ', NULL);
INSERT INTO `todo` VALUES (1980, 53, '2020-11-19 14:30:00', '2020-11-19 15:45:00', 2, 'Gọi dt kh ', NULL);
INSERT INTO `todo` VALUES (1981, 3, '2020-11-19 08:00:00', '2020-11-19 08:30:00', 2, 'Gặp KH Trân tư vấn vay vốn', 'accepted');
INSERT INTO `todo` VALUES (1982, 3, '2020-11-19 09:00:00', '2020-11-19 09:30:00', 2, 'Gọi ĐT KH Đặng út em tư vấn vay', NULL);
INSERT INTO `todo` VALUES (1983, 3, '2020-11-19 09:30:00', '2020-11-19 10:30:00', 2, 'Trình HS vay KH Nguyễn Duy Quang', NULL);
INSERT INTO `todo` VALUES (1984, 3, '2020-11-19 10:30:00', '2020-11-19 11:00:00', 2, 'Gọi ĐT nhắc nợ quá hạn', NULL);
INSERT INTO `todo` VALUES (1985, 3, '2020-11-19 14:00:00', '2020-11-19 15:00:00', 2, 'Trình HS vay KH Nguyễn Ngọc Hân', NULL);
INSERT INTO `todo` VALUES (1986, 8, '2020-11-19 07:45:00', '2020-11-19 08:45:00', 2, 'Gặp chị Tuyền bổ sung hồ sơ vay thêm 1,2 tỷ', 'accepted');
INSERT INTO `todo` VALUES (1987, 8, '2020-11-19 08:45:00', '2020-11-19 10:00:00', 2, 'Xử lý hồ sơ a Quân vay 750tr', NULL);
INSERT INTO `todo` VALUES (1988, 8, '2020-11-19 10:00:00', '2020-11-19 00:00:00', 2, 'Gặp a Tâm nhu cầu vay 400tr', NULL);
INSERT INTO `todo` VALUES (1989, 8, '2020-11-20 07:45:00', '2020-11-20 08:30:00', 1, 'Gặp a Dũng ký mở tài khoản số đẹp', NULL);
INSERT INTO `todo` VALUES (1990, 8, '2020-11-20 08:30:00', '2020-11-20 11:00:00', 1, 'Bổ sung hồ sơ định giá, xử lý hs a Hiếu Quân vay 700tr', NULL);
INSERT INTO `todo` VALUES (1991, 8, '2020-11-20 11:00:00', '2020-11-20 00:00:00', 1, 'Xử lý bàn giao KH Nguyễn Quốc Chiến', NULL);
INSERT INTO `todo` VALUES (1992, 8, '2020-11-20 13:00:00', '2020-11-20 15:00:00', 1, 'Thi online nghiệp vụ định giá', NULL);
INSERT INTO `todo` VALUES (1993, 8, '2020-11-20 15:00:00', '2020-11-20 17:00:00', 1, 'Gặp a Hồ Quốc Việt nhu cầu vay 2 tỷ', NULL);
INSERT INTO `todo` VALUES (1994, 3, '2020-11-21 11:30:00', '2020-11-21 13:30:00', 2, 'Họp kinh doanh PVcomBank Trà Nóc', NULL);
INSERT INTO `todo` VALUES (1995, 6, '2020-11-21 11:30:00', '2020-11-21 13:30:00', 2, 'Họp kinh doanh PVcomBank Trà Nóc', NULL);
INSERT INTO `todo` VALUES (1996, 8, '2020-11-21 11:30:00', '2020-11-21 13:30:00', 2, 'Họp kinh doanh PVcomBank Trà Nóc', NULL);
INSERT INTO `todo` VALUES (1998, 53, '2020-11-21 11:30:00', '1970-01-01 00:00:00', 2, 'Họp kinh doanh PVcomBank Trà Nóc', NULL);
INSERT INTO `todo` VALUES (1999, 3, '2020-11-20 09:00:00', '2020-11-20 10:00:00', 1, 'Soạn HS KH Đặng Út Em vay góp lương', NULL);
INSERT INTO `todo` VALUES (2000, 3, '2020-11-20 10:00:00', '2020-11-20 10:30:00', 1, 'Trình HS vay thấu chi KH Nguyễn Duy Quang', NULL);
INSERT INTO `todo` VALUES (2001, 3, '2020-11-20 13:30:00', '2020-11-20 14:00:00', 1, 'Gọi ĐT nhắc nợ quá hạn', NULL);
INSERT INTO `todo` VALUES (2002, 3, '2020-11-20 15:00:00', '2020-11-20 16:00:00', 1, 'Trình HS vay Tiêu dùng KH Nguyễn Ngọc Hân', NULL);
INSERT INTO `todo` VALUES (2003, 8, '2020-11-23 07:45:00', '2020-11-23 08:30:00', 1, 'Gặp A Thương nhu cầu mở TK số đẹp và vay 250tr ở Bình Thủy', 'accepted');
INSERT INTO `todo` VALUES (2004, 8, '2020-11-23 08:30:00', '2020-11-23 09:30:00', 1, 'Họp huddle ', NULL);
INSERT INTO `todo` VALUES (2005, 8, '2020-11-23 09:30:00', '2020-11-23 00:00:00', 1, 'Trình hồ sơ KH Nguyễn Hiếu Quân', NULL);
INSERT INTO `todo` VALUES (2006, 6, '2020-11-23 08:30:00', '2020-11-23 00:00:00', 2, 'Họp hudle\r\n', NULL);
INSERT INTO `todo` VALUES (2007, 6, '2020-11-23 13:00:00', '2020-11-23 00:00:00', 2, 'Trình hs a Trung', NULL);
INSERT INTO `todo` VALUES (2008, 6, '2020-11-23 10:00:00', '2020-11-23 00:00:00', 2, 'Làm hs thẻ td a Sang', NULL);
INSERT INTO `todo` VALUES (2009, 53, '2020-11-23 08:14:00', '2020-11-23 10:00:00', 2, 'Họp huddle ', NULL);
INSERT INTO `todo` VALUES (2010, 53, '2020-11-23 10:14:00', '2020-11-23 00:00:00', 2, 'Đi gặp KH chị Hữu Nhân ký giấy bổ sung form cấp hồ sơ ', NULL);
INSERT INTO `todo` VALUES (2011, 53, '2020-11-23 14:30:00', '2020-11-23 15:45:00', 2, 'Gọi dt KH ', NULL);
INSERT INTO `todo` VALUES (2012, 53, '2020-11-23 13:20:00', '2020-11-23 14:00:00', 2, 'Nhập LTS ', NULL);
INSERT INTO `todo` VALUES (2013, 3, '2020-11-23 08:30:00', '2020-11-23 09:00:00', 2, 'Làm giấy đi đường KH Trần Văn Hải', NULL);
INSERT INTO `todo` VALUES (2014, 3, '2020-11-23 09:00:00', '2020-11-23 09:30:00', 2, 'Trình HS vay thấu chi KH Nguyễn Duy Quang', NULL);
INSERT INTO `todo` VALUES (2015, 3, '2020-11-23 10:30:00', '2020-11-23 11:00:00', 2, 'Gọi ĐT nhắc nợ quá hạn', NULL);
INSERT INTO `todo` VALUES (2016, 3, '2020-11-23 14:00:00', '2020-11-23 15:00:00', 2, 'Trình HS vay KH Nguyễn Ngọc Hân', NULL);
INSERT INTO `todo` VALUES (2017, 3, '2020-11-23 15:00:00', '2020-11-23 16:00:00', 2, 'Soạn HS vay góp lương KH Đặng Út Em', NULL);
INSERT INTO `todo` VALUES (2018, 6, '2020-11-24 10:50:00', '2020-11-24 00:00:00', 2, 'Trình hs a Thạnh\r\n', NULL);
INSERT INTO `todo` VALUES (2019, 6, '2020-11-24 10:50:00', '2020-11-24 00:00:00', 2, 'Trình hs a Trung', NULL);
INSERT INTO `todo` VALUES (2020, 6, '2020-11-24 13:00:00', '2020-11-24 00:00:00', 2, 'Giải ngân hs chị Dao', NULL);
INSERT INTO `todo` VALUES (2021, 6, '2020-11-24 08:05:00', '2020-11-24 00:00:00', 2, 'Ghé chụp hình chỗ a Chiến ', 'accepted');
INSERT INTO `todo` VALUES (2022, 3, '2020-11-24 08:00:00', '2020-11-24 10:00:00', 2, 'Đi xử lý nợ KH Lê Văn Út Dứt vs Anh Duy bộ phận thu hồi nợ', 'accepted');
INSERT INTO `todo` VALUES (2023, 3, '2020-11-24 10:30:00', '2020-11-24 11:30:00', 2, 'Trình HS góp lương KH Đặng út em', NULL);
INSERT INTO `todo` VALUES (2024, 3, '2020-11-24 13:30:00', '2020-11-24 14:00:00', 2, 'Gọi ĐT nhắc nợ quá hạn', NULL);
INSERT INTO `todo` VALUES (2025, 3, '2020-11-24 14:00:00', '2020-11-24 15:00:00', 2, 'Trình HS vay KH Nguyễn Ngọc Hân', NULL);
INSERT INTO `todo` VALUES (2026, 53, '2020-11-24 09:01:00', '2020-11-24 10:45:00', 2, 'Gọi dt KH ', NULL);
INSERT INTO `todo` VALUES (2027, 53, '2020-11-24 10:30:00', '2020-11-23 23:50:00', 2, 'Gặp chị Nhân thu phí BH ', NULL);
INSERT INTO `todo` VALUES (2028, 53, '2020-11-24 13:30:00', '2020-11-24 14:00:00', 2, 'Nhập LTS ', NULL);
INSERT INTO `todo` VALUES (2029, 53, '2020-11-24 14:00:00', '2020-11-24 15:30:00', 2, 'Làm hđ 15tr KH Tâm của a Hưng ', NULL);
INSERT INTO `todo` VALUES (2030, 3, '2020-11-25 11:44:00', '2020-11-25 11:44:00', 2, 'Găp KH', NULL);
INSERT INTO `todo` VALUES (2031, 8, '2020-11-25 11:44:00', '2020-11-25 11:44:00', 2, 'Găp KH', NULL);
INSERT INTO `todo` VALUES (2032, 3, '2020-11-25 08:00:00', '2020-11-25 08:40:00', 2, 'Gặp anh Út Em nhận chứng từ bổ sung HS vay và gặp chị Hương cho ký đơn phát hành thẻ tín dụng', 'accepted');
INSERT INTO `todo` VALUES (2033, 3, '2020-11-25 09:00:00', '2020-11-25 09:30:00', 2, 'Trình HS vay KH Nguyễn Ngọc Hân', NULL);
INSERT INTO `todo` VALUES (2034, 3, '2020-11-25 09:30:00', '2020-11-25 10:30:00', 2, 'Trình HS vay góp lương KH Đặng Út Em', NULL);
INSERT INTO `todo` VALUES (2035, 3, '2020-11-25 10:30:00', '2020-11-25 11:00:00', 2, 'Gọi ĐT nhắc nợ quá hạn', NULL);
INSERT INTO `todo` VALUES (2036, 3, '2020-11-25 14:00:00', '2020-11-25 15:00:00', 2, 'Trình HS thẻ tín dụng KH Nguyễn Thị Lan Hương', NULL);
INSERT INTO `todo` VALUES (2037, 53, '2020-11-25 09:00:00', '2020-11-25 10:45:00', 2, 'Gọi dt nhắc phí ', NULL);
INSERT INTO `todo` VALUES (2038, 53, '2020-11-25 10:50:00', '2020-11-25 11:30:00', 2, 'Nhập ds nhận hoa hồng cho hđ đã phát hành tháng 11', NULL);
INSERT INTO `todo` VALUES (2039, 53, '2020-11-25 14:30:00', '2020-11-25 15:45:00', 2, 'Gọi dt ', NULL);
INSERT INTO `todo` VALUES (2040, 53, '2020-11-26 08:00:00', '2020-11-26 10:00:00', 2, 'Họp huddle ', NULL);
INSERT INTO `todo` VALUES (2041, 53, '2020-11-26 10:10:00', '2020-11-26 11:15:00', 2, 'Gọi dt ', NULL);
INSERT INTO `todo` VALUES (2042, 53, '2020-11-26 14:30:00', '2020-11-26 15:45:00', 2, 'Gọi dt kh ', NULL);
INSERT INTO `todo` VALUES (2043, 6, '2020-11-27 08:10:00', '2020-11-27 00:00:00', 2, 'Qua ttctxh cho a Hải ký hs thấu chi', 'accepted');
INSERT INTO `todo` VALUES (2044, 6, '2020-11-27 10:30:00', '2020-11-27 00:00:00', 2, 'Bs hồ sơ a Chiến', NULL);
INSERT INTO `todo` VALUES (2045, 8, '2020-11-27 07:45:00', '2020-11-27 09:00:00', 1, 'Gặp KH Lê Danh Đồng ký hồ sơ giải ngân', 'accepted');
INSERT INTO `todo` VALUES (2046, 8, '2020-11-27 09:00:00', '2020-11-27 11:00:00', 1, 'Giải ngân KH Lê Danh Đồng', NULL);
INSERT INTO `todo` VALUES (2047, 8, '2020-11-27 11:00:00', '2020-11-27 02:00:00', 1, 'Trao đổi KH Trần Hoàng Trung mua BH nhân thọ 15tr', NULL);
INSERT INTO `todo` VALUES (2048, 53, '2020-11-27 09:00:00', '2020-11-27 11:00:00', 1, 'Gọi dt nhắc phí ', NULL);
INSERT INTO `todo` VALUES (2049, 53, '2020-11-27 08:20:00', '2020-11-27 09:00:00', 1, 'Kiểm tra lại thông tin trên LTS ', NULL);
INSERT INTO `todo` VALUES (2050, 53, '2020-11-27 14:30:00', '2020-11-27 15:45:00', 1, 'Gọi dt ', NULL);
INSERT INTO `todo` VALUES (2051, 53, '2020-11-27 13:30:00', '2020-11-27 14:00:00', 1, 'Hỏi thông tin hồ sơ KH của a Hưng ', NULL);
INSERT INTO `todo` VALUES (2052, 3, '2020-11-27 08:30:00', '2020-11-27 09:30:00', 2, 'Gặp anh Vinh tư vấn vay vốn', 'accepted');
INSERT INTO `todo` VALUES (2053, 3, '2020-11-27 10:00:00', '2020-11-27 11:00:00', 2, 'Trình HS vay góp lương KH Đặng Út Em', NULL);
INSERT INTO `todo` VALUES (2054, 3, '2020-11-27 13:30:00', '2020-11-27 14:00:00', 1, 'Gọi ĐT nhắc nợ quá hạn', NULL);
INSERT INTO `todo` VALUES (2055, 3, '2020-11-27 14:00:00', '2020-11-27 15:00:00', 1, 'Trình HS thẻ tín dụng KH Nguyễn Thị Lan Hương', NULL);
INSERT INTO `todo` VALUES (2056, 6, '2020-11-30 08:05:00', '2020-11-29 00:00:00', 2, 'Ghé chi nhánh lấy hs về giải ngân', 'accepted');
INSERT INTO `todo` VALUES (2057, 6, '2020-11-30 11:00:00', '2020-11-29 00:00:00', 2, 'Giải ngân hs Thạnh', NULL);
INSERT INTO `todo` VALUES (2058, 6, '2020-11-30 15:00:00', '2020-11-29 00:00:00', 2, 'Gọi đt nhắc nợ quá hạn', NULL);
INSERT INTO `todo` VALUES (2059, 6, '2020-11-30 14:00:00', '2020-11-29 00:00:00', 2, 'Giải ngân hs Trung\r\n', NULL);
INSERT INTO `todo` VALUES (2060, 3, '2020-11-30 08:00:00', '2020-11-30 08:30:00', 1, 'Bận việc cá nhân xin vô trễ', 'accepted');
INSERT INTO `todo` VALUES (2061, 3, '2020-11-30 08:30:00', '2020-11-30 09:30:00', 1, 'Trình thẻ tín dụng KH Hương', NULL);
INSERT INTO `todo` VALUES (2062, 3, '2020-11-30 09:30:00', '2020-11-30 10:30:00', 1, 'Gửi đơn phản hồi cho toà án quận Ninh Kiều', NULL);
INSERT INTO `todo` VALUES (2063, 3, '2020-11-30 13:30:00', '2020-11-30 14:00:00', 1, 'Gọi ĐT nhắc nợ quá hạn', NULL);
INSERT INTO `todo` VALUES (2064, 3, '2020-11-30 15:00:00', '2020-11-30 16:00:00', 1, 'Trình HS vay KH Nguyễn Ngọc Hân', NULL);
INSERT INTO `todo` VALUES (2065, 8, '2020-12-03 07:30:00', '2020-12-03 08:30:00', 1, 'Gặp a Thương chị Phương Anh trao đổi lãi suất và bảo hiểm', 'accepted');
INSERT INTO `todo` VALUES (2066, 8, '2020-12-03 08:30:00', '2020-12-03 09:30:00', 1, 'Trả tài sản KH Lê Danh Đồng', NULL);
INSERT INTO `todo` VALUES (2067, 8, '2020-12-03 09:30:00', '2020-12-03 00:00:00', 1, 'Trình hồ sơ KH Nguyễn Văn Thương', NULL);
INSERT INTO `todo` VALUES (2068, 3, '2020-12-04 08:00:00', '2020-12-04 09:00:00', 1, 'Gặp anh Út hẹn ngày đi định giá và trao đổi PA vay', 'accepted');
INSERT INTO `todo` VALUES (2069, 3, '2020-12-04 09:30:00', '2020-12-04 10:30:00', 1, 'Trình HS vay KH Nguyễn Ngọc Hân', NULL);
INSERT INTO `todo` VALUES (2070, 3, '2020-12-04 10:30:00', '2020-12-04 11:00:00', 1, 'Gọi ĐT nhắc nợ quá hạn', NULL);
INSERT INTO `todo` VALUES (2071, 3, '2020-12-04 14:00:00', '2020-12-04 15:00:00', 1, 'Trình HS thẻ tín dụng KH Hương', NULL);
INSERT INTO `todo` VALUES (2072, 3, '2020-12-07 08:00:00', '2020-12-07 09:00:00', 2, 'Gặp KH Hân nhận chứng từ bổ sung', 'denied');
INSERT INTO `todo` VALUES (2073, 3, '2020-12-07 09:30:00', '2020-12-07 10:30:00', 2, 'Trình HS vay KH Nguyễn Ngọc Hân', NULL);
INSERT INTO `todo` VALUES (2074, 3, '2020-12-07 10:30:00', '2020-12-07 11:00:00', 2, 'Gọi ĐT nhắc nợ quá hạn', NULL);
INSERT INTO `todo` VALUES (2075, 3, '2020-12-07 14:00:00', '2020-12-07 15:30:00', 2, 'Trình HS thẻ tín dụng KH Hương', NULL);
INSERT INTO `todo` VALUES (2076, 53, '2020-12-07 08:00:00', '2020-12-07 10:00:00', 2, 'Họp Huddle ', NULL);
INSERT INTO `todo` VALUES (2077, 53, '2020-12-07 10:00:00', '2020-12-07 11:15:00', 2, 'Đối soát lại thông tin CBNV cho phòng banca HO ', NULL);
INSERT INTO `todo` VALUES (2078, 53, '2020-12-07 14:30:00', '2020-12-07 15:45:00', 2, 'Gọi dt KH ', NULL);
INSERT INTO `todo` VALUES (2079, 3, '2020-12-07 08:30:00', '2020-12-07 09:30:00', 2, 'Họp Huddule', NULL);
INSERT INTO `todo` VALUES (2080, 6, '2020-12-07 08:30:00', '2020-12-07 09:30:00', 1, 'Họp Huddule', NULL);
INSERT INTO `todo` VALUES (2081, 8, '2020-12-07 08:30:00', '2020-12-07 09:30:00', 2, 'Họp Huddule', NULL);
INSERT INTO `todo` VALUES (2082, 3, '2020-12-08 08:00:00', '2020-12-08 09:00:00', 2, 'Gặp KH Nguyễn Thành Tâm tư vấn vay vốn', 'accepted');
INSERT INTO `todo` VALUES (2083, 3, '2020-12-08 09:30:00', '2020-12-08 10:00:00', 2, 'Gọi ĐT KH Lê Minh Hải tư vấn bảo hiểm', NULL);
INSERT INTO `todo` VALUES (2084, 3, '2020-12-08 10:00:00', '2020-12-08 10:30:00', 2, 'Gửi lại định giá KH Lê Minh Út', NULL);
INSERT INTO `todo` VALUES (2085, 3, '2020-12-08 10:30:00', '2020-12-08 11:00:00', 2, 'Gọi ĐT nhắc nợ quá hạn', NULL);
INSERT INTO `todo` VALUES (2086, 8, '2020-12-09 07:30:00', '2020-12-09 13:00:00', 2, 'Công chứng và đăng ký thế chấp KH Nguyễn Hiếu Quân', 'accepted');
INSERT INTO `todo` VALUES (2087, 8, '2020-12-09 13:00:00', '2020-12-09 16:00:00', 2, 'Giải ngân KH Nguyễn Hiếu Quân', NULL);
INSERT INTO `todo` VALUES (2088, 8, '2020-12-09 04:00:00', '2020-12-09 17:00:00', 2, 'Soạn thảo VKTD KH Nguyễn Văn Thương', NULL);
INSERT INTO `todo` VALUES (2089, 53, '2020-12-09 09:00:00', '2020-12-09 10:30:00', 2, 'Gọi nhắc phí', NULL);
INSERT INTO `todo` VALUES (2090, 53, '2020-12-09 13:30:00', '2020-12-09 14:30:00', 2, 'Gặp KH cũ Lê Trúc Phương ở vp Pru hướng dẫn thủ tục đổi phí định kỳ nữa năm ', NULL);
INSERT INTO `todo` VALUES (2091, 53, '2020-12-09 14:45:00', '2020-12-09 16:00:00', 2, 'Gọi dt ', NULL);
INSERT INTO `todo` VALUES (2092, 53, '2020-12-10 08:00:00', '2020-12-10 09:15:00', 2, '2 KH Nguyễn Ngọc Hân và Lê Trúc Phương hẹn 8h ở Mậu Thân vp Pru chuyển đổi phí định kỳ thành nữa năm cho khách và nộp thư bàn giao hđ, do vết thương còn đau nên em hạn chế việc đi lại lên xuống nhiều lần bởi vậy đã hẹn gặp 2kh sớm. Vì vp Pru 8h mới mở cửa', 'accepted');
INSERT INTO `todo` VALUES (2093, 53, '2020-12-10 09:00:00', '2020-12-10 10:30:00', 2, 'Họp huddle', NULL);
INSERT INTO `todo` VALUES (2094, 53, '2020-12-10 14:30:00', '2020-12-10 15:45:00', 2, 'Gọi dt', NULL);
INSERT INTO `todo` VALUES (2095, 6, '2020-12-10 08:05:00', '2020-12-10 08:30:00', 2, 'Ghé chi nhánh CT QLTD lấy xóa đăng ký gd xe KH Tuyết', 'accepted');
INSERT INTO `todo` VALUES (2096, 6, '2020-12-10 10:00:00', '2020-12-10 00:00:00', 2, 'Soạn hs thấu chi a Hải', NULL);
INSERT INTO `todo` VALUES (2097, 6, '2020-12-10 11:05:00', '2020-12-10 00:00:00', 2, 'Đt chị Tuyền nhu cầu vay sửa chữa nhà', NULL);
INSERT INTO `todo` VALUES (2098, 6, '2020-12-10 15:00:00', '2020-12-10 00:00:00', 2, 'Đt nhắc nợ quá hạn', NULL);
INSERT INTO `todo` VALUES (2099, 8, '2020-12-10 07:30:00', '2020-12-10 09:00:00', 1, 'Đưa hồ sơ cho a Nguyên và a Thương ký lại mẫu mở tk mới, chụp hình kho lúa của a Thương', 'accepted');
INSERT INTO `todo` VALUES (2100, 8, '2020-12-10 09:00:00', '2020-12-10 11:00:00', 1, 'Scan hs soạn thảo vktd Nguyễn Văn Thương', NULL);
INSERT INTO `todo` VALUES (2101, 8, '2020-12-10 11:00:00', '2020-12-10 14:00:00', 1, 'Xử lý hồ sơ thẻ KH Nguyễn Hiếu Quâb', NULL);
INSERT INTO `todo` VALUES (2102, 8, '2020-12-10 14:00:00', '2020-12-10 17:00:00', 1, 'Soạn thảo lại hợp đồng máy pos và đưa KH ký tên', NULL);
INSERT INTO `todo` VALUES (2104, 3, '2020-12-11 07:00:00', '2020-12-11 17:00:00', 2, 'Đi định giá HS KH Lê Minh Út ở Kiêng Giang', 'accepted');
INSERT INTO `todo` VALUES (2105, 3, '2020-12-14 08:00:00', '2020-12-14 09:00:00', 2, 'Hỗ trợ cô tý gửi tiền gửi tiết kiệm về Trà Nóc ', 'accepted');
INSERT INTO `todo` VALUES (2106, 3, '2020-12-14 10:00:00', '2020-12-14 10:30:00', 2, 'Làm giấy đi đường KH Võ Trần Khiêm', NULL);
INSERT INTO `todo` VALUES (2107, 53, '2020-12-14 08:03:00', '2020-12-14 10:00:00', 2, 'Họp huddle', NULL);
INSERT INTO `todo` VALUES (2108, 53, '2020-12-14 10:04:00', '2020-12-14 11:15:00', 2, 'Gọi nhắc phí ', NULL);
INSERT INTO `todo` VALUES (2109, 53, '2020-12-14 14:30:00', '2020-12-14 15:45:00', 2, 'Gọi dt ', NULL);
INSERT INTO `todo` VALUES (2110, 53, '2020-12-15 07:30:00', '2020-12-15 09:00:00', 2, 'Đi khám sức khoẻ ', 'accepted');
INSERT INTO `todo` VALUES (2111, 3, '2020-12-15 08:00:00', '2020-12-15 09:00:00', 2, 'Gặp anh Sử tư vấn vay vốn', 'accepted');
INSERT INTO `todo` VALUES (2112, 3, '2020-12-15 09:30:00', '2020-12-15 10:00:00', 2, 'Gọi ĐT anh Tứ Hải tư vấn vay vốn', NULL);
INSERT INTO `todo` VALUES (2113, 3, '2020-12-15 10:30:00', '2020-12-15 11:00:00', 2, 'Gọi ĐT nhắc nợ quá hạn', NULL);
INSERT INTO `todo` VALUES (2114, 3, '2020-12-15 14:00:00', '2020-12-15 15:00:00', 2, 'Trình HS vay góp lương KH Đặng Út Em', NULL);
INSERT INTO `todo` VALUES (2115, 3, '2020-12-16 08:00:00', '2020-12-16 09:30:00', 2, 'Em bị sốt em xin lên trễ', 'accepted');
INSERT INTO `todo` VALUES (2116, 3, '2020-12-16 10:00:00', '2020-12-16 10:30:00', 2, 'Gửi yêu cầu giải chấp HS vay KH Lê Tứ Hải', NULL);
INSERT INTO `todo` VALUES (2117, 3, '2020-12-16 10:30:00', '2020-12-16 11:00:00', 2, 'Gọi ĐT nhắc nợ quá hạn', NULL);
INSERT INTO `todo` VALUES (2118, 6, '2020-12-17 08:30:00', '2020-12-17 00:00:00', 2, 'Đi học cơ cấu nợ tại chi nhánh', NULL);
INSERT INTO `todo` VALUES (2119, 3, '2020-12-21 08:00:00', '2020-12-21 08:15:00', 1, 'Họp Huddle đầu ngày', NULL);
INSERT INTO `todo` VALUES (2120, 6, '2020-12-21 08:00:00', '2020-12-21 08:15:00', 1, 'Họp Huddle đầu ngày', NULL);
INSERT INTO `todo` VALUES (2121, 8, '2020-12-21 08:00:00', '2020-12-21 08:15:00', 1, 'Họp Huddle đầu ngày', NULL);
INSERT INTO `todo` VALUES (2122, 53, '2020-12-21 08:00:00', '2020-12-21 08:15:00', 2, 'Họp Huddle đầu ngày', NULL);
INSERT INTO `todo` VALUES (2123, 53, '2020-12-22 08:30:00', '2020-12-22 09:00:00', 2, 'Theo dõi hđ mới nộp và gửi mail áp phí ', NULL);
INSERT INTO `todo` VALUES (2124, 53, '2020-12-22 09:07:00', '2020-12-22 10:45:00', 2, 'Gọi dt nhắc phí và chăm sóc KH ', NULL);
INSERT INTO `todo` VALUES (2125, 53, '2020-12-22 13:30:00', '2020-12-22 14:15:00', 2, 'Đi nộp thư bàn giao và huỷ 2hđ ', NULL);
INSERT INTO `todo` VALUES (2126, 53, '2020-12-22 14:30:00', '2020-12-22 15:45:00', 2, 'Tra sdt KH TK  trên t24 ', NULL);
INSERT INTO `todo` VALUES (2127, 53, '2020-12-23 09:02:00', '2020-12-23 10:45:00', 2, 'Gọi ds đh gửi tk ', NULL);
INSERT INTO `todo` VALUES (2128, 53, '2020-12-23 11:03:00', '2020-12-23 11:30:00', 2, 'Nhập ds lts ', NULL);
INSERT INTO `todo` VALUES (2129, 53, '2020-12-23 14:30:00', '2020-12-23 15:45:00', 2, 'Gọi dt ', NULL);
INSERT INTO `todo` VALUES (2130, 53, '2020-12-23 15:06:00', '2020-12-23 15:30:00', 2, 'Gọi c Thảo chốt giờ để làm hđ ', NULL);
INSERT INTO `todo` VALUES (2131, 53, '2020-12-23 17:00:00', '2020-12-23 19:00:00', 2, 'Đi làm hđ anh Hải với chị Hương ', NULL);
INSERT INTO `todo` VALUES (2132, 53, '2020-12-24 09:00:00', '2020-12-24 10:45:00', 2, 'Gọi ds nhắc đh ', NULL);
INSERT INTO `todo` VALUES (2133, 53, '2020-12-24 10:50:00', '2020-12-24 00:00:00', 2, 'Nộp thư bàn giao hđ và nộp phí của chị Thảo', NULL);
INSERT INTO `todo` VALUES (2134, 53, '2020-12-24 14:30:00', '2020-12-24 15:50:00', 2, 'Gọi dt ', NULL);
INSERT INTO `todo` VALUES (2135, 53, '2020-12-24 13:20:00', '2020-12-24 14:00:00', 2, 'Nhập LTS ', NULL);
INSERT INTO `todo` VALUES (2136, 8, '2020-12-25 08:00:00', '2020-12-25 00:00:00', 2, 'Kiểm kho cùng quản lý tín dụng tại CN Cần Thơ', 'accepted');
INSERT INTO `todo` VALUES (2137, 6, '2020-12-25 08:00:00', '2020-12-25 08:45:00', 1, 'Gặp KH Nguyễn Thị Thu Trang tư vấn vay tiêu dùng 200tr', 'accepted');
INSERT INTO `todo` VALUES (2138, 8, '2020-12-25 13:00:00', '2020-12-25 14:00:00', 2, 'Gặp KH Nguyễn Văn Thương ký hồ sơ giải ngân hạn mức tiếp theo', NULL);
INSERT INTO `todo` VALUES (2139, 6, '2020-12-25 10:45:00', '2020-12-25 12:00:00', 1, 'Soạn hs vay KH Đoàn Huỳnh Hương', NULL);
INSERT INTO `todo` VALUES (2140, 3, '2020-12-25 08:00:00', '2020-12-25 08:30:00', 1, 'Gặp KH Lê Minh Út bổ sung HS vay vốn', 'accepted');
INSERT INTO `todo` VALUES (2141, 6, '2020-12-25 15:00:00', '2020-12-25 16:00:00', 1, 'Đt nhắc nợ KH quá hạn', NULL);
INSERT INTO `todo` VALUES (2142, 8, '2020-12-25 14:00:00', '2020-12-25 16:00:00', 1, 'Thẩm định KH Cẩm Tuyền nhu cầu vay hạn mức kinh doanh bánh kẹo tết', NULL);
INSERT INTO `todo` VALUES (2143, 8, '2020-12-25 16:00:00', '2020-12-25 17:00:00', 1, 'Xử lý hồ sơ thẻ tín dụng KH a Quân', NULL);
INSERT INTO `todo` VALUES (2144, 3, '2020-12-25 09:00:00', '2020-12-25 09:30:00', 1, 'Gặp KH Trần Thanh Sử tư vấn vay vốn', NULL);
INSERT INTO `todo` VALUES (2145, 3, '2020-12-25 10:00:00', '2020-12-25 10:30:00', 1, 'Gọi ĐT nhắc nợ quá hạn', NULL);
INSERT INTO `todo` VALUES (2146, 3, '2020-12-25 13:30:00', '2020-12-25 14:00:00', 1, 'Gửi đề nghị định gì giá  KH Lê Trường Giang', NULL);
INSERT INTO `todo` VALUES (2147, 3, '2020-12-25 14:00:00', '2020-12-25 15:00:00', 1, 'Trình HS vay KH Đặng Út Em', NULL);
INSERT INTO `todo` VALUES (2148, 3, '2020-12-29 08:00:00', '2020-12-29 08:30:00', 2, 'Gặp KH Đặng Út Em ký chứng từ bổ sung để giải ngân', 'accepted');
INSERT INTO `todo` VALUES (2149, 3, '2020-12-29 09:00:00', '2020-12-29 09:30:00', 2, 'Thu nợ khoản vay tín chấp cũ KH Đặng Út Em', NULL);
INSERT INTO `todo` VALUES (2150, 3, '2020-12-29 10:00:00', '2020-12-29 10:30:00', 2, 'Gọi ĐT nhắc nợ quá hạn', NULL);
INSERT INTO `todo` VALUES (2151, 3, '2020-12-29 14:00:00', '2020-12-29 14:30:00', 2, 'Giải ngân HS vay KH Đặng Út Em', NULL);
INSERT INTO `todo` VALUES (2152, 3, '2020-12-29 15:00:00', '2020-12-29 16:00:00', 2, 'Đi định giá HS vay KH Lê Trường Giang', NULL);
INSERT INTO `todo` VALUES (2153, 3, '2020-12-29 11:30:00', '2020-12-29 13:30:00', 2, 'Đi thẩm định HS vay KH Lê Trường Giang', NULL);
INSERT INTO `todo` VALUES (2154, 53, '2021-01-04 08:06:00', '2021-01-04 10:00:00', 2, 'Họp Huddle', NULL);
INSERT INTO `todo` VALUES (2155, 53, '2021-01-04 10:07:00', '2021-01-04 11:30:00', 2, 'Lấy hđ ở sacom và gặp chị Thảo giao hđ ', NULL);
INSERT INTO `todo` VALUES (2156, 53, '2021-01-04 14:30:00', '2021-01-04 15:45:00', 2, 'Gọi dt ', NULL);
INSERT INTO `todo` VALUES (2157, 3, '2021-01-05 08:00:00', '2021-01-05 08:30:00', 2, 'Ghé chi nhánh cần thơ hỗ trợ lấy tài sản cho KH Trần Thị Hồng Hoa', 'accepted');
INSERT INTO `todo` VALUES (2158, 3, '2021-01-05 09:00:00', '2021-01-05 09:30:00', 2, 'Gặp KH Lưu Thành cho ký giấy thu nợ thấu chi', NULL);
INSERT INTO `todo` VALUES (2159, 3, '2021-01-05 10:00:00', '2021-01-05 10:30:00', 2, 'Gửi định giá HS KH Phạm Văn Chí Thanh', NULL);
INSERT INTO `todo` VALUES (2160, 3, '2021-01-05 10:30:00', '2021-01-05 11:00:00', 2, 'Gọi ĐT nhắc nợ quá hạn', NULL);
INSERT INTO `todo` VALUES (2161, 3, '2021-01-06 08:00:00', '2021-01-06 08:30:00', 2, 'Gặp KH Trương Công Luận tư vấn vay', 'request');
INSERT INTO `todo` VALUES (2162, 3, '2021-01-06 09:00:00', '2021-01-06 09:30:00', 2, 'Làm giấy đi đường KH Huỳnh Minh Khương', NULL);
INSERT INTO `todo` VALUES (2163, 3, '2021-01-06 09:30:00', '2021-01-06 10:00:00', 2, 'Gọi ĐT KH Đào Văn Hoà tư vấn vay vốn', NULL);
INSERT INTO `todo` VALUES (2164, 3, '2021-01-06 10:00:00', '2021-01-06 10:30:00', 2, 'Gọi ĐT nhắc nợ quá hạn', NULL);
INSERT INTO `todo` VALUES (2165, 3, '2021-01-06 13:30:00', '2021-01-06 15:00:00', 2, 'Đi định giá HS KH Phạm Văn Chí Thanh', NULL);
INSERT INTO `todo` VALUES (2166, 3, '2021-01-06 15:00:00', '2021-01-06 16:00:00', 2, 'Gặp KH Lê Văn Út bổ sung chứng từ vay vốn', NULL);
INSERT INTO `todo` VALUES (2167, 3, '2021-01-07 08:00:00', '2021-01-07 09:00:00', 2, 'Gặp KH Nguyễn Ngọc Hân bổ sung chứng từ vay thêm', 'request');
INSERT INTO `todo` VALUES (2168, 3, '2021-01-07 09:30:00', '2021-01-07 10:00:00', 2, 'Gọi ĐT KH Võ Thị Cẩm Loan tư vấn vay thêm', NULL);
INSERT INTO `todo` VALUES (2169, 3, '2021-01-07 10:00:00', '2021-01-07 10:30:00', 2, 'Gọi ĐT nhắc nợ quá hạn', NULL);
INSERT INTO `todo` VALUES (2170, 3, '2021-01-07 13:30:00', '2021-01-07 15:00:00', 2, 'Đi định giá HS KH Phạm Văn Chí Thanh', NULL);
INSERT INTO `todo` VALUES (2171, 3, '2021-01-07 15:00:00', '2021-01-07 16:00:00', 2, 'Soạn HS giải ngân hạn mức KH Huỳnh Thứ Phát', NULL);
INSERT INTO `todo` VALUES (2172, 3, '2021-01-08 08:00:00', '2021-01-08 08:30:00', 1, 'Làm giấy đi đường KH Huỳnh Minh Khương', NULL);
INSERT INTO `todo` VALUES (2173, 3, '2021-01-08 09:00:00', '2021-01-08 09:30:00', 1, 'Giải trình vắng mặt tháng 12/2020', NULL);
INSERT INTO `todo` VALUES (2174, 3, '2021-01-08 10:00:00', '2021-01-08 10:30:00', 1, 'Gọi ĐT nhắc nợ quá hạn', NULL);
INSERT INTO `todo` VALUES (2175, 3, '2021-01-08 13:00:00', '2021-01-08 14:00:00', 1, 'Gặp KH Đào Văn Hoà tư vấn vay vốn', NULL);
INSERT INTO `todo` VALUES (2176, 3, '2021-01-08 14:00:00', '2021-01-08 14:30:00', 1, 'Gặp KH Trương Công Luận cho ký HS vay', NULL);
INSERT INTO `todo` VALUES (2177, 3, '2021-01-08 15:00:00', '2021-01-08 16:00:00', 1, 'Soạn HS giải ngân hạn mức KH Huỳnh Thứ Phát', NULL);
INSERT INTO `todo` VALUES (2178, 53, '2021-01-11 08:09:00', '2021-01-11 10:00:00', 2, 'Họp huddle ', NULL);
INSERT INTO `todo` VALUES (2179, 53, '2021-01-11 10:09:00', '2021-01-11 11:30:00', 2, 'Gặp a Phong ký giấy rút tiền và gặp chị Dung ký huỷ hđ ', NULL);
INSERT INTO `todo` VALUES (2180, 53, '2021-01-11 13:00:00', '2021-01-11 14:30:00', 2, 'Nộp giấy huỷ hđ của chị Dung và nộp giấy rút tiền đầu tư của a Phong khách cũ ở Mậu Thân ', NULL);
INSERT INTO `todo` VALUES (2181, 53, '2021-01-11 15:00:00', '2021-01-11 16:30:00', 2, 'Lập kế hoạch 2021 báo cáo cho a Sơn', NULL);
INSERT INTO `todo` VALUES (2182, 3, '2021-01-12 08:00:00', '2021-01-12 09:00:00', 2, 'Bận việc cá nhân ( bạn gái em nhập viện)', 'accepted');
INSERT INTO `todo` VALUES (2183, 3, '2021-01-12 09:30:00', '2021-01-12 10:00:00', 2, 'Giải ngân HS vay hạn mức KH Huỳnh Thứ Phát', NULL);
INSERT INTO `todo` VALUES (2184, 3, '2021-01-12 10:30:00', '2021-01-12 11:00:00', 2, 'Gọi ĐT nhắc nợ quá hạn', NULL);
INSERT INTO `todo` VALUES (2185, 3, '2021-01-12 13:30:00', '2021-01-12 14:30:00', 2, 'Trình HS vay góp lương KH trương công luận', NULL);
INSERT INTO `todo` VALUES (2186, 53, '2021-01-12 08:11:00', '2021-01-12 10:11:00', 2, 'Họp huddle bù', NULL);
INSERT INTO `todo` VALUES (2187, 53, '2021-01-12 10:11:00', '2021-01-12 11:45:00', 2, 'Nhắc phí BH', NULL);
INSERT INTO `todo` VALUES (2188, 53, '2021-01-12 13:15:00', '2021-01-12 14:15:00', 2, 'Nộp thư bàn giao HĐ của KH vay Cẩm Tuyền ở mậu thân ', NULL);
INSERT INTO `todo` VALUES (2189, 53, '2021-01-12 14:30:00', '2021-01-12 15:45:00', 2, 'Gọi dt ', NULL);
INSERT INTO `todo` VALUES (2190, 8, '2021-01-15 07:30:00', '2021-01-15 09:00:00', 1, 'Gặp KH Lê Văn Dũng trao đổi hồ sơ vay mua đất ở Thới Lai', 'accepted');
INSERT INTO `todo` VALUES (2191, 8, '2021-01-15 09:00:00', '2021-01-15 10:30:00', 1, 'Gặp chị Nguyễn Thị Thương vay kinh doanh ở Phong Điền ', NULL);
INSERT INTO `todo` VALUES (2192, 8, '2021-01-15 10:30:00', '2021-01-15 15:00:00', 1, 'Chuẩn bị 4 hồ sơ bàn giao cho quản lý tín dụngp', NULL);
INSERT INTO `todo` VALUES (2193, 3, '2021-01-15 08:00:00', '2021-01-15 08:30:00', 1, 'Gặp KH Huỳnh Thứ Phát ký HS giải ngân hạn mức', 'accepted');
INSERT INTO `todo` VALUES (2194, 3, '2021-01-15 09:00:00', '2021-01-15 09:30:00', 1, 'Giải trình đi trễ', NULL);
INSERT INTO `todo` VALUES (2195, 3, '2021-01-15 09:30:00', '2021-01-15 10:30:00', 1, 'Soạn HS vay của Cô Lan Vị Thủy', NULL);
INSERT INTO `todo` VALUES (2196, 3, '2021-01-15 10:30:00', '2021-01-15 11:00:00', 1, 'Gọi ĐT nhắc nợ quá hạn', NULL);
INSERT INTO `todo` VALUES (2197, 3, '2021-01-15 15:00:00', '2021-01-15 16:00:00', 1, 'Gặp KH Lê Minh Út chốt PA khoản vay 900 tr', NULL);
INSERT INTO `todo` VALUES (2198, 3, '2021-01-19 08:00:00', '2021-01-19 08:30:00', 2, 'Gặp KH Huỳnh Thứ Phát ký chứng từ thu nợ trước hạn', 'accepted');
INSERT INTO `todo` VALUES (2199, 3, '2021-01-19 09:00:00', '2021-01-19 09:30:00', 2, 'Thu nợ trước hạn HS KH Huỳnh Thứ Phát', NULL);
INSERT INTO `todo` VALUES (2200, 3, '2021-01-19 10:00:00', '2021-01-19 10:30:00', 2, 'Gọi ĐT nhắc nợ quá hạn', NULL);
INSERT INTO `todo` VALUES (2201, 3, '2021-01-19 14:00:00', '2021-01-19 15:00:00', 2, 'Trình HS vay KH Nguyễn Ngọc Hân', NULL);
INSERT INTO `todo` VALUES (2202, 3, '2021-01-20 08:00:00', '2021-01-20 09:00:00', 2, 'Gặp KH Huỳnh Thứ Phát ký chứng từ giải ngân', 'accepted');
INSERT INTO `todo` VALUES (2203, 3, '2021-01-20 09:00:00', '2021-01-20 09:30:00', 2, 'Giải trình cho kiểm toán', NULL);
INSERT INTO `todo` VALUES (2204, 3, '2021-01-20 09:30:00', '2021-01-20 10:30:00', 2, 'Giải ngân HS vay KH Huỳnh Thứ Phát', NULL);
INSERT INTO `todo` VALUES (2205, 3, '2021-01-20 10:30:00', '2021-01-20 11:00:00', 2, 'Gọi ĐT nhắc nợ quá hạn', NULL);
INSERT INTO `todo` VALUES (2206, 3, '2021-01-20 14:00:00', '2021-01-20 15:00:00', 2, 'Trình HS vay KH Trương Công Luận', NULL);
INSERT INTO `todo` VALUES (2208, 3, '2021-01-21 08:00:00', '2021-01-21 09:00:00', 2, 'Gặp KH Nguyễn Ngọc Hân nhận chứng từ bổ sung HS vay', 'accepted');
INSERT INTO `todo` VALUES (2209, 3, '2021-01-21 09:30:00', '2021-01-21 10:30:00', 2, 'Trình HS vay KH Trương Công Luận', NULL);
INSERT INTO `todo` VALUES (2210, 3, '2021-01-21 10:30:00', '2021-01-21 11:00:00', 2, 'Gọi ĐT nhắc nợ quá hạn', NULL);
INSERT INTO `todo` VALUES (2211, 3, '2021-01-21 13:30:00', '2021-01-21 14:30:00', 2, 'Trình HS vay KH Nguyễn Ngọc Hân', NULL);
INSERT INTO `todo` VALUES (2212, 3, '2021-01-22 08:00:00', '2021-01-22 09:00:00', 2, 'Gặp KH Lê Minh Út nhận chứng từ vay và trao đổi PA vay', 'accepted');
INSERT INTO `todo` VALUES (2213, 3, '2021-01-22 09:30:00', '2021-01-22 10:00:00', 2, 'Bổ sung HS vay KH Trương Công Luận', NULL);
INSERT INTO `todo` VALUES (2214, 3, '2021-01-22 10:30:00', '2021-01-22 11:00:00', 2, 'Gọi ĐT nhắc nợ quá hạn', NULL);
INSERT INTO `todo` VALUES (2215, 3, '2021-01-22 14:00:00', '2021-01-22 15:00:00', 2, 'Trình HS vay KH Nguyễn Ngọc Hân', NULL);
INSERT INTO `todo` VALUES (2216, 3, '2021-01-22 16:00:00', '2021-01-22 17:00:00', 2, 'Làm bàn giao các HS đã giải ngân', NULL);
INSERT INTO `todo` VALUES (2217, 3, '2021-01-25 13:30:00', '2021-01-25 14:00:00', 2, 'Soạn HS giải ngân hạn mức KH Trần Ngọc Thúy', NULL);
INSERT INTO `todo` VALUES (2218, 3, '2021-01-25 14:00:00', '2021-01-25 14:30:00', 2, 'Làm giấy đi đường KH Tăng Văn Trung', NULL);
INSERT INTO `todo` VALUES (2219, 3, '2021-01-25 14:30:00', '2021-01-25 15:00:00', 2, 'Gọi ĐT nhắc nợ quá hạn', NULL);
INSERT INTO `todo` VALUES (2220, 3, '2021-01-25 15:00:00', '2021-01-25 16:00:00', 2, 'Trình HS vay KH Nguyễn Ngọc Hân', NULL);
INSERT INTO `todo` VALUES (2221, 53, '2021-01-26 09:00:00', '2021-01-26 10:45:00', 2, 'Dt nhắc phí ', NULL);
INSERT INTO `todo` VALUES (2222, 53, '2021-01-26 20:30:00', '2021-01-26 09:00:00', 2, 'Họp KHCN ', NULL);
INSERT INTO `todo` VALUES (2223, 53, '2021-01-26 14:30:00', '2021-01-26 14:50:00', 2, 'DT KH cũ tên MỘNG LAN hẹn gặp cài lại app pruonline', NULL);
INSERT INTO `todo` VALUES (2224, 53, '2021-01-26 14:50:00', '2021-01-26 16:00:00', 2, 'Gọi dt ', NULL);
INSERT INTO `todo` VALUES (2225, 6, '2021-01-26 20:30:00', '2021-01-26 00:00:00', 2, 'Họp phòng KHCN', NULL);
INSERT INTO `todo` VALUES (2226, 6, '2021-01-26 23:00:00', '2021-01-26 00:00:00', 2, 'Đt chị Loan tư vấn thấu chi', NULL);
INSERT INTO `todo` VALUES (2227, 6, '2021-01-26 13:30:00', '2021-01-25 00:00:00', 2, 'Gặp a Duy tư vấn nhu cầu vay mua BDS', NULL);
INSERT INTO `todo` VALUES (2228, 6, '2021-01-26 15:30:00', '2021-01-26 00:00:00', 2, 'Đt KH quá hạn', NULL);
INSERT INTO `todo` VALUES (2229, 3, '2021-01-26 08:00:00', '2021-01-26 10:00:00', 2, 'Gặp KH với anh nhân', NULL);
INSERT INTO `todo` VALUES (2230, 3, '2021-01-26 10:30:00', '2021-01-26 11:00:00', 2, 'Gọi ĐT nhắc nợ quá hạn', NULL);
INSERT INTO `todo` VALUES (2231, 3, '2021-01-26 13:00:00', '2021-01-26 13:30:00', 2, 'Gọi ĐT cô Lan tư vấn vay', NULL);
INSERT INTO `todo` VALUES (2232, 3, '2021-01-26 14:00:00', '2021-01-26 16:00:00', 2, 'Tham dự toàn án quận Ninh Kiều hồ sơ KH Vũ Quyết Tiến', NULL);
INSERT INTO `todo` VALUES (2233, 3, '2021-01-27 08:00:00', '2021-01-27 09:00:00', 2, 'Gặp KH Lê Minh Út nhận HS bổ sung', 'accepted');
INSERT INTO `todo` VALUES (2234, 3, '2021-01-27 09:00:00', '2021-01-27 09:30:00', 2, 'Thu nợ trước hạn KH Trần Thị Xuân Giang', NULL);
INSERT INTO `todo` VALUES (2235, 3, '2021-01-27 10:30:00', '2021-01-27 11:00:00', 2, 'Gọi ĐT nhắc nợ quá hạn', NULL);
INSERT INTO `todo` VALUES (2236, 3, '2021-01-27 14:00:00', '2021-01-27 14:30:00', 2, 'Thu nợ trước hạn KH Nguyễn Thanh Quí', NULL);
INSERT INTO `todo` VALUES (2237, 53, '2021-01-27 09:00:00', '2021-01-27 10:30:00', 2, 'Gọi dt ', NULL);
INSERT INTO `todo` VALUES (2238, 53, '2021-01-27 10:45:00', '2021-01-27 11:30:00', 2, 'Đối soát hoa hồng ', NULL);
INSERT INTO `todo` VALUES (2239, 53, '2021-01-27 14:30:00', '2021-01-27 15:45:00', 2, 'Gọi KH cũ ', NULL);
INSERT INTO `todo` VALUES (2240, 3, '2021-01-27 14:30:00', '2021-01-27 17:00:00', 2, 'Gặp KH Trần Ngọc Thúy ký HS giải ngân HM', NULL);
INSERT INTO `todo` VALUES (2241, 3, '2021-01-28 08:00:00', '2021-01-28 08:30:00', 2, 'Giải chấp TSĐB KH Nguyễn Thanh Quí', NULL);
INSERT INTO `todo` VALUES (2242, 3, '2021-01-28 08:30:00', '2021-01-28 09:00:00', 2, 'Soạn HS thu nợ và giải chấp KH Nguyễn Văn Toàn', NULL);
INSERT INTO `todo` VALUES (2243, 3, '2021-01-28 09:00:00', '2021-01-28 10:00:00', 2, 'Giải ngân HS vay hạn mức KH Trần Ngọc Thúy', NULL);
INSERT INTO `todo` VALUES (2244, 3, '2021-01-28 10:30:00', '2021-01-28 11:00:00', 2, 'Gọi ĐT nhắc nợ quá hạn', NULL);
INSERT INTO `todo` VALUES (2245, 3, '2021-01-28 14:00:00', '2021-01-28 15:00:00', 2, 'Lấy tài sản bàn giao cho KH Nguyễn Thanh Quí', NULL);
INSERT INTO `todo` VALUES (2246, 8, '2021-01-29 07:30:00', '2021-01-29 08:30:00', 1, 'Lấy chứng từ và trả tiền lãi tiết cho KH Ngô Thị Cẩm Tiên', 'accepted');
INSERT INTO `todo` VALUES (2247, 8, '2021-01-29 08:30:00', '2021-01-29 10:00:00', 1, 'Gặp KH Hồ Quốc Việt nhu cầu vay sxkd', NULL);
INSERT INTO `todo` VALUES (2248, 8, '2021-01-29 10:00:00', '2021-01-29 00:00:00', 1, 'Xử lý và bàn giao hs cho QLTD', NULL);
INSERT INTO `todo` VALUES (2249, 3, '2021-01-29 08:00:00', '2021-01-29 09:00:00', 2, 'Gọi ĐT cô lan tư vấn vay và gửi định giá', NULL);
INSERT INTO `todo` VALUES (2250, 3, '2021-01-29 09:00:00', '2021-01-29 10:00:00', 2, 'Trình HS vay KH Nguyễn Ngọc Hân', NULL);
INSERT INTO `todo` VALUES (2251, 3, '2021-01-29 10:30:00', '2021-01-29 11:00:00', 2, 'Gọi ĐT nhắc nợ quá hạn', NULL);
INSERT INTO `todo` VALUES (2252, 3, '2021-01-29 13:30:00', '2021-01-29 02:00:00', 2, 'Gọi ĐT anh Kiệt tư vấn bảo hiểm', NULL);
INSERT INTO `todo` VALUES (2253, 3, '2021-01-29 16:00:00', '2021-01-29 17:00:00', 2, 'Làm bàn giao các HS đã giải ngân', NULL);
INSERT INTO `todo` VALUES (2254, 3, '2021-02-02 08:30:00', '2021-02-02 09:00:00', 2, 'Gọi ĐT KH Đào Văn Hoà tư vấn vay vốn', NULL);
INSERT INTO `todo` VALUES (2255, 3, '2021-02-02 09:00:00', '2021-02-02 10:00:00', 2, 'Gọi ĐT nhắc nợ quá hạn', NULL);
INSERT INTO `todo` VALUES (2256, 3, '2021-02-02 10:00:00', '2021-02-02 10:30:00', 2, 'Gọi ĐT anh Kiệt tư vấn bảo hiểm', NULL);
INSERT INTO `todo` VALUES (2257, 3, '2021-02-04 07:00:00', '2021-02-04 07:30:00', 2, 'Đi lấy chứng từ bên TTCTXH', NULL);
INSERT INTO `todo` VALUES (2258, 3, '2021-02-04 08:00:00', '2021-02-04 08:30:00', 2, 'Gọi ĐT KH Lê Minh Hải tư vấn bảo hiểm', NULL);
INSERT INTO `todo` VALUES (2259, 3, '2021-02-04 09:00:00', '2021-02-04 09:30:00', 2, 'Gọi ĐT KH Phạm Tấn Tài tư vấn vay vốn', NULL);
INSERT INTO `todo` VALUES (2260, 3, '2021-02-04 10:00:00', '2021-02-04 10:30:00', 2, 'Gọi ĐT nhắc nợ quá hạn', NULL);
INSERT INTO `todo` VALUES (2261, 3, '2021-02-04 14:00:00', '2021-02-04 15:30:00', 2, 'Gặp KH Lê Minh Út nhận HS bổ sung', NULL);
INSERT INTO `todo` VALUES (2262, 3, '2021-02-04 16:00:00', '2021-02-04 17:00:00', 2, 'Làm bàn giao HS giải ngân', NULL);
INSERT INTO `todo` VALUES (2263, 3, '2021-02-05 08:00:00', '2021-02-05 09:00:00', 1, 'Gọi ĐT anh Châu tư vấn vay vốn', NULL);
INSERT INTO `todo` VALUES (2264, 3, '2021-02-05 09:00:00', '2021-02-05 10:00:00', 1, 'Soạn HS vay KH Phạm Tấn Tài', NULL);
INSERT INTO `todo` VALUES (2265, 3, '2021-02-05 10:30:00', '2021-02-05 11:00:00', 1, 'Gọi ĐT nhắc nợ quá hạn', NULL);
INSERT INTO `todo` VALUES (2266, 3, '2021-02-05 13:30:00', '2021-02-05 14:30:00', 1, 'Soạn HS vay KH Lê Minh Út', NULL);
INSERT INTO `todo` VALUES (2267, 3, '2021-02-05 15:00:00', '2021-02-05 16:00:00', 1, 'Kiểm tra các khoản thấu chi và vay hạn mức SXKD đến hạn trong tháng 2', NULL);
INSERT INTO `todo` VALUES (2268, 3, '2021-02-08 08:00:00', '2021-02-08 09:00:00', 2, 'Gặp anh Châu tư vấn vay vốn', 'accepted');
INSERT INTO `todo` VALUES (2269, 3, '2021-02-08 09:30:00', '2021-02-08 10:00:00', 2, 'Gọi ĐT nhắc nợ quá hạn', NULL);
INSERT INTO `todo` VALUES (2270, 3, '2021-02-08 10:00:00', '2021-02-08 11:00:00', 2, 'Soạn HS KH Lê Minh Út', NULL);
INSERT INTO `todo` VALUES (2271, 3, '2021-02-08 13:30:00', '2021-02-08 14:00:00', 2, 'Gọi ĐT anh Kiệt tư vấn bảo hiểm', NULL);
INSERT INTO `todo` VALUES (2272, 53, '2021-02-08 09:00:00', '2021-02-08 10:45:00', 2, 'Gọi dt ', NULL);
INSERT INTO `todo` VALUES (2273, 53, '2021-02-08 11:00:00', '2021-02-08 11:45:00', 2, 'Kiểm tra thông tin stk của KH Trần Thị Cẩm Tuyền có tiền từ Pru ck qua chưa ', NULL);
INSERT INTO `todo` VALUES (2274, 53, '2021-02-08 14:30:00', '2021-02-08 15:45:00', 2, 'Goi dt ', NULL);
INSERT INTO `todo` VALUES (2275, 53, '2021-02-25 08:33:00', '2021-02-25 10:00:00', 2, 'Soạn BMH và lên hđ KH Trần Tuấn Vũ của chị Kim Oanh ip 20tr đtt 40tr ', NULL);
INSERT INTO `todo` VALUES (2276, 53, '2021-02-25 10:00:00', '2021-02-25 11:35:00', 2, 'Gặp KH Trần Tuấn Vũ để ký giấy thư xác nhận OTP', NULL);
INSERT INTO `todo` VALUES (2277, 53, '2021-02-25 13:30:00', '2021-02-25 14:00:00', 2, 'Nộp thư xác nhận điện tử tại vp Pru mậu thân ', NULL);
INSERT INTO `todo` VALUES (2278, 53, '2021-02-25 14:36:00', '2021-02-25 15:00:00', 2, 'Gọi hỏi thăm hs vay của a Hưng đi thẩm định KH Nguyễn Văn Hiếu tiến trình tới đâu ', NULL);
INSERT INTO `todo` VALUES (2279, 53, '2021-02-25 15:00:00', '2021-02-25 16:38:00', 2, 'Gọi nhắc phí KH tháng 2', NULL);
INSERT INTO `todo` VALUES (2280, 6, '2021-02-25 08:00:00', '2021-02-25 00:00:00', 2, 'Gặp KH', 'accepted');
INSERT INTO `todo` VALUES (2281, 8, '2021-02-25 07:45:00', '2021-02-25 08:30:00', 1, 'Gặp chị Hiền phát hành lại thẻ tín dụng', 'accepted');
INSERT INTO `todo` VALUES (2282, 6, '2021-02-25 10:30:00', '2021-02-25 00:00:00', 2, 'Làm hs A Quý', NULL);
INSERT INTO `todo` VALUES (2283, 8, '2021-02-25 08:30:00', '2021-02-25 09:00:00', 1, 'Gặp a Thuận môi giới trao đổi hồ sơ vay vốn tháng 3', NULL);
INSERT INTO `todo` VALUES (2284, 8, '2021-02-25 09:00:00', '2021-02-25 11:00:00', 1, 'Gặp KH Nguyễn Văn Hiếu nhu cầu vay 2 tỷ', NULL);
INSERT INTO `todo` VALUES (2285, 8, '2021-02-25 11:00:00', '2021-02-25 00:00:00', 1, 'Khảo sát TSBĐ cùng KH Nguyễn Văn Hiếu', NULL);
INSERT INTO `todo` VALUES (2286, 3, '2021-02-25 08:00:00', '2021-02-25 08:30:00', 2, 'Gọi ĐT chị Hương TTCTXH tư vấn vay', NULL);
INSERT INTO `todo` VALUES (2287, 3, '2021-02-25 08:30:00', '2021-02-25 09:30:00', 2, 'Trình HS vay thấu chi CBNV Nguyễn Văn Thi', NULL);
INSERT INTO `todo` VALUES (2288, 3, '2021-02-25 09:30:00', '2021-02-25 10:00:00', 2, 'Gọi ĐT anh Út tư vấn bảo hiểm', NULL);
INSERT INTO `todo` VALUES (2289, 3, '2021-02-25 10:30:00', '2021-02-25 11:00:00', 2, 'Gọi ĐT nhắc nợ quá hạn', NULL);
INSERT INTO `todo` VALUES (2290, 3, '2021-02-25 14:00:00', '2021-02-25 15:00:00', 2, 'Trình HS vay góp lương KH trương công luận', NULL);
INSERT INTO `todo` VALUES (2291, 53, '2021-02-26 08:30:00', '2021-02-26 09:10:00', 2, 'Theo dõi hđ cần bổ sung thông tin gì k ', NULL);
INSERT INTO `todo` VALUES (2292, 53, '2021-02-26 10:00:00', '2021-02-26 11:45:00', 2, 'Nộp thư xác nhận điện tử và đi chứng từ cho c Kim Oanh ở Tây Đô và ghé chi nhánh trả chứng từ dùm chị Hằng', NULL);
INSERT INTO `todo` VALUES (2293, 3, '2021-02-26 08:00:00', '2021-02-26 08:30:00', 2, 'Soạn hồ sơ tất nợ KH Nguyễn Nhựt Minh', NULL);
INSERT INTO `todo` VALUES (2294, 3, '2021-02-26 08:30:00', '2021-02-26 09:30:00', 2, 'Tất tất hồ sơ KH Nguyễn Nhựt Minh', NULL);
INSERT INTO `todo` VALUES (2295, 3, '2021-02-26 09:30:00', '2021-02-26 10:30:00', 1, 'Trình HS thấu chi CBNV Nguyễn Văn Thi', NULL);
INSERT INTO `todo` VALUES (2296, 3, '2021-02-26 10:30:00', '2021-02-26 11:00:00', 1, 'Gọi ĐT nhắc nợ quá hạn', NULL);
INSERT INTO `todo` VALUES (2297, 53, '2021-02-26 15:00:00', '2021-02-26 15:30:00', 2, 'Nhắc a Điền gọi dt chốt giờ KH Lê Minh Út gặp tv để lên case BH ', NULL);
INSERT INTO `todo` VALUES (2298, 3, '2021-02-26 13:30:00', '2021-02-26 14:30:00', 1, 'Trình HS vay KH Trương Công Luận', NULL);
INSERT INTO `todo` VALUES (2299, 3, '2021-02-26 15:00:00', '2021-02-26 16:00:00', 1, 'Gặp chị Hương TTCTXH tư vấn vay', NULL);
INSERT INTO `todo` VALUES (2300, 3, '2021-02-26 16:30:00', '2021-02-26 17:00:00', 1, 'Bàn giao các HS đã giải ngân', NULL);
INSERT INTO `todo` VALUES (2301, 53, '2021-02-26 13:30:00', '2021-02-26 14:00:00', 2, 'Nhập LTS gắn hoa hồng cho GDV ', NULL);
INSERT INTO `todo` VALUES (2302, 53, '2021-02-27 08:45:00', '2021-02-27 10:01:00', 1, 'Gặp kh với a Điền ', NULL);
INSERT INTO `todo` VALUES (2303, 3, '2021-03-03 08:00:00', '2021-03-03 08:30:00', 2, 'Ghé TTCTXH gửi chứng từ và lấy chứng từ cho chị Hằng', 'accepted');
INSERT INTO `todo` VALUES (2304, 3, '2021-03-03 08:30:00', '2021-03-03 09:00:00', 2, 'Gửi quyết toán thuế cho chị mận và bàn giao HS giải ngân', NULL);
INSERT INTO `todo` VALUES (2305, 3, '2021-03-03 09:30:00', '2021-03-03 10:30:00', 2, 'Kiểm tra và báo cáo kiểm tra sau cho vay gửi cho chị Tuyết', NULL);
INSERT INTO `todo` VALUES (2306, 3, '2021-03-03 10:30:00', '2021-03-03 11:00:00', 2, 'Gọi ĐT nhắc nợ quá hạn', NULL);
INSERT INTO `todo` VALUES (2307, 3, '2021-03-03 13:30:00', '2021-03-03 14:30:00', 2, 'Soạn HS vay KH Lê Minh Út', NULL);
INSERT INTO `todo` VALUES (2308, 8, '2021-03-04 08:00:00', '2021-03-04 00:00:00', 1, 'Gặp KH Thạch Thị Hồng ký hồ sơ tái cấp hạn mức, gặp KH Võ Văn Thua và Nguyễn Thị Bảy nhu cầu vay', NULL);
INSERT INTO `todo` VALUES (2309, 53, '2021-03-05 07:00:00', '2021-03-05 09:00:00', 1, 'Dẫn KH Lê Minh Út của a Điền đi ksk lúc 7h sáng ở Hoàn Mỹ ', 'accepted');
INSERT INTO `todo` VALUES (2310, 53, '2021-03-05 09:30:00', '2021-03-05 11:00:00', 2, 'Nhắc phí KH tháng 3', NULL);
INSERT INTO `todo` VALUES (2311, 53, '2021-03-05 13:30:00', '2021-03-05 14:15:00', 2, 'Theo dõi hồ sơ KSK của KH ', NULL);
INSERT INTO `todo` VALUES (2312, 53, '2021-03-05 14:30:00', '2021-03-05 16:00:00', 2, 'Dt hỏi thăm lại KH đã tv hồi tháng 2 và đầu tháng 3', NULL);
INSERT INTO `todo` VALUES (2313, 3, '2021-03-05 08:30:00', '2021-03-05 09:30:00', 2, 'Bàn giao HS KH Trần Văn Trung qua bên XLN', 'accepted');
INSERT INTO `todo` VALUES (2314, 3, '2021-03-05 09:30:00', '2021-03-05 10:00:00', 2, 'Gặp KH Đỗ Văn Tiến cho ký chứng từ thu nợ một phần gốc', NULL);
INSERT INTO `todo` VALUES (2315, 3, '2021-03-05 10:30:00', '2021-03-05 11:30:00', 2, 'Gửi định giá KH Phạm Tấn Tài', NULL);
INSERT INTO `todo` VALUES (2316, 3, '2021-03-05 13:30:00', '2021-03-05 14:30:00', 1, 'Gửi báo cáo kiểm tra SCV cho chị Tuyết', NULL);
INSERT INTO `todo` VALUES (2317, 3, '2021-03-05 14:30:00', '2021-03-05 15:00:00', 1, 'Gọi ĐT nhắc nợ quá hạn', NULL);
INSERT INTO `todo` VALUES (2318, 53, '2021-03-06 08:00:00', '2021-03-06 08:22:00', 1, 'Lấy hđ của KH chị Kim Oanh ở sacom ', NULL);
INSERT INTO `todo` VALUES (2319, 6, '2021-03-08 08:00:00', '2021-03-08 00:00:00', 2, 'Gặp KH Ánh ký hs mở thẻ tín dụng', 'accepted');
INSERT INTO `todo` VALUES (2320, 6, '2021-03-08 10:00:00', '2021-03-08 00:00:00', 2, 'Đt a Tuấn hs vay sxkd', NULL);
INSERT INTO `todo` VALUES (2321, 6, '2021-03-08 15:00:00', '2021-03-08 00:00:00', 2, 'Gọi kh quá hạn', NULL);
INSERT INTO `todo` VALUES (2322, 3, '2021-03-10 08:00:00', '2021-03-10 09:00:00', 2, 'Gặp KH Lê Minh Út nhận hồ sơ bổ sung', 'accepted');
INSERT INTO `todo` VALUES (2323, 3, '2021-03-10 09:30:00', '2021-03-10 10:00:00', 2, 'Giải ngân HS vay hạn mức KH Huỳnh Thứ Phát', NULL);
INSERT INTO `todo` VALUES (2324, 3, '2021-03-10 10:30:00', '2021-03-10 11:00:00', 2, 'Gọi ĐT nhắc nợ quá hạn', NULL);
INSERT INTO `todo` VALUES (2325, 3, '2021-03-10 14:00:00', '2021-03-10 03:00:00', 2, 'Trình HS vay KH Lê Minh Út', NULL);
INSERT INTO `todo` VALUES (2326, 3, '2021-03-11 08:30:00', '2021-03-11 09:30:00', 2, 'Gặp anh Châu tư vấn vay vốn', 'accepted');
INSERT INTO `todo` VALUES (2327, 3, '2021-03-11 10:00:00', '2021-03-11 10:30:00', 2, 'Gọi ĐT chị then tư vấn vay vốn', NULL);
INSERT INTO `todo` VALUES (2328, 3, '2021-03-11 10:30:00', '2021-03-11 11:00:00', 2, 'Gửi yêu cầu cho trung tâm thẻ phát hành thẻ', NULL);
INSERT INTO `todo` VALUES (2329, 3, '2021-03-11 13:30:00', '2021-03-11 14:00:00', 2, 'Gọi ĐT nhắc nợ quá hạn', NULL);
INSERT INTO `todo` VALUES (2330, 3, '2021-03-11 14:00:00', '2021-03-11 15:00:00', 2, 'Trình HS vay KH Lê Minh Út', NULL);
INSERT INTO `todo` VALUES (2333, 6, '2021-03-15 08:00:00', '2021-03-15 00:00:00', 1, 'Gặp a Trí tư vấn vay', 'denied');
INSERT INTO `todo` VALUES (2335, 53, '2021-03-15 08:00:00', '2021-03-15 08:45:00', 2, 'Nộp thư xác nhận điện tử của KH Trần Tấn Kiệt chốt hôm chiều t6 , do sáng t7 vp Pru mậu thân k làm nên sáng nay nộp sớm cho kịp phát hành ', 'denied');
INSERT INTO `todo` VALUES (2336, 53, '2021-03-15 09:00:00', '2021-03-15 10:50:00', 2, 'Gọi dt ', NULL);
INSERT INTO `todo` VALUES (2337, 53, '2021-03-15 14:00:00', '2021-03-15 02:32:00', 2, 'Nhắc KH Trần Tấn Kiệt đóng phí hđ mới để phát hành ', NULL);
INSERT INTO `todo` VALUES (2338, 53, '2021-03-15 14:00:00', '2021-03-15 02:32:00', 2, 'Nhắc KH Trần Tấn Kiệt đóng phí hđ mới để phát hành ', NULL);
INSERT INTO `todo` VALUES (2339, 3, '2021-03-15 08:30:00', '2021-03-15 08:30:00', 2, 'Họp Huddle đầu ngày', NULL);
INSERT INTO `todo` VALUES (2340, 6, '2021-03-15 08:30:00', '2021-03-15 08:30:00', 1, 'Họp Huddle đầu ngày', NULL);
INSERT INTO `todo` VALUES (2341, 8, '2021-03-15 08:30:00', '2021-03-15 08:30:00', 1, 'Họp Huddle đầu ngày', NULL);
INSERT INTO `todo` VALUES (2342, 53, '2021-03-15 08:30:00', '2021-03-15 08:30:00', 2, 'Họp Huddle đầu ngày', NULL);
INSERT INTO `todo` VALUES (2343, 3, '2021-03-17 08:30:00', '2021-03-17 09:30:00', 2, 'Soạn HS KH Chu Thị Then', NULL);
INSERT INTO `todo` VALUES (2344, 3, '2021-03-17 09:30:00', '2021-03-17 10:00:00', 2, 'Làm giấy đi đường KH Thái Đức Ba', NULL);
INSERT INTO `todo` VALUES (2345, 3, '2021-03-17 10:00:00', '2021-03-17 11:00:00', 2, 'Gửi định giá KH Nguyễn Thị Hằng', NULL);
INSERT INTO `todo` VALUES (2346, 3, '2021-03-17 13:30:00', '2021-03-17 14:00:00', 2, 'Gọi ĐT nhắc nợ quá hạn', NULL);
INSERT INTO `todo` VALUES (2347, 3, '2021-03-17 14:00:00', '2021-03-17 15:00:00', 2, 'Soạn HS vay CBNV Nguyễn Thị Hằng', NULL);
INSERT INTO `todo` VALUES (2348, 3, '2021-03-23 08:00:00', '2021-03-23 08:30:00', 2, 'Gặp KH Đỗ Văn Tiến ký HS giải ngân hạn mức', 'accepted');
INSERT INTO `todo` VALUES (2349, 3, '2021-03-23 08:30:00', '2021-03-23 09:00:00', 2, 'Gặp KH Nguyễn Thị Anh Thư ký giấy thu nợ trước hạn', NULL);
INSERT INTO `todo` VALUES (2350, 3, '2021-03-23 09:30:00', '2021-03-23 10:00:00', 2, 'Thu nợ trước hạn HS vay tín chấp KH Nguyễn Thị Anh Thư', NULL);
INSERT INTO `todo` VALUES (2351, 3, '2021-03-23 10:00:00', '2021-03-23 10:30:00', 2, 'Gọi ĐT nhắc nợ quá hạn', NULL);
INSERT INTO `todo` VALUES (2352, 3, '2021-03-23 13:30:00', '2021-03-23 14:00:00', 2, 'Giải ngân HS vay hạn mức KH Đỗ Văn Tiến', NULL);
INSERT INTO `todo` VALUES (2353, 8, '2021-03-23 10:00:00', '2021-03-23 11:00:00', 1, 'Trình phuơng án thay đổi Tài Sản KH Mộng Lan', NULL);
INSERT INTO `todo` VALUES (2354, 8, '2021-03-23 13:15:00', '2021-03-23 14:15:00', 1, 'Soạn hồ sơ Mộng Lan gửi anh Nhân xem truớc khi gửi Kiểm Toán', NULL);
INSERT INTO `todo` VALUES (2355, 8, '2021-03-23 14:30:00', '2021-03-23 15:00:00', 1, 'Xử lý dứt điểm truờng hợp ZShop', NULL);
INSERT INTO `todo` VALUES (2356, 3, '2021-03-24 08:00:00', '2021-03-24 08:30:00', 2, 'Ghé TTCTXH lấy chứng từ và cho KH Chu Thị Then ký HS giải ngân', 'accepted');
INSERT INTO `todo` VALUES (2357, 3, '2021-03-24 09:00:00', '2021-03-24 10:00:00', 2, 'Soạn HS vay CBNV Nguyễn Thị Hằng', NULL);
INSERT INTO `todo` VALUES (2358, 3, '2021-03-24 10:00:00', '2021-03-24 11:00:00', 2, 'Giải ngân HS vay KH Chu Thị Then', NULL);
INSERT INTO `todo` VALUES (2359, 3, '2021-03-24 11:00:00', '2021-03-24 11:30:00', 2, 'Gọi ĐT nhắc nợ quá hạn', NULL);
INSERT INTO `todo` VALUES (2360, 3, '2021-03-24 14:00:00', '2021-03-24 15:00:00', 2, 'Trình HS vay mua BDS KH Lê Minh Út', NULL);
INSERT INTO `todo` VALUES (2361, 3, '2021-03-25 08:00:00', '2021-03-24 08:30:00', 2, 'Ghé chi nhánh Cần Thơ gửi chị Tuyết HS giải chấp lấy tài sản cho anh Hạnh.', 'request');
INSERT INTO `todo` VALUES (2362, 3, '2021-03-25 08:30:00', '2021-03-25 09:00:00', 2, 'Gặp KH Lê Minh Út nhận HS vay bổ sung', NULL);
INSERT INTO `todo` VALUES (2363, 3, '2021-03-25 09:30:00', '2021-03-25 10:30:00', 2, 'Trình HS vay KH Lê Minh Út', NULL);
INSERT INTO `todo` VALUES (2364, 3, '2021-03-25 10:30:00', '2021-03-25 11:00:00', 2, 'Gọi ĐT nhắc nợ quá hạn', NULL);
INSERT INTO `todo` VALUES (2365, 3, '2021-03-25 14:00:00', '2021-03-25 15:00:00', 2, 'Trình HS CBNV Nguyễn Thị Hằng', NULL);
INSERT INTO `todo` VALUES (2366, 3, '2021-03-26 08:00:00', '2021-03-26 08:30:00', 2, 'Gọi ĐT KH Vinh tư vấn vay vốn', NULL);
INSERT INTO `todo` VALUES (2367, 3, '2021-03-26 09:00:00', '2021-03-26 10:00:00', 2, 'Trình HS vay CBNV Nguyễn Thị Hằng', NULL);
INSERT INTO `todo` VALUES (2368, 3, '2021-03-26 10:00:00', '2021-03-26 11:00:00', 2, 'Làm kiểm soát sau cho vay tháng 3', NULL);
INSERT INTO `todo` VALUES (2369, 3, '2021-03-26 11:00:00', '2021-03-26 11:30:00', 2, 'Gọi ĐT nhắc nợ quá hạn', NULL);
INSERT INTO `todo` VALUES (2370, 3, '2021-03-26 16:00:00', '2021-03-26 17:00:00', 2, 'Bàn giao các HS đã giải ngân', NULL);
INSERT INTO `todo` VALUES (2371, 3, '2021-03-30 08:00:00', '2021-03-30 08:30:00', 2, 'Gọi ĐT KH Hoà tư vấn vay', NULL);
INSERT INTO `todo` VALUES (2372, 3, '2021-03-30 08:30:00', '2021-03-30 09:00:00', 2, 'Úp soạn HS vay KH Nguyễn Thị Hằng', NULL);
INSERT INTO `todo` VALUES (2373, 3, '2021-03-30 09:00:00', '2021-03-30 10:00:00', 2, 'Rà soát định giá và soạn HS giải ngân HS vay KH Lê Minh Út', NULL);
INSERT INTO `todo` VALUES (2374, 3, '2021-03-30 10:30:00', '2021-03-30 11:00:00', 2, 'Gọi ĐT nhắc nợ quá hạn', NULL);
INSERT INTO `todo` VALUES (2375, 3, '2021-03-30 16:00:00', '2021-03-30 17:00:00', 2, 'Bàn giao các HS đã giải ngân', NULL);
INSERT INTO `todo` VALUES (2376, 3, '2021-03-31 08:00:00', '2021-03-31 09:00:00', 2, 'Gặp anh Nhu tư vấn vay mua đất', 'request');
INSERT INTO `todo` VALUES (2378, 3, '2021-03-31 09:00:00', '2021-03-31 09:30:00', 2, 'Gọi ĐT anh Khang tư vấn vay vốn', NULL);
INSERT INTO `todo` VALUES (2379, 3, '2021-03-31 10:00:00', '2021-03-31 11:00:00', 2, 'Hoàn thiện HS kiểm soát sau cho vay', NULL);
INSERT INTO `todo` VALUES (2380, 3, '2021-03-31 11:00:00', '2021-03-31 11:30:00', 2, 'Gọi ĐT nhắc nợ quá hạn', NULL);
INSERT INTO `todo` VALUES (2381, 3, '2021-04-05 08:00:00', '2021-04-05 09:00:00', 2, 'Thu nợ trước hạn và giải chấp TSBD KH Nguyễn Ngọc Hân', NULL);
INSERT INTO `todo` VALUES (2382, 3, '2021-04-05 09:30:00', '2021-04-05 10:00:00', 2, 'Trình HS thẻ tín dụng KH Hồ Quốc Khánh', NULL);
INSERT INTO `todo` VALUES (2383, 3, '2021-04-05 10:00:00', '2021-04-05 10:30:00', 2, 'Giải ngân HS vay KH Nguyễn Thị Hằng', NULL);
INSERT INTO `todo` VALUES (2384, 3, '2021-04-05 10:30:00', '2021-04-05 11:00:00', 2, 'Gửi định giá HS vay CBNV Nguyễn Thị Kim Oanh', NULL);
INSERT INTO `todo` VALUES (2385, 3, '2021-04-05 13:30:00', '2021-04-05 14:00:00', 2, 'Gọi ĐT nhắc nợ quá hạn', NULL);
INSERT INTO `todo` VALUES (2386, 3, '2021-04-05 14:00:00', '2021-04-05 15:00:00', 2, 'Hoàn tất kiểm tra sau vay tháng 3', NULL);
INSERT INTO `todo` VALUES (2387, 3, '2021-04-06 08:00:00', '2021-04-06 09:00:00', 2, 'Ghé CN Tây Đô bổ sung HS cơ cấu cho KTNN', 'request');
INSERT INTO `todo` VALUES (2388, 3, '2021-04-06 09:30:00', '2021-04-06 10:30:00', 2, 'Bổ sung HS thẻ tín dụng KH Hồ Quốc Khánh', NULL);
INSERT INTO `todo` VALUES (2389, 3, '2021-04-06 10:30:00', '2021-04-06 11:00:00', 2, 'Gọi ĐT nhắc nợ quá hạn', NULL);
INSERT INTO `todo` VALUES (2390, 3, '2021-04-06 13:30:00', '2021-04-06 14:30:00', 2, 'Hoàn tất kiểm soát sau tháng 3', NULL);
INSERT INTO `todo` VALUES (2391, 3, '2021-04-07 08:30:00', '2021-04-07 09:30:00', 2, 'Bổ sung HS thẻ tín dụng KH Hồ Quốc Khánh', NULL);
INSERT INTO `todo` VALUES (2392, 3, '2021-04-07 09:30:00', '2021-04-07 10:00:00', 2, 'Gửi yêu cầu định giá đề nghị ra phụ lục sửa báo cáo định giá hồ sơ vay KH Lê Minh Út', NULL);
INSERT INTO `todo` VALUES (2393, 3, '2021-04-07 10:30:00', '2021-04-07 11:00:00', 2, 'Gọi ĐT nhắc nợ quá hạn', NULL);
INSERT INTO `todo` VALUES (2394, 3, '2021-04-07 13:30:00', '2021-04-07 14:00:00', 2, 'Hoàn thành kiểm soát sau vay tháng 3/2021', NULL);
INSERT INTO `todo` VALUES (2395, 3, '2021-04-07 15:00:00', '2021-04-07 15:30:00', 2, 'Gặp KH Đào Văn Hoà tư vấn vay vốn', NULL);
INSERT INTO `todo` VALUES (2396, 3, '2021-04-07 15:30:00', '2021-04-07 16:00:00', 2, 'Gặp anh Khang TTCTXH tư vấn vay vốn', NULL);
INSERT INTO `todo` VALUES (2397, 3, '2021-04-07 16:30:00', '2021-04-07 17:00:00', 2, 'Bàn giao các HS đã giải ngân', NULL);
INSERT INTO `todo` VALUES (2398, 3, '2021-04-12 08:00:00', '2021-04-12 08:30:00', 2, 'Gửi rà soát định giá KH Lê Minh Út', NULL);
INSERT INTO `todo` VALUES (2399, 3, '2021-04-12 08:30:00', '2021-04-12 09:30:00', 2, 'Soạn HS giải ngân KH Lê Minh Út', NULL);
INSERT INTO `todo` VALUES (2400, 3, '2021-04-12 09:30:00', '2021-04-12 10:00:00', 2, 'Gọi ĐT KH Khang tư vấn vay', NULL);
INSERT INTO `todo` VALUES (2401, 3, '2021-04-12 10:00:00', '2021-04-12 10:30:00', 2, 'Gọi ĐT nhắc nợ quá hạn', NULL);
INSERT INTO `todo` VALUES (2402, 3, '2021-04-12 16:00:00', '2021-04-12 17:00:00', 2, 'Bàn giao HS giải ngân', NULL);
INSERT INTO `todo` VALUES (2403, 3, '2021-04-14 08:00:00', '2021-04-14 09:00:00', 2, 'Gặp KH Đào Văn Hoà tư vấn vay', 'accepted');
INSERT INTO `todo` VALUES (2404, 3, '2021-04-14 09:00:00', '2021-04-14 09:30:00', 2, 'Gặp anh Khang tư vấn vay', NULL);
INSERT INTO `todo` VALUES (2405, 3, '2021-04-14 10:00:00', '2021-04-14 11:00:00', 2, 'Trình HS vay thấu chi CBNV Huỳnh Minh Thành', NULL);
INSERT INTO `todo` VALUES (2406, 3, '2021-04-14 14:00:00', '2021-04-14 14:30:00', 2, 'Gọi ĐT nhắc nợ quá hạn', NULL);
INSERT INTO `todo` VALUES (2407, 3, '2021-04-14 17:00:00', '2021-04-14 18:00:00', 2, 'Tham dự lớp học payroll tại phòng', NULL);
INSERT INTO `todo` VALUES (2408, 3, '2021-04-20 08:00:00', '2021-04-20 08:30:00', 1, 'Ghé CN Cần Thơ cho anh Thi ký HS điều chỉnh lãi suất CBNV', 'request');
INSERT INTO `todo` VALUES (2409, 3, '2021-04-20 09:00:00', '2021-04-20 10:00:00', 1, 'Trình HS vay thấu chi CBNV Huỳnh Minh Thành', NULL);
INSERT INTO `todo` VALUES (2410, 3, '2021-04-20 10:00:00', '2021-04-20 10:30:00', 1, 'Gọi ĐT nhắc nợ quá hạn', NULL);
INSERT INTO `todo` VALUES (2411, 3, '2021-04-26 08:00:00', '2021-04-26 08:30:00', 2, 'Gặp KH Vũ Hồng Tâm ký HS mở thẻ tín dụng', 'accepted');
INSERT INTO `todo` VALUES (2412, 3, '2021-04-26 08:30:00', '2021-04-26 09:00:00', 2, 'Gặp KH Hồ Thanh Hải ký HS vay thấu chi', NULL);
INSERT INTO `todo` VALUES (2413, 3, '2021-04-26 09:30:00', '2021-04-26 10:00:00', 2, 'Trình HS vay thấu chi CBNV Huỳnh Minh Thành', NULL);
INSERT INTO `todo` VALUES (2414, 3, '2021-04-26 10:00:00', '2021-04-26 10:30:00', 2, 'Gọi ĐT nhắc nợ quá hạn', NULL);
INSERT INTO `todo` VALUES (2415, 3, '2021-04-26 14:00:00', '2021-04-26 15:00:00', 2, 'Trình HS vay thấu chi KH Hồ Thanh Hải', NULL);
INSERT INTO `todo` VALUES (2416, 3, '2021-06-29 08:08:00', '2021-06-29 11:09:00', 1, 'Gap KH', 'accepted');
INSERT INTO `todo` VALUES (2417, 3, '2022-01-02 13:00:00', '2022-01-02 15:00:00', 1, 'Gặp Khách hàng', NULL);
INSERT INTO `todo` VALUES (2418, 8, '2022-01-02 13:00:00', '2022-01-02 15:00:00', 2, 'Gặp Khách hàng', NULL);
INSERT INTO `todo` VALUES (2419, 3, '2024-01-15 10:42:00', '2024-01-17 10:41:00', 1, 'Báo cáo ', NULL);
INSERT INTO `todo` VALUES (2420, 6, '2024-01-15 10:42:00', '2024-01-17 10:41:00', 1, 'Báo cáo ', NULL);
INSERT INTO `todo` VALUES (2422, 86, '1970-01-01 00:00:00', '1970-01-01 00:00:00', 1, 'Gọi điện khách hàng', NULL);
INSERT INTO `todo` VALUES (2424, 83, '2024-04-17 16:09:00', '2024-04-17 16:15:00', 2, 'Gọi điện nhắc nợ kh Trần Ngọc Hân ', NULL);
INSERT INTO `todo` VALUES (2425, 85, '2024-04-17 08:00:00', '2024-04-16 21:40:00', 2, 'Họp đầu ngày', NULL);
INSERT INTO `todo` VALUES (2427, 91, '2024-04-17 15:00:00', '2024-04-17 16:00:00', 2, 'Trình hồ sơ KH ', NULL);
INSERT INTO `todo` VALUES (2428, 85, '2024-04-17 10:00:00', '2024-04-17 10:50:00', 2, 'Gọi nhắc nợ KH quá hạn', NULL);
INSERT INTO `todo` VALUES (2429, 91, '2024-04-17 11:00:00', '2024-04-17 12:00:00', 2, 'Giao máy pos\r\n', NULL);
INSERT INTO `todo` VALUES (2430, 91, '2024-04-17 13:00:00', '2024-04-17 14:00:00', 2, 'Soạn hồ sơ', NULL);
INSERT INTO `todo` VALUES (2432, 91, '2024-04-17 14:00:00', '2024-04-17 15:00:00', 2, 'Báo cáo phễu tín dụng', NULL);
INSERT INTO `todo` VALUES (2435, 85, '2024-04-17 17:00:00', '2024-04-17 17:30:00', 2, 'Lập kế hoạch làm việc ngày 19/4', NULL);
INSERT INTO `todo` VALUES (2437, 87, '2024-04-17 17:00:00', '2024-04-17 17:30:00', 2, 'Lập kế hoạch làm việc ngày 19/4', NULL);
INSERT INTO `todo` VALUES (2438, 91, '2024-04-17 17:00:00', '2024-04-17 17:30:00', 2, 'Lập kế hoạch làm việc ngày 19/4', NULL);
INSERT INTO `todo` VALUES (2441, 87, '2024-04-17 08:32:00', '2024-04-17 09:32:00', 2, 'đi khách hàng', NULL);
INSERT INTO `todo` VALUES (2442, 85, '2024-04-17 10:55:00', '2024-04-17 11:10:00', 2, 'Gọi tư vấn KH Nguyễn Minh Tâm', NULL);
INSERT INTO `todo` VALUES (2444, 85, '2024-04-17 15:40:00', '2024-04-17 17:00:00', 2, 'Xem sản phẩm tư vấn KHBM quý 2', NULL);
INSERT INTO `todo` VALUES (2445, 85, '2024-04-17 13:15:00', '2024-04-17 15:00:00', 2, 'Gửi yêu cầu thu nợ KH quá hạn', NULL);
INSERT INTO `todo` VALUES (2447, 91, '2024-04-19 11:00:00', '2024-04-19 11:15:00', 2, 'Trình lại Hs Thẻ tín dụng - Nguyễn Thanh Cường', NULL);
INSERT INTO `todo` VALUES (2448, 83, '2024-04-19 11:30:00', '2024-04-19 12:00:00', 2, 'Trao đổi hồ sơ anh Chiến - Vay mua BĐS 600Tr', NULL);
INSERT INTO `todo` VALUES (2449, 85, '2024-04-19 13:15:00', '2024-04-19 13:30:00', 2, 'Trình hồ sơ tín chấp Giáo viên', NULL);
INSERT INTO `todo` VALUES (2450, 83, '2024-09-18 09:00:00', '2024-04-19 09:30:00', 2, 'Nhắc nợ khách hàng quá hạn', NULL);
INSERT INTO `todo` VALUES (2451, 83, '2024-08-19 08:00:00', '2024-04-19 09:00:00', 2, 'Tra soát thẻ tín dụng và đóng thẻ cho khách', NULL);
INSERT INTO `todo` VALUES (2452, 83, '2024-04-19 09:30:00', '2024-04-19 11:30:00', 2, 'Thẩm định hồ sơ kg Nguyễn văn Vũ ở Vĩnh Thạnh', NULL);
INSERT INTO `todo` VALUES (2453, 83, '2024-04-19 13:00:00', '2024-04-19 03:30:00', 2, 'Bàn giao hồ sơ tín dụng và kiểm tra sau vay', NULL);
INSERT INTO `todo` VALUES (2454, 85, '2024-04-19 07:05:00', '2024-04-19 07:30:00', 2, 'Cho KH Phạm Đình Phúc ký lại hồ sơ', NULL);
INSERT INTO `todo` VALUES (2455, 83, '2024-04-19 15:30:00', '2024-04-19 16:00:00', 1, 'Điều chỉnh tà khoản thu nợ khách hàng Ngô hoàng Ngọc Trâm ', NULL);
INSERT INTO `todo` VALUES (2456, 86, '2024-04-18 08:00:00', '2024-04-19 08:30:00', 2, 'Điện thoại nhắc nợ các khách hàng quá hạn', NULL);
INSERT INTO `todo` VALUES (2460, 86, '2024-04-15 15:00:00', '2024-04-19 16:00:00', 1, 'Gửi yêu cầu kiểm tra sau vay và bàn giao hồ sơ cho hổ trợ tín dụng', NULL);
INSERT INTO `todo` VALUES (2461, 91, '2024-04-19 11:00:00', '2024-04-19 12:00:00', 2, 'Hẹn KH lại quầy mở thẻ và hướng dẫn KH về biểu phí và cách sử dụng', NULL);
INSERT INTO `todo` VALUES (2462, 91, '2024-04-19 13:00:00', '2024-04-19 14:00:00', 2, 'Soạn hồ sơ bà Trần Thị Kim Đồng', NULL);
INSERT INTO `todo` VALUES (2463, 91, '2024-04-19 14:00:00', '2024-04-19 15:00:00', 2, 'Soạn hồ sơ bà Nguyễn Đỗ Vân Phương', NULL);
INSERT INTO `todo` VALUES (2464, 91, '2024-04-19 16:00:00', '2024-04-19 17:00:00', 2, 'Liên hệ KH Trần Thị Loan Phượng vay thế chấp (dự kiến vay 2 tỷ)', NULL);
INSERT INTO `todo` VALUES (2465, 85, '2024-04-19 08:27:00', '2024-04-19 09:00:00', 2, 'Gọi danh sách các khách hàng quá hạn', NULL);
INSERT INTO `todo` VALUES (2466, 85, '2024-04-19 09:05:00', '2024-04-19 16:30:00', 2, 'Gửi yêu cầu thu các KH nợ quá hạn', NULL);
INSERT INTO `todo` VALUES (2468, 85, '2024-04-19 13:00:00', '2024-04-19 17:00:00', 2, 'Xuất sao kê dư nợ tín dụng và gọi các KH tới hạn của tháng 05', NULL);
INSERT INTO `todo` VALUES (2470, 85, '2024-04-19 13:35:00', '2024-04-19 14:35:00', 2, 'Đi thẩn định KH Trần Thị Loan Phượng với Rm Ánh Tuyết', NULL);
INSERT INTO `todo` VALUES (2471, 83, '2024-04-20 08:00:00', '2024-04-20 09:00:00', 2, 'Sao kê nợ, kiểm tra khách hàng quá hạn ', NULL);
INSERT INTO `todo` VALUES (2472, 83, '2024-10-08 09:00:00', '2024-04-20 09:30:00', 2, 'Nhắc nợ khách hàng quá hạn', NULL);
INSERT INTO `todo` VALUES (2473, 83, '2024-04-20 09:30:00', '2024-04-20 11:00:00', 2, 'Xuống nhà khách hàng quá hạn Trần Ngọc Hân', NULL);
INSERT INTO `todo` VALUES (2474, 83, '2024-04-20 11:00:00', '2024-04-20 12:00:00', 2, 'Thông báo các khách hàng sắp đến hạn trả nợ', NULL);
INSERT INTO `todo` VALUES (2475, 83, '2024-04-20 13:00:00', '2024-04-20 15:00:00', 2, 'Là kiểm tra MDS vốn ', NULL);
INSERT INTO `todo` VALUES (2476, 83, '2024-04-20 15:00:00', '2024-04-20 17:00:00', 2, 'Đánh giá hạn mức khách hàng Lê Ngọc Hà', NULL);
INSERT INTO `todo` VALUES (2477, 91, '2024-04-20 07:30:00', '2024-04-20 08:30:00', 2, 'Hướng dẫn kh Đặng Thị Đang và Nguyễn Thị Vui sử dụng app PVconnect', NULL);
INSERT INTO `todo` VALUES (2478, 91, '2024-04-20 09:00:00', '2024-04-20 11:00:00', 2, 'Hẹn KH NGUYỄN ĐỖ VÂN PHƯƠNG KÝ HỒ SƠ (Kh bận việc hẹn lại Thứ 2)', NULL);
INSERT INTO `todo` VALUES (2479, 86, '2024-04-22 08:05:00', '2024-04-22 08:30:00', 2, 'Điện thoại đôn đốc nhắc nợ các khách hàng quá hạn', NULL);
INSERT INTO `todo` VALUES (2480, 86, '2024-04-23 10:00:00', '2024-04-23 11:00:00', 2, 'Xuống xã đông thuận thu thập hồ sơ khách hàng vay mới ', NULL);
INSERT INTO `todo` VALUES (2481, 86, '2024-04-22 09:50:00', '2024-04-22 11:00:00', 2, 'Xuống nhà khách hàng vay Nguyễn Chí Tâm đôn đốc thu hồi nợ lãi quá hạn', NULL);
INSERT INTO `todo` VALUES (2482, 86, '1970-01-01 00:00:00', '1970-01-01 00:00:00', 1, 'Làm việc tại phòng ', NULL);
INSERT INTO `todo` VALUES (2484, 86, '1970-01-01 00:00:00', '1970-01-01 00:00:00', 1, 'Đi thẩm định khách hàng mới tại xã trung hưng', NULL);
INSERT INTO `todo` VALUES (2485, 86, '1970-01-01 00:00:00', '1970-01-01 00:00:00', 1, 'Đi thẩm định hồ sơ vay khách hàng mới tại xã Trung Hưng', NULL);
INSERT INTO `todo` VALUES (2486, 86, '2024-04-22 15:40:00', '2024-04-22 17:00:00', 2, 'Đi thẩm định khách hàng vay mới tại xã trung hưng', NULL);
INSERT INTO `todo` VALUES (2488, 85, '2024-04-22 08:15:00', '2024-04-22 00:00:00', 2, 'Gọi điện các khách hàng quá hạn', NULL);
INSERT INTO `todo` VALUES (2489, 85, '2024-04-22 09:00:00', '2024-04-22 14:00:00', 2, 'Tra cic và soạn hồ sơ giải ngân lại KH Phạm Phú Thuận', NULL);
INSERT INTO `todo` VALUES (2490, 85, '2024-04-23 14:06:00', '2024-04-23 18:47:00', 2, 'Gặp KH Phạm Phú Thuận', NULL);
INSERT INTO `todo` VALUES (2491, 91, '2024-04-22 08:00:00', '2024-04-22 08:30:00', 2, 'Phản hồi hồ sơ TTD Trần Thị Kim Đồng', NULL);
INSERT INTO `todo` VALUES (2492, 91, '2024-04-22 08:45:00', '2024-04-22 09:30:00', 2, 'Phản hồi kpis tháng 03 ( Không liên lạc được đầu mối)', NULL);
INSERT INTO `todo` VALUES (2493, 91, '2024-04-22 09:30:00', '2024-04-22 11:00:00', 2, 'Hẹn KH Nguyễn Đỗ Vân Phương ký hồ sơ', NULL);
INSERT INTO `todo` VALUES (2494, 91, '2024-04-22 13:00:00', '2024-04-22 14:30:00', 2, 'Hẹn gặp KH Triệu Thị Giàu tư vấn chuyền tiền quốc tế (Con KH đi du học Hàn quốc) - KH bận việc hẹn lại thứ 4', NULL);
INSERT INTO `todo` VALUES (2496, 83, '2024-04-22 08:00:00', '2024-04-22 08:30:00', 2, 'Sao kê nợ quá hạn', NULL);
INSERT INTO `todo` VALUES (2497, 83, '2024-04-22 08:30:00', '2024-09-21 21:30:00', 2, 'Gặp khách hàng Lê viết Hoàng', NULL);
INSERT INTO `todo` VALUES (2498, 83, '2024-04-22 09:30:00', '2024-04-22 10:00:00', 2, 'Nhắc nợ quá hạn', NULL);
INSERT INTO `todo` VALUES (2499, 83, '2024-04-22 10:00:00', '2024-04-22 00:00:00', 2, 'Định giá lại đất khách hàng Nguyễn thị mảnh', NULL);
INSERT INTO `todo` VALUES (2500, 87, '2024-04-22 07:50:00', '2024-04-22 10:00:00', 2, 'sáng đi gặp khách hàng thu thập hồ sơ vay Trần Thị chính', NULL);
INSERT INTO `todo` VALUES (2501, 83, '2024-04-22 13:00:00', '2024-04-22 17:00:00', 2, 'Định giá đất kh Nguyễn thị mảnh', NULL);
INSERT INTO `todo` VALUES (2502, 87, '2024-04-22 00:00:00', '2024-04-22 07:55:00', 2, 'rà soát và kích hoạt thẻ tín dụng mới về ', NULL);
INSERT INTO `todo` VALUES (2503, 87, '2024-04-22 13:00:00', '2024-04-22 17:00:00', 2, 'làm hồ sơ thẻ tín dụng và thấu chi KH Nguyễn Âu Minh Trí', NULL);
INSERT INTO `todo` VALUES (2504, 87, '2024-04-22 13:00:00', '2024-04-22 16:59:00', 2, 'làm hồ sơ thẻ tín dụng KH Trần thị Phương Thảo', NULL);
INSERT INTO `todo` VALUES (2505, 85, '2024-04-22 09:17:00', '2024-04-22 11:17:00', 2, 'Đóng thẻ TD KH Phạm Đình Phúc', NULL);
INSERT INTO `todo` VALUES (2506, 85, '2024-04-22 13:22:00', '2024-04-22 15:30:00', 2, 'Thẩm định KH Trần Văn Dũng', NULL);
INSERT INTO `todo` VALUES (2507, 85, '2024-04-22 10:25:00', '2024-04-22 00:00:00', 2, 'Kiểm tra KH đến hạn trong dịp nghỉ lễ', NULL);
INSERT INTO `todo` VALUES (2508, 86, '2024-04-22 13:30:00', '2024-04-22 16:39:00', 2, '- xuống nhà khách hàng quá hạn Nguyễn Văn Nhơn làm việc\r\n- xuống nhà khách hàng  vay nguyễn văn huệ  sắp hết hợp đồng hạn mức cho vay \r\n- xuống nhà khách hàng quá hạn trần hoàng giang làm việc', NULL);
INSERT INTO `todo` VALUES (2509, 87, '2024-04-23 08:00:00', '2024-04-23 00:00:00', 2, 'Đi khảo sát gặp khách hàng phát hành máy POS', NULL);
INSERT INTO `todo` VALUES (2510, 87, '2024-04-23 01:00:00', '2024-04-23 05:00:00', 2, 'thu thập hồ sơ thẻ tín dụng của KH Nguyễn Văn Điền', NULL);
INSERT INTO `todo` VALUES (2511, 87, '2024-04-23 13:00:00', '2024-04-23 17:00:00', 2, 'kích hoạt thẻ tín dụng KH Nguyễn Ngọc Lẹ và Phan Văn Tuấn', NULL);
INSERT INTO `todo` VALUES (2512, 86, '2024-04-23 08:00:00', '2024-04-23 08:30:00', 2, 'Sao kê nợ quá hạn và đôn đốc thu hồi nợ \r\n- Khách hàng Hà Văn Trắng \r\n- khách hàng đỗ thanh tùng', NULL);
INSERT INTO `todo` VALUES (2513, 86, '2024-04-23 09:00:00', '2024-04-22 09:30:00', 2, 'Thu thập hồ sơ mới khách hàng vay tại Xã Thới Đông Huyện Cờ Đỏ', NULL);
INSERT INTO `todo` VALUES (2514, 86, '2024-04-24 15:00:00', '2024-04-25 17:00:00', 2, 'Làm hồ sơ khách hàng vay tại xã đông thuận', NULL);
INSERT INTO `todo` VALUES (2515, 83, '2024-04-23 08:00:00', '2024-04-23 09:00:00', 2, 'Sao kê nợ quá hạn và nhắc nợ khách hàng', NULL);
INSERT INTO `todo` VALUES (2516, 83, '2024-04-23 09:00:00', '2024-04-23 10:30:00', 2, 'Xuống làm việc và gửi thông báo nợ qua hạn khách hàng nguyễn  Phước hậu', NULL);
INSERT INTO `todo` VALUES (2517, 83, '2024-04-23 10:30:00', '2024-04-23 12:00:00', 2, 'Xuống nhà khách hàng Trần Ngọc Hân làm việc và gửi thông báo nợ.', NULL);
INSERT INTO `todo` VALUES (2518, 83, '2024-04-23 13:00:00', '2024-04-23 16:30:00', 2, 'Tổng hợp các trường trả lương trình cấp tín dụng ngoại lệ', NULL);
INSERT INTO `todo` VALUES (2519, 83, '2024-05-08 16:00:00', '2024-04-23 17:00:00', 2, 'Làm hồ sơ giải ngân lại khách hàng Nguyễn Thị Mảnh', NULL);
INSERT INTO `todo` VALUES (2520, 85, '2024-04-23 08:00:00', '2024-04-23 09:30:00', 2, 'Đi gặp KH ở Nóc Bằng và xem TSĐB', NULL);
INSERT INTO `todo` VALUES (2521, 85, '2024-04-23 10:00:00', '2024-04-23 13:30:00', 2, 'Hoàn thành tờ trìh KH Võ Diệp Thuý', NULL);
INSERT INTO `todo` VALUES (2522, 85, '2024-04-23 14:00:00', '2024-04-23 15:00:00', 2, 'Sao kê nợ quá hạn và gọi nhắc nợ KH', NULL);
INSERT INTO `todo` VALUES (2524, 85, '2024-04-23 16:00:00', '2024-04-23 17:00:00', 2, 'Cho KH Võ Diệp Thúy  kê khai thông tin', NULL);
INSERT INTO `todo` VALUES (2525, 86, '2024-04-25 13:30:00', '2024-04-25 14:30:00', 2, '- đi thẩm định khách hàng vay mới Nguyễn Hùng Lợi\r\n\r\n\r\n', NULL);
INSERT INTO `todo` VALUES (2526, 86, '2024-05-01 08:00:00', '2024-04-24 08:30:00', 2, 'Sao kê nợ quá hạn và gọi điện đôn đốc thu hồi nợ các khách hàng quá hạn', NULL);
INSERT INTO `todo` VALUES (2527, 86, '2024-04-24 13:00:00', '2024-04-24 14:00:00', 2, 'Soạn hồ sơ giải ngân khách hàng Trần Ngọc Liên', NULL);
INSERT INTO `todo` VALUES (2528, 85, '2024-04-24 08:00:00', '2024-04-24 10:30:00', 2, 'Gặp KH hướng dẫn mở tài khoản onl', 'accepted');
INSERT INTO `todo` VALUES (2529, 85, '2024-04-24 11:00:00', '2024-04-24 14:00:00', 2, 'Gửi báo cáo kiểm tra mục đích sử dụng vốn và kiểm tra định kỳ PVB Cờ Đỏ', NULL);
INSERT INTO `todo` VALUES (2530, 85, '2024-04-24 14:10:00', '2024-04-24 17:00:00', 2, 'Sao kê và gọi đôn đốc các KH quá hạn chưa thanh toán ', NULL);
INSERT INTO `todo` VALUES (2531, 85, '2024-04-24 04:00:00', '2024-04-24 05:41:00', 2, 'Tra thông tin CIC và chuẩn bị hồ sơ KH Phạm Phú Thuận', NULL);
INSERT INTO `todo` VALUES (2532, 91, '2024-04-24 08:00:00', '2024-04-24 09:00:00', 2, 'Trình hồ sơ TTD Nguyễn Đỗ Vân Phương', NULL);
INSERT INTO `todo` VALUES (2533, 91, '2024-04-24 09:00:00', '2024-04-24 09:30:00', 2, 'Gặp khách hàng Phan Hữu Lợi', NULL);
INSERT INTO `todo` VALUES (2534, 91, '2024-04-24 13:00:00', '2024-04-24 14:00:00', 2, 'Liên hệ Chú Tuấn - bên Chi cục Thuế Thới Lai - Cờ Đỏ', NULL);
INSERT INTO `todo` VALUES (2535, 91, '2024-04-24 14:00:00', '2024-04-24 14:30:00', 2, 'Liên hệ KH Cao Thị Gọn Private mở thẻ tín dụng ( Chị ít sử dụng TTD, nên chưa có nhu cầu mở)', NULL);
INSERT INTO `todo` VALUES (2537, 83, '2024-04-24 08:00:00', '2024-04-24 09:00:00', 2, 'Sao kê nợ làm kế hoạch kiểm tra MDSD vốn tháng 5', NULL);
INSERT INTO `todo` VALUES (2538, 83, '2024-04-24 09:00:00', '2024-04-24 12:00:00', 2, 'Làm tờ trình ngoại lệ các trương chi lương ', NULL);
INSERT INTO `todo` VALUES (2539, 83, '2024-04-24 13:00:00', '2024-04-24 15:00:00', 2, 'Làm kiểm tra sau vay', NULL);
INSERT INTO `todo` VALUES (2540, 83, '2024-04-24 15:00:00', '2024-04-24 16:00:00', 2, 'Đóng thẻ tín dụng cho khách Nguyễn Duy linh và Nguyễn hoàng Yến ', NULL);
INSERT INTO `todo` VALUES (2541, 83, '2024-04-24 16:00:00', '2024-04-24 17:00:00', 2, 'Bàn giao hồ sơ tín dụng', NULL);
INSERT INTO `todo` VALUES (2542, 87, '2024-04-24 08:00:00', '2024-04-24 09:00:00', 2, 'đi gặp khách hàng Quốc Chi hỗ trợ máy Pos tại Cờ Đỏ', NULL);
INSERT INTO `todo` VALUES (2543, 87, '2024-04-24 09:00:00', '2024-04-24 10:00:00', 2, 'lặp kế hoạch kiểm tra MĐSD vốn của Tháng 05', NULL);
INSERT INTO `todo` VALUES (2544, 87, '2024-04-25 09:00:00', '2024-04-25 10:00:00', 2, ' liên hệ KH ký đóng TTD KH Trần Trúc Giang và Nguyễn Hoàng Nghĩa', NULL);
INSERT INTO `todo` VALUES (2545, 87, '2024-04-25 10:00:00', '2024-04-25 11:00:00', 2, 'liên hệ KH ký hồ sơ Thẻ tín dụng ', NULL);
INSERT INTO `todo` VALUES (2546, 87, '2024-04-24 13:00:00', '2024-04-24 03:00:00', 2, 'làm 2 hồ sơ thẻ tín dụng ', NULL);
INSERT INTO `todo` VALUES (2547, 87, '2024-04-25 11:00:00', '2024-04-25 00:00:00', 2, 'Trình úp hồ sơ thẻ ', NULL);
INSERT INTO `todo` VALUES (2548, 91, '2024-04-24 10:30:00', '2024-04-24 11:30:00', 2, 'Báo cáo phễu tín dụng gửi chị Hải Bình', NULL);
INSERT INTO `todo` VALUES (2549, 85, '2024-04-24 14:40:00', '2024-04-24 17:00:00', 2, 'Soạn hồ sơ giải ngân KH Nguyễn Thị Thanh Tuyền', NULL);
INSERT INTO `todo` VALUES (2550, 86, '2024-04-24 15:35:00', '2024-04-24 04:00:00', 2, 'Gửi các yêu cầu kiểm tra sau cấp tín dụng', NULL);
INSERT INTO `todo` VALUES (2551, 87, '2024-04-25 08:00:00', '2024-04-25 09:00:00', 2, 'đi giao máy Pos cho KH Niệm Vạn Thành', NULL);
INSERT INTO `todo` VALUES (2552, 87, '2024-04-25 13:00:00', '2024-04-25 14:00:00', 2, 'thu thập hồ sơ TTD KH lê thị cẩm tiên và Lương Khánh Linh ', NULL);
INSERT INTO `todo` VALUES (2553, 83, '2024-04-25 08:00:00', '2024-04-25 10:00:00', 2, 'Hợp đầu ngày ', NULL);
INSERT INTO `todo` VALUES (2554, 83, '2024-04-25 10:00:00', '2024-04-25 12:00:00', 2, 'Sao kê nợ quá hạn, gọi khách, soạn thông báo nợ quá hạn', NULL);
INSERT INTO `todo` VALUES (2555, 83, '2024-04-25 13:00:00', '2024-04-25 15:00:00', 2, 'Xuống nhà khách hàng Nguyễn thị Phượng ', NULL);
INSERT INTO `todo` VALUES (2556, 83, '2024-04-25 19:46:00', '2024-04-25 17:00:00', 2, 'Bàn giao hồ sơ tín dụng do hôm qua phát sinh đều chỉnh khoản vay kh Huỳnh thị Huỳnh như nên chưa bàn giao kịp', NULL);
INSERT INTO `todo` VALUES (2557, 91, '2024-04-25 08:00:00', '2024-04-25 10:00:00', 2, 'Họp Huddle', NULL);
INSERT INTO `todo` VALUES (2558, 91, '2024-04-25 13:00:00', '2024-04-25 14:00:00', 2, 'Hỗ trợ anh Sang giao máy pos', NULL);
INSERT INTO `todo` VALUES (2559, 86, '2024-04-25 09:58:00', '2024-04-25 11:30:00', 2, 'Đi gặp khách hàng vay mới tại tt cờ đỏ', NULL);
INSERT INTO `todo` VALUES (2560, 86, '2024-04-25 13:10:00', '2024-04-25 14:00:00', 2, 'Giải ngân hồ sơ trần ngọc liên', NULL);
INSERT INTO `todo` VALUES (2561, 86, '2024-04-26 08:30:00', '2024-04-26 08:40:00', 2, 'Thu nợ khách hàng Nguyễn Ngọc Giang', NULL);
INSERT INTO `todo` VALUES (2562, 91, '2024-04-25 10:30:00', '2024-04-25 12:00:00', 2, 'Hẹn gặp KH nhà nghỉ Vạn sanh phát đối diện trường THPT Hà Nguyên Giáp mở máy pos cùng chị Trân', NULL);
INSERT INTO `todo` VALUES (2563, 85, '2024-04-25 08:00:00', '2024-04-25 10:00:00', 2, 'Họp đầu ngày', NULL);
INSERT INTO `todo` VALUES (2564, 91, '2024-04-25 14:00:00', '2024-04-25 15:00:00', 2, 'Liên hệ khách hàng Phạm Minh Tân private mở thẻ tín dụng ( KH không có nhu cầu mở thẻ)', NULL);
INSERT INTO `todo` VALUES (2565, 85, '2024-04-25 10:30:00', '2024-04-25 11:00:00', 2, 'Thanh lý hạn mức thấu chi KH Thanh Tuyền', NULL);
INSERT INTO `todo` VALUES (2566, 85, '2024-04-25 13:00:00', '2024-04-25 15:00:00', 2, 'Gửi yêu cầu giải ngân KH Nguyễn Thị Thanh Tuyền', NULL);
INSERT INTO `todo` VALUES (2567, 85, '2024-04-25 13:00:00', '2024-04-25 14:30:00', 2, 'Gửi yêu cầu giải ngân Phạm Phú Thuận', NULL);
INSERT INTO `todo` VALUES (2568, 85, '2024-04-25 13:32:00', '2024-04-25 17:00:00', 2, 'Sao kê và gọi điện nhắc nợ KH Lê Thị Thuỳ Vân, Lê Thị Chi, Nguyễn Công Quới', NULL);
INSERT INTO `todo` VALUES (2569, 91, '2024-04-25 11:00:00', '2024-04-25 12:00:00', 2, 'Liên hệ Kh Lê Minh Nhựt KH LCT mở TTD theo danh sách bên telesales gửi về ĐV', NULL);
INSERT INTO `todo` VALUES (2570, 87, '2024-04-26 08:00:00', '2024-04-26 09:00:00', 2, 'đi gặp KH chủ quán cà phê cá koi tư vấn máy POs', NULL);
INSERT INTO `todo` VALUES (2571, 91, '2024-04-25 14:30:00', '2024-04-25 15:00:00', 2, 'Soạn giấy đề nghị KH Lê Minh Nhựt', NULL);
INSERT INTO `todo` VALUES (2572, 91, '2024-04-25 15:00:00', '2024-04-25 17:00:00', 2, 'Hẹn KH Lê Minh Nhựt ký hồ sơ (KH hẹn qua lễ)', NULL);
INSERT INTO `todo` VALUES (2573, 87, '2024-04-26 09:00:00', '2024-04-26 00:00:00', 2, 'làm hồ sơ thẻ TD và thấu chi KH Lê Thị Cẩm Tiên', NULL);
INSERT INTO `todo` VALUES (2574, 85, '2024-04-26 08:00:00', '2024-04-26 08:10:00', 2, 'Soạn thông báo nợ quá hạn KH Lê Thị Chi', NULL);
INSERT INTO `todo` VALUES (2575, 85, '2024-04-26 08:15:00', '2024-04-26 08:30:00', 2, 'Soạn thông báo nợ quá hạn KH Lê Thị Thuỳ Vân', NULL);
INSERT INTO `todo` VALUES (2576, 85, '2024-04-26 08:35:00', '2024-04-26 09:00:00', 2, 'Soạn thông báo nợ quá hạn KH Trần Kiều Loan', NULL);
INSERT INTO `todo` VALUES (2577, 85, '2024-04-26 09:20:00', '2024-04-26 10:20:00', 2, 'Đến trường Màm Non Trung Hưng 2 điểm lẻ gặp và cho KH ký biên bản làm việc và gửi thông báo nợ quá hạn với KH Lê Thị Chi và KH Trần Kiều Loan', NULL);
INSERT INTO `todo` VALUES (2578, 85, '2024-04-26 10:35:00', '2024-04-26 11:20:00', 2, 'Đến trường Mầm Non Trung Hưng 2 điểm chính tại chợ Ba Đá gặp và cho KH ký biên bản làm việc, gửi thông báo nợ quá hạn với KH Lê Thị Thuỳ Vân', NULL);
INSERT INTO `todo` VALUES (2579, 83, '2024-04-26 08:00:00', '2024-04-26 10:00:00', 1, 'Xuống nhà khách hàng Nguyễn thành Trung ở xã đông thuận, h thới lai.', NULL);
INSERT INTO `todo` VALUES (2580, 83, '2024-04-26 10:00:00', '2024-04-26 12:00:00', 1, 'Sao kê nợ quá hạn và nhắc nợ khách hàng ', NULL);
INSERT INTO `todo` VALUES (2581, 83, '2024-04-26 13:00:00', '2024-04-26 15:00:00', 1, 'Làm kiểm tra định kỳ khách hàng Lê Ngọc hà và Huỳnh thị Huỳnh như', NULL);
INSERT INTO `todo` VALUES (2582, 83, '2024-04-26 15:00:00', '2024-04-26 17:01:00', 1, 'Kiểm tra khách hàng tới kỳ đánh giá lại hạn mức và làm đánh giá lại hạn mức', NULL);
INSERT INTO `todo` VALUES (2584, 91, '2024-04-26 09:30:00', '2024-04-26 10:30:00', 2, 'Liên hệ KH Dương Hoàng Ân Kích hoạt TTD', NULL);
INSERT INTO `todo` VALUES (2586, 86, '2024-04-26 13:30:00', '2024-04-26 15:30:00', 2, 'Gặp khách hàng Cao Thị Minh tâm có nhu cầu vay vốn , tại xã thạnh phước , huyện giồng riềng', NULL);
INSERT INTO `todo` VALUES (2587, 86, '2024-04-26 08:10:00', '2024-04-26 20:20:00', 2, 'Điện thoại đôn đốc khách hàng Đỗ Thanh tùng nợ quá hạn , khách hàng cam kết ngày 27/4/2024 sẽ thanh toán hết nợ quá hạn', NULL);
INSERT INTO `todo` VALUES (2588, 86, '2024-04-26 09:00:00', '1970-01-01 00:00:00', 2, 'Làm kiểm tra sau vay khách hàng Lâm Thanh Hoà', NULL);
INSERT INTO `todo` VALUES (2591, 91, '2024-04-26 09:30:00', '2024-04-26 11:30:00', 2, 'Hỗ trợ chị Vy đi thu nợ KH quá hạn Lê Thị Thuỳ Vân, Lê Thị Chi, Trần Kiều Loan ', NULL);
INSERT INTO `todo` VALUES (2593, 85, '2024-04-26 13:16:00', '2024-04-26 13:40:00', 2, 'Thu nợ  khoản vay KH Bùi Văn Dân 500 triệu đồng', NULL);
INSERT INTO `todo` VALUES (2594, 91, '2024-04-26 15:00:00', '2024-04-26 16:00:00', 1, 'Giao thẻ KH Đặng Thị Đang, Nguyễn Thị Vui', NULL);
INSERT INTO `todo` VALUES (2595, 87, '2024-04-26 15:00:00', '2024-04-26 16:00:00', 2, 'đi gặp khách hàng tiệm vàng Hoàng Anh tư vấn máy pos', NULL);
INSERT INTO `todo` VALUES (2596, 87, '2024-05-08 08:00:00', '2024-05-08 00:00:00', 2, 'đi học đào tạo nâng cao phát triển KH hộ kinh doanh tại cần Thơ', NULL);
INSERT INTO `todo` VALUES (2597, 85, '2024-05-02 08:10:00', '2024-05-02 09:00:00', 2, 'Sao kê và gọi nhắc nợ quá hạn', NULL);
INSERT INTO `todo` VALUES (2598, 91, '2024-05-02 13:00:00', '2024-05-02 14:30:00', 2, 'Hẹn KH Lê Minh Nhựt ký hồ sơ', NULL);
INSERT INTO `todo` VALUES (2599, 91, '2024-05-02 09:30:00', '2024-05-02 10:30:00', 2, 'Bàn giao hồ sơ của KH Nguyễn Thanh Cường', NULL);
INSERT INTO `todo` VALUES (2600, 91, '2024-05-02 10:30:00', '2024-05-02 11:30:00', 2, 'Bàn giao hồ sơ KH Trần Thị Kim Đồng', NULL);
INSERT INTO `todo` VALUES (2601, 83, '2024-05-02 08:00:00', '2024-05-02 09:00:00', 2, 'Sao kê nợ quá hạn nhắc nợ gói hạn', NULL);
INSERT INTO `todo` VALUES (2602, 83, '2024-05-02 09:00:00', '2024-05-02 00:00:00', 2, 'Làm hồ sơ giải ngân lại kh Nguyễn thị mảnh', NULL);
INSERT INTO `todo` VALUES (2603, 85, '2024-05-02 09:05:00', '2024-05-02 09:30:00', 2, 'Tra cic KH Trần Văn Xoài', NULL);
INSERT INTO `todo` VALUES (2604, 83, '2024-05-02 13:00:00', '2024-05-02 15:00:00', 2, 'Kiểm tra và gọi điện lại các trường chị lương giải thích việc ngân hàng thu phí tin nhắn sms', NULL);
INSERT INTO `todo` VALUES (2605, 85, '2024-05-02 09:35:00', '2024-05-02 11:10:00', 2, 'Bàn giao hồ sơ KH Phạm Phú Thuận và KH Nguyễn Thị Thanh Tuyền', NULL);
INSERT INTO `todo` VALUES (2606, 83, '2024-05-02 16:00:00', '2024-05-02 04:30:00', 2, 'Kiểm tra hồ sơ khách hàng Nguyễn thị kim Tuyến xin vay đáo hạn lại trả góp lương', NULL);
INSERT INTO `todo` VALUES (2607, 85, '2024-05-02 11:15:00', '2024-05-02 00:00:00', 2, 'Kiểm tra mục đích sử dụng vốn KH Nguyễn Thị Thanh Tuyền', NULL);
INSERT INTO `todo` VALUES (2608, 87, '2024-05-02 08:00:00', '2024-05-02 10:00:00', 2, 'đi thẩm định thu thập hồ sơ KH thạch Nhứt ở Lồng Ống', NULL);
INSERT INTO `todo` VALUES (2609, 83, '2024-05-02 16:30:00', '2024-05-02 17:00:00', 2, 'Kiểm trả hồ sơ khách hàng Nguyễn văn lợi anh xin giải ngân lại 350 triệu đồng.', NULL);
INSERT INTO `todo` VALUES (2610, 85, '2024-05-02 13:05:00', '2024-05-02 13:45:00', 2, 'Kiểm tra mục đích sử dụng vốn KH Phạm phú Thuận', NULL);
INSERT INTO `todo` VALUES (2611, 85, '2024-05-02 13:50:00', '2024-05-02 15:00:00', 2, 'Ghi thông tin biên bản làm việc, scan up ảnh thực địa bổ sung lên file zilla các KH Trần Kiều Loan, Lê Thị Chi, Lê Thị Thuỳ Vân', NULL);
INSERT INTO `todo` VALUES (2612, 86, '2024-05-02 08:10:00', '2024-05-02 08:40:00', 2, 'Sao kê khách hàng quá hạn \r\n- gọi điện đôn đốc khách nợ quá hạn', NULL);
INSERT INTO `todo` VALUES (2613, 86, '2024-05-02 13:10:00', '2024-05-02 14:30:00', 2, 'Xuống xã đông thuận hổ trợ khách hàng Nguyễn Thanh Điền làm giấy xác nhận kinh doanh và xác nhận đất', NULL);
INSERT INTO `todo` VALUES (2614, 87, '2024-05-02 10:00:00', '2024-05-02 00:00:00', 2, 'trình úp hồ sơ Lê Thị Cẩm Tiên', NULL);
INSERT INTO `todo` VALUES (2615, 86, '2024-05-02 09:30:00', '2024-05-02 11:00:00', 2, 'Xuống nhà khách hàng quá hạn nguyễn chí tâm thu lãi ', NULL);
INSERT INTO `todo` VALUES (2616, 87, '2024-05-02 13:00:00', '2024-05-02 14:00:00', 2, 'soạn bàn giao hồ sơ Nguyễn Thanh Điền ', NULL);
INSERT INTO `todo` VALUES (2617, 86, '2024-05-02 13:10:00', '2024-05-02 15:30:00', 1, 'Làm định giá và trình ký hồ sơ khách hàng Nguyễn Thanh Điền', NULL);
INSERT INTO `todo` VALUES (2618, 86, '1970-01-01 00:00:00', '1970-01-01 00:00:00', 1, 'Thu nợ trước hạn khách hàng Nguyễn Văn Mười', NULL);
INSERT INTO `todo` VALUES (2619, 85, '2024-05-02 10:26:00', '2024-05-02 16:00:00', 2, 'Thu nợ trước hạn KH Phương Tuấn Vũ', NULL);
INSERT INTO `todo` VALUES (2620, 91, '2024-05-02 13:00:00', '2024-05-02 13:30:00', 2, 'Soạn tờ trình Lê Minh Nhựt', NULL);
INSERT INTO `todo` VALUES (2621, 87, '2024-05-13 08:00:00', '2024-05-15 08:00:00', 2, 'học online chuyển tiền quốc tế', NULL);
INSERT INTO `todo` VALUES (2624, 91, '2024-05-03 15:30:00', '2024-05-03 16:30:00', 2, 'Báo cáo phễu tín dụng', NULL);
INSERT INTO `todo` VALUES (2625, 91, '2024-05-15 08:00:00', '2024-05-17 17:00:00', 1, 'Báo cáo cuối kỳ khoá học Tân tuyển ', NULL);
INSERT INTO `todo` VALUES (2626, 91, '2024-05-02 13:30:00', '2024-05-02 14:30:00', 2, 'Học tân tuyển online bộ tiêu chuẩn CLDV dành cho chuyên viên KHCN', NULL);
INSERT INTO `todo` VALUES (2627, 91, '2024-05-03 10:00:00', '2024-05-03 11:00:00', 2, 'Trình hồ sơ TTD KH Lê Minh Nhựt', NULL);
INSERT INTO `todo` VALUES (2628, 91, '2024-05-03 13:30:00', '2024-05-03 14:30:00', 2, 'Tra cic và liên hệ thẩm định KH  Trần Thị Hồng Nhung làm việc tại UBND Huyện Cờ Đỏ có nhu cầu mở thẻ tín dụng 30tr và thấu chi 20tr', NULL);
INSERT INTO `todo` VALUES (2629, 91, '2024-05-03 08:00:00', '2024-05-03 10:00:00', 2, 'Họp huddle', NULL);
INSERT INTO `todo` VALUES (2630, 86, '2024-05-03 08:00:00', '2024-05-03 08:20:00', 2, 'Sao kê và gọi điện thoại nhắc nợ các khách hàng quá hạn', NULL);
INSERT INTO `todo` VALUES (2631, 83, '2024-05-03 08:00:00', '2024-05-03 10:00:00', 2, 'Hợp đầu ngày ', NULL);
INSERT INTO `todo` VALUES (2632, 83, '2024-05-03 10:00:00', '2024-05-03 12:00:00', 2, 'Bàn giao hồ sơ tín dụng và kiểm tra sau vay', NULL);
INSERT INTO `todo` VALUES (2633, 83, '2024-05-03 13:00:00', '2024-05-03 17:00:00', 1, 'Làm hồ sơ khách hàng Trần văn chiến', NULL);
INSERT INTO `todo` VALUES (2634, 87, '2024-05-03 08:00:00', '2024-05-03 10:00:00', 2, 'họp huddle đầu ngày tại quán cf ca koi ', NULL);
INSERT INTO `todo` VALUES (2635, 87, '2024-05-03 10:00:00', '2024-05-03 00:00:00', 2, 'đi thẩm định hồ sơ vay Thạch Tấn Tài tại ấp thới hòa B, Thị Trấn Cờ Đỏ', NULL);
INSERT INTO `todo` VALUES (2636, 86, '2024-05-03 08:30:00', '2024-05-03 09:30:00', 2, 'Hợp đầu ngày ', NULL);
INSERT INTO `todo` VALUES (2637, 85, '2024-05-03 08:10:00', '2024-05-03 10:00:00', 2, 'Họp đầu ngày', NULL);
INSERT INTO `todo` VALUES (2638, 85, '2024-05-03 10:15:00', '2024-05-03 11:15:00', 2, 'Gọi nhắc nợ quá hạn', NULL);
INSERT INTO `todo` VALUES (2639, 91, '2024-05-03 13:00:00', '2024-05-03 14:00:00', 2, 'Gặp KH Phạm Thị Như Ý - Đông Thuận, Thới Lai - dự kiến vay thế chấp 100tr', NULL);
INSERT INTO `todo` VALUES (2640, 87, '2024-05-04 08:00:00', '2024-05-04 10:00:00', 2, 'làm hồ sơ giải ngân Lê Thị Cẩm Tiên', NULL);
INSERT INTO `todo` VALUES (2641, 85, '2024-05-03 11:00:00', '2024-05-03 00:00:00', 2, 'Gửi yêu cầu kiểm tra MĐSDV KH Phạm Phú Thuận', NULL);
INSERT INTO `todo` VALUES (2642, 85, '2024-05-03 13:15:00', '2024-05-03 14:20:00', 2, 'Gửi yêu cầu đóng thẻ TD ', NULL);
INSERT INTO `todo` VALUES (2643, 85, '2024-05-03 14:20:00', '2024-05-03 16:00:00', 2, 'Kiểm tra danh sách thẻ tín dụng đến hạn thu phí', NULL);
INSERT INTO `todo` VALUES (2644, 83, '2024-05-04 08:00:00', '2024-05-04 09:00:00', 2, 'Sao kê nợ quá hạn và nhắc nợ', NULL);
INSERT INTO `todo` VALUES (2645, 83, '2024-05-04 09:00:00', '2024-05-04 11:00:00', 2, 'Gặp khách hàng võ văn út sau', NULL);
INSERT INTO `todo` VALUES (2646, 83, '2024-05-04 11:00:00', '2024-05-04 12:00:00', 2, 'Gặp khách hàng võ văn út trước ', NULL);
INSERT INTO `todo` VALUES (2647, 83, '2024-05-04 13:00:00', '2024-05-04 15:00:00', 2, 'Xuống nhà khách hàng Nguyễn thị mảnh ', NULL);
INSERT INTO `todo` VALUES (2648, 91, '2024-05-04 08:00:00', '2024-05-04 09:00:00', 2, 'Báo cáo phễu tín dụng t5 gửi chị Bình', NULL);
INSERT INTO `todo` VALUES (2649, 91, '2024-05-04 09:15:00', '2024-05-04 10:00:00', 2, 'Bàn giao hồ sơ TTD Nguyễn Đỗ Vân Phương', NULL);
INSERT INTO `todo` VALUES (2650, 86, '2024-05-04 08:20:00', '2024-05-04 08:40:00', 2, 'Điện thoại nhắc nợ các khách hàng', NULL);
INSERT INTO `todo` VALUES (2651, 91, '2024-05-04 13:30:00', '2024-05-04 14:00:00', 2, 'Giao thẻ KH Triệu Thị Giàu', NULL);
INSERT INTO `todo` VALUES (2652, 91, '2024-05-04 13:00:00', '2024-05-04 13:30:00', 2, 'Giao thẻ KH Bùi Văn Lâm', NULL);
INSERT INTO `todo` VALUES (2653, 86, '2024-05-04 09:50:00', '2024-05-04 10:10:00', 2, 'Gửi yêu cầu kiểm tra sau cấp tín dụng khách hàng Lâm Thanh Hoà', NULL);
INSERT INTO `todo` VALUES (2654, 87, '2024-05-04 11:00:00', '2024-05-04 00:00:00', 2, 'bàn giao hồ sơ Nguyễn Thanh Điền cho anh Khánh', NULL);
INSERT INTO `todo` VALUES (2657, 91, '2024-05-09 08:00:00', '2024-05-09 17:00:00', 1, 'Học đào tạo hướng dẫn trình hồ sơ qua TT TT&PDTD, đào tạo nhóm sp thế chấp và hướng dẫn kênh phát triển bán hàng tín dụng', NULL);
INSERT INTO `todo` VALUES (2658, 91, '2024-05-08 08:00:00', '2024-05-08 00:00:00', 2, 'Học đào tạo nâng cao hiệu quả phân khúc KH HKD và DNSN', NULL);
INSERT INTO `todo` VALUES (2659, 87, '2024-05-09 08:05:00', '2024-05-09 17:05:00', 2, 'học online hướng dẫn và đào tạo thế chấp', NULL);
INSERT INTO `todo` VALUES (2660, 91, '2024-05-09 17:30:00', '2024-05-09 19:00:00', 1, 'Họp kinh doanh phòng tháng 5', NULL);
INSERT INTO `todo` VALUES (2661, 87, '2024-05-09 17:30:00', '2024-05-09 19:00:00', 2, 'Họp Kinh doanh PVcombank Cờ Đỏ', NULL);
INSERT INTO `todo` VALUES (2662, 83, '2024-05-06 08:00:00', '2024-05-06 09:30:00', 2, 'Đi gặp vợ khách hàng Lê Viết Hoàng báo lãi đã quá hạn', NULL);
INSERT INTO `todo` VALUES (2663, 83, '2024-05-06 09:30:00', '2024-05-06 10:30:00', 2, 'Sao kê nợ quá hạn và nhắc nợ quá hạn', NULL);
INSERT INTO `todo` VALUES (2664, 83, '2024-05-06 10:30:00', '2024-05-06 12:00:00', 2, 'Nộp phí định giá và gửi yêu cầu định giá', NULL);
INSERT INTO `todo` VALUES (2665, 86, '2024-05-06 08:00:00', '2024-05-06 08:20:00', 2, 'Sao kê nợ quá hạn , và nhắc nợ khách hàng', NULL);
INSERT INTO `todo` VALUES (2666, 86, '2024-05-06 08:20:00', '2024-05-06 08:40:00', 2, 'Thu nợ khách hàng Nguyễn Tiến Bình', NULL);
INSERT INTO `todo` VALUES (2667, 83, '2024-05-06 13:00:00', '2024-05-06 15:00:00', 2, 'Kiểm tra sau vay định kỳ', NULL);
INSERT INTO `todo` VALUES (2668, 83, '2024-05-06 15:00:00', '2024-05-06 05:00:00', 1, 'Gặp khách hàng Nguyễn văn lợi Anh', NULL);
INSERT INTO `todo` VALUES (2671, 87, '2024-05-06 11:00:00', '2024-05-06 00:00:00', 2, 'soạn hồ sơ  giao Lê Thị Cẩm Tiên', NULL);
INSERT INTO `todo` VALUES (2673, 85, '2024-05-06 08:10:00', '2024-05-06 08:15:00', 2, 'In tài liệu lớp SXKD ngày 08/05/2024', NULL);
INSERT INTO `todo` VALUES (2674, 85, '2024-05-06 08:20:00', '2024-05-06 09:00:00', 2, ' Gọi KH có khoản vay đến hạn tháng 5', NULL);
INSERT INTO `todo` VALUES (2675, 85, '2024-05-06 09:00:00', '2024-05-06 00:00:00', 2, 'Soạn hồ sơ tín chấp KH Trần Văn Xoài', NULL);
INSERT INTO `todo` VALUES (2676, 85, '2024-05-06 13:10:00', '2024-05-06 14:30:00', 2, 'Sao kê gọi nhắc nợ KH quá hạn ', NULL);
INSERT INTO `todo` VALUES (2677, 85, '2024-05-06 14:35:00', '2024-05-06 17:00:00', 2, 'Lập báo cáo kế hoạch bán hàng tháng 5', NULL);
INSERT INTO `todo` VALUES (2678, 86, '1970-01-01 00:00:00', '1970-01-01 00:00:00', 1, 'Đi thẩm định làm hồ sơ tái cấp hạn mức cho khách hàng Nguyễn Văn Huệ tại xã Thạnh Phước Huyện Giồng Riềng', NULL);
INSERT INTO `todo` VALUES (2679, 86, '1970-01-01 00:00:00', '1970-01-01 00:00:00', 1, 'Thẩm định khách hàng Nguyễn Văn Huệ tái cấp hạn mức tại Xã Thạnh Phước Huyện Giồng Riềng', NULL);
INSERT INTO `todo` VALUES (2680, 86, '2024-05-07 09:00:00', '1970-01-01 00:00:00', 2, 'Thẩm định khách hàng Nguyễn Văn Huệ tái cấp hạn mức tín dụng tại Xã Thạnh Phước Huyện Giồng Riềng\r\n', NULL);
INSERT INTO `todo` VALUES (2681, 87, '2024-05-06 15:00:00', '2024-05-06 16:00:00', 2, 'thu lãi thấu chi KH Lê Hiền Đức', NULL);
INSERT INTO `todo` VALUES (2683, 86, '2024-05-07 10:00:00', '2024-05-07 11:30:00', 2, 'Thẩm định lại khách hàng vay hạn mức Trần Văn Luông Xã Đông Thuận Huyện Thới Lai', NULL);
INSERT INTO `todo` VALUES (2684, 91, '2024-05-07 08:00:00', '2024-05-07 09:30:00', 2, 'Phát thư ngõ cho vay tại UBND xã Đông Thuận và chợ Kinh Ngang ( Xã Đông Thuận)', NULL);
INSERT INTO `todo` VALUES (2685, 91, '2024-05-07 10:30:00', '2024-05-07 11:00:00', 2, 'Giao thẻ KH Nguyễn Thanh Cường và hướng dẫn KH sử dụng lấy doanh số giao dịch thẻ', NULL);
INSERT INTO `todo` VALUES (2686, 91, '2024-05-07 10:30:00', '2024-05-07 11:00:00', 1, 'Giao thẻ KH Trần Thị Kim Đồng và hướng dẫn KH sử dụng thẻ để kích hoạt thẻ và lấy doanh số giao dịch', NULL);
INSERT INTO `todo` VALUES (2687, 91, '2024-05-07 13:00:00', '2024-05-07 13:30:00', 2, 'Bàn giao hồ sơ TTD KH Lê Minh Nhựt cho Quản lý tín dụng', NULL);
INSERT INTO `todo` VALUES (2688, 91, '2024-05-07 14:00:00', '2024-05-07 17:00:00', 2, 'Gọi điện liên hệ tư vấn Khách hàng trong danh sách do Trạm Khuyến nông huyện cung cấp ', NULL);
INSERT INTO `todo` VALUES (2689, 91, '2024-05-08 09:00:00', '2024-05-08 11:00:00', 2, 'Cập nhật báo cáo phễu tín dụng, danh sách hồ sơ pending đến ngày 8/5/2024', NULL);
INSERT INTO `todo` VALUES (2690, 91, '2024-05-07 09:30:00', '2024-05-07 11:00:00', 2, 'Thẩm định Đơn vị chấp nhận thẻ mở máy pos Vạn Sanh Phát', NULL);
INSERT INTO `todo` VALUES (2691, 83, '2024-05-07 08:00:00', '2024-05-07 10:00:00', 1, 'Lập kế hoạch bán hàng tháng 5', NULL);
INSERT INTO `todo` VALUES (2692, 83, '2024-05-07 10:00:00', '2024-05-07 00:00:00', 1, 'Sao kê nợ và nhắc nợ khách hàng, lam thông báo nợ', NULL);
INSERT INTO `todo` VALUES (2693, 83, '2024-05-08 01:00:00', '2024-05-07 03:00:00', 1, 'Xuống nhà khách hàng Trần Ngọc hân', NULL);
INSERT INTO `todo` VALUES (2694, 83, '2024-05-07 15:00:00', '2024-05-07 17:00:00', 1, 'Xuống nhà khách hàng Nguyễn thị mảnh làm việc, khách hàng hứa trả nhưng chưa trả nợ.', NULL);
INSERT INTO `todo` VALUES (2695, 85, '2024-05-07 08:06:00', '2024-05-07 10:00:00', 2, 'Sao kê gọi nhắc nợ khách hàng và làm báo cáo nợ', NULL);
INSERT INTO `todo` VALUES (2696, 85, '2024-05-07 10:35:00', '2024-05-07 00:00:00', 2, 'Gọi điện thoại cho KH theo danh sách data bán thẻ tín dụng', NULL);
INSERT INTO `todo` VALUES (2697, 85, '2024-05-07 13:10:00', '2024-05-07 14:30:00', 2, 'Rà soát thông tin báo cáo kế hoạch làm việc tháng 5', NULL);
INSERT INTO `todo` VALUES (2698, 86, '2024-05-07 08:05:00', '2024-05-07 08:25:00', 2, 'sao kê nợ quá hạn , và gọi điện thoại đôn đốc khách hàng thanh toán', NULL);
INSERT INTO `todo` VALUES (2699, 87, '2024-05-07 08:00:00', '2024-05-07 10:00:00', 2, 'đi thu thập hồ sơ máy Pos KH Tuấn Nguyên', NULL);
INSERT INTO `todo` VALUES (2700, 87, '2024-05-07 10:00:00', '2024-05-07 00:00:00', 2, 'đi bàn giao thẻ TD cho KH Nguyễn Thanh Điền và hướng dẫn kích hoạt sử dụng', NULL);
INSERT INTO `todo` VALUES (2701, 87, '2024-05-07 13:00:00', '2024-05-07 14:00:00', 2, 'liên hệ KH Nguyễn Hoàng Nghĩa ký tên đóng thẻ TD ', NULL);
INSERT INTO `todo` VALUES (2702, 85, '2024-05-07 11:11:00', '2024-05-07 11:15:00', 2, 'Gửi yêu cầu thu nợ KH Bùi Văn Dân và KH Lê Thị Ngọc Trinh', NULL);
INSERT INTO `todo` VALUES (2703, 85, '2024-05-07 15:30:00', '2024-05-07 17:00:00', 2, 'Họp nợ quá hạn phòng KHCN', NULL);
INSERT INTO `todo` VALUES (2704, 91, '2024-05-07 13:00:00', '2024-05-07 14:00:00', 1, 'Giao thẻ cho KH Nguyễn Đỗ Vân Phương, hướng dẫn KH kích hoạt và sử dụng thẻ tại Trung Hưng - Cờ Đỏ', NULL);
INSERT INTO `todo` VALUES (2705, 85, '2024-05-08 08:00:00', '2024-05-08 13:00:00', 2, 'Học nâng cao hiểu quả cho vay SXKD ', NULL);
INSERT INTO `todo` VALUES (2706, 86, '2024-05-08 08:00:00', '2024-05-08 00:00:00', 2, 'Đi học lớp nâng cao hiệu quả khai thác phân khúc khách hàng hộ kinh doanh và doanh nghiệp siêu nhỏ', NULL);
INSERT INTO `todo` VALUES (2707, 87, '2024-05-10 09:30:00', '2024-05-10 10:30:00', 2, 'thi test online CTDT Nâng cao hiệu quả phát triển phân khúc HKD - DNSN', NULL);
INSERT INTO `todo` VALUES (2708, 86, '2024-05-09 08:10:00', '2024-05-09 08:20:00', 2, 'Sao kê nhắc nợ quá hạn và điện thoại đôn đốc', NULL);
INSERT INTO `todo` VALUES (2709, 86, '2024-05-09 08:20:00', '2024-05-09 17:00:00', 2, 'Học online đào tạo trình hồ sơ thế chấp ', NULL);
INSERT INTO `todo` VALUES (2710, 86, '2024-05-09 09:00:00', '2024-05-09 00:00:00', 2, 'Đi xử lý nợ cùng bộ phận xử lý nợ của vùng', NULL);
INSERT INTO `todo` VALUES (2711, 87, '2024-05-09 08:00:00', '2024-05-09 00:00:00', 2, 'làm hồ sơ máy Pos của hàng điện thoại Tuấn Nguyên', NULL);
INSERT INTO `todo` VALUES (2712, 85, '2024-05-09 08:30:00', '2024-05-09 00:00:00', 2, 'Học online hướng dẫn trình hồ sơ qua trung tâm phê duyệt', NULL);
INSERT INTO `todo` VALUES (2713, 85, '2024-05-01 13:30:00', '2024-05-09 17:00:00', 1, 'Đào tạo sản phẩm thế chấp và định hướng tín dụng', NULL);
INSERT INTO `todo` VALUES (2714, 85, '2024-05-09 13:30:00', '2024-05-09 17:00:00', 2, 'Đào tạo sản phẩm thế chấp và định hướng tín dụng', NULL);
INSERT INTO `todo` VALUES (2715, 91, '2024-05-10 08:00:00', '2024-05-10 11:00:00', 2, 'Thi online DNSN và HKD', NULL);
INSERT INTO `todo` VALUES (2716, 91, '2024-05-15 08:00:00', '2024-05-10 12:00:00', 2, 'Học bảo hiểm phi nhân thọ', NULL);
INSERT INTO `todo` VALUES (2719, 87, '2024-05-09 15:00:00', '2024-05-09 16:00:00', 2, 'đóng TTD Lê Thị Phương Thảo', NULL);
INSERT INTO `todo` VALUES (2720, 86, '2024-05-09 15:30:00', '2024-05-09 17:00:00', 2, 'Giải ngân hồ sơ khách hàng trần văn luông', NULL);
INSERT INTO `todo` VALUES (2721, 83, '2024-05-10 08:00:00', '2024-05-10 10:00:00', 1, 'Hợp đầu ngày', NULL);
INSERT INTO `todo` VALUES (2722, 83, '2024-05-10 10:00:00', '2024-05-10 11:00:00', 1, 'Thẩm định lại cơ sơ khinh doanh khách hàng Huỳnh Thị Huỳnh Như', NULL);
INSERT INTO `todo` VALUES (2723, 83, '2024-05-10 11:00:00', '2024-05-10 00:00:00', 1, 'Sao kê nợ quá và nhắc nợ khách hàng', NULL);
INSERT INTO `todo` VALUES (2724, 83, '2024-05-10 13:00:00', '2024-05-10 15:00:00', 1, 'Chuẩn bị hồ sơ giải ngân khách hàng Huỳnh Thị Huỳnh Như', NULL);
INSERT INTO `todo` VALUES (2725, 83, '2024-05-10 15:00:00', '2024-05-10 17:00:00', 1, 'Chuẩn bị hồ sơ giải ngân lại khách hàng Nguyễn văn lợi anh Anh', NULL);
INSERT INTO `todo` VALUES (2726, 91, '2024-05-10 08:00:00', '2024-05-10 09:00:00', 2, 'Họp huddle', NULL);
INSERT INTO `todo` VALUES (2727, 91, '2024-05-13 10:00:00', '2024-05-14 11:00:00', 2, 'Gặp KH Nguyễn Thanh Cường để hướng dẫn khách sử dụng lại máy pos tăng doanh số máy pos', NULL);
INSERT INTO `todo` VALUES (2728, 92, '2024-05-10 10:30:00', '2024-05-10 17:00:00', 1, 'Đi công tác thốt nốt cho khách hàng Huỳnh Thanh Phong ký hồ sơ công chứng ( Phòng Thới Lai)', 'accepted');
INSERT INTO `todo` VALUES (2729, 87, '2024-05-10 08:00:00', '2024-05-10 09:30:00', 2, 'họp hudel đầu ngày tại quán CF cá koi', NULL);
INSERT INTO `todo` VALUES (2730, 86, '2024-05-10 09:30:00', '2024-05-10 10:00:00', 2, 'Điện thoại đôn đốc các khách hàng quá hạn', NULL);
INSERT INTO `todo` VALUES (2731, 86, '2024-05-10 10:00:00', '2024-05-10 11:00:00', 2, 'Làm kiểm tra sau vay khách hàng Trần Văn Luông', NULL);
INSERT INTO `todo` VALUES (2732, 87, '2024-05-10 10:30:00', '2024-05-10 00:00:00', 2, 'đi gặp KH ký hồ sơ và trình máy pos cho KH cửa hàng điện thoại Tuấn Nguyên', NULL);
INSERT INTO `todo` VALUES (2733, 87, '2024-05-10 13:00:00', '2024-05-10 15:00:00', 2, 'đi thu thập thẩm định hồ sơ KH Thu Cúc trong kênh 4 nông trường cờ đỏ', NULL);
INSERT INTO `todo` VALUES (2735, 85, '2024-05-10 08:00:00', '2024-05-10 09:00:00', 2, 'Họp đầu ngày', NULL);
INSERT INTO `todo` VALUES (2736, 85, '2024-05-10 09:20:00', '2024-05-10 09:30:00', 2, 'Thanh lý HMTC KH Dương Thị Bích Nga', NULL);
INSERT INTO `todo` VALUES (2737, 85, '2024-05-10 09:35:00', '2024-05-10 09:45:00', 2, 'Thi test nân cao hiệu quả phát triển phân khúc bán hàng', NULL);
INSERT INTO `todo` VALUES (2738, 85, '2024-05-10 09:20:00', '2024-05-10 10:00:00', 2, 'Mua bảo hiểm Bảo Việt KH Võ DIệp Thúy', NULL);
INSERT INTO `todo` VALUES (2739, 85, '2024-05-10 11:55:00', '2024-05-10 11:15:00', 2, 'Gửi yêu cầu GN KH Võ Diệp Thúy', NULL);
INSERT INTO `todo` VALUES (2740, 85, '2024-05-10 11:23:00', '2024-05-10 14:00:00', 1, 'Soạn hồ sơ giải ngân KH Bùi Văn Dân', NULL);
INSERT INTO `todo` VALUES (2741, 85, '2024-05-10 14:30:00', '2024-05-10 03:30:00', 1, 'Sao kê và nhắc nợ các KH quá hạn đến ngày 10/05/2024', NULL);
INSERT INTO `todo` VALUES (2742, 86, '2024-05-10 13:30:00', '2024-05-10 15:30:00', 2, 'Xuống địa bàn ấp thới xuyên xã thới đông gặp trưởng ấp trao đổi các sản phẩm vay ', NULL);
INSERT INTO `todo` VALUES (2743, 87, '2024-05-10 15:00:00', '2024-05-10 16:00:00', 2, 'thu thập hồ sơ TTD Trần Nam Hà', NULL);
INSERT INTO `todo` VALUES (2744, 85, '2024-05-10 15:00:00', '2024-05-10 15:40:00', 1, 'Gặp KH Phan Thị Cẩm Thu', NULL);
INSERT INTO `todo` VALUES (2745, 87, '2024-05-10 16:00:00', '2024-05-10 17:00:00', 2, 'đi thẩm định KH vay Nguyễn Hậu tại cờ đỏ', NULL);
INSERT INTO `todo` VALUES (2746, 92, '2024-05-13 08:00:00', '2024-05-13 11:00:00', 1, 'Đi công tác thốt nốt lấy kết quả đăng ký thế chấp cho kh Huỳnh Thanh Phong theo giấy hẹn ( phòng Thới Lai)', 'accepted');
INSERT INTO `todo` VALUES (2747, 91, '2024-05-13 08:30:00', '2024-05-13 09:30:00', 2, 'Mở tài khoản số đẹp Kh Phan Ngọc Trâm mà nhờ Khách gửi casa', NULL);
INSERT INTO `todo` VALUES (2748, 91, '2024-05-13 13:00:00', '2024-05-13 15:00:00', 2, 'Mở tài khoản bên VNpost', NULL);
INSERT INTO `todo` VALUES (2749, 91, '2024-05-13 09:00:00', '2024-05-13 10:00:00', 2, 'Đánh giá và thẩm định gặp lại Kh Huỳnh Thị Tư mở máy pos', NULL);
INSERT INTO `todo` VALUES (2750, 86, '2024-05-13 08:10:00', '2024-05-13 08:20:00', 2, 'Sao kê nợ quá hạn , gọi điện các khách hàng quá hạn', NULL);
INSERT INTO `todo` VALUES (2751, 86, '2024-05-13 08:30:00', '2024-05-13 10:00:00', 2, 'Làm hồ sơ thẻ tín dụng khách hàng lựa chọn trước', NULL);
INSERT INTO `todo` VALUES (2752, 86, '2024-05-13 13:00:00', '2024-05-13 15:00:00', 2, 'Đi mở tài khoản An sinh xã hội', NULL);
INSERT INTO `todo` VALUES (2753, 86, '2024-05-14 11:50:00', '2024-05-14 13:00:00', 2, 'Đi thẩm định khách hàng giải ngân lại Huỳnh Văn Lý tại xã trường xuân B', NULL);
INSERT INTO `todo` VALUES (2754, 83, '2024-05-13 08:00:00', '2024-05-13 12:00:00', 2, 'Giải ngân hồ sơ kh Huỳnh thị Huỳnh như, sao kê nhức nợ khách hàng quá hạn.', NULL);
INSERT INTO `todo` VALUES (2755, 83, '2024-05-13 13:00:00', '2024-05-13 15:00:00', 2, 'Gửi thông báo nợ quá hạn ', NULL);
INSERT INTO `todo` VALUES (2756, 83, '2024-05-13 15:00:00', '2024-05-13 17:00:00', 2, 'Xuống nhà khác hàng Phùng thị tuyết Anh', NULL);
INSERT INTO `todo` VALUES (2757, 85, '2024-05-13 08:10:00', '2024-05-13 11:00:00', 2, 'Giải ngân hồ sơ KH Bùi Văn Dân', NULL);
INSERT INTO `todo` VALUES (2758, 87, '2024-05-13 13:00:00', '2024-05-13 15:00:00', 2, 'mở Tài khoản An sinh xã hội ', NULL);
INSERT INTO `todo` VALUES (2759, 85, '2024-05-13 11:00:00', '2024-05-13 00:00:00', 2, 'Kiểm tra mục đích sử dụng vốn KH Võ Diệp Thúy', NULL);
INSERT INTO `todo` VALUES (2760, 85, '2024-05-13 13:00:00', '2024-05-13 15:00:00', 2, 'Mở tài khoản An Sinh Xã Hội Ấp Thới Hòa A', NULL);
INSERT INTO `todo` VALUES (2761, 85, '2024-05-13 15:30:00', '2024-05-13 04:10:00', 2, 'Bàn giao hồ sơ KH Võ Diệp Thúy', NULL);
INSERT INTO `todo` VALUES (2762, 85, '2024-05-13 16:15:00', '2024-05-13 17:00:00', 2, 'Sao kê và nhắc nợ KH quá hạn', NULL);
INSERT INTO `todo` VALUES (2763, 87, '2024-05-13 08:00:00', '2024-05-13 21:00:00', 2, 'thu thập hồ sơ thẻ tín dụng võ văn Đức', NULL);
INSERT INTO `todo` VALUES (2764, 87, '2024-05-13 10:00:00', '2024-05-13 00:00:00', 2, 'làm hồ sơ TTD cho KH Võ Văn Đức và Trần Nam Hà', NULL);
INSERT INTO `todo` VALUES (2765, 87, '2024-05-13 15:00:00', '2024-05-13 17:00:00', 2, 'đi thẩm định KH Nguyễn thu cúc tại kênh 4 nông trường ', NULL);
INSERT INTO `todo` VALUES (2766, 91, '2024-05-13 15:32:00', '2024-05-13 16:00:00', 2, 'Mở taài khoản số đẹp tại quán ViVy tea ngay vòng xoay ', NULL);
INSERT INTO `todo` VALUES (2767, 83, '2024-05-14 08:00:00', '2024-06-03 10:00:00', 2, 'Xuống nhà khách hàng Nguyễn văn Ớt ', NULL);
INSERT INTO `todo` VALUES (2768, 83, '2024-05-14 10:00:00', '2024-05-14 11:00:00', 2, 'Sao kê nợ gọi nhắc nợ', NULL);
INSERT INTO `todo` VALUES (2769, 83, '2024-05-14 13:00:00', '2024-05-14 15:00:00', 2, 'Đi mở tài khoản khách hàng an sinh xã hội', NULL);
INSERT INTO `todo` VALUES (2770, 87, '2024-05-14 08:06:00', '2024-05-14 09:06:00', 2, 'úp hồ sơ TTD Nguyễn Âu Trí Minh', NULL);
INSERT INTO `todo` VALUES (2771, 87, '2024-05-14 20:07:00', '2024-05-14 15:07:00', 2, 'tạo tài khoản an sinh xã hội', NULL);
INSERT INTO `todo` VALUES (2772, 86, '2024-05-14 08:15:00', '2024-05-14 08:40:00', 2, 'Thu nợ giải chấp khách hàng vay Ngô Thái Trung', NULL);
INSERT INTO `todo` VALUES (2773, 86, '2024-05-14 09:00:00', '2024-05-14 09:15:00', 2, 'Đóng thẻ tín dụng khách hàng Nguyễn Văn Huệ', NULL);
INSERT INTO `todo` VALUES (2774, 86, '2024-05-14 13:00:00', '2024-05-14 15:00:00', 2, 'Đi mở tài khoản An sinh xã hội', NULL);
INSERT INTO `todo` VALUES (2775, 86, '2024-05-14 09:30:00', '2024-05-14 10:10:00', 2, 'Soạn hồ sơ giải ngân khách hàng vay Huỳnh Văn Lý', NULL);
INSERT INTO `todo` VALUES (2776, 85, '2024-05-14 08:10:00', '2024-05-14 11:30:00', 2, 'Soạn tờ trình và check list hồ sơ HMCT Trần Văn Xoài', NULL);
INSERT INTO `todo` VALUES (2777, 85, '2024-05-14 11:30:00', '2024-05-14 00:00:00', 2, 'Kiểm tra MĐSDV KH Bùi Văn Dân', NULL);
INSERT INTO `todo` VALUES (2778, 85, '2024-05-14 13:00:00', '2024-05-14 15:30:00', 2, 'Mở TK an sinh xã hội', NULL);
INSERT INTO `todo` VALUES (2779, 85, '2024-05-14 15:40:00', '2024-05-14 04:20:00', 2, 'Gọi điện thoại nhắc nợ KH quá hạn ngày 13/05/2024', NULL);
INSERT INTO `todo` VALUES (2780, 85, '2024-05-14 16:25:00', '2024-05-14 17:00:00', 2, 'Bàn giao hồ sơ Bùi Văn Dân', NULL);
INSERT INTO `todo` VALUES (2781, 91, '2024-05-14 13:00:00', '2024-05-14 15:30:00', 2, 'Mở tài khoản vnpost', NULL);
INSERT INTO `todo` VALUES (2782, 87, '2024-05-14 10:00:00', '2024-05-14 11:00:00', 2, 'gửi định giá cho KH Trần Thị Thu Cúc', NULL);
INSERT INTO `todo` VALUES (2783, 91, '2024-05-14 09:00:00', '2024-05-14 09:30:00', 2, 'Gặp Khách hàng Nguyễn Thành Điền dự định vay 200tr để hboor sung vốn mua xe ', NULL);
INSERT INTO `todo` VALUES (2784, 91, '2024-05-14 10:30:00', '2024-05-14 11:45:00', 2, 'Mở tài khoản tại ấp Thới Hoà A của VNPost còn xót lại hôm qua', NULL);
INSERT INTO `todo` VALUES (2785, 87, '2024-05-14 23:00:00', '2024-05-14 00:00:00', 2, 'làm hồ sơ TTD KH lê Thị Phương Thảo', NULL);
INSERT INTO `todo` VALUES (2786, 91, '2024-05-15 08:30:00', '2024-05-15 10:30:00', 2, 'Báo cáo phễu tín dụng ngày 15.05.2024 gửi chị Bình. ( Sáng thứ 5 từ 8:30 am -9:30 am gửi lại chị) ', NULL);
INSERT INTO `todo` VALUES (2787, 92, '2024-05-15 08:00:00', '2024-05-15 17:00:00', 1, 'Đi công tác ngoại tỉnh tại Vĩnh Long nguyên ngày cho kh Phạm Thị Mỹ Trinh ký công chứng ( phòng Thới Lai)', 'accepted');
INSERT INTO `todo` VALUES (2788, 83, '2024-05-15 08:00:00', '2024-05-15 10:00:00', 1, 'Sao kê nợ và nhắc nợ, gặp khách hàng Nguyễn văn lợi anh ', NULL);
INSERT INTO `todo` VALUES (2789, 83, '2024-05-15 10:00:00', '2024-05-15 00:00:00', 1, 'Đi gặp khách hàng Nguyễn Phước Hậu', NULL);
INSERT INTO `todo` VALUES (2790, 83, '2024-05-15 13:00:00', '2024-05-15 16:00:00', 1, 'Mở tài khoản an sinh xã hội', NULL);
INSERT INTO `todo` VALUES (2791, 83, '2024-05-15 16:00:00', '2024-05-15 17:00:00', 1, ' Xuống nhà mẹ khách hàng Trần Ngọc Hân', NULL);
INSERT INTO `todo` VALUES (2792, 86, '2024-05-15 08:10:00', '2024-05-15 20:20:00', 2, 'Sao kê khách hàng quá hạn và gọi điện đôn đốc khách hàng ', NULL);
INSERT INTO `todo` VALUES (2793, 86, '2024-05-15 08:25:00', '2024-05-15 11:00:00', 2, 'Học bảo hiểm phi nhân thọ', NULL);
INSERT INTO `todo` VALUES (2794, 87, '2024-05-15 08:34:00', '2024-05-15 11:00:00', 2, 'học online phi bảo hiểm An Gia', NULL);
INSERT INTO `todo` VALUES (2795, 85, '2024-05-15 08:30:00', '2024-05-15 10:30:00', 2, 'Học bảo hiểm Bảo Việt An Gia', NULL);
INSERT INTO `todo` VALUES (2796, 85, '2024-05-15 12:00:00', '2024-05-15 05:00:00', 2, 'Họp kinh doanh với giám đốc vùng ', NULL);
INSERT INTO `todo` VALUES (2797, 87, '2024-05-15 13:00:00', '2024-05-15 16:00:00', 2, 'đi họp vùng 6 tại cần thơ', NULL);
INSERT INTO `todo` VALUES (2798, 85, '2024-05-15 10:30:00', '2024-05-15 11:20:00', 2, 'Gửi yêu cầu kiểm tra dụng vốn', NULL);
INSERT INTO `todo` VALUES (2799, 85, '2024-05-15 08:00:00', '2024-05-15 08:30:00', 2, 'Gọi nhắc nợ KH quá hạn', NULL);
INSERT INTO `todo` VALUES (2800, 91, '2024-05-15 13:00:00', '2024-05-15 16:00:00', 2, 'Mở tài khoản ấp Thạnh Hoà', NULL);
INSERT INTO `todo` VALUES (2801, 91, '2024-05-16 09:00:00', '2024-05-16 11:00:00', 2, 'Mở lại các tài khoản chưa mở của Ấp Thạnh Hoà', NULL);
INSERT INTO `todo` VALUES (2802, 91, '2024-05-16 13:00:00', '2024-05-16 16:00:00', 2, 'Mở tài khoản ấp Thới Hiệp', NULL);
INSERT INTO `todo` VALUES (2803, 86, '2024-05-16 08:00:00', '2024-05-16 08:10:00', 2, 'Sao kê nợ quá hạn , và gọi điện nhắc nợ khách hàng', NULL);
INSERT INTO `todo` VALUES (2804, 86, '2024-05-16 08:10:00', '2024-05-16 09:30:00', 2, 'Hợp đầu ngày ', NULL);
INSERT INTO `todo` VALUES (2805, 86, '2024-05-16 10:00:00', '2024-05-16 10:30:00', 2, 'Thu nợ giải chấp tài sản khách hàng Nguyễn Văn Huệ', NULL);
INSERT INTO `todo` VALUES (2806, 87, '2024-05-16 08:00:00', '2024-05-16 17:00:00', 2, 'xin nghỉ phép đột xuất chở con khám bệnh', NULL);
INSERT INTO `todo` VALUES (2807, 85, '2024-05-16 08:00:00', '2024-05-16 09:45:00', 2, 'Họp đầu ngày', NULL);
INSERT INTO `todo` VALUES (2808, 85, '2024-05-16 09:50:00', '2024-05-16 10:10:00', 2, 'Bổ sung hồ sơ', NULL);
INSERT INTO `todo` VALUES (2809, 86, '2024-05-16 10:50:00', '2024-05-16 11:30:00', 2, 'Tham khảo hồ sơ trình máy pos', NULL);
INSERT INTO `todo` VALUES (2810, 85, '2024-05-16 11:00:00', '2024-05-16 00:00:00', 2, 'Đề nghị giải chấp TSĐB', NULL);
INSERT INTO `todo` VALUES (2811, 85, '2024-05-16 11:43:00', '2024-05-16 16:00:00', 2, 'Mở TK TK An Sinh Xã Hội', NULL);
INSERT INTO `todo` VALUES (2812, 85, '2024-05-16 16:00:00', '2024-05-16 17:30:00', 2, 'Gọi điện thoại Nhắc nợ KH quá hạn', NULL);
INSERT INTO `todo` VALUES (2813, 86, '2024-05-16 13:00:00', '2024-05-16 16:30:00', 2, 'Mở tài khoản an sinh xã hội', NULL);
INSERT INTO `todo` VALUES (2814, 91, '2024-05-17 08:00:00', '2024-05-17 10:00:00', 1, 'Đi mở tài khoản các hộ còn sót lại của Ấp Thới Hiệp', NULL);
INSERT INTO `todo` VALUES (2816, 87, '2024-05-17 10:00:00', '2024-05-17 00:00:00', 2, 'làm 2 hồ sơ TTD KH lê Thị Phương Thảo và Võ Văn Đức', NULL);
INSERT INTO `todo` VALUES (2817, 87, '2024-05-17 13:00:00', '2024-05-17 16:00:00', 2, 'đi mở TK An Sinh Xã Hội ở Thới Hòa B', NULL);
INSERT INTO `todo` VALUES (2818, 86, '2024-05-17 08:10:00', '2024-05-17 10:00:00', 2, 'Sao kê nợ quá hạn  , xuống làm biên bản làm việc với khách hàng quá hạn Nguyễn Chí Tâm tại xã trường xuân B', NULL);
INSERT INTO `todo` VALUES (2819, 86, '2024-05-17 10:30:00', '2024-05-17 00:00:00', 2, 'Làm hồ sơ máy pos khách hàng lâm đắc trí', NULL);
INSERT INTO `todo` VALUES (2820, 91, '2024-05-17 09:20:00', '2024-05-17 10:30:00', 1, 'Gắn mã QR cho quán Vivy Tea', NULL);
INSERT INTO `todo` VALUES (2821, 85, '2024-05-17 08:01:00', '2024-05-30 10:45:00', 2, 'Bổ sung hồ sơ KH Trần Văn Xoài', NULL);
INSERT INTO `todo` VALUES (2822, 85, '2024-05-17 10:50:00', '2024-05-17 11:30:00', 2, 'Gọi nhăc nợ các Kh quá hạn ngày 17.05.2024', NULL);
INSERT INTO `todo` VALUES (2823, 85, '2024-05-17 10:15:00', '2024-05-17 10:30:00', 2, 'Thực hiện yêu cầu đóng thẻ TD KH Huỳnh Thị Hồng Dung', NULL);
INSERT INTO `todo` VALUES (2824, 85, '2024-05-17 13:00:00', '2024-05-17 16:00:00', 2, 'Mở tk an sinh xã hội ấp Thới Hòa B', NULL);
INSERT INTO `todo` VALUES (2825, 85, '2024-05-17 16:05:00', '2024-05-17 17:00:00', 2, 'Soạn hồ sơ thẻ TD', NULL);
INSERT INTO `todo` VALUES (2826, 83, '2024-05-20 08:00:00', '2024-05-20 09:00:00', 1, 'Sao kê nợ quá hạn và nhắc nợ khách hàng ', NULL);
INSERT INTO `todo` VALUES (2827, 83, '2024-05-20 09:00:00', '2024-05-20 11:00:00', 1, 'Đóng thẻ tín dụng và thu nợ khách hàng Nguyễn thị kim Tuyến', NULL);
INSERT INTO `todo` VALUES (2828, 83, '2024-05-20 10:00:00', '2024-05-20 12:00:00', 1, 'Xuống nhà khách hàng Phùng thị tuyết Anh', NULL);
INSERT INTO `todo` VALUES (2829, 83, '2024-05-20 13:00:00', '2024-05-20 15:00:00', 1, 'Xuống nhà khách hàng Nguyễn văn lợi anh ', NULL);
INSERT INTO `todo` VALUES (2830, 83, '2024-05-20 15:00:00', '2024-05-20 17:00:00', 1, 'Xuống nhà khách hàng Trần Ngọc Hân', NULL);
INSERT INTO `todo` VALUES (2831, 91, '2024-05-20 08:45:00', '2024-05-20 09:30:00', 1, 'Chở KH Thạch Thị Hui qua quầy mở tài khoản ASXH', NULL);
INSERT INTO `todo` VALUES (2832, 85, '2024-05-20 08:00:00', '2024-05-20 08:30:00', 1, 'Gửi mail giải trình chấm công tháng 4', NULL);
INSERT INTO `todo` VALUES (2833, 91, '2024-05-20 13:00:00', '2024-05-20 16:00:00', 1, 'Mở tài khoản ấp Thới Trung', NULL);
INSERT INTO `todo` VALUES (2834, 91, '2024-05-20 08:00:00', '2024-05-20 08:30:00', 1, 'Tổng hợp tài khoản tuần rồi', NULL);
INSERT INTO `todo` VALUES (2835, 85, '2024-05-20 08:30:00', '2024-05-20 09:00:00', 1, 'Kiểm tra mục đích sử dụng vốn KH Bùi Văn Dân', NULL);
INSERT INTO `todo` VALUES (2836, 87, '2024-05-20 08:14:00', '2024-05-20 09:00:00', 1, 'đi thu thập hồ sơ TTD KH Võ Thị Lan Anh và Cao Tấn Phát', NULL);
INSERT INTO `todo` VALUES (2837, 85, '2024-05-20 09:05:00', '2024-05-20 10:00:00', 1, 'Sao kê và gọi nhắc nợ khách hàng quá hạn', NULL);
INSERT INTO `todo` VALUES (2838, 86, '2024-05-20 08:10:00', '2024-05-20 08:40:00', 1, 'Gặp khách hàng mới Lý Khánh Linh có nhu cầu vay thế chấp', NULL);
INSERT INTO `todo` VALUES (2839, 87, '2024-05-20 09:00:00', '2024-05-20 11:00:00', 1, 'Trình Úp Hồ sơ TTD KH Nguyễn Nam Hà và Võ Văn Đức', NULL);
INSERT INTO `todo` VALUES (2840, 85, '2024-05-20 10:05:00', '2024-05-20 00:00:00', 1, 'Soạn hồ sơ phát hành thẻ TD KH Lý Nhã Trúc', NULL);
INSERT INTO `todo` VALUES (2841, 87, '2024-05-20 11:00:00', '2024-05-20 00:00:00', 1, 'Liên hệ KH Nguyễn Thị Cẩm Tú Ký đóng hạn mức thấu chi', NULL);
INSERT INTO `todo` VALUES (2842, 87, '2024-05-20 13:00:00', '2024-05-20 16:00:00', 1, 'đi mở tài khoản ASXH ', NULL);
INSERT INTO `todo` VALUES (2843, 85, '2024-05-20 13:00:00', '2024-05-20 15:30:00', 1, 'Mở tài khoản An sinh xã hội ấp Thới Trung', NULL);
INSERT INTO `todo` VALUES (2844, 91, '2024-05-20 08:15:00', '2024-05-20 08:20:00', 1, 'Hỗ trợ kiểm tài khoản tiền KH từ Agri qua Pvcom để thu nợ đúng hạn', NULL);
INSERT INTO `todo` VALUES (2845, 86, '2024-05-20 08:50:00', '2024-05-20 09:20:00', 1, 'Sao kê gọi điện thoại nhắc nợ các khách hàng nợ quá hạn ', NULL);
INSERT INTO `todo` VALUES (2846, 87, '2024-05-22 08:30:00', '2024-05-20 00:00:00', 1, 'đi học lớp chia sẽ nâng cao hoàng thành KPI tại Cần Thơ ', NULL);
INSERT INTO `todo` VALUES (2849, 91, '2024-05-21 08:30:00', '2024-05-21 10:00:00', 1, 'Làm báo cáo phễu tín dụng ngày 22/05/2022 gửi Chi Bình', NULL);
INSERT INTO `todo` VALUES (2850, 86, '2024-05-20 09:20:00', '2024-05-20 11:30:00', 1, 'Làm hồ sơ máy pos lâm đắc trí ', NULL);

SET FOREIGN_KEY_CHECKS = 1;
