CREATE DATABASE db_QLBanSach;
USE db_QLBanSach;
CREATE TABLE IF NOT EXISTS Khach_hang(
	MaKH varchar(10),
    TaiKhoan varchar(50),
    MatKhau varchar(50),
    HoTen nvarchar(50),
    Email varchar(50),
    DiaChi nvarchar(255),
    DienThoai varchar(10),
    GioiTinh nvarchar(50),
    NgaySinh date    
);
CREATE TABLE IF NOT EXISTS Don_hang(
	MaDonHang varchar(10),
    DaThanhToan bit,
    TinhTrangGH nvarchar(255),
    NgayDat date,
    NgayGiao date    
);
CREATE TABLE IF NOT EXISTS Tac_gia(
	MaTacGia varchar(10),
    TenTacGia nvarchar(50),   
    DiaChi nvarchar(255),
    TieuSu nvarchar(255),
    DienThoai varchar(10)     
);
CREATE TABLE IF NOT EXISTS Chu_de(
	MaChuDe varchar(10),
    TenChuDe nvarchar(50)
);


CREATE TABLE IF NOT EXISTS Sach(
	MaSach varchar(10),
    TenSach nvarchar(50),
    GiaBan float,
    MoTa nvarchar(255),
    AnhBia varchar(255),
    NgayCapNhat date,
    SoLuongTon int
);

CREATE TABLE IF NOT EXISTS Nha_xuat_ban(
 MaNSX varchar(10),
 TenNSB nvarchar(50),
 DiaChi varchar(255),
 DienThoai varchar(10)
);
CREATE TABLE IF NOT EXISTS Chi_tiet_don_hang(
 MaChiTiet varchar(10),
 SoLuong int,
 DonGia float,
 MaDonHang varchar(10),
 MaSach varchar(10)
);
CREATE TABLE IF NOT EXISTS Chi_tiet_tac_gia(
 MaChiTiet varchar(10),
 VaiTro nvarchar(50),
 ViTri nvarchar(50),
 MaTacGia varchar(10),
 MaSach varchar(10)
);
ALTER TABLE `db_qlbansach`.`chi_tiet_don_hang` 
CHANGE COLUMN `MaChiTiet` `MaChiTiet` VARCHAR(10) NOT NULL ,
CHANGE COLUMN `SoLuong` `SoLuong` INT UNSIGNED NOT NULL ,
CHANGE COLUMN `DonGia` `DonGia` FLOAT UNSIGNED NOT NULL ,
CHANGE COLUMN `MaDonHang` `MaDonHang` VARCHAR(10) NOT NULL ,
CHANGE COLUMN `MaSach` `MaSach` VARCHAR(10) NOT NULL ,
ADD PRIMARY KEY (`MaChiTiet`);
;

ALTER TABLE `db_qlbansach`.`chi_tiet_tac_gia` 
CHANGE COLUMN `MaChiTiet` `MaChiTiet` VARCHAR(10) NOT NULL ,
CHANGE COLUMN `MaTacGia` `MaTacGia` VARCHAR(10) NOT NULL ,
CHANGE COLUMN `MaSach` `MaSach` VARCHAR(10) NOT NULL ,
ADD PRIMARY KEY (`MaChiTiet`);
;

ALTER TABLE `db_qlbansach`.`chu_de` 
CHANGE COLUMN `MaChuDe` `MaChuDe` VARCHAR(10) NOT NULL ,
ADD PRIMARY KEY (`MaChuDe`);
;

ALTER TABLE `db_qlbansach`.`don_hang` 
CHANGE COLUMN `MaDonHang` `MaDonHang` VARCHAR(10) NOT NULL ,
ADD PRIMARY KEY (`MaDonHang`);
;

ALTER TABLE `db_qlbansach`.`khach_hang` 
CHANGE COLUMN `MaKH` `MaKH` VARCHAR(10) NOT NULL ,
CHANGE COLUMN `TaiKhoan` `TaiKhoan` VARCHAR(50) NOT NULL ,
CHANGE COLUMN `MatKhau` `MatKhau` VARCHAR(50) NOT NULL ,
CHANGE COLUMN `Email` `Email` VARCHAR(50) NOT NULL ,
CHANGE COLUMN `DiaChi` `DiaChi` VARCHAR(255) CHARACTER SET 'utf8' NOT NULL ,
CHANGE COLUMN `DienThoai` `DienThoai` VARCHAR(10) NOT NULL ,
CHANGE COLUMN `GioiTinh` `GioiTinh` VARCHAR(50) CHARACTER SET 'utf8' NOT NULL ,
CHANGE COLUMN `NgaySinh` `NgaySinh` DATE NOT NULL ,
CHANGE COLUMN `HoTen` `HoTen` VARCHAR(50) CHARACTER SET 'utf8' NOT NULL ,
ADD PRIMARY KEY (`MaKH`);
;

ALTER TABLE `db_qlbansach`.`nha_xuat_ban` 
CHANGE COLUMN `MaNSX` `MaNSX` VARCHAR(10) NOT NULL ,
ADD PRIMARY KEY (`MaNSX`);
;

ALTER TABLE `db_qlbansach`.`sach` 
CHANGE COLUMN `MaSach` `MaSach` VARCHAR(10) NOT NULL ,
CHANGE COLUMN `GiaBan` `GiaBan` FLOAT UNSIGNED NULL DEFAULT NULL ,
CHANGE COLUMN `SoLuongTon` `SoLuongTon` INT UNSIGNED NULL DEFAULT NULL ,
ADD PRIMARY KEY (`MaSach`);
;

ALTER TABLE `db_qlbansach`.`tac_gia` 
CHANGE COLUMN `MaTacGia` `MaTacGia` VARCHAR(10) NOT NULL ,
ADD PRIMARY KEY (`MaTacGia`);
;

ALTER TABLE `db_qlbansach`.`don_hang` 
ADD COLUMN `MaKH` VARCHAR(10) NOT NULL AFTER `NgayGiao`;

ALTER TABLE `db_qlbansach`.`sach` 
ADD COLUMN `MaChuDe` VARCHAR(10) NOT NULL AFTER `SoLuongTon`,
ADD COLUMN `MaNSX` VARCHAR(10) NOT NULL AFTER `MaChuDe`;

ALTER TABLE Don_hang
ADD FOREIGN KEY (MaKH) 
REFERENCES Khach_hang(MaKH);

ALTER TABLE Sach
ADD FOREIGN KEY (MaChuDe) 
REFERENCES Chu_de(MaChuDe);

ALTER TABLE Sach
ADD FOREIGN KEY (MaNSX) 
REFERENCES Nha_xuat_ban(MaNSX);

ALTER TABLE Chi_tiet_don_hang
ADD FOREIGN KEY (MaDonHang) 
REFERENCES Don_hang(MaDonHang);
ALTER TABLE Chi_tiet_don_hang
ADD FOREIGN KEY (MaSach) 
REFERENCES Sach(MaSach);

ALTER TABLE Chi_tiet_tac_gia
ADD FOREIGN KEY (MaTacGia) 
REFERENCES Tac_gia(MaTacGia);
ALTER TABLE Chi_tiet_tac_gia
ADD FOREIGN KEY (MaSach) 
REFERENCES Sach(MaSach);


INSERT INTO khach_hang 
	values ('KH001','KH001','123456','KH001@gmail.com','23 Hai Ba Trung','0123456789','nam','2000-10-16','Long Vo' );
INSERT INTO khach_hang 
	values ('KH002','KH002','654321','KH001@gmail.com','26 Ly Thai To','9876543210','nữ','1997-01-13','Anno' ),
			('KH003','KH003','159874','KH001@gmail.com','188 Le Van Viet','0147852369','gay','1985-12-25','Koko' ),
            ('KH004','KH004','4563178','KH001@gmail.com','3 So Do','9632587410','les','2001-10-01','Itemyy' ),
            ('KH005','KH005','111111','KH001@gmail.com','147 Hang Dong','9512368740','nam','2002-09-16','Ugo' );
	
#select * from tac_gia;
INSERT INTO tac_gia 
	values ('TG001','Nguyen Nhat Anh','120 Lo Lu','Viet rat nhieu bai van hay','0123745698' ),
    ('TG002','Akira','111 Osaka Nihon','Viet manga hay','0321456987' ),
    ('TG003','An Si','111 Vo Van Ngan','Vua vao nghe','9856327410' );

#select * from chu_de;
INSERT INTO chu_de 
	values ('CD001','Truyen Tranh'),
    ('CD002','Truyen dai'),
    ('CD003','Truyen ngan'),
    ('CD004','SGK');
#select * from nha_xuat_ban;
INSERT INTO nha_xuat_ban 
	values ('NSX001','NXB GD','200 Dong Ho','0008889990'),
    ('NSX002','NXB Tre','123 Le Van Luong','8889990001'),
    ('NSX003','NXB Thanh Nien','478 So Cat','125866974');
    
##select * from don_hang;
    INSERT INTO don_hang 
	values ('MDH001',0,'Chua giao','2021-06-22','2021-06-26','KH001');
	INSERT INTO don_hang 
	values ('MDH002',1,'Chua giao','2021-06-21','2021-06-25','KH002');
  
##select * from sach;
INSERT INTO `db_qlbansach`.`sach` (`MaSach`, `TenSach`, `GiaBan`, `MoTa`, `AnhBia`, `NgayCapNhat`, `SoLuongTon`, `MaChuDe`, `MaNSX`) VALUES ('S001', 'Toi thay hoa vang tren co xanh', '12000', 'no rat hay', 'https://salt.tikicdn.com/cache/280x280/ts/product/2e/ae/d3/2e400bbfda127802bf5fd46f86ead538.jpg', '2000-02-25', '100', 'CD002', 'NSX003');
INSERT INTO `db_qlbansach`.`sach` (`MaSach`, `TenSach`, `GiaBan`, `MoTa`, `AnhBia`, `NgayCapNhat`, `SoLuongTon`, `MaChuDe`, `MaNSX`) VALUES ('S002', 'Mat Biec', '24000', 'no rat rat hay', 'https://cf.shopee.vn/file/67d0ef3d3fc8897213c9a1f84ee561e1', '2003-04-24', '20', 'CD002', 'NSX003');

##select * from chi_tiet_don_hang
INSERT INTO `db_qlbansach`.`chi_tiet_don_hang` (`MaChiTiet`, `SoLuong`, `DonGia`, `MaDonHang`, `MaSach`) VALUES ('CTDH001', '1', '24000', 'MDH001', 'S002');
INSERT INTO `db_qlbansach`.`chi_tiet_don_hang` (`MaChiTiet`, `SoLuong`, `DonGia`, `MaDonHang`, `MaSach`) VALUES ('CTDH002', '2', '24000', 'MDH002', 'S001');
# select * from chi_tiet_tac_gia
INSERT INTO `db_qlbansach`.`chi_tiet_tac_gia` (`MaChiTiet`, `VaiTro`, `ViTri`, `MaTacGia`, `MaSach`) VALUES ('CTTG001', 'Viet Van', 'Chu bien', 'TG001', 'S001');
INSERT INTO `db_qlbansach`.`chi_tiet_tac_gia` (`MaChiTiet`, `VaiTro`, `ViTri`, `MaTacGia`, `MaSach`) VALUES ('CTTG002', 'Viet Van', 'Chu Bien', 'TG001', 'S002');
