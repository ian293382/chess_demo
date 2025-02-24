- [ ] **建立虛擬環境**
  - Linux/macOS:  
    `python3 -m venv venv`  
    `source venv/bin/activate`
  <!-- - Windows:  沒有WINDOWS選項 這裡不歡迎
    `python -m venv venv`  
    `venv\Scripts\activate` -->
- [ ] **安裝依賴套件**
  - 確認所有必要套件安裝完成後，執行：  
    `pip freeze > requirements.txt`

## 2. 環境與設定
- [ ] **建立 .env 檔案**
  - 設定專案所需的環境變數（如 SECRET_KEY、資料庫、Redis、Email 設定等）。
- [ ] **更新 .gitignore**
  - 確認 .env、settings_local.py 等敏感檔案不會上傳 GitHub。

## 3. Django 專案與應用程式設定
- [ ] **建立新的 Django 專案**
  - 命令：  
    `django-admin startproject chess_demo .`
- [ ]確保Mysql 資料庫是有運作的好知道目前django是可以用的 
  - # TODO List

## 1. MySQL 資料庫
- [ ] **確認或安裝 MySQL**  
  - 確認能用 `mysql -u root -p` 正常連線。
    - 不能使用則使用下面方式:
        - [ ] **設定 MySQL 帳號與密碼**  
        - 預設 `root` 可能是透過 `auth_socket` 登入，需改為密碼或建立新使用者。  
        - 範例：
            ```
            ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'password';
            FLUSH PRIVILEGES; //刷新
            ```
        - 或建立新使用者：
            ```
            CREATE USER 'django_user'@'localhost' IDENTIFIED BY 'django_pass';
            GRANT ALL PRIVILEGES ON chess_demo.* TO 'django_user'@'localhost';
            FLUSH PRIVILEGES;
            ```
  - 若在 Docker / Kubernetes 上部署 MySQL，請先配置對應的容器或 YAML 檔。

- [ ] **建立資料庫**  
  ```
  CREATE DATABASE chess_demo;
  - 設定setting.py
    ``` 
        DATABASES = {
        'default': {
            'ENGINE': 'django.db.backends.mysql',
            'NAME': 'chess_demo',
            'USER': 'root',        # 或 django_user
            'PASSWORD': 'password',# 或 django_pass
            'HOST': 'localhost',
            'PORT': '3306',
        }
    } or 拿去env.py座隱藏參數設計
- 資料庫遷移正常執行 Django app
    ```
    python manage.py makemigrations 
    python manage.py migrate


- [ ]  - 配置 Dockerfile
  - 環境變數 python3 -i 即可顯示
    ```
    # code object from '/usr/lib/python3.8/__pycache__/sitecustomize.cpython-38.pyc'
        import 'sitecustomize' # <_frozen_importlib_external.SourceFileLoader object at 0x7f4dd83cc5b0>
        import 'site' # <_frozen_importlib_external.SourceFileLoader object at 0x7f4dd83fb640>
        Python 3.8.10 (default, Feb  4 2025, 15:02:54) 
        [GCC 9.4.0] on linux
    ```
  - setting Dockerfile
    ```
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
    ```
  - [ ] 將當前使用者加入 Docker 群組，讓 Docker 指令無需 sudo：
    ```bash
    sudo usermod -aG docker $USER && newgrp docker
- []  - 配置mikube k8s
  - ref:`https://minikube.sigs.k8s.io/docs/start/?arch=%2Fwindows%2Fx86-64%2Fstable%2F.exe+download`
  step1: minikube 安裝
  step2: minikube start => 如果跳出dockerr 權限問題 設定sudo 加入docker
  - [ ] 安裝 kubectl `sudo snap install kubectl --classic` 
  - [ ]

- [ ] **設定 settings.py**
  - 加入 `rest_framework`、`corsheaders`、`djoser` 以及自訂 App。
  - 配置 JWT 認證（使用 djangorestframework-simplejwt）。
  - 加入 Celery、Redis、Email 

- [ ] **建立必要的 App**
  - 例如建立發信功能的 App：  
    `python manage.py startapp mailer`

## 4. 整合 Celery 與 Redis
- [ ] **建立 celery.py**
  - 在專案根目錄建立 celery.py 並設定：

- [ ] **更新 __init__.py**

- [ ] **撰寫 Celery 任務**
  - 在 `mailer/tasks.py` 中建立非同步發信任務：


## 5. 實作發信與 Rate Limiting
- [ ] **撰寫 Rate Limiter 的 View**
  - 在 `mailer/views.py` 中實作：

- [ ] **設定 URL 路由**
  - 在 `mailer/urls.py` 中新增：

## 6. 資料庫設定與遷移
- [ ] **設定 MySQL 資料庫**（在 settings.py 中使用 mysqlclient）
- [ ] **執行遷移**

## 7. 前端整合 (Optional)
- [ ] **選擇前端框架**
  - 如果需要前端，安裝 React.js 或 Vue.js。
- [ ] **安裝 Axios**
  - 使用 npm 安裝：  
    `npm install axios`
- [ ] **整合前端與後端 API**

## 8. 部署與測試
- [ ] **啟動 Django 伺服器**
  - 命令：  
    `python manage.py runserver`
- [ ] **啟動 Celery Worker**
  - 命令：  
    `celery -A chess_demo worker -l info`
- [ ] **測試 API 功能**
  - 透過瀏覽器或 Postman 測試 URL，例如：  
    `http://localhost:8000/mailer/send-email/?email=test@example.com&name=TestUser`

## 9. Docker / Kubernetes 部署 (後續進行)
- [ ] **撰寫 Dockerfile 與 docker-compose.yml**
- [ ] **撰寫 Kubernetes 配置檔**（ConfigMap、Secret、Deployment 等）
- [ ] **測試容器化與集群部署**

## 10. 文件與後續工作
- [ ] **更新 README.md** 其實每次都在更新
- [ ] **撰寫單元測試**
- [ ] **收集反饋並持續改善**

## 11 刪除不該存在的檔案

- [ ] `git filter-repo --path chess_demo/settings.py --invert-paths`
- [ ] `git filter-repo --path env.py --invert-paths`
- [ ] 更新 .gitignore
    ```
    env.py
    ```
    修正setting.py 
- [ ] **強制推送**: `git push origin main --force` 