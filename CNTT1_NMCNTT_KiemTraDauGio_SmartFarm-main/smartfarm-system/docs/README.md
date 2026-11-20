# Bai Tap Thuc Hanh
# Hệ Thống Quản Trị Hạ Tầng SmartFarm (smartfarm-system)

Hệ thống quản trị nhật ký máy chủ (server logs) và đối soát danh mục thiết bị tại các trạm cảm biến nông nghiệp thông minh **SmartFarm**.

---

## 1. Hướng dẫn chạy script lọc log tự động

Mở **PowerShell**, di chuyển vào thư mục `scripts/` và thực thi kịch bản `auto_report.ps1` bằng đường dẫn tương đối:

```

cd .\smartfarm-system\scripts


.uto_report.ps1

# Nếu bị chặn bởi ExecutionPolicy trên Windows, chạy bằng lệnh sau:
powershell -ExecutionPolicy Bypass -File .uto_report.ps1
```

---

## 2. Checklist kiểm tra thiết bị trạm cảm biến

- [x] Kiểm tra kết nối mạng và tín hiệu Heartbeat định kỳ từ các trạm cảm biến (`sensor-01` đến `sensor-06`).
- [x] Rà soát dung lượng ổ cứng máy chủ cơ sở dữ liệu (`/var/lib/db`) và kiểm tra tiến trình snapshot hàng ngày.
- [ ] Thay thế nguồn điện và lắp bổ sung anten kích sóng cho trạm `sensor-03`.
- [ ] Nâng cấp Firmware lên phiên bản mới cho trạm `sensor-06` và sạc/thay pin cho trạm `sensor-05`.

---

## 3. Bảng thông số phần cứng

Dữ liệu trích xuất từ bảng danh mục linh kiện (`danh-muc-linh-kien` trong file `quan-ly-thiet-bi.xlsx`):

| Mã linh kiện | Tên thiết bị | Đơn giá (VNĐ) | Loại Storage |
| :--- | :--- | ---: | :---: |
| LK01 | Raspberry Pi 4 Model B | 1,450,000 | SSD |
| LK02 | Intel NUC i3 | 6,200,000 | SSD |
| LK03 | Orange Pi 5 | 2,300,000 | SSD |
| LK04 | Dell Optiplex Micro | 5,400,000 | HDD |
| LK05 | Mini PC Fanless N100 | 4,200,000 | SSD |
| LK06 | Synology DS220j NAS | 3,900,000 | HDD |

---

## 4. Phân tích hệ thống

### 4.1. Mô hình IPO (Input – Process – Output) của chức năng lọc log

* **Input (Đầu vào):**
  * File nhật ký hệ thống thô `data/log-he-thong.log` chứa toàn bộ các dòng sự kiện (`INFO`, `WARNING`, `ERROR`, `CRITICAL`) sinh ra từ máy chủ và các trạm cảm biến.
  * Thời gian hệ thống hiện tại lấy từ lệnh `Get-Date`.
* **Process (Xử lý):**
  * Đọc nội dung file log bằng `Get-Content` và truyền qua đường ống **Pipeline (`|`)** sang `Select-String` để lọc các dòng khớp với từ khóa `"CRITICAL"` hoặc `"ERROR"`.
  * Đếm tổng số dòng sự cố nghiêm trọng tìm được bằng pipeline kết hợp `Measure-Object` (hoặc thuộc tính `.Count`).
  * Ghi tiêu đề báo cáo, nối tiếp (`>>`) danh sách các dòng lỗi và tổng số sự cố vào file đích.
* **Output (Đầu ra):**
  * File báo cáo tổng hợp `backup/bao-cao-su-co.txt` gồm thời gian xuất báo cáo, 8 dòng sự cố (`ERROR` / `CRITICAL`) và dòng thống kê `TONG SO SU CO: 8`.

### 4.2. Phân loại phát biểu theo mô hình DIKW (Data – Information – Knowledge – Wisdom)

| Phát biểu | Tầng DIKW | Giải thích |
| :--- | :---: | :--- |
| **(b)** *"2026-10-12 08:15:01 [ERROR] sensor-03 Connection TIMEOUT after 30s"* | **Data ** | Dữ liệu nhật ký thô  được máy chủ ghi nhận trực tiếp từ sự kiện đơn lẻ, chưa qua tổng hợp. |
| **(c)** *"Hôm nay hệ thống ghi nhận 8 sự cố, trong đó 4 sự cố đến từ trạm sensor-03."* | **Information ** | Dữ liệu đã được lọc, đếm và tổng hợp có ngữ cảnh để trả lời câu hỏi *Ai / Cái gì / Bao nhiêu*. |
| **(d)** *"Trạm sensor-03 hay mất kết nối vào buổi chiều do sóng yếu, nên cần lắp thêm anten."* | **Knowledge (Tri thức)** | Kết nối thông tin với kinh nghiệm/quy luật vận hành để tìm ra nguyên nhân gốc rễ  và giải pháp kỹ thuật . |
| **(a)** *"Quyết định thay modem trạm sensor-03 trước thứ Sáu."* | **Wisdom ** | Hành động ra quyết định quản trị cụ thể có mục tiêu và thời hạn  rõ ràng để xử lý triệt để vấn đề trong tương lai. |

---

## 5. Bẫy phần cứng: Tính thời gian tải file log

**Bài toán:** Tải file log dung lượng **500 MB** qua đường truyền mạng tốc độ **100 Mbps** mất bao lâu?

* **Bước 1: Quy đổi đơn vị tốc độ mạng từ Mbps (Megabits/giây) sang MB/s (Megabytes/giây)**
  Vì $1\text{ Byte} = 8\text{ bits}$ (hệ số quy đổi là $8$), tốc độ tải thực tế tính theo Megabyte mỗi giây là:
  $$\text{Tốc độ (MB/s)} = \frac{100\text{ Mbps}}{8} = 12.5\text{ MB/s}$$

* **Bước 2: Tính thời gian tải file log 500 MB**
  $$\text{Thời gian tải (giây)} = \frac{\text{Dung lượng file (MB)}}{\text{Tốc độ mạng (MB/s)}} = \frac{500\text{ MB}}{12.5\text{ MB/s}} = 40\text{ giây}$$

* **Kết quả:** Thời gian tải xong file log 500 MB qua mạng 100 Mbps (trong điều kiện lý tưởng) là **40 giây**.
