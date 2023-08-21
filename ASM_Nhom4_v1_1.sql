use master
go
create database ASM_Nhom4
go

use ASM_Nhom4
go

create table Users
(	email nvarchar(100) primary key,
	username nvarchar(100) not null,
	password nvarchar(100) not null,
	role bit,
	activated bit,
)
go

create table Verifyaccounts(
	idverify int  identity,
	email nvarchar(100),
	Verifycode varchar(8),
	primary key (idverify),
	foreign key (email) references Users(email)
)

go
create table Orders
(
	order_id int primary key identity,
	email nvarchar(100),
	order_date date,
	total bigint,
	foreign key (email) references Users(email)
)

go
create table Categories
(
	category_id nvarchar(30) primary key,
	category_name nvarchar(100) not null
)

go
create table Products
(
	product_id nvarchar(30) primary key,
	category_id nvarchar(30),
	product_name nvarchar(100) not null,
	price bigint not null,
	image nvarchar(max) not null,
	description nvarchar(max),
	foreign key (category_id) references Categories(category_id)
)

go
create table Orderdetails
(
	order_details_id int primary key identity,
	order_id int,
	product_id nvarchar(30),
	color nvarchar(30),
	quantity int, -- Số lượng
	foreign key (order_id) references Orders(order_id),
	foreign key (product_id) references Products(product_id)
)

go


go

create table Productdetail
(
	Productdetail_id int identity(1,1) ,
	product_id nvarchar(30),
	PD_quantity int, -- Số lượng
	color nvarchar(30) not null,
	image nvarchar(max) not null,
	foreign key (product_id) references Products(product_id)
)
go

insert into Users
values
('tuan268493@gmail.com', 'tuanlm', '123456', 0,1 ),
('hothuan20112003@gmail.com', 'thuanhm', '123456', 1,1 ),
('hieutt@gmail.com', 'hieutt', '123456', 1,1 ),
('antc@gmail.com', 'Antc', '123456', 1, 1),
('vynt@gmail.com', 'vynt', '123456', 1, 1),
('tuanlm@gmail.com', 'tuanlm', '123456', 1,1 ),
('thainq@gmail.com', 'thainq', '123456', 1,1)

insert into Categories
values
('CT001', 'Ford'),
('CT002', 'Mercedes'),
('CT003', 'Kia'),
('CT004', 'Toyota'),
('CT005', 'BMW')

insert into Products
values
('SC001', 'CT001', 'Ford Ranger XL 2.0L 4X4 MT', 669000000,'https://www.ford.com.vn/content/dam/ecomm/Release-3/vn/models/xl/billbooard1.jpg.renditions.original.png', N' Ford Ranger hoàn toàn mới được biết đến như một chiếc xe đầy sức mạnh cùng với thiết kế mới bắt mắt, thu hút mọi ánh nhìn.Một chiếc xe sản xuất cho toàn cầu phải vận hành tốt ở bất kì điều kiện khu vực nào.'),
('SC002', 'CT001', 'Ford Everest Titanium 2.0L AT 4x4', 1468000000,'https://www.ford.com.vn/content/dam/ecomm/u704/release-3/vn/models/titanium/carousel-banner-1.jpg.renditions.original.png', N' Ford Ranger hoàn toàn mới được biết đến như một chiếc xe đầy sức mạnh cùng với thiết kế mới bắt mắt, thu hút mọi ánh nhìn. Một chiếc xe sản xuất cho toàn cầu phải vận hành tốt ở bất kì điều kiện khu vực nào.Động cơ của Ford Ranger hoàn toàn mới đã được chứng minh về khả năng vận hành trong các điều kiện khắc nghiệt, từ 400 mét dưới mực nước biển lên đến 4.500 mét trên mực nước biển, và chịu nhiệt độ từ -40oC đến + 50oC. Khi nói đến công suất và mức tiêu hao nhiên liệu, Ford Ranger hoàn toàn mới có thể xếp đầu bảng.'),
('SC003', 'CT001', 'Ford Everest Wildtrak 2.0L AT 4x4', 1499000000,'https://www.ford.com.vn/content/dam/ecomm/u704/release-3/vn/models/wildtrak/vn-everest-wildtrak-banner-1.jpg.renditions.original.png', N' Ford Ranger hoàn toàn mới được biết đến như một chiếc xe đầy sức mạnh cùng với thiết kế mới bắt mắt, thu hút mọi ánh nhìn. Một chiếc xe sản xuất cho toàn cầu phải vận hành tốt ở bất kì điều kiện khu vực nào. Động cơ của Ford Ranger hoàn toàn mới đã được chứng minh về khả năng vận hành trong các điều kiện khắc nghiệt, từ 400 mét dưới mực nước biển lên đến 4.500 mét trên mực nước biển, và chịu nhiệt độ từ -40oC đến + 50oC. Khi nói đến công suất và mức tiêu hao nhiên liệu, Ford Ranger hoàn toàn mới có thể xếp đầu bảng.'),
('SC004', 'CT001', 'Ford Ranger XLS 2.0L 4X2 AT', 707000000,'https://www.ford.com.vn/content/dam/ecomm/Release-3/vn/models/xls/vn-xls-billboard-carousel-1.jpg.renditions.original.png', N' Ford Ranger hoàn toàn mới được biết đến như một chiếc xe đầy sức mạnh cùng với thiết kế mới bắt mắt, thu hút mọi ánh nhìn. Một chiếc xe sản xuất cho toàn cầu phải vận hành tốt ở bất kì điều kiện khu vực nào.'),
('SC005', 'CT001', 'Ford Limited 2.3 Ecoboost AT 4WD', 2439000000,'https://www.ford.com.vn/content/ford/vn/vi_vn/site-wide-content/billboard-carousels/limited-carousel/jcr:content/par/billboard/imageComponent/image.imgs.full.high.jpg', N'Ford Ranger hoàn toàn mới được biết đến như một chiếc xe đầy sức mạnh cùng với thiết kế mới bắt mắt, thu hút mọi ánh nhìn. Một chiếc xe sản xuất cho toàn cầu phải vận hành tốt ở bất kì điều kiện khu vực nào.'),
('SC006', 'CT002', 'Mercedes-Maybach S-Class Sedan', 8199000000, 'https://assets.oneweb.mercedes-benz.com/iris/iris.jpg?COSY-EU-100-1713d0VXqbSeqtyO67PobzIr3eWsrrCsdRRzwQZhkHZbMw3SGtGyMtsd2vtcUfpLfXGEuiXJ0l34AOB2NQnbApjtwI5uVczQC3qkOkzNRLkm7jxafhKVFSQ%25vq9tayLRDcVYaxWaqrH1dBtn8wfAyoiZLbXM4FaIrTg9HQe6PD8P6SeWiaMtsd4HDcUfg8yXGEPbXJ0leIZOB2sQnbApUTyI5uG6JQC30SQkzNHTnm7j8yZhKViYh%25vq4uTyLRg3mYaxPrhrH1enun8wY8WoiZrMlM4FAIcTg95zp6PDCLNSeWzn3tsd8hTcUfiUkXGE4bjJ0lgolOB2PWEbApetpI5usc2QC3UkrkzNGmbm7j0hShKVBHM%25vqA8jyLRjcHYaxVXprH1qM%25n8wPO2oiZeIQM6oY2ul0kkzNL6Sm%25kFpKhymWBM%25vqBBjyLR0GWYaxv0SrH1LIrn8wiO3oiZ4iZM4FgCuTg9Pv36PKNCZnX2f3SNsQ3BxNDkSW9wUUEVXqdYWqtyRV3H3k9kBF7v0wAFslUqoWq&imgt=P27&bkgnd=9&pov=BE040&uni=cs&im=Crop,rect=(0,0,1450,750),gravity=Center;Resize,width=400', N'Hoàn mỹ trong việc lựa chọn chất liệu đến sự tinh tế của từng đường chỉ may tương phản đầy ấn tượng, Mercedes-Maybach S-Class mới tái thiết chuẩn mực sang trọng. Trợ lý cá nhân MBUX với những công nghệ ưu việt đánh dấu khởi nguyên của một trải nghiệm lái xe bậc nhất.'),
('SC007', 'CT002', 'Mercedes G-Class SUV', 11750000000, 'https://assets.oneweb.mercedes-benz.com/iris/iris.jpg?COSY-EU-100-1713d0VXqrWFqtyO67PobzIr3eWsrrCsdRRzwQZUZpZbMw3SGtGyMtsdAv3cUf5rcXGE5YrJbXSqxVKnn8wPbIoTnlR4M6ouvrTg9U1n6PDAGoSeWf%25MtsdE1tcUflwfXGE2hEJ0lp%25fOB2u5EbAp3CoI5uE5ZQC3lXFkzN25bm7jpv3hKV0cM%25vqrUdyLRnb6YaxoTWrH1MVtn8wBocoiZCkNM4FzRRTg9itZ6PD4%25DSeWgnRtsdPyDcUfeT6XGEsFmJ0lh4VOB2ZnnbApFrpI5ubvxQC3IAOkzN7mum7jDcfhKVjbQ%25vqYUTyLR3tmYaBEUVmMDZfrEQ5fA3JxXr1RjiiF2MpwQ1pnIu2fzfXRXPq0Agjeq89iph1p&imgt=P27&bkgnd=9&pov=BE140&uni=cs&im=Crop,rect=(0,0,1450,750),gravity=Center;Resize,width=300',N'Thiết kế ngoại thất ấn tượng khiến ai cũng phải trầm trồ từ cái nhìn đầu tiên. Lưới tản nhiệt đặc trưng AMG, bánh xe 20-inch cũng như hệ thống xả khí hiệu suất AMG nổi bật với hai ống xả kép mạ crôm phía bên hông, tất cả mang đến một vẻ ngoài hướng ngoại đáng ngưỡng mộ. Dù là nham thạch hay nhựa đường, Mercedes-AMG G 63 đều dễ dàng lướt êm. Với hiệu suất chuẩn mực, trên đường địa hình, chiếc xe này không có đối thủ. Với đặc tính vận hành vượt trội, kể cả trong thành phố, gã khổng lồ off-road này cũng dễ dàng ghi dấu ấn. Tất cả tạo nên vị vua của dòng xe địa hình: một biểu tượng trên đường phố nội ô.'),
('SC008', 'CT002', 'Mercedes V-Class Van', 3039000000, 'https://assets.oneweb.mercedes-benz.com/bbd/images/v1/4689/a/89/2ec734cdbf9055c4b20f24121be3454879f7b.png?im=Crop,rect=(70,35,460,260);Resize,width=300', N'Thiết kế nội thất rộng rãi và linh hoạt biến Mercedes-Benz V-Class trở thành một chiếc MPV tiện nghi với vô số tùy chọn. Sự thoải mái tuyệt vời mà bạn sẽ cảm nhận bên trong V-class là nhờ vào những tính toán kĩ càng về công thái học, mang đến trải nghiệm thoải mái tối đa.'),
('SC009', 'CT002', 'Mercedes GLE Coupé', 4919000000, 'https://assets.oneweb.mercedes-benz.com/iris/iris.jpg?COSY-EU-100-1713d0VXqrEFqtyO67PobzIr3eWsrrCsdRRzwQZg9pZbMw3SGtGyItsd2HVcUfpO6XGEubYJ0l36xOB2sr%25bApUAbI5uGQMQC3aM1kzNHTnm7j8hohKVi%25E%25vqmUjyLRhnmYaxU0drH1Gm%25n8w7OcoiZKiEM4FvSlTg9Lte6PDarsSeWHthtsd8B3cUfD%25kXGE5YrJbXSqxVKnn8wPbIoTnlR4M6oeIlTg9vx96PDK1RSeWgeRtsdPvQcUfeFfXGE1zrJ0lBYrOB2A85bAp5tlI5uCQ2QCPFi2J%25xVZkFPsgGvx3MkNulKKqD%25WjcNWmtdDZGZMuMapgeLlHp7RKWONW&imgt=P27&bkgnd=9&pov=BE140&uni=cs&im=Crop,rect=(0,0,1450,750),gravity=Center;Resize,width=300', N'Nội thất của GLS Coupé đã có nhiều điểm nổi bật từ các trang bị tiêu chuẩn, chẳng hạn như hệ thống đa phương tiện MBUX và tay lái thể thao đa năng. Nhiều loại bọc đệm, các chi tiết trang trí và các dòng trang bị EXCLUSIVE hoặc AMG Line có sẵn để tiện cá nhân hóa.'),
('SC010', 'CT003', 'Kia K5', 859000000, 'https://kiavietnam.com.vn/storage/k5-xanhsam.png', N'KIA K5 – là mẫu xe Sedan “Fastback” thể thao thế hệ mới trong nhóm K series, thay đổi toàn diện với đường nét thiết kế của tương lai đậm chất thể thao, sang trọng; trang bị tiện nghi hiện đại và hệ thống an toàn tiên tiến nhất.​'),
('SC011', 'CT003', 'Sorento', 1069000000, 'https://kiavietnam.com.vn/storage/sorento-pngicon.png', N'Kia Sorento Mẫu xe SUV được đổi mới toàn diện về thiết kế và công nghệ thuộc thế hệ sản phẩm mới nhất của thương hiệu KIA.​'),
('SC012', 'CT003', 'Sportage', 859000000, 'https://kiavietnam.com.vn/storage/kia-viet-nam/hinh-anh/suv-1.png', N'Kia Sportage Mẫu xe ứng dụng thành tố Bold for Nature – Đậm Chất Tự Nhiên trong triết lý thiết kế mới. Lấy cảm hứng từ thiên nhiên và cuộc sống đương đại, Kia Sportage được nhấn mạnh bằng những đường nét táo bạo và dứt khoát, tạo nên một diện mạo đầy mạnh mẽ, hiện đại và ấn tượng.​'),
('SC013', 'CT003', 'Sonet', 859000000, 'https://kiavietnam.com.vn/storage/kia-viet-nam/hinh-anh/suv-5.png', N'KIA SONET Sở hữu kích thước tối ưu, không gian bên trong rộng rãi; kiểu dáng cá tính, thể thao; vận hành linh hoạt, an toàn và hiệu quả kinh tế, Kia Sonet “thổi” một làn gió mới cho phân khúc SUV, hứa hẹn mang lại thành công về doanh số, góp phần khẳng định vị thế, khởi đầu kỷ nguyên mới cho thương hiệu KIA.​'),
('SC014', 'CT004', 'Toyota Alphard LUXURY', 4370000000, 'https://ssa-api.toyotavn.com.vn/Resources/Images/25275CF3794F02BE7BBEAC0C29C1EF1C.png', N'Toyota Alphard 2021 nhập khẩu chính hãng với giá hơn 4 tỷ đồng. Mẫu xe MPV Toyota Alphard 2021 vừa chính thức được đặt chân về thị trường Việt Nam sau một thời gian dài bị sức ép của Nghị định 116/2017/NĐ-CP về việc nhập khẩu ô tô nước ngoài vào Việt Nam. Hiện đây là mẫu xe MPV nắm giữ giá bán cao nhất của hãng xe Nhật tính đến thời điểm hiện tại và ghi danh vào hạng mục “chuyên cơ mặt đất” theo giới mê xe đánh giá.'),
('SC015', 'CT004', 'Toyota CAMRY 2.5HV', 1495000000, 'https://hantoyota.com.vn/wp-content/uploads/2021/12/Toyota-camry-2022-2-5-HV-Hybird-mau-trang-ngoc-trai-noi-that-den-dai-ly-toyota-my-dinh.png', N'Toyota Camry thế hệ mới nhất, sau đó được giới thiệu tại một số nước Đông Nam Á như tại Singapore, Thái Lan, Malaysia vào thời gian cuối năm ngoái. Có thể thấy phiên bản TOYOTA CAMRY HYBRID 2.5HV khoác lên một diện mạo mới, có sự thay đổi hoàn toàn so với thế hệ cũ. Thiết kế mặt ca-lăng mới, trang bị cụm đèn pha đã được thiết kế lại, sử dụng bóng LED, có đèn LED chạy ban ngày. TOYOTA CAMRY HYBRID 2.5HV được thiết kế bắt mắt với các dải năng lượng xanh. Đặc biệt, xe trang bị hệ thống an toàn Toyota Safety Sence (TTS) với rada đặt trong logo đầu xe.'),
('SC016', 'CT004', 'Toyota COROLLA ALTIS ', 765000000, 'https://ssa-api.toyotavn.com.vn//VehicleImgs/867B954C907BEB58F2B5F5A068A36B17.png',N'TOYOTA COROLLA ALTIS ra mắt lần đầu năm 1966 tại Nhật Bản. Qua nhiều lần cải tiến  với chất lượng vượt trội, kiểu dáng thu hút. Khả năng vận hành mạnh mẽ và tiết kiệm nhiên liệu cũng trở thành thương hiệu của dòng xe này. Ngoài ra, bản nâng cấp mới sở hữu ngoại hình hiện đại và khá nhiều nội thất. Toyota Mỹ Đình đang khuyến mại tiền mặt cùng phụ kiện cực khủng. TOYOTA ALTIS hiện được hưởng chính sách giảm 50% thuế trước bạ.'),
('SC017', 'CT004', 'Toyota FORTUNER', 1434000000, 'https://ssa-api.toyotavn.com.vn//VehicleImgs/409F2F5BCEE10C1DF302541BC118DC5E.png',N'TOYOTA FORTUNER thế hệ mới thay đổi hoàn toàn diện mạo bắt mắt, thể thao hơn. Tính năng vận hành an toàn và tiện nghi cũng được bổ sung thêm tăng tính cạnh tranh và chiếm trọn tình cảm của người dùng Việt Nam. Toyota Mỹ Đình đang khuyến mại tiền mặt cùng phụ kiện cực khủng. TOYOTA FORTUNER hiện được hưởng chính sách giảm 50% thuế trước bạ.'),
('SC018', 'CT005', 'BMW X3', 1659000000, 'https://www.bmwnhatrang.vn/wp-content/uploads/2020/04/C1M-Phytonic-Blue-min.png', N'BMW X3 chính là tuyên ngôn về cuộc sống không giới hạn, là hiện thân của cái tôi và sự tự do tuyệt đối. Ngay từ cái nhìn đầu tiên, chiếc xe đã gây ấn tượng với diện mạo thể thao và gây mê hoặc với trải nghiệm lái đầy phấn khích. Nhờ chế độ lái bán tự động và hệ thống truyền động bốn bánh thông minh BMW xDrive, chiếc xe mang lại cho người điều khiển cảm giác cực kỳ thoải mái trong mọi điều kiện địa hình. Chính vì vậy, chiếc xe đã tái định nghĩa mọi tiêu chuẩn trong phân khúc và khẳng định một điều rõ ràng: đích đến có thể giống nhau nhưng trải nghiệm trên hành trình là cả sự khác biệt.'),
('SC019', 'CT005', 'BMW X7', 4189000000, 'https://www.bmwnhatrang.vn/wp-content/uploads/sites/32/2020/05/BMW-X7-2019-1600-0d.jpg', N'BMW X7 mới là sự kết hợp giữa kiểu dáng ấn tượng và cá tính nổi trội. Đối lập với vẻ ngoài hầm hố, BMW X7 mang lại ấn tượng về sự nhẹ nhàng và linh hoạt nhờ thiết kế lịch lãm và kiểu dáng thể thao. Đồng thời, không gian nội thất rộng rãi thoải mái cho phép kết hợp cả ba yếu tố độc đáo, tiện lợi và tự do – kết quả của sự kết hợp này chính là không gian thoải mái cho cả ba hàng ghế. Công năng mạnh mẽ. Phong cách lịch lãm.'),
('SC020', 'CT005', 'BMW 7 Series',3899000000, 'https://www.bmwnhatrang.vn/wp-content/uploads/2020/08/A96-Mineral-White-min.png', N'BMW 7 Series được mệnh danh là chiếc sedan hạng siêu sang đáng để sở hữu nhất hiện nay. Giống như bất kỳ chiếc xe nào cùng phân khúc, 7 Series mới cũng được trang bị mọi mánh khóe từ thương hiệu sản sinh ra nó. Ngoài việc sở hữu nội thất rộng rãi, vật liệu chất lượng hàng đầu, 7 Series còn gây chú ý nhờ một loạt tính năng công nghệ tiên tiến và hệ thống truyền động với sức mạnh to lớn.'),
('SC021', 'CT005', 'BMW 4 Series Gran Coupes', 2929000000, 'https://www.bmwnhatrang.vn/wp-content/uploads/2022/09/4-series2000x1200.png', N'Thiết kế tinh xảo, khả năng xử lý tối ưu và nhiều không gian để sử dụng hàng ngày: BMW 4 Series Gran Coupé mới truyền cảm hứng suốt đường dài. Với sự thoải mái tối đa khi lái xe và nhiều không gian rộng rãi, năm ghế ngồi đủ cỡ và khoang hành lý, chiếc Gran Coupé năm cửa tinh tế này là bạn đồng hành lý tưởng cho mỗi cuộc hành trình.')
go

insert into Productdetail
values
('SC001', 4, N'Đen', 'https://drive.gianhangvn.com/image/rl9trpm-2202356j31644.jpg'),  -- Ford Ranger XL 2.0L 4X4 MT
('SC001', 4, N'Đỏ Cam', 'https://drive.gianhangvn.com/image/281zrpk-2202354j31644.jpg'),  -- Ford Ranger XL 2.0L 4X4 MT
('SC002', 4, N'Trắng', 'https://showroomford.vn/wp-content/uploads/2019/09/b-c-yDKuM1r2Pr-711x400.png'),  -- Ford Everest Titanium 2.0L AT 4x4
('SC002', 4, N'Đen', 'https://showroomford.vn/wp-content/uploads/2019/09/en-6e5lUleBsY-711x400.png'),  -- Ford Everest Titanium 2.0L AT 4x4
('SC003', 4, N'Vàng', 'https://fordsg.com.vn/wp-content/uploads/au-wildtrak-coloriser-luxe-yellow-1.webp'),  -- Ford Everest Wildtrak 2.0L AT 4x4
('SC003', 4, N'Xám', 'https://fordsg.com.vn/wp-content/uploads/au-wildtrak-coloriser-aluminium-1.webp'),  -- Ford Everest Wildtrak 2.0L AT 4x4
('SC004', 4, N'Đỏ Đô', 'https://phumyford.vn/files/800x/ranger-m-u--njzPMat9I6.png'),  -- Ford Ranger XLS 2.0L 4X2 AT
('SC004', 4, N'Xanh Dương', 'https://phumyford.vn/files/800x/ranger-m-u-xanh-rL6IJwRIyl.png'),  -- Ford Ranger XLS 2.0L 4X2 AT
('SC005', 4, N'Đỏ', 'https://thanglongford.com.vn/wp-content/uploads/2020/05/910x590-21_frd_epr_ltd_rprd_ps34_1HC_VN.jpg'),  -- Ford Limited 2.3 Ecoboost AT 4WD
('SC005', 4, N'Đen', 'https://thanglongford.com.vn/wp-content/uploads/2020/05/910x590-21_frd_epr_ltd_agbl_ps34_1HC_VN.jpg'),  -- Ford Limited 2.3 Ecoboost AT 4WD
('SC006', 5, N'Đen', 'https://mercedes-hcm.com/wp-content/uploads/2019/08/Mercedes-Maybach-S560-2019-3.jpg'),--Mercedes-Maybach S-Class Sedan
('SC006', 5, N'Trắng', 'https://mercedes-hcm.com/wp-content/uploads/2019/08/Mercedes-Maybach-S560-2019-5.jpg'),--Mercedes-Maybach S-Class Sedan
('SC007', 5, N'Đen', 'https://assets.oneweb.mercedes-benz.com/iris/iris.jpg?COSY-EU-100-1713d0VXqrWFqtyO67PobzIr3eWsrrCsdRRzwQZUZpZbMw3SGtGyMtsdAv3cUf5rcXGE5YrJbXSqxVKnn8wPbIoTnlR4M6ouvrTg9U1n6PDAGoSeWf%25MtsdE1tcUflwfXGE2hEJ0lp%25fOB2u5EbAp3CoI5uE5ZQC3lXFkzN25bm7jpv3hKV0cM%25vqrUdyLRnb6YaxoTWrH1MVtn8wBocoiZCkNM4FzRRTg9itZ6PD4%25DSeWgnRtsdPyDcUfeT6XGEsFmJ0lh4VOB2ZnnbApFrpI5ubvxQC3IAOkzN7mum7jDcfhKVjbQ%25vqYUTyLR3tmYaBEUVmMDZfrEQ5fA3JxXr1RjiiF2MpwQ1pnIu2fzfXRXPq0Agjeq89iph1p&imgt=P27&bkgnd=9&pov=BE140&uni=cs&im=Crop,rect=(0,0,1450,750),gravity=Center;Resize,width=300' ),--Mercedes G-Class SUV
('SC007', 5, N'Trắng', 'https://www.mercedes-benz.com.vn/vi/passengercars/mercedes-benz-cars/models/g-class/g-class-suv/facts-and-lines/model-comparison/_jcr_content/par/productinfotabnav_2f/tabnav/productinfotabnavite/tabnavitem/productinfotextimage/media2/slides/videoimageslide_434e/image.MQ6.12.20180814152812.jpeg'),--Mercedes G-Class SUV
('SC008', 5, N'Trắng','https://assets.oneweb.mercedes-benz.com/bbd/images/v1/4689/a/89/2ec734cdbf9055c4b20f24121be3454879f7b.png?im=Crop,rect=(70,35,460,260);Resize,width=300'),--Mercedes V-Class Van
('SC008', 5, N'Đen', 'https://choxesaigon.com/wp-content/uploads/2019/04/V-Class-den.jpg'),--Mercedes V-Class Van
('SC009', 5, N'Trắng', 'https://www.mercedes-benz.com.vn/vi/passengercars/mercedes-benz-cars/models/gle/coupe-c167/mercedes-amg/special-edition/_jcr_content/par/productinfotextimage/media2/slides/videoimageslide_783091297/image.MQ6.7.20220626054321.jpeg'),--Mercedes GLE Coupé
('SC009', 5, N'Đen', 'https://www.mercedes-benz.com.vn/vi/passengercars/mercedes-benz-cars/models/gle/coupe-c167/mercedes-amg/special-edition/_jcr_content/par/productinfotextimage/media2/slides/videoimageslide/image.MQ6.7.20220626054321.jpeg'),--Mercedes GLE Coupé
('SC010', 5, N'Xanh sám', 'https://kiavietnam.com.vn/storage/k5-xanhsam.png'), -- Kia k5
('SC010', 5, N'Đỏ', 'https://kiavietnam.com.vn/storage/k5-do.png'), -- Kia k5
('SC011', 5, N'Xanh nước', 'https://kiavietnam.com.vn/storage/sorento-pngicon.png'), -- Sorento
('SC011', 5, N'Trắng', 'https://kiavietnam.com.vn/storage/sorento-glacia-white-pearl-7cho.jpg'), -- Sorento
('SC012', 5, N'Xanh rêu', 'https://kiavietnam.com.vn/storage/kia-viet-nam/hinh-anh/suv-1.png'), -- Sportage
('SC012', 5, N'Đen', 'https://kiavietnam.com.vn/storage/360/sportage/den/fsb-62.webp'), -- Sportage
('SC013', 5, N'Cam', 'https://kiavietnam.com.vn/storage/kia-viet-nam/hinh-anh/suv-5.png'), -- Sonet
('SC013', 5, N'Trắng sám', 'https://kiavietnam.com.vn/storage/360/sonet/vang-cat-noc-den/05-d.png'), -- Sonet
('SC014', 5, N'Đen', 'https://ssa-api.toyotavn.com.vn//VehicleImgs/alphard/D1FCC90A81CD14798B722C7E61B6397A.png'), -- Toyota Alphard LUXURY
('SC014', 5, N'Trắng', 'https://ssa-api.toyotavn.com.vn/Resources/Images/25275CF3794F02BE7BBEAC0C29C1EF1C.png'), --Toyota Alphard LUXURY
('SC015', 5, N'Đỏ', 'https://hantoyota.com.vn/wp-content/uploads/2021/12/Toyota-camry-2022-2-5-HV-Hybird-mau-do-noi-that-den-dai-ly-toyota-my-dinh.png'), -- Toyota CAMRY 2.5HV
('SC015', 5, N'Trắng', 'https://hantoyota.com.vn/wp-content/uploads/2021/12/Toyota-camry-2022-2-5-HV-Hybird-mau-trang-ngoc-trai-noi-that-den-dai-ly-toyota-my-dinh.png'), --Toyota CAMRY 2.5HV
('SC016', 5, N'Xanh', 'https://ssa-api.toyotavn.com.vn//VehicleImgs/867B954C907BEB58F2B5F5A068A36B17.png'), -- Toyota COROLLA ALTIS
('SC016', 5, N'Trắng', 'https://ssa-api.toyotavn.com.vn//VehicleImgs/4D01DEE886B17F3667E047AE0B1508D8.png'), -- Toyota COROLLA ALTIS
('SC017', 5, N'Đen', 'https://ssa-api.toyotavn.com.vn//VehicleImgs/409F2F5BCEE10C1DF302541BC118DC5E.png'), -- Toyota FORTUNER
('SC017', 5, N'Trắng', 'https://ssa-api.toyotavn.com.vn//VehicleImgs/4311B489533329511F91BB11290B7B39.png'), --Toyota FORTUNER
('SC018', 3, N'Xanh dương', 'https://www.bmwnhatrang.vn/wp-content/uploads/2020/04/C1M-Phytonic-Blue-min.png'), --BMW X3
('SC018', 3, N'Đen', 'https://www.actualidadmotor.com/wp-content/uploads/2021/06/BMW-X3-2021-1-1024x614.jpg'), --BMW X3
('SC019', 3, N'Trắng', 'https://thacoauto.vn/storage/bmw/lineup2022/x7-xdrive40i-m-sport.png'), --BMW X7
('SC019', 3, N'Bạc', 'https://www.bmwnhatrang.vn/wp-content/uploads/2020/08/A96-Mineral-White-min.png'),  --BMW X7
('SC020', 3, N'Đen', 'https://autopro8.mediacdn.vn/2022/3/17/2023-bmw-7-series-renderings-1647529551170712624731.jpg'),--BMW 7 Series  
('SC020', 3, N'Xám', 'https://fordsg.com.vn/wp-content/uploads/au-wildtrak-coloriser-aluminium-1.webp'),--BMW 7 Series
('SC021', 3, N'Đỏ Đô', 'https://www.bmwnhatrang.vn/wp-content/uploads/2022/09/4-series2000x1200.png'),  --BMW 4 Series Gran Coupé
('SC021', 3, N'Bạc', 'https://autopro8.mediacdn.vn/2021/12/13/autopro-bmw-4-series-gran-coupe-ve-viet-nam-3-163936598203716055588-crop-1639368181784545750180.jpg')   --BMW 4 Series Gran Coupé
go

--INSERT INTO Orders 
--VALUES (1,'ID001', '1900-01-01');
--select * from orders
--select * from Orderdetails
----
--delete from Orders 

select * from Productdetail