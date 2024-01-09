--Bài tập thực hành môn Quản lý thông tin tuần 2
--LE HOANG HUY
--20521392
--BTTH2 19/4/2023


create database QLDT
go
use QLDT
go 
set dateformat dmy
go
--5.1 . Viết các câu lệnh SQL tạo các quan hệ trên với các kiểu dữ liệu mô tả trong bảng sau (tạo các ràng buộc khóa chính, khóa ngoại tương ứng):
CREATE TABLE SINHVIEN 
( 
MSSV CHAR(8) PRIMARY KEY, 
TENSV NVARCHAR(30) NOT NULL, 
SODT VARCHAR(10), 
LOP CHAR(10) NOT NULL, 
DIACHI NCHAR(30) NOT NULL 
) 

CREATE TABLE DETAI 
( 
MSDT CHAR(6) PRIMARY KEY, 
TENDT NVARCHAR(30) NOT NULL 
) 
CREATE TABLE HOCVI( 
MSHV INT,  
TENHV nvarchar(20) NOT NULL, 
PRIMARY KEY(MSHV) 
) 
CREATE TABLE HOCHAM( 
MSHH int,  
TENHH nvarchar(20) NOT NULL, 
PRIMARY KEY(MSHH) 
) 

CREATE TABLE SV_DETAI 
( 
MSSV char(8) FOREIGN KEY REFERENCES SINHVIEN(MSSV),  
MSDT char(6) FOREIGN KEY REFERENCES DETAI(MSDT), 
PRIMARY KEY(MSSV, MSDT) 
) 
CREATE TABLE GIAOVIEN( 
MSGV int,  
TENGV nvarchar(30) NOT NULL,  
DIACHI nvarchar(50) NOT NULL,  
SODT varchar(10) NOT NULL,  
MSHH int FOREIGN KEY REFERENCES HOCHAM(MSHH),  
NAMHH smalldatetime NOT NULL, 
PRIMARY KEY(MSGV) 

) 

CREATE TABLE CHUYENNGANH( 

MSCN int,  

TENCN nvarchar(30) NOT NULL, 

PRIMARY KEY(MSCN) 
) 
CREATE TABLE GV_HV_CN( 
MSGV int FOREIGN KEY REFERENCES GIAOVIEN(MSGV),  

MSHV int  FOREIGN KEY REFERENCES HOCVI(MSHV),  

MSCN int  FOREIGN KEY REFERENCES CHUYENNGANH(MSCN),  

NAM smalldatetime NOT NULL, 

PRIMARY KEY(MSGV, MSHV, MSCN) 

) 
CREATE TABLE GV_HDDT( 

MSGV int FOREIGN KEY REFERENCES GIAOVIEN(MSGV),  

MSDT char(6) FOREIGN KEY REFERENCES DETAI(MSDT),  

DIEM float NOT NULL, 

PRIMARY KEY(MSGV, MSDT) 

) 
CREATE TABLE GV_PBDT( 

MSGV int FOREIGN KEY REFERENCES GIAOVIEN(MSGV),  

MSDT char(6) FOREIGN KEY REFERENCES DETAI(MSDT),  

DIEM float NOT NULL, 

PRIMARY KEY(MSGV, MSDT) 

)
CREATE TABLE GV_UVDT( 

MSGV int FOREIGN KEY REFERENCES GIAOVIEN(MSGV),  

MSDT char(6) FOREIGN KEY REFERENCES DETAI(MSDT),  

DIEM float NOT NULL, 

PRIMARY KEY(MSGV, MSDT) 

) 
CREATE TABLE HOIDONG( 

MSHD int,  

PHONG int,  

TGBD smalldatetime, 

NGAYHD smalldatetime NOT NULL,  

TINHTRANG nvarchar(30) NOT NULL, 

MSGV int FOREIGN KEY REFERENCES GIAOVIEN(MSGV), 

PRIMARY KEY(MSHD) 

) 

 

CREATE TABLE HOIDONG_GV( 

MSHD int  FOREIGN KEY REFERENCES HOIDONG(MSHD),  

MSGV int FOREIGN KEY REFERENCES GIAOVIEN(MSGV), 

PRIMARY KEY(MSHD, MSGV) 

) 
CREATE TABLE HOIDONG_DT( 

MSHD int  FOREIGN KEY REFERENCES HOIDONG(MSHD),  

MSDT char(6) FOREIGN KEY REFERENCES DETAI(MSDT),  

QUYETDINH nchar(10), 

PRIMARY KEY(MSHD, MSDT) 

) 

--5.2: Insert dữ liệu vào CSDL:

-- chuyen doi ngay thang -- 

SET DATEFORMAT DMY 
-- them du lieu vao cac table -- 


---A.BẢNG SINHVIEN 

INSERT INTO SINHVIEN VALUES('13520001',N'Nguyễn Văn An','0906762255','SE103.U32',N'THỦ ĐỨC') 

INSERT INTO SINHVIEN VALUES('13520002',N'Phan Tấn Đạt','0975672350','IE204.T21',N'QUẬN 1') 

INSERT INTO SINHVIEN VALUES('13520003',N'Nguyễn Anh Hải','0947578688','IE205.R12',N'QUẬN 9') 

INSERT INTO SINHVIEN VALUES('13520004',N'Phạm Tài','0956757869','IE202.A22',N'QUẬN 1') 

INSERT INTO SINHVIEN VALUES('13520005',N'Lê Thúy Hằng','0976668688','SE304.E22',N'THỦ ĐỨC') 

INSERT INTO SINHVIEN VALUES('13520006',N'Ưng Hồng Ân','0957475898','IE208.F33',N'QUẬN 2') 

 

---B.BẢNG DETAI 

INSERT INTO DETAI VALUES('97001',N'Quản lý thư viện') 

INSERT INTO DETAI VALUES('97002',N'Nhận dạng vân tay') 

INSERT INTO DETAI VALUES('97003',N'Bán đấu giá trên mạng') 

INSERT INTO DETAI VALUES('97004',N'Quản lý siêu thị') 

INSERT INTO DETAI VALUES('97005',N'Xử lý ảnh') 

INSERT INTO DETAI VALUES('97006',N'Hệ giải toán thông minh') 

 

---C.BẢNG SV_DETAI 

INSERT INTO SV_DETAI VALUES('13520001','97004') 

INSERT INTO SV_DETAI VALUES('13520002','97005') 

INSERT INTO SV_DETAI VALUES('13520003','97001') 

INSERT INTO SV_DETAI VALUES('13520004','97002') 

INSERT INTO SV_DETAI VALUES('13520005','97003') 

INSERT INTO SV_DETAI VALUES('13520006','97005') 

--D. BẢNG HOCHAM 

INSERT INTO HOCHAM VALUES(1,N'PHÓ GIÁO SƯ') 

INSERT INTO HOCHAM VALUES(2,N'GIÁO SƯ') 

---E. BẢNG GIAOVIEN 

INSERT INTO GIAOVIEN VALUES(00201,N'Trần Trung',N'Bến Tre','35353535',1,'1996') 

INSERT INTO GIAOVIEN VALUES(00202,N'Nguyễn Văn An',N'Tiền Giang','67868688',1,'1996') 

INSERT INTO GIAOVIEN VALUES(00203,N'Trần Thu Trang',N'Cần Thơ','74758687',1,'1996') 

INSERT INTO GIAOVIEN VALUES(00204,N'Nguyễn Thị Loan',N'TP. HCM','56575868',2,'2005') 

INSERT INTO GIAOVIEN VALUES(00205,N'Chu Tiến',N'Hà Nội','46466646',2,'2005') 

---F.BẢNG HOCVI 

INSERT INTO HOCVI VALUES(1,N'Kỹ sư') 

INSERT INTO HOCVI VALUES(2,N'Cử Nhân') 

INSERT INTO HOCVI VALUES(3,N'Thạc sĩ') 

INSERT INTO HOCVI VALUES(4,N'Tiến sĩ') 

INSERT INTO HOCVI VALUES(5,N'Tiến sĩ Khoa học')	 

---G. BẢNG CHUYENNGANH 

INSERT INTO CHUYENNGANH VALUES(1,N'Công nghệ Web') 

INSERT INTO CHUYENNGANH VALUES(2,N'Mạng xã hội') 

INSERT INTO CHUYENNGANH VALUES(3,N'Quản lý CNTT') 

INSERT INTO CHUYENNGANH VALUES(4,N'GIS') 

---H. BẢNG GV_HV_CN 

INSERT INTO GV_HV_CN VALUES(00201,1,1,'2013') 

INSERT INTO GV_HV_CN VALUES(00201,1,2,'2013') 

INSERT INTO GV_HV_CN VALUES(00201,2,1,'2014') 

INSERT INTO GV_HV_CN VALUES(00202,3,2,'2013') 

INSERT INTO GV_HV_CN VALUES(00203,2,4,'2014') 

INSERT INTO GV_HV_CN VALUES(00204,3,2,'2014') 

---I. BẢNG GV_HDDT 

INSERT INTO GV_HDDT VALUES(00201,'97001',8) 

INSERT INTO GV_HDDT VALUES(00202,'97002',7) 

INSERT INTO GV_HDDT VALUES(00205,'97001',9) 

INSERT INTO GV_HDDT VALUES(00204,'97004',7) 

INSERT INTO GV_HDDT VALUES(00203,'97005',9) 

---J. BẢNG GV_PBDT 

INSERT INTO GV_PBDT VALUES(00201,'97005',8) 

INSERT INTO GV_PBDT VALUES(00202,'97001',7) 

INSERT INTO GV_PBDT VALUES(00205,'97004',9) 

INSERT INTO GV_PBDT VALUES(00204,'97003',7) 

INSERT INTO GV_PBDT VALUES(00203,'97002',9) 

---K. BẢNG GV_UVDT 

INSERT INTO GV_UVDT VALUES(00205,'97005',8) 

INSERT INTO GV_UVDT VALUES(00202,'97005',7) 

INSERT INTO GV_UVDT VALUES(00204,'97005',9) 

INSERT INTO GV_UVDT VALUES(00203,'97001',7) 

INSERT INTO GV_UVDT VALUES(00204,'97001',9) 

INSERT INTO GV_UVDT VALUES(00205,'97001',8) 

INSERT INTO GV_UVDT VALUES(00203,'97003',7) 

INSERT INTO GV_UVDT VALUES(00201,'97003',9) 

INSERT INTO GV_UVDT VALUES(00202,'97003',7) 

INSERT INTO GV_UVDT VALUES(00201,'97004',9) 

INSERT INTO GV_UVDT VALUES(00202,'97004',8) 

INSERT INTO GV_UVDT VALUES(00203,'97004',7) 

INSERT INTO GV_UVDT VALUES(00201,'97002',9) 

INSERT INTO GV_UVDT VALUES(00204,'97002',7) 

INSERT INTO GV_UVDT VALUES(00205,'97002',9) 

---L. BẢNG HOIDONG 

INSERT INTO HOIDONG VALUES(1,002,'7:00','29/11/2014',N'Thật',00201) 

INSERT INTO HOIDONG VALUES(2,102,'7:00','5/12/2014',N'Thật',00202) 

INSERT INTO HOIDONG VALUES(3,003,'8:00','6/12/2014',N'Thật',00203) 

---M. BẢNG HOIDONG_GV 

INSERT INTO HOIDONG_GV VALUES(1,00201) 

INSERT INTO HOIDONG_GV VALUES(1,00202) 

INSERT INTO HOIDONG_GV VALUES(1,00203) 

INSERT INTO HOIDONG_GV VALUES(1,00204) 

INSERT INTO HOIDONG_GV VALUES(2,00203) 

INSERT INTO HOIDONG_GV VALUES(2,00202) 

INSERT INTO HOIDONG_GV VALUES(2,00205) 

INSERT INTO HOIDONG_GV VALUES(2,00204) 

INSERT INTO HOIDONG_GV VALUES(3,00201) 

INSERT INTO HOIDONG_GV VALUES(3,00202) 

INSERT INTO HOIDONG_GV VALUES(3,00203) 

INSERT INTO HOIDONG_GV VALUES(3,00204) 

---N. BẢNG HOIDONG_DT 

INSERT INTO HOIDONG_DT VALUES(1,'97001',N'Được') 

INSERT INTO HOIDONG_DT VALUES(1,'97002',N'Được') 

INSERT INTO HOIDONG_DT VALUES(2,'97001',N'Không') 

INSERT INTO HOIDONG_DT VALUES(2,'97004',N'Không') 

INSERT INTO HOIDONG_DT VALUES(1,'97005',N'Được') 

INSERT INTO HOIDONG_DT VALUES(3,'97001',N'Không') 

INSERT INTO HOIDONG_DT VALUES(3,'97002',N'Được') 




--A. STORED PROCEDUREDS VỚI THAM SỐ VÀO

--1. Tham số vào là MSGV, TENGV, SODT, DIACHI, MSHH, NAMHH. Trước khi insert dữ liệu cần kiểm tra MSHH đã tồn tại trong table HOCHAM chưa, nếu chưa thì trả về giá trị 0.

create procedure Them_GV 
	@MSGV int, 
	@TENGV nvarchar(30), 
	@DIACHI nvarchar(50),  
	@SODT varchar(10) , 
	@MSHH int ,
	@NAMHH smalldatetime
as
begin
	if exists (select*from HOCHAM where MSHH = @MSHH)
	begin 
		insert into GIAOVIEN(MSGV, TENGV, DIACHI, SODT, MSHH,NAMHH) VALUES (@MSGV, @TENGV, @DIACHI, @SODT, @MSHH, @NAMHH)
	end
	else print('0')
end
exec Them_GV 209, 'Le Hoang Huy', 'TP HCM', '0769699206', 4,2023



--2. Tham số vào là MSGV, TENGV, SODT, DIACHI, MSHH, NAMHH. Trước khi insert dữ liệu cần kiểm tra MSGV trong table GIAOVIEN có trùng không, nếu trùng thì trả về giá trị 0.
create procedure Them_GV_1 
	@MSGV int, 
	@TENGV nvarchar(30), 
	@DIACHI nvarchar(50),  
	@SODT varchar(10) , 
	@MSHH int ,
	@NAMHH smalldatetime
as
begin
	if not exists (select*from GIAOVIEN where MSGV = @MSGV)
	begin 
		insert into GIAOVIEN(MSGV, TENGV, DIACHI, SODT, MSHH,NAMHH) VALUES (@MSGV, @TENGV, @DIACHI, @SODT, @MSHH, @NAMHH)
	end
	else print('0')
end
exec Them_GV_1 2010, 'Hoang Huy', 'TP HCM', '0769699206', 4,2023



-- 3. Giống (1) và (2) kiểm tra xem MSGV có trùng không? MSHH có tồn tại chưa? Nếu MSGV trùng thì trả về 0. Nếu MSHH chưa tồn tại trả về 1, ngược lại cho insert dữ liệu.
create procedure Them_GV_3 @MSGV int, @TENGV nvarchar(30), @DIACHI nvarchar(50),  @SODT varchar(10) , @MSHH int ,@NAMHH smalldatetime
as
begin
	if exists (select*from GIAOVIEN where MSGV = @MSGV)
		print('0')
	else 
		if not exists (select*from HOCHAM where MSHH = @MSHH) or @MSHH is null
			print('1')
		else
			insert into GIAOVIEN(MSGV, TENGV, DIACHI, SODT, MSHH,NAMHH) VALUES (@MSGV, @TENGV, @DIACHI, @SODT, @MSHH, @NAMHH)
end


--Bai 4: Đưa vào MSDT cũ, TENDT mới. Hãy cập nhật tên đề tài mới với mã đề tài cũ không đổi nếu không tìm thấy trả về 0, ngược lại cập nhật và trả về 1.
create procedure De_tai_moi @MSDT char(6), @TENDETAI NVARCHAR(30)
as
begin
	declare @msdt_kt char(6)
	select @msdt_kt = MSDT 
	from DETAI where @MSDT =MSDT
	if (@msdt_kt is null)
		print('0')
	else 
		begin 
			update DETAI
			set TENDT=@TENDETAI
			where MSDT=@MSDT
			return 1
		end
end
exec De_tai_moi @MSDT= '97001', @TENDETAI= N'Quản lí sách'



--5. Tham số đưa vào MSSV, TENSV mới, DIACHI mới thủ lục dùng để cập nhật sinh viên trên, nếu không tìm thấy trả về 0, ngược lại cập nhật và trả về 1.
create procedure Sinh_vien_moi @MSSV char(8), @TENSV NVARCHAR(30), @DIACHI NCHAR(30)
as
begin
	declare @mssv_kt char(8)
	select @mssv_kt = MSSV 
	from SINHVIEN where @MSSV =MSSV
	if (@mssv_kt is null)
		print('0')
	else 
		begin 
			update SINHVIEN
			set TENSV=@TENSV, DIACHI=@DIACHI
			where MSSV=@MSSV
			return 1
		end
end
exec Sinh_vien_moi @MSSV= 13520001, @TENSV= N'Le Hoang Huy', @DIACHI= N'TP HCM'



--B. STORED PROCEDUREDS VỚI THAM SỐ VÀO VÀ RA

--1. Đưa vào TENHV trả ra: Số GV thỏa học vị, nếu không tìm thấy trả về 0.


create procedure Tinh_GV_Hocvi @TENHV nvarchar(20), @SOLUONG int output
as
begin
	select @SOLUONG=COUNT(MSGV)
	from HOCVI, GV_HV_CN
	where HOCVI.MSHV=GV_HV_CN.MSHV and TENHV=@TENHV
end

--2. Đưa vào MSDT cho biết: Điểm trung bình của đề tài, nếu không tìm thấy trả về 0.
create procedure Tinh_DTB @MSDT char(6), @DTB float output
as
begin
	select @DTB = ((SUM(hd.DIEM) + SUM(uv.DIEM)+ SUM(pb.DIEM)) / (count(hd.DIEM) + count(uv.DIEM)+ count(pb.DIEM)))
	from DETAI DT, GV_HDDT hd, GV_PBDT pb,GV_UVDT uv
	where DT.MSDT=hd.MSDT and DT.MSDT=pb.MSDT and dt.MSDT=uv.MSDT and dt.MSDT=@MSDT
end

--3. Đưa vào TENGV trả ra: SDT của giáo viên đó, nếu không tìm thấy trả về 0. Nếu trùng tên thì có báo lỗi không? Tại sao? Làm sao để hiện thông báo có bao nhiêu giáo viên trùng tên và trả về các SDT. 
declare @TB float 
exec Tinh_DTB '97004', @TB output
print  @TB

	
--4. Đưa vào MSHD cho biết: Điểm trung bình các đề tài của hội đồng đó.
create procedure Tinh_DTB_detai @MSHD int, @DTB float output
as
begin
	select @DTB = ((SUM(hd.DIEM) + SUM(uv.DIEM)+ SUM(pb.DIEM)) / (count(hd.DIEM) + count(uv.DIEM)+ count(pb.DIEM)))
	from HOIDONG , GV_HDDT hd, GV_PBDT pb,GV_UVDT uv
	where HOIDONG.MSGV=hd.MSGV and HOIDONG.MSGV=uv.MSGV and HOIDONG.MSGV=pb.MSGV and HOIDONG.MSHD=@MSHD
end




--C. TRIGGER

--1. Tạo Trigger thỏa mãn điều kiện khi xóa một đề tài sẽ xóa các thông tin liên quan.
create trigger XOADETAI
	on DETAI for delete
	as
	begin
		declare @msdt char(6)
		select @msdt = MSDT from deleted
		delete from SV_DETAI where MSDT = @msdt
		delete from GV_HDDT where MSDT = @msdt
		delete from GV_PBDT where MSDT = @msdt
		delete from GV_UVDT where MSDT = @msdt
		delete from HOIDONG_DT where MSDT = @msdt
	end

--2. Tạo Trigger thỏa mãn ràng buộc là một hội đồng không quá 10 đề tài. Dùng “Group by” có được không? Giải thích
create trigger TG_2c
	on HOIDONG_DT FOR INSERT 
	AS
	BEGIN
		declare @mshd int
		set @mshd = (select MSHD from inserted)
		if(select count(*) from HOIDONG_DT where MSHD=@mshd group by MSHD)>10
			begin 
				print N'hội đồng không quá 10 đề tài'
				rollback transaction 
			end
	end



	--D. FUNCTION

-- 1. Viết hàm tính điểm trung bình của một đề tài. Giá trị trả về là điểm trung bình ứng với mã số đề tài nhập vào
create function Tinh_DTB_DT (@MSDT char(6))
returns float
as
begin
	declare @DTB float
	select @DTB = ((SUM(hd.DIEM) + SUM(uv.DIEM)+ SUM(pb.DIEM)) / (count(hd.DIEM) + count(uv.DIEM)+ count(pb.DIEM)))
	from DETAI DT, GV_HDDT hd, GV_PBDT pb,GV_UVDT uv
	where DT.MSDT=hd.MSDT and DT.MSDT=pb.MSDT and dt.MSDT=uv.MSDT and dt.MSDT=@MSDT
	return @DTB
end

-- 2. Trả về kết quả của đề tài theo MSDT nhập vào. Kết quả là DAT nếu như điểm trung bình từ 5 trở lên, và KHONGDAT nếu như điểm trung bình dưới 5.
create function KETQUADT (@MSDT char(6))
returns varchar(10)
as
begin
	declare @DiemTB float
	select @DiemTB = dbo.Tinh_DTB_DT (MSDT)
	from DETAI
	where MSDT =@MSDT
	if (@DiemTB>5)
		return 'DAT'
	RETURN 'KHONG DAT'
END


--E. CURSOR
CREATE TABLE DETAI_DIEM (
	MSDT VARCHAR(6) PRIMARY KEY,
	DIEM FLOAT
)
DECLARE p CURSOR FOR SELECT MSDT, dbo.Tinh_DTB_DT(MSDT) AS DIEM_TB FROM DETAI
OPEN p
DECLARE @MADT CHAR(6), @DIEM FLOAT

FETCH NEXT FROM p INTO @MADT, @DIEM
WHILE (@@FETCH_STATUS=0)
BEGIN
	UPDATE DETAI_DIEM
	SET MSDT= @MADT, DIEM=ROUND(@DIEM,2)
	FETCH NEXT FROM p INTO @MADT, @DIEM
END
	CLOSE P
	DEALLOCATE p