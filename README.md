# simplequiz_app

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

### Bước 1: Khởi tạo ứng dụng ban đầu
* Mở "Visual Studio Code". Trên thanh công cụ, chọn "View" -> "Command Palette"
* Chọn "Flutter: New Project" -> Tiếp theo, chọn "Application"
* Lựa chọn địa chỉ thư mục muốn lưu trữ project (ví dụ ở đây là C:\flutter\mobile_projects)
* Đặt tên project (ví dụ: simplequiz_app)
* Chạy thử máy ảo với ứng dụng mặc định bằng cách trên thanh công cụ chọn "Run" -> "Start Debugging" (F5)

### Bước 2: Khởi tạo model của questions
* Từ thư mực lib, nhấp chuột phải -> Chọn New Folder -> Đặt tên là models
* Tiếp theo đó, từ thư mực models vừa tạo, nhấp chuột phải -> Chọn New File -> Đặt tên question_model.dart

### Bước 3: Khởi tạo biến cố định
* Tạo file biến cố định với tên constants.dart ở vị trí cùng cấp với file main.dart
* Khai báo các biến màu sắc: correct, incorrect, neutral, background

### Bước 4: Tạo trang chính
* Xóa tất cả các dòng code mặc định
* Tạo myApp widget, loại bỏ debug banner, khởi tạo HomeScreen
* Tạo thư mục screens trong lib -> Tiếp theo, tạo file home_screen.dart -> Trong đó, tạo HomeScreen widget -> Gắn đường dẫn của file homescreen.dart vào trong file main.dart

### Bước 5: Thiết kế giao diện người dùng
* Thay đổi màu sắc của background và appBar -> Gắn đường dẫn của constants.dart vào trong homescreen.dart
* Tạo một số câu hỏi để có thể chạy thử nghiệm
* Tạo thêm thư mục widgets trong lib -> Tạo mới file question widget với tên là question_widget.dart trong thư mục widgets -> Gắn đường dẫn của nó vào trong homescreen.dart
* Thay đổi định dạng của câu hỏi

### Bước 6: Tạo nút Câu hỏi tiếp theo
* Sử dụng Floating Action Button (FAB)
* Thêm vào một vài function để khi nhấn vào sẽ xuất hiện câu hỏi tiếp theo

### Bước 7: Thêm các lựa chọn đáp án
* Tạo mới file option_card.dart trong thư mục widgets -> Gắn đường dẫn của nó vào trong homescreen.dart
* Làm cho nó trở thành những nút có thể bấm được và thay đổi màu sắc khi nhấn vào
* Tạo thêm việc bắt buộc người dùng phải lựa chọn đáp án mới cho phép chuyển sang câu hỏi tiếp theo

### Bước 8: Tạo phần điểm số trên màn hình
* Thêm vào một vài function để tăng giá trị lên 1 khi người dùng trả lời đúng

### Bước 9: Thay đổi màu sắc
* Thay đổi màu của chữ khi người dùng nhấn vào một trong các lựa chọn của câu hỏi (từ đen sang trắng)

### Bước 10: Tạo hộp thoại hiển thị kết quả
* Tạo mới file result_box.dart trong thư mục widgets -> Gắn đường dẫn của nó vào trong homescreen.dart

### Bước 11: Tạo nút làm lại bài kiểm tra
* Tạo một function trong home_srceen.dart để nó có thể hoạt động

### Bước 12: Làm việc với Firebase
* Truy cập ([https://firebase.google.com](https://firebase.google.com/)) -> Đăng nhập bằng tài khoản Google
* Nhấn chọn "Get Start" -> "Create a project" -> Đặt tên là "simpleQuizApp"
* Chọn "Realtime Database" -> Nhấn "Create Database" -> Lựa chọn ở chế độ "test mode"
* Trong thư mục models, tạo thêm file db_connect.dart. Để kết nối với cơ sở dữ liệu, nhập flutter pub add http ở Terminal
* Tạo thêm function để đưa câu hỏi vào cơ sở dữ liệu, khai báo tên của bảng và thêm .json vào hậu tố. Gọi thêm package "convert" trong dart

### Bước 12: Lấy câu hỏi từ cơ sở dữ liệu
* Sử dụng lại phương thức tương tự với việc thêm câu hỏi vào cơ sở dữ liệu
* Tạo thêm các câu hỏi trong cơ sở dữ liệu

### Bước 13: Đưa các câu hỏi từ cơ sở dữ liệu vào trong ứng dụng
* Chuyển đổi từ dạng "Map<dynamic, dynamic>" thành "Map<String, dynamic>"
* Sử dụng cặp "key, value" cho các câu hỏi
* Tạo thêm vị trí để lưu các câu hỏi đã tạo
* Thay đổi vị trí các câu hỏi trong ứng dụng thành các câu hỏi được lấy từ cơ sở dữ liệu
* Có thể xóa bỏ phương thức "addQuestion"
