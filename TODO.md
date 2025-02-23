# Django Chess Demo - TODO List
---

## 1. 前置需求

- **Git**：請先安裝 Git 以便從 GitHub clone 專案。
- **Python 3.8 或更高版本**：本專案在 Python 3.8 下可以正常運作。
  - 若你想升級 Python，建議使用 [pyenv](https://github.com/pyenv/pyenv) 或 [Conda](https://docs.conda.io/en/latest/miniconda.html)。
- **pip**：Python 套件管理工具（大多數 Python 安裝都已包含）。
- **(Linux 用戶)**：請確認已安裝 `python3-venv`
  ```bash
  sudo apt-get update
  sudo apt-get install python3-venv
  ```

## 2. Clone 專案

在你想存放專案的目錄下執行：

```
git clone https://github.com/ian293382/django_chess_demo.git
cd django_chess_demo
```
## 3. 建立虛擬環境

```#Linux / macOS
python3 -m venv venv
source venv/bin/activate
```

## 4. 安裝Django 以及相關套件 
```
pip install Django

<!-- ( a libraary us with  authentication and tokens) -->
<!-- https://github.com/sunscrapers/djoser -->
pip install djoser

<!-- ( a lobrary for handling the server headers Cross-Origin Resource Sharing) -->
<!-- https://github.com/encode/django-rest-framework -->
pip install django-rest-framework

<!-- a libraary for handling the server header Cross-Origin Resource Sharing -->
<!-- https://github.com/adamchainz/django-cors-headers -->
pip install django-cors-headers

<!-- install and setting jwt  -->
pip install djangorestframework-simplejwt

<!-- install celery and redis cache  -->
pip install celery
pip install django-redis

<!-- mysqlclient mysqlDB -->
pip install mysqlclient
```

## 5. Create  a new Django project


## 6. Configure the project

## 7. Add Djoser urls to the urls file 