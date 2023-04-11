# flutterdemo

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.


# POSTapi/users

## API Request
{

	"name":"traveler",
	"email":"traveler@gmail.com",
	"location":"USA"
}

## API Response

{

    "$id": "1",
    "id": 7076,
    "name": "traveler",
    "email": "traveler@gmail.com",
    "profilepicture": "https://www.adequatetravel.com/ATMultimedia//Images/userimageicon.png",
    "location": "USA",
    "createdat": "2021-10-14T12:05:59.7235182Z"
}

# SQLScript

## Create table users

CREATE TABLE USERS (
   id int not null auto_increment,

   name nvarchar(50) not null,

   email nvarchar(50) not null,

   profilepicture nvarchar(50),

   location nvarchar(50),

   createdat timestamp not null DEFAULT CURRENT_TIMESTAMP,

   PRIMARY KEY (id)
    
)

## create index

create unique index users_idx on users (email);

## Describe
SH Figuarts hay còn viết tắt là SHF là tên của dòng sản phẩm, nhãn hàng chuyên về các mô hình đồ chơi chất lượng cao được sản xuất bởi Bandai vào năm 2008. Mô hình SH Figuarts gồm những nhân vật được thiết kế bằng những hình dạng di chuyển, đã có hàng loạt nhân vật tiêu chuẩn mới từ Bandai thể hiện hình tượng các nhân vật đang chuyển động bằng công nghệ SH Figuarts ( S-CH Figuarts). 
Mô hình đồ chơi SH Figuarts là những sản phẩm được thiết kế, sáng tạo và thực hiện rất tỉ mỉ, tất cả những bộ phận và chi tiết của Figuarts đều chuẩn như những nhân vật trong truyện tranh hay những hình người thật trong phim. Chính vì vậy, Figuarts không chỉ đơn giản là một món đồ chơi mà nó còn là niềm đam mê, thú vui sưu tầm của rất nhiều người.
Nhận thấy được nhu cầu sưu tầm SHF của giới trẻ Việt Nam ngày càng tăng. Tuy nhiên các công tác bán hàng vẫn còn thủ công nên đã dẫn đến nhiều khó khăn cho các cửa hành kinh doanh mô hình đồ chơi. Nên em quyết định thực hiện thiết kế phần mềm quản lí cửa hàng mô hình đồ chơi để giúp các cửa hàng dễ dàng hơn trong khâu quản lí.
Kinh doanh cửa hàng mồ hình đồ chơi muốn kiếm nhiều lãi đòi hỏi việc quản lý bán hàng phải chặt sẽ. Sử dụng phần mềm quản lý cửa hàng đồ chơi được đánh giá là phương pháp tối ưu giúp chủ shop quản lý kho, chi phí, doanh số, lợi nhuận cũng như tích điểm cho khách hàng thân quen.
So với phương pháp quản lý bán hàng đồ chơi bằng excel hay sổ sách, sử dụng phần mềm quản lý đồ chơi giúp cửa hàng vận hành hiệu quả và chuyên nghiệp hơn.

## Function

### 2.1. Quản lý tồn kho đồ chơi và hàng hóa hiệu quả
Thống kê chi tiết số lượng hàng hóa theo từng thuộc tính sản phẩm như tên hàng, size, màu sắc, thương hiệu…
Tự động cập nhật trạng thái tồn kho trên hệ thống cửa hàng.
### 2.2. Quản lý nhân viên và phân quyền, chỉ định vai trò cho từng nhân viên
Phân quyền nhân viên theo vai trò chung như thu ngân, kế toán, nhân viên bán hàng … và các vai trò chi tiết như quyền sửa hóa đơn, quyền thêm/sửa/xóa khách hàng hay quyền xem báo cáo này nhưng không được xem báo cáo khác
Dễ dàng theo dõi lịch sử hoạt động của từng nhân viên
Thống kê doanh số bán hàng của từng nhân viên để đánh giá lương, thưởng chính xác
### 2.3. Khách hàng:
Xem danh sách sản phẩm
Xem thông tin chi tiết sản phẩm
Tìm kiểm sản phẩm
Đưa sản phẩm vào giỏ hàng
Đặt mua hàng
Chọn hình thức thanh toán
Thanh toán khi nhận hàng
Thanh toán Online( Liên Kết MOMO, Liên kết ngân hàng)
Góp ý
Liên hệ
## 3.Công nghệ sử dụng
FE:  Flutter
BE: Rest API
DB: mysql. 
## 4.Các lĩnh vực nghiên cứu
Bán hàng Online
Cách thiết kế app mobile
Nghiên cứ về Framework flutter, Rest API

