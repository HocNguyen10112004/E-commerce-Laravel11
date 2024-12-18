import pandas as pd

# Đọc file complete laptop data0.csv
complete_laptop_data = pd.read_csv('complete laptop data0.csv', encoding='ISO-8859-1')

# Đọc file downloaded.csv
downloaded_data = pd.read_csv('downloaded.csv', encoding='ISO-8859-1')

# Hiển thị dữ liệu
print(complete_laptop_data.columns)
print(downloaded_data.columns)

# Chỉ lấy các cột cần thiết từ complete_laptop_data
columns_to_keep = [
    'name', 'Price', 'Unnamed: 0', 'Color', 'Type', 'Suitable For', 'SSD', 
    'SSD Capacity', 'Weight', 'Processor Brand', 'Processor Name', 
    'Processor Variant', 'RAM', 'RAM Type', 'RAM Frequency', 
    'Graphic Processor', 'Screen Size', 'Screen Resolution', 'Battery Cell'
]
filtered_laptop_data = complete_laptop_data[columns_to_keep]

# Hiển thị dữ liệu đã lọc
print(filtered_laptop_data.head())

# Chuyển đổi giá sang VND
# Xóa dấu ',' và '?' trong chuỗi 'Price' và đổi thành float
filtered_laptop_data['Price'] = filtered_laptop_data['Price'].str.replace(',', '').str.replace('?', '').astype(float)
filtered_laptop_data['Price'] = filtered_laptop_data['Price'] * 299.09

# Hiển thị dữ liệu đã chuyển đổi
print(filtered_laptop_data.head())

# Thêm cột 'brand' bằng cách tách từ đầu tiên trong 'name'
filtered_laptop_data['Brand'] = filtered_laptop_data['name'].str.split().str[0]

# Hiển thị dữ liệu sau khi thêm cột 'brand'
print(filtered_laptop_data.head())

# Hiển thị các giá trị duy nhất trong cột 'brand'
unique_brands = filtered_laptop_data['Brand'].unique()
print(unique_brands)

# Lấy 182 dòng đầu tiên
filtered_laptop_data = filtered_laptop_data.head(182)

# Hiển thị 182 dòng đầu tiên
print(filtered_laptop_data)

# Lọc những dòng có brand là ASUS, HP, Lenovo, DELL, MSI, acer, APPLE, Vaio
brands_to_keep = ['ASUS', 'HP', 'Lenovo', 'DELL', 'MSI', 'acer', 'APPLE', 'Vaio']
filtered_laptop_data_brands = filtered_laptop_data[filtered_laptop_data['Brand'].isin(brands_to_keep)]

# Hiển thị dữ liệu đã lọc theo brand
print(filtered_laptop_data_brands)
# Hiển thị số lượng dòng còn lại sau khi lọc theo brand
print(f"Số lượng dòng còn lại: {len(filtered_laptop_data_brands)}")

# Làm tròn giá lên hàng nghìn
filtered_laptop_data_brands['Price'] = filtered_laptop_data_brands['Price'].apply((lambda x: (int(x) // 100000 + 1) * 100000 if x % 100000 != 0 else int(x)))
filtered_laptop_data_brands['Price'] = filtered_laptop_data_brands['Price'] - 1000

# Hiển thị dữ liệu sau khi làm tròn giá
print(filtered_laptop_data_brands.head())

# In số lượng cột
print(filtered_laptop_data.columns)

# Thêm cột 'Graphic Processor Brand' bằng cách tách từ đầu tiên trong 'Graphic Processor'
filtered_laptop_data_brands['Graphic Processor Brand'] = filtered_laptop_data_brands['Graphic Processor'].str.split().str[0]

# Hiển thị dữ liệu sau khi thêm cột 'Graphic Processor Brand'
print(filtered_laptop_data_brands.head())

# Hiển thị các giá trị duy nhất trong 'Graphic Processor Brand'
unique_graphic_processors = filtered_laptop_data_brands['Graphic Processor Brand'].unique()
print(unique_graphic_processors)

# Hiển thị các giá trị duy nhất trong 'Processor Brand'
unique_processor_brands = filtered_laptop_data_brands['Processor Brand'].unique()
print(unique_processor_brands)
# Lọc bỏ các dòng có 'Graphic Processor' là 'NA' hoặc 'Qualcomm'
filtered_laptop_data_brands = filtered_laptop_data_brands[~filtered_laptop_data_brands['Graphic Processor'].isin(['NA', 'Qualcomm'])]

# Lọc bỏ các dòng có 'Processor Brand' là 'Qualcomm'
filtered_laptop_data_brands = filtered_laptop_data_brands[filtered_laptop_data_brands['Processor Brand'] != 'Qualcomm']

# Hiển thị dữ liệu sau khi lọc
print(filtered_laptop_data_brands.head())

# Hiển thị số lượng dòng còn lại sau khi lọc
print(f"Số lượng dòng còn lại sau khi lọc: {len(filtered_laptop_data_brands)}")

# Đổi tên cột 'Unnamed: 0' thành 'img_dir' và thay giá trị bằng 'img/laptop_' + data['Unnamed: 0'] + '.jpeg'
filtered_laptop_data_brands = filtered_laptop_data_brands.rename(columns={'Unnamed: 0': 'img_dir'})
filtered_laptop_data_brands['img_dir'] = 'C:/xampp/htdocs/E-commerce-Laravel11/resources/img/laptop_images/laptop_' + filtered_laptop_data_brands['img_dir'].astype(str) + '.jpeg'

# Hiển thị dữ liệu sau khi đổi tên và thay giá trị
print(filtered_laptop_data_brands.head())

print(filtered_laptop_data_brands.columns)

# Đưa cột 'Processor Brand' và 'Graphic Processor Brand' ra cuối cùng
columns_order = [col for col in filtered_laptop_data_brands.columns if col not in ['Processor Brand', 'Graphic Processor Brand']]
columns_order += ['Processor Brand', 'Graphic Processor Brand']
filtered_laptop_data_brands = filtered_laptop_data_brands[columns_order]

# Hiển thị dữ liệu sau khi sắp xếp lại cột
print(filtered_laptop_data_brands.head())

# Hiển thị các giá trị duy nhất trong cột 'Type'
unique_types = filtered_laptop_data_brands['Type'].unique()
print(unique_types)

# Đổi tên các giá trị trong cột 'Type'
type_mapping = {
    'Gaming Laptop': 'Laptop Gaming',
    '2 in 1 Gaming Laptop': 'Laptop Gaming',
    'Thin and Light Laptop': 'Laptop Văn phòng',
    'Notebook': 'Laptop Văn phòng',
    '2 in 1 Laptop': 'Laptop 2 trong 1',
    'Business Laptop': 'Laptop Doanh nhân',
    'Laptop': 'Laptop Văn phòng'
}
filtered_laptop_data_brands['Type'] = filtered_laptop_data_brands['Type'].replace(type_mapping)

# Hiển thị dữ liệu sau khi đổi tên
print(filtered_laptop_data_brands['Type'].unique())

# Hiển thị các giá trị duy nhất trong cột 'Brand'
unique_brands = filtered_laptop_data_brands['Brand'].unique()
print(unique_brands)

print(filtered_laptop_data_brands.columns)

# Bỏ cột 'Suitable For' và 'Processor Name'
filtered_laptop_data_brands = filtered_laptop_data_brands.drop(columns=['Suitable For', 'Processor Name'])

# Hiển thị dữ liệu sau khi bỏ cột
print(filtered_laptop_data_brands.head())

# Hiển thị các cột còn lại
print(filtered_laptop_data_brands.columns)

# Kiểm tra cột 'SSD Capacity' xem có giá trị NaN không
nan_ssd_capacity = filtered_laptop_data_brands['SSD Capacity'].isna().sum()
print(f"Số lượng giá trị NaN trong cột 'SSD Capacity': {nan_ssd_capacity}")

# Gom các cột thành 1 cột duy nhất là 'context'
filtered_laptop_data_brands['context'] = (
    'CPU: ' + 
    filtered_laptop_data_brands['Processor Variant'].fillna('Không có') + '\n' +
    'GPU: ' +
    filtered_laptop_data_brands['Graphic Processor'].fillna('Không có') + '\n' +
    'RAM: ' +
    filtered_laptop_data_brands['RAM'].fillna('Không có') + ' ' +
    filtered_laptop_data_brands['RAM Type'].fillna('Không có') + ' ' +
    filtered_laptop_data_brands['RAM Frequency'].fillna('Không có') + '\n' +
    'SSD: ' +
    filtered_laptop_data_brands['SSD Capacity'].fillna('Không có') + '\n' +
    'Màn hình: ' +
    filtered_laptop_data_brands['Screen Size'].fillna('Không có') + ' ' +
    filtered_laptop_data_brands['Screen Resolution'].fillna('Không có') + '\n' +
    'Pin: ' +
    filtered_laptop_data_brands['Battery Cell'].fillna('Không có') + '\n' +
    'Màu sắc: '+
    filtered_laptop_data_brands['Color'].fillna('Không có') + '\n' +
    'Trọng lượng: ' +
    filtered_laptop_data_brands['Weight'].fillna('Không có')
)

# Hiển thị dữ liệu sau khi thêm cột 'context'
print(filtered_laptop_data_brands[['context']].head())

# Xóa các cột đã gộp
columns_to_drop = [
    'Processor Variant', 'Graphic Processor', 'RAM', 'RAM Type', 
    'RAM Frequency', 'SSD Capacity', 'Screen Size', 
    'Screen Resolution', 'Battery Cell', 'Color', 'Weight'
]
filtered_laptop_data_brands = filtered_laptop_data_brands.drop(columns=columns_to_drop)

# Hiển thị dữ liệu sau khi xóa các cột đã gộp
print(filtered_laptop_data_brands.head())

# Hiển thị các cột còn lại
print(filtered_laptop_data_brands.columns)

# Bỏ cột 'SSD'
filtered_laptop_data_brands = filtered_laptop_data_brands.drop(columns=['SSD'])

# Đưa cột 'context' lên trước cột 'Processor Brand'
columns_order = [col for col in filtered_laptop_data_brands.columns if col != 'context']
columns_order.insert(columns_order.index('Processor Brand'), 'context')
filtered_laptop_data_brands = filtered_laptop_data_brands[columns_order]

# Hiển thị dữ liệu sau khi sắp xếp lại cột
print(filtered_laptop_data_brands.columns)

# Thêm cột 'desc' trước cột 'context' với tất cả giá trị gán bằng "Bài review về laptop"
filtered_laptop_data_brands.insert(filtered_laptop_data_brands.columns.get_loc('context'), 'desc', 'Bài review về laptop')

# Hiển thị dữ liệu sau khi thêm cột 'desc'
print(filtered_laptop_data_brands.head())
print(filtered_laptop_data_brands.columns)

# Thêm cột 'show' sau cột 'context' với tất cả giá trị gán bằng 1
filtered_laptop_data_brands.insert(filtered_laptop_data_brands.columns.get_loc('context') + 1, 'show', 1)

# Hiển thị dữ liệu sau khi thêm cột 'show'
print(filtered_laptop_data_brands.head())
print(filtered_laptop_data_brands.columns)

# Đổi giá trị trong cột 'Type'
type_value_mapping = {
    'Laptop Gaming': 26,
    'Laptop Văn phòng': 28,
    'Laptop 2 trong 1': 29,
    'Laptop Doanh nhân': 30
}
filtered_laptop_data_brands['Type'] = filtered_laptop_data_brands['Type'].replace(type_value_mapping)

# Hiển thị dữ liệu sau khi đổi giá trị
print(filtered_laptop_data_brands['Type'].unique())

# Đổi giá trị trong cột 'Brand'
brand_value_mapping = {
    'MSI': 4,
    'DELL': 5,
    'Lenovo': 6,
    'HP': 7,
    'ASUS': 8,
    'acer': 9
}
filtered_laptop_data_brands['Brand'] = filtered_laptop_data_brands['Brand'].replace(brand_value_mapping)

# Hiển thị dữ liệu sau khi đổi giá trị
print(filtered_laptop_data_brands['Brand'].unique())

# Xuất 1 dòng đầu tiên ra file Excel
filtered_laptop_data_brands.head(1).to_excel('first_row_filtered_laptop_data_brands.xlsx', index=False)
# Xuất dữ liệu ra file Excel mà không có header
filtered_laptop_data_brands.to_excel('filtered_laptop_data_brands.xlsx', index=False, header=False)