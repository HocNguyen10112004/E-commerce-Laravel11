from selenium import webdriver
from selenium.webdriver.common.by import By
from bs4 import BeautifulSoup
import os
import requests
import re
import time
from selenium.webdriver.edge.service import Service
import csv

# Tạo thư mục để lưu ảnh nếu chưa có
if not os.path.exists('laptop_images'):
    os.makedirs('laptop_images')

# Đường dẫn đến Edge WebDriver
driver_path = "C:/Users/ASUS/Downloads/edgedriver_win64/msedgedriver.exe"

# Đọc dữ liệu từ file CSV
csv_file_path = 'complete laptop data0.csv'
urls = []

with open(csv_file_path, newline='') as csvfile:
    csvreader = csv.reader(csvfile)
    next(csvreader)  # Bỏ qua dòng tiêu đề nếu có
    for row in csvreader:
        urls.append(row[1])  # Lấy cột thứ 2 là URL

# Khởi tạo dịch vụ và WebDriver
service = Service(driver_path)
driver = webdriver.Edge(service=service)

# Biến để đánh số ảnh
index = 0

# Duyệt qua từng URL trong danh sách
for url in urls:
    print(f"Processing URL: {url}")
    driver.get(url)  # Mở trang web
    try:
        driver.get(url)  # Mở trang web
    except Exception as e:
        with open('error_log.txt', 'a', encoding='utf-8') as log_file:
            log_file.write(f"Failed to load URL {url}: {e}\n")
        continue
    time.sleep(5)  # Chờ trang tải đầy đủ
    
    # Lấy mã HTML sau khi trang đã tải
    html = driver.page_source
    soup = BeautifulSoup(html, 'html.parser')

    # Tìm tất cả thẻ <img> trên trang (lọc ảnh có kích thước phù hợp)
    img_tags = soup.find_all('img')
    img_tags = [img for img in img_tags if '416' in img.get('src', '')]  # Lọc ảnh kích thước 416x416

    if img_tags:  # Kiểm tra có ảnh hợp lệ
        img = img_tags[0]  # Chỉ lấy ảnh đầu tiên
        img_url = img.get('src')  # Lấy đường dẫn ảnh
        print(f"Image URL: {img_url}")

        if img_url:
            # Loại bỏ các ký tự không hợp lệ từ tên ảnh
            img_name = os.path.basename(img_url)
            img_name = re.sub(r'[^\w\s.-]', '_', img_name)  # Thay thế ký tự không hợp lệ
            img_name = os.path.join('laptop_images', f"laptop_{index}.jpeg")
            index += 1

            try:
                # Tải ảnh
                img_response = requests.get(img_url)
                with open(img_name, 'wb') as f:
                    f.write(img_response.content)
                print(f'Downloaded: {img_name}')
                with open('downloaded.csv', 'a', newline='', encoding='utf-8') as csvfile:
                    csvwriter = csv.writer(csvfile)
                    csvwriter.writerow([index, img_name])
            except Exception as e:
                print(f'Failed to download {img_url}: {e}')
                with open('error_log.txt', 'a', encoding='utf-8') as log_file:
                    log_file.write(f"Failed to download image from {img_url}: {e}\n")
    else:
        with open('error_log.txt', 'a', encoding='utf-8') as log_file:
            log_file.write(f"No valid image found on URL {url}\n")

# Đóng trình duyệt
driver.quit()
