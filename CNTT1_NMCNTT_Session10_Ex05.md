# Phần 1. Phân tích hệ thống trang trại thông minh 
### 1. Xác định Input và Output

-   **Input :**
    
    -   Cảm biến nhiệt độ, độ ẩm đất, ánh sáng quang phổ.
        
    -   Tín hiệu thủ công từ người quản lý trang trại (nút bấm khẩn cấp hoặc lịch hẹn giờ trên phần mềm).
        
-   **Output :**
    
    -   Van điện từ (mở/đóng nước tưới), hệ thống đèn LED kích thích sinh trưởng, còi/đèn cảnh báo khi thông số vượt ngưỡng an toàn.
        
    -   Giao diện màn hình hiển thị dữ liệu thời gian thực và thông báo nhật ký hệ thống.
  ###  2. Sơ đồ phối hợp phần cứng (Mô hình IPO & SoC)
  [Cảm biến môi trường] ---> (Input) ---> [Vi điều khiển / SoC (CPU, RAM, ROM)] ---> (Output) ---> [Thiết bị chấp hành (Van nước, Đèn)]
  # Phần 2. Triển khai file README.md hoàn chỉnh
 

## 1. Mô tả dự án



## 2. Chu kỳ Fetch–Decode–Execute (Xử lý lệnh tưới Lan)



## 3. Quy trình chuyển hóa thông tin (Mô hình DIKW)
### Phần 3. Kiểm thử: Xử lý sự cố khi RAM bị đầy dữ liệu nhật ký Đoạn nội dung cập nhật cho mục
 **"Lưu ý"** trong file README để xử lý an toàn khi RAM bị đầy: >  Xử lý sự cố tràn RAM do nhật ký  > Nguyên nhân  > Cách xử lý an toàn > 1. Truy cập giao diện dòng lệnh quản trị, thực hiện lệnh ngắt ghi log tạm thời  > 2. Tiến hành kết xuất dữ liệu nhật ký quan trọng còn lại ra thẻ nhớ hoặc lưu trữ đám mây, sau đó thực hiện lệnh xóa bộ đệm RAM  > 3. Khởi động lại dịch vụ giám sát và cấu hình lại cơ chế giới hạn kích thước tệp log 

