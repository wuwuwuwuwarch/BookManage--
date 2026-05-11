# 图书管理系统 (BookManage)

基于 **Spring Boot 3.3.5 + MyBatis + JSP + AdminLTE 2** 构建的图书管理 Web 应用，提供图书浏览、搜索、后台管理等功能。

---

## 项目简介

本项目是一个面向图书馆或小型书库的图书信息管理系统，采用经典的三层架构（Controller-Service-DAO），前端使用 AdminLTE 2 管理后台模板构建响应式界面，数据存储使用 MySQL 数据库。项目覆盖了图书信息的完整增删改查流程，同时支持图书封面图片上传、按书名/类型模糊搜索、批量删除等实用功能。

项目视角覆盖两类用户：

- **普通访客**：访问首页即可浏览全部图书，支持按条件和类型检索图书信息
- **管理员**：登录后台后可进行图书的添加、编辑、删除等管理操作

---

## 技术栈

| 分类 | 技术 | 版本 |
|------|------|------|
| 后端框架 | Spring Boot | 3.3.5 |
| ORM 框架 | MyBatis | 3.0.3 |
| 数据库 | MySQL | 8.0 |
| 数据库连接池 | Alibaba Druid | 1.1.20 |
| 视图技术 | JSP + JSTL | 3.0 |
| Java 版本 | Java | 23 |
| 构建工具 | Maven | 3.9.9 |
| 前端模板 | AdminLTE 2 (Bootstrap 3) | 2.x |
| 前端脚本 | jQuery | 2.2.3 |

---

## 功能特性

### 游客功能
- **图书浏览**：首页以卡片缩略图形式展示所有图书，包含封面、书名、作者等信息
- **图书搜索**：支持按书名模糊搜索和按图书类型筛选，组合查询结果实时展示
- **管理员入口**：页面顶部提供管理员登录导航链接

### 管理员功能
- **身份认证**：基于 Session 的登录校验，保障后台操作安全
- **图书管理**：
  - **查看列表**：后台表格视图展示所有图书，含 ISBN、书名、类型、作者、价格、出版社、出版日期等字段
  - **添加图书**：填写完整图书信息并上传封面图片，支持 10MB 以内文件
  - **编辑图书**：通过 ISBN 检索图书并修改信息，可更换封面
  - **删除图书**：支持批量勾选删除，删除前弹出确认对话框
- **登出**：安全销毁当前会话

---

## 数据库设计

### 表结构

**book 表**（图书表）

| 字段 | 类型 | 说明 |
|------|------|------|
| isbn | VARCHAR(255) | ISBN 编号（主键） |
| title | VARCHAR(255) | 书名 |
| type_id | INT | 图书类型 ID（外键） |
| author | VARCHAR(255) | 作者 |
| introduction | TEXT | 图书简介 |
| price | DECIMAL | 价格 |
| publisher | VARCHAR(255) | 出版社 |
| photo | VARCHAR(255) | 封面图片路径 |
| publishcationDate | DATE | 出版日期 |

**type 表**（图书类型表）

| 字段 | 类型 | 说明 |
|------|------|------|
| id | INT | 类型 ID（主键） |
| typename | VARCHAR(255) | 类型名称 |

预设图书类型：1-计算机、2-心理、3-教育学

---

## 项目结构

```
src/main/java/com/hstc/springbootbookmanage9135/
├── controller/
│   ├── IndexController.java      # 游客端控制器
│   └── BookController.java       # 管理员控制器
├── service/
│   ├── BookService.java          # 图书业务接口
│   ├── TypeService.java          # 类型业务接口
│   └── impl/
│       ├── BookServiceImpl.java
│       └── TypeServiceImpl.java
├── dao/
│   ├── BookMapper.java
│   └── TypeMapper.java
└── entity/
    ├── Book.java
    └── Type.java

src/main/resources/
├── application.properties        # 应用配置
└── mapper/
    ├── BookMapper.xml
    └── TypeMapper.xml

src/main/webapp/
├── WEB-INF/jsp/                  # JSP 视图文件
├── plugins/                      # 前端插件库
├── cover/                        # 上传封面存放目录
├── css/                          # 样式文件
└── img/                          # 图片资源
```

---

## 快速开始

### 环境要求

- JDK 23+
- Maven 3.9+
- MySQL 8.0+
- Git

### 运行步骤

1. **克隆项目**

```bash
git clone git@github.com:wuwuwuwuwarch/BookManage--.git
```

2. **创建数据库**

在 MySQL 中创建数据库 `bookmanage`，并执行以下建表语句：

```sql
CREATE TABLE type (
  id INT PRIMARY KEY,
  typename VARCHAR(255)
);

CREATE TABLE book (
  isbn VARCHAR(255) PRIMARY KEY,
  title VARCHAR(255),
  type_id INT,
  author VARCHAR(255),
  introduction TEXT,
  price DECIMAL(10,2),
  publisher VARCHAR(255),
  photo VARCHAR(255),
  publishcationDate DATE
);

INSERT INTO type VALUES (1, '计算机'), (2, '心理'), (3, '教育学');
```

3. **修改数据库配置**

编辑 `src/main/resources/application.properties`，修改数据库连接信息：

```properties
spring.datasource.url=jdbc:mysql://localhost:3306/bookmanage?useUnicode=true&characterEncoding=utf-8&serverTimezone=Asia/Shanghai
spring.datasource.username=你的用户名
spring.datasource.password=你的密码
```

4. **启动应用**

```bash
mvn spring-boot:run
```

5. **访问系统**

浏览器打开 `http://localhost:8081/SpringBootBookManage9135/`

- 游客首页：直接访问上述地址
- 管理员登录：点击页面顶部"管理员登录"，用户名 `admin`，密码 `admin`

---

## 注意事项

- 管理员凭据为硬编码（`admin/admin`），生产环境建议集成 Spring Security 等安全框架
- 封面上传存储在本地 `cover/` 目录，生产环境建议迁移至对象存储服务
- 项目集成了 Actuator 监控端点，可通过 `/actuator` 路径访问

---

## License

MIT License
