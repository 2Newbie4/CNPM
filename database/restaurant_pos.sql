IF DB_ID(N'restaurant_pos') IS NULL
BEGIN
    CREATE DATABASE restaurant_pos;
END
GO

USE restaurant_pos;
GO

IF OBJECT_ID(N'dbo.dishes', N'U') IS NOT NULL
    DROP TABLE dbo.dishes;
GO

IF OBJECT_ID(N'dbo.users', N'U') IS NOT NULL
    DROP TABLE dbo.users;
GO

CREATE TABLE dbo.users (
    id INT IDENTITY(1,1) PRIMARY KEY,
    username VARCHAR(50) NOT NULL UNIQUE,
    password VARCHAR(50) NOT NULL,
    full_name NVARCHAR(100),
    position VARCHAR(50)
);
GO

CREATE TABLE dbo.dishes (
    id INT IDENTITY(1,1) PRIMARY KEY,
    name NVARCHAR(100) NOT NULL,
    type NVARCHAR(50) NOT NULL,
    price DECIMAL(18,2) NOT NULL,
    image NVARCHAR(255),
    description NVARCHAR(MAX),
    status NVARCHAR(20) NOT NULL
);
GO

INSERT INTO dbo.users(username, password, full_name, position)
VALUES ('admin', '123456', N'Nguyễn Văn Quản Lý', 'Manager');
GO

INSERT INTO dbo.dishes(name, type, price, image, description, status)
VALUES
(N'Phở bò', N'Món chính', 65000, N'', N'Phở bò truyền thống', N'Hiện'),
(N'Phở gà', N'Món chính', 55000, N'', N'Phở gà truyền thống', N'Hiện'),
(N'Phở hải sản', N'Món chính', 75000, N'', N'Phở hải sản', N'Ẩn');
GO
