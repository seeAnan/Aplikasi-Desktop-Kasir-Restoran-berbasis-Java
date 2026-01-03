/*
 Navicat Premium Data Transfer

 Source Server         : dbase
 Source Server Type    : MySQL
 Source Server Version : 100432 (10.4.32-MariaDB)
 Source Host           : localhost:3306
 Source Schema         : db_restoran

 Target Server Type    : MySQL
 Target Server Version : 100432 (10.4.32-MariaDB)
 File Encoding         : 65001

 Date: 28/12/2025 12:59:21
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for menu
-- ----------------------------
DROP TABLE IF EXISTS `menu`;
CREATE TABLE `menu`  (
  `id_menu` int NOT NULL AUTO_INCREMENT,
  `nama_menu` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `harga` int NULL DEFAULT NULL,
  `status` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id_menu`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of menu
-- ----------------------------
INSERT INTO `menu` VALUES (1, 'Soto Betawi', 25000, 'AVAILABLE');
INSERT INTO `menu` VALUES (2, 'Soto Lamongan', 20000, 'AVAILABLE');
INSERT INTO `menu` VALUES (3, 'Soto Madura', 20000, 'AVAILABLE');
INSERT INTO `menu` VALUES (4, 'Soto Kuning Bogor', 25000, 'AVAILABLE');
INSERT INTO `menu` VALUES (5, 'Nasi', 5000, 'AVAILABLE');
INSERT INTO `menu` VALUES (6, 'Es Teh Manis', 5000, 'AVAILABLE');
INSERT INTO `menu` VALUES (7, 'Es Teh Tawar', 2000, 'AVAILABLE');
INSERT INTO `menu` VALUES (9, 'Air Mineral', 5000, 'AVAILABLE');

-- ----------------------------
-- Table structure for transaksi
-- ----------------------------
DROP TABLE IF EXISTS `transaksi`;
CREATE TABLE `transaksi`  (
  `id_transaksi` int NOT NULL AUTO_INCREMENT,
  `nama_pelanggan` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `id_menu` int NULL DEFAULT NULL,
  `tanggal` date NULL DEFAULT NULL,
  `nama_menu` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `harga` int NULL DEFAULT NULL,
  `jumlah_order` int NULL DEFAULT NULL,
  `total_bayar` int NULL DEFAULT NULL,
  PRIMARY KEY (`id_transaksi`) USING BTREE,
  INDEX `id_menu`(`id_menu` ASC) USING BTREE,
  CONSTRAINT `transaksi_ibfk_1` FOREIGN KEY (`id_menu`) REFERENCES `menu` (`id_menu`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of transaksi
-- ----------------------------
INSERT INTO `transaksi` VALUES (1, 'Anan Azzury', 1, '2025-12-28', 'Soto Betawi', 25000, 2, 50000);
INSERT INTO `transaksi` VALUES (4, 'Raharsyah', 2, '2025-12-27', 'Soto Lamongan', 20000, 2, 40000);
INSERT INTO `transaksi` VALUES (5, 'Gregorius Pendianus', 4, '2025-12-27', 'Soto Kuning Bogor', 25000, 1, 25000);
INSERT INTO `transaksi` VALUES (6, 'Pak Septa', 3, '2025-12-28', 'Soto Madura', 20000, 2, 40000);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id_user` int NOT NULL AUTO_INCREMENT,
  `username` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `password` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `nama_user` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `id_level` int NULL DEFAULT NULL,
  PRIMARY KEY (`id_user`) USING BTREE,
  UNIQUE INDEX `username`(`username` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 'admin', 'admin123', 'Administrator', 1);
INSERT INTO `user` VALUES (2, 'kasir', 'kasir123', 'kasir', 2);
INSERT INTO `user` VALUES (3, 'owner', 'owner123', 'owner', 3);
INSERT INTO `user` VALUES (5, 'pelanggan', 'pelanggan123', 'Oojang', 4);
INSERT INTO `user` VALUES (6, 'Anan', 'anan123', 'Anan Azzury', 1);
INSERT INTO `user` VALUES (7, 'Raharsyah', 'raharsyah123', 'Raharsyah', 2);
INSERT INTO `user` VALUES (8, 'Gregorius', 'gregorius123', 'Gregorius Pendianus', 3);

SET FOREIGN_KEY_CHECKS = 1;
