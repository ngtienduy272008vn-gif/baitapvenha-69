# Phần 1: Phân tích lỗi

## 1. Xác định lỗi cấu trúc và cơ chế quét của Auto TOC

-   **Lỗi cụ thể của 7 dòng tiêu đề:** Tất cả các tiêu đề trong file  đang sử dụng kiểu định dạng thủ công  thay vì gán nhãn kiểu cấu trúc có sẵn 
    
-   **Cơ chế hoạt động của tính năng quét tiêu đề:** Tính năng Mục lục tự động  trong các trình soạn thảo văn bản  không nhận diện tiêu đề dựa trên hình thức trực quan . Thay vào đó, nó hoạt động bằng cách quét các đoạn văn bản được áp dụng sẵn các thẻ cấp độ cấu trúc logic
## 2. Tại sao việc nhầm H2 sang H3 hay ngược lại sẽ làm mục lục trông sai lệch về mặt thụt đầu dòng?
- Nếu dòng H2 bị nhầm thành H3 , mục lục sẽ hiểu nhầm đây là một đề mục lớn ngang hàng với mục chính thay vì cấp con. Điều này khiến cấu trúc thụt đầu dòng bị lệch , làm mất đi tính logic phân cấp  của một tài liệu kỹ thuật chuẩn.
# Phần 2: Sửa lỗi & Nghiệm thu

## 3. Các bước sửa cấu trúc Heading


1.  **Dòng 1 ,4,7:** Bôi đen dòng tiêu đề →\rightarrow→ Gán nhãn Heading 1
    
2.  **Dòng 2 ,3,5:** Bôi đen dòng tiêu đề →\rightarrow→ Gán nhãn Heading 2
    

6.  **Dòng 6 :** Bôi đen dòng tiêu đề →\rightarrow→ Gán nhãn đúng cấp chi tiết là Heading 3
    

    

-   **Cập nhật mục lục:** Sau khi định dạng xong, đặt chuột tại vị trí trang đầu tiên, chọn thẻ References→\rightarrow→ Update Table →\rightarrow→ Chọn Update entire table để Auto TOC quét lại và hiển thị đầy đủ 3 cấp cấu trúc.
    

## 4. Xử lý bẫy dữ liệu về số trang trong mục lục


-   **Thao tác xử lý và phím tắt:** Cần thực hiện cập nhật lại trường dữ liệu (Field) của mục lục.
    
    -   **Cách làm:** Nhấp chuột vào vùng chứa Mục lục →\rightarrow→ Chọn Update Table 
    -   **Phím tắt nhanh :** Chọn toàn bộ khung mục lục bằng cách click vào nó và nhấn phím `F9` , sau đó chọn Update entire table rồi nhấn _OK_.
