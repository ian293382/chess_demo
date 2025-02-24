# 選擇 Python 3.8-slim 作為基底映像檔（與你在 WSL 使用的版本一致）
FROM python:3.8-slim

# 設定環境變數，讓 Python 輸出不被快取，方便即時查看 log
ENV PYTHONUNBUFFERED 1

# 設定容器內的工作目錄為 /app
WORKDIR /app

# 複製 requirements.txt 到容器的工作目錄
COPY requirements.txt .

# 安裝所有相依套件（--no-cache-dir 用來減少映像檔大小）
RUN pip install --no-cache-dir -r requirements.txt

# 複製專案所有檔案到容器內的工作目錄 /app
COPY . .

# 對外暴露埠號 8000 (Django 開發伺服器預設使用)
EXPOSE 8000

# 預設啟動指令：啟動 Django 開發伺服器，監聽所有介面
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]