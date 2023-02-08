import openpyxl


def add_to_excel(file_name, sheet_name, data):
    workbook = openpyxl.Workbook()
    sheet = workbook.active
    sheet.title = sheet_name

    for i in range(len(data[0])):
        for j in range(len(data)):
            sheet.cell(row=i + 1, column=j + 1, value=data[j][i])

    workbook.save(file_name)


# Example usage
data = [['Search', 'News', 'Blog', 'Recently viewed products', 'Compare products list', 'New products'],
        ['Sitemap', 'Shipping & returns', 'Privacy notice', 'Conditions of Use', 'About us', 'Contact us'],
        ['My account', 'Orders', 'Addresses', 'Shopping cart', 'Wishlist', 'Apply for vendor account']]
add_to_excel("example.xlsx", "Sheet1", data)
