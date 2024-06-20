create database asm_1;
use asm_1; 
CREATE TABLE Loaihang (
  MaLoaiHang varchar (10),
  TenLoaiHang VARCHAR(255)
);

CREATE TABLE Mathang (
  MaMatHang varchar (10),
  TenMatHang VARCHAR(255),
  DonGia varchar (50),
  DonViTinh VARCHAR(50),
  MaLoaiHang varchar (10)
);

CREATE TABLE Cuahang (
  MaCuaHang varchar (10),
  TenCuaHang VARCHAR(255),
  DiaChi VARCHAR(255),
  SoDienThoai VARCHAR(20),
  Email VARCHAR(100),
  NguoiDaiDien VARCHAR(255)
);
CREATE TABLE Nguoilapphieu (
  MaNguoiLapPhieu varchar(10),
  TenNguoiLapPhieu VARCHAR(255)
);

CREATE TABLE Phieuxuat (
  MaPhieuXuat varchar (10),
  NgayLap DATE,
  NgayXuat DATE,
  SoLuong INT,
  MaCuaHang varchar (10),
  MaNguoiLapPhieu varchar(10)
);


CREATE TABLE Phieuxuat_Mathang (
  MaPhieuXuat varchar(10),
  MaMatHang varchar(10),
  SoLuong INT
);
-- TAO KHOA CHINH CAC BANG
alter table loaihang add constraint PK_MaLoaiHang primary key (MaLoaiHang);
alter table mathang add constraint PK_MaMatHang primary key (MaMatHang);
alter table cuahang add constraint PK_MaCuaHang primary key (MaCuaHang);
alter table nguoilapphieu add constraint PK_Malapphieu primary key (MaNguoiLapPhieu);
alter table phieuxuat add constraint PK_Maphieuxuat primary key (MaPhieuXuat);
alter table phieuxuat_mathang add constraint PK_Maphieuxuat primary key (MaPhieuXuat,MaMatHang);
-- TAO KHOA NGOAI 
ALTER TABLE Mathang ADD CONSTRAINT FK_MaLoaiHang FOREIGN KEY (MaLoaiHang) REFERENCES Loaihang(MaLoaiHang);
ALTER TABLE Phieuxuat ADD CONSTRAINT FK_MaMaNguoiLapPhieu FOREIGN KEY (MaNguoiLapPhieu) REFERENCES nguoilapphieu(MaNguoiLapPhieu);
ALTER TABLE Phieuxuat_Mathang ADD CONSTRAINT FK_MaPhieuXuat FOREIGN KEY (MaPhieuXuat) REFERENCES phieuxuat(MaPhieuXuat);
ALTER TABLE Phieuxuat_Mathang ADD CONSTRAINT FK_MaMatHang FOREIGN KEY (MaMatHang) REFERENCES mathang(MaMatHang);

ALTER TABLE Phieuxuat_Mathang Add CONSTRAINT soluong check ( soluong>0);
ALTER TABLE cuahang ADD CONSTRAINT unique_sdt UNIQUE (SoDienThoai);
ALTER TABLE cuahang ADD CONSTRAINT unique_email UNIQUE (email);
ALTER TABLE mathang Add CONSTRAINT dongia check ( dongia>0);
-- thêm dự liệu vào bảng 
SET FOREIGN_KEY_CHECKS=0;
set @@sql_safe_updates=0;
DELETE FROM Loaihang;
DELETE FROM Mathang;
DELETE FROM Cuahang;
DELETE FROM Nguoilapphieu;
DELETE FROM Phieuxuat;
DELETE FROM Phieuxuat_Mathang;

-- Thêm dữ liệu cho bảng Loaihang
INSERT INTO Loaihang (MaLoaiHang, TenLoaiHang)
VALUES
    ('LH001', 'Thời trang nữ'),
    ('LH002', 'Thời trang nam'),
    ('LH003', 'Quần áo trẻ em'),
    ('LH004', 'Phụ kiện'),
    ('LH005', 'Thời trang cao cấp');

-- Thêm dữ liệu cho bảng Mathang
INSERT INTO Mathang (MaMatHang, TenMatHang, DonGia, DonViTinh, MaLoaiHang)
VALUES
    ('MH001', 'Áo sơ mi nam trắng', 300000, 'Cái', 'LH001'),
    ('MH002', 'Áo thun nữ họa tiết', 200000, 'Cái', 'LH002'),
    ('MH003', 'Quần kaki nam', 250000, 'Cái', 'LH003'),
    ('MH004', 'Quần short nữ', 150000, 'Cái', 'LH004'),
    ('MH005', 'Mũ lưỡi trai', 50000, 'Cái', 'LH005');

-- Thêm dữ liệu cho bảng Cuahang
INSERT INTO Cuahang (MaCuaHang, TenCuaHang, DiaChi, SoDienThoai, Email, NguoiDaiDien)
VALUES
    ('CH001', 'Cửa hàng thời trang A', '123 Đường ABC, Q1', '0123456789', 'cthnn@example.com', 'Nguyễn Văn A'),
    ('CH002', 'Cửa hàng thời trang B', '456 Đường XYZ, Q2', '0987654321', 'cthntn@example.com', 'Trần Thị B'),
    ('CH003', 'Cửa hàng quần áo C', '789 Đường LMN, Q3', '0369874521', 'chqac@example.com', 'Lê Công C'),
    ('CH004', 'Cửa hàng phụ kiện D', '321 Đường PQR, Q4', '0765432198', 'chpkd@example.com', 'Phạm Đình D'),
    ('CH005', 'Cửa hàng thời trang E', '654 Đường UVW, Q5', '0932165478', 'cthne@example.com', 'Nguyễn Thị E');

-- Thêm dữ liệu cho bảng Nguoilapphieu
INSERT INTO Nguoilapphieu (MaNguoiLapPhieu, TenNguoiLapPhieu)
VALUES
    ('NL001', 'Nguyễn Văn A'),
    ('NL002', 'Trần Thị B'),
    ('NL003', 'Lê Công C'),
    ('NL004', 'Phạm Đình D'),
    ('NL005', 'Nguyễn Thị E');

-- Thêm dữ liệu cho bảng Phieuxuat
INSERT INTO Phieuxuat (MaPhieuXuat, NgayLap, NgayXuat, SoLuong, MaCuaHang, MaNguoiLapPhieu)
VALUES
    ('PX001', '2023-07-25', '2023-07-26', 100, 'CH001', 'NL001'),
    ('PX002', '2023-07-26', '2023-07-27', 50, 'CH002', 'NL002'),
    ('PX003', '2023-07-27', '2023-07-28', 75, 'CH003', 'NL003'),
    ('PX004', '2023-07-28', '2023-07-29', 30, 'CH004', 'NL004'),
    ('PX005', '2023-07-29', '2023-07-30', 40, 'CH005', 'NL005');

-- Thêm dữ liệu cho bảng Phieuxuat_Mathang
INSERT INTO Phieuxuat_Mathang (MaPhieuXuat, MaMatHang, SoLuong)
VALUES
    ('PX001', 'MH001', 30),
    ('PX001', 'MH002', 50),
    ('PX002', 'MH003', 20),
    ('PX002', 'MH002', 15),
    ('PX003', 'MH001', 35),
    ('PX004', 'MH004', 10),
    ('PX004', 'MH005', 20),
    ('PX005', 'MH001', 25),
    ('PX005', 'MH003', 15);

-- Viết câu lệnh truy vấn
-- cau 6.1 Hiển thị tất cả mặt hàng. Danh sách sắp xếp theo đơn giá tăng dần.
SELECT * 
FROM mathang
ORDER BY DonGia desc;

-- cau 6.2 Hiển thị tất cả các mặt hàng thuộc loại hàng “Thời trang”.
-- Thông tin gồm: mã mặt
-- hàng, tên mặt hàng, đơn vị tính, đơn giá, tên loại hàng.
SELECT MaMatHang, DonViTinh, DonGia, TenLoaiHang
FROM loaihang
JOIN mathang ON mathang.MaLoaiHang = loaihang.MaLoaiHang
WHERE loaihang.TenLoaiHang LIKE '%Thời trang%';
-- cau 6.3 Thống kê số mặt hàng theo loại hàng, thông tin gồm: mã loại hàng, tên loại hàng, tổng
-- số mặt hàng. Danh sách sắp xếp theo tổng số mặt hàng giảm dần
select loaihang.MaLoaiHang, tenloaihang, count(mathang.MaMatHang) TongMatHang
from loaihang
join mathang on loaihan g.MaLoaiHang = mathang.MaLoaiHang
group by loaihang.MaLoaiHang
order by TongMatHang desc;
-- cau 6.4 Liệt kê số phiếu xuất, ngày xuất hàng, mã cửa hàng, tên mặt hàng, số lượng, đơn giá, thành tiền.
SELECT
    px.MaPhieuXuat,px.NgayXuat,ch.MaCuaHang,mh.TenMatHang,pxmh.SoLuong,mh.DonGia,
    pxmh.SoLuong * mh.DonGia ThanhTien
FROM
    Phieuxuat px
JOIN
    Phieuxuat_Mathang pxmh ON px.MaPhieuXuat = pxmh.MaPhieuXuat
JOIN
    Cuahang ch ON px.MaCuaHang = ch.MaCuaHang
JOIN
    Mathang mh ON pxmh.MaMatHang = mh.MaMatHang;
-- 6.5 Thống kế tổng số lần xuất hàng theo từng tháng trong năm 2021, thông tin gồm:
-- tháng/năm, số lần xuất hàng
SELECT DATE_FORMAT(NgayXuat, '%m/%Y') AS ThangNam, COUNT(*) AS SoLanXuatHang
FROM phieuxuat
WHERE YEAR(NgayXuat) = 2021
GROUP BY  DATE_FORMAT(NgayXuat, '%m/%Y');

-- 6.6. Liệt kê 5 mặt hàng có số lượng xuất kho nhiều nhất.
select  mathang.TenMatHang, sum(phieuxuat_mathang.SoLuong) TongSoLuongXuatKho
from phieuxuat_mathang
join mathang on phieuxuat_mathang.MaMatHang = mathang.MaMatHang
group by mathang.MaMatHang
order by TongSoLuongXuatKho desc
limit 5;

-- 6.7. Thống kê số hàng nhập về cửa hàng “Chi nhánh quận 5”, thông tin hiển thị: Tên cửa hàng, số lần nhập hàng.
SELECT cuahang.TenCuaHang, COUNT(*) AS SoLanNhapHang 
FROM cuahang
JOIN phieuxuat ON cuahang.MaCuaHang = phieuxuat.MaCuaHang
WHERE cuahang.DiaChi LIKE '%Đường%'
GROUP BY cuahang.TenCuaHang;
-- 6.8. Thống kê tổng tiền hàng xuất kho theo ngày, thông tin hiển thị: Ngày xuất hàng, tổng thành tiền.
select phieuxuat.NgayXuat, sum(mathang.dongia*phieuxuat.soluong) TongThanhTien
from phieuxuat 
join phieuxuat_mathang on phieuxuat.MaPhieuXuat = phieuxuat_mathang.MaPhieuXuat
join mathang on phieuxuat_mathang.MaMatHang = mathang.mamathang
group by NgayXuat;
-- 6.9. Cập nhật ngày xuất hàng là ngày hiện hành cho các phiếu xuất chưa có ngày xuất
-- Thêm một bản ghi mới vào bảng phieuxuat
set @@sql_safe_updates=0;
UPDATE phieuxuat
SET NgayXuat = CURDATE()
WHERE NgayXuat IS NULL;
-- 6.10 Cập nhật đơn giá của “Đồng phục học sinh” giảm 10% trên đơn giá hiện tại
update mathang 
set dongia = dongia * 0.9
where tenmathang = 'Quần kaki nam';
-- 6.11 Thực hiện xóa các cửa hàng chưa có thông tin xuất hàng
DELETE FROM cuahang
WHERE MaCuaHang NOT IN (SELECT DISTINCT MaCuaHang FROM phieuxuat);
-- 6.12 Liệt kê danh sách các mặt hàng có số lượng xuất hàng thấp nhất: Mã hàng, tên hàng,
-- tổng số lượng xuất.
SELECT mathang.MaMatHang, mathang.TenMatHang, SUM(phieuxuat_mathang.SoLuong) AS TongSoLuongXuat
FROM mathang
LEFT JOIN phieuxuat_mathang ON mathang.MaMatHang = phieuxuat_mathang.MaMatHang
GROUP BY mathang.MaMatHang, mathang.TenMatHang
HAVING TongSoLuongXuat = (SELECT MIN(TongSoLuongXuat) 
							FROM (SELECT SUM(phieuxuat_mathang.SoLuong)TongSoLuongXuat 
							FROM mathang
							 LEFT JOIN phieuxuat_mathang ON mathang.MaMatHang = phieuxuat_mathang.MaMatHang
							GROUP BY mathang.MaMatHang) TongSoLuongXuatBang);
-- 6.13 Liệt kê những mặt hàng chưa từng xuất cho các cửa hàng, thông tin gồm: Mã mặt
-- hàng, tên mặt hàng, tên loại hàng.
SELECT mathang.MaMatHang, mathang.TenMatHang, loaihang.TenLoaiHang
FROM mathang
JOIN loaihang ON mathang.MaLoaiHang = loaihang.MaLoaiHang
WHERE mathang.MaMatHang NOT IN (
    SELECT DISTINCT MaMatHang FROM phieuxuat_mathang
);

