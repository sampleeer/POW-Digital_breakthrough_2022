# -*- encoding: utf-8 -*-
import xlwt  # Требуемые модули


def txt_xls(filename, xlsname):
    """
         : Функция преобразования текста в xls
         : param filename txt текстовое имя файла,
         : param xlsname представляет преобразованное имя файла Excel
    """
    try:
        f = open(filename)
        xls = xlwt.Workbook()
        # Способ генерации Excel, объявить Excel
        sheet = xls.add_sheet('sheet1', cell_overwrite_ok=True)
        x = 0
        while True:
            # Цикл за строкой, читать текстовый файл
            line = f.readline()
            if not line:
                break # Если контента нет, выйдите из цикла
            for i in range(len(line.split('\t'))):
                item = line.split('\t')[i]
                sheet.write(x, i, item)  # x долгота ячейки, широта ячейки i
            x += 1  # excel начинает новую строку
        f.close()
        xls.save(xlsname)
    # Сохранить файл xls
    except:
        raise


if __name__ == "__main__":
    filename = "D:/gg.txt"
    xlsname = "D:/gg.xlsx"
    txt_xls(filename, xlsname)