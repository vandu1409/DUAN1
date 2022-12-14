USE [master]
GO
/****** Object:  Database [phonestore_duan1]    Script Date: 12/9/2022 3:22:43 PM ******/
CREATE DATABASE [phonestore_duan1]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'phonestore_duan1', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\phonestore_duan1.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'phonestore_duan1_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\phonestore_duan1_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [phonestore_duan1] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [phonestore_duan1].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [phonestore_duan1] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [phonestore_duan1] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [phonestore_duan1] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [phonestore_duan1] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [phonestore_duan1] SET ARITHABORT OFF 
GO
ALTER DATABASE [phonestore_duan1] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [phonestore_duan1] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [phonestore_duan1] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [phonestore_duan1] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [phonestore_duan1] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [phonestore_duan1] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [phonestore_duan1] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [phonestore_duan1] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [phonestore_duan1] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [phonestore_duan1] SET  DISABLE_BROKER 
GO
ALTER DATABASE [phonestore_duan1] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [phonestore_duan1] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [phonestore_duan1] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [phonestore_duan1] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [phonestore_duan1] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [phonestore_duan1] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [phonestore_duan1] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [phonestore_duan1] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [phonestore_duan1] SET  MULTI_USER 
GO
ALTER DATABASE [phonestore_duan1] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [phonestore_duan1] SET DB_CHAINING OFF 
GO
ALTER DATABASE [phonestore_duan1] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [phonestore_duan1] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [phonestore_duan1] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [phonestore_duan1] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [phonestore_duan1] SET QUERY_STORE = OFF
GO
USE [phonestore_duan1]
GO
/****** Object:  Table [dbo].[Brand]    Script Date: 12/9/2022 3:22:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Brand](
	[id] [nvarchar](50) NOT NULL,
	[name] [nvarchar](100) NULL,
 CONSTRAINT [PK_Company] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 12/9/2022 3:22:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[customerId] [nvarchar](50) NOT NULL,
	[fullname] [nvarchar](50) NULL,
	[phone] [nvarchar](50) NULL,
	[email] [nvarchar](50) NULL,
	[gender] [bit] NULL,
	[birthday] [date] NULL,
	[createdate] [date] NULL,
	[address] [nvarchar](200) NULL,
	[notes] [nvarchar](300) NULL,
	[purchaseTimes] [int] NULL,
 CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED 
(
	[customerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetalis]    Script Date: 12/9/2022 3:22:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetalis](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[productId] [nvarchar](50) NOT NULL,
	[orderId] [nvarchar](50) NOT NULL,
	[quatity] [int] NOT NULL,
	[totalPrice] [float] NOT NULL,
 CONSTRAINT [PK_OrderDetalis] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 12/9/2022 3:22:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[orderId] [nvarchar](50) NOT NULL,
	[total] [float] NULL,
	[createDate] [date] NULL,
	[customerId] [nvarchar](50) NULL,
	[voucherCode] [nvarchar](50) NULL,
	[discount] [float] NULL,
	[memberDiscount] [float] NULL,
	[status] [nvarchar](50) NULL,
	[creator] [nvarchar](50) NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[orderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 12/9/2022 3:22:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[productId] [nvarchar](50) NOT NULL,
	[title] [nvarchar](100) NULL,
	[image] [nvarchar](500) NULL,
	[price] [float] NULL,
	[importprice] [float] NULL,
	[ram] [int] NULL,
	[rom] [int] NULL,
	[quatity] [int] NULL,
	[color] [nvarchar](50) NULL,
	[companyId] [nvarchar](50) NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[productId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Salary]    Script Date: 12/9/2022 3:22:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Salary](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[userId] [nvarchar](50) NULL,
	[basicSalary] [float] NULL,
	[commission] [float] NULL,
	[advanceSalary] [float] NULL,
	[salaryDeducted] [float] NULL,
	[bonus] [float] NULL,
	[startDate] [date] NULL,
	[endDate] [date] NULL,
	[numberDay] [float] NULL,
	[totalSalary] [float] NULL,
	[receivedDate] [date] NULL,
	[notes] [nvarchar](300) NULL,
 CONSTRAINT [PK_Salary] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 12/9/2022 3:22:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[username] [nvarchar](50) NOT NULL,
	[password] [nvarchar](50) NOT NULL,
	[email] [nvarchar](50) NOT NULL,
	[image] [nvarchar](200) NULL,
	[fullname] [nvarchar](50) NULL,
	[gender] [bit] NULL,
	[role] [bit] NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Vouchers]    Script Date: 12/9/2022 3:22:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Vouchers](
	[voucherCode] [nvarchar](50) NOT NULL,
	[name] [nvarchar](100) NULL,
	[discountByPrice] [float] NULL,
	[discountByPercent] [float] NULL,
	[startDate] [date] NULL,
	[endDate] [date] NULL,
	[amountApplied] [float] NULL,
	[maximumAmount] [float] NULL,
	[notes] [nvarchar](300) NULL,
 CONSTRAINT [PK_Vouchers] PRIMARY KEY CLUSTERED 
(
	[voucherCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Brand] ([id], [name]) VALUES (N'APLLE', N'IPHONE')
INSERT [dbo].[Brand] ([id], [name]) VALUES (N'OPPO', N'OPPO')
INSERT [dbo].[Brand] ([id], [name]) VALUES (N'REALME', N'REALME')
INSERT [dbo].[Brand] ([id], [name]) VALUES (N'SAMSUNG', N'SAMSUNG')
INSERT [dbo].[Brand] ([id], [name]) VALUES (N'VIVO', N'VIVO')
INSERT [dbo].[Brand] ([id], [name]) VALUES (N'XIAOMI', N'XIAOMI')
GO
INSERT [dbo].[Customer] ([customerId], [fullname], [phone], [email], [gender], [birthday], [createdate], [address], [notes], [purchaseTimes]) VALUES (N'KH136455', N'Phạm Anh Tuấn', N'0912658989', N'anhtuan@gmail.com', 1, CAST(N'2011-08-07' AS Date), CAST(N'2022-11-20' AS Date), N'Đà Nẵng', N'', 10)
INSERT [dbo].[Customer] ([customerId], [fullname], [phone], [email], [gender], [birthday], [createdate], [address], [notes], [purchaseTimes]) VALUES (N'KH517638', N'Nguyễn Văn Bình', N'0374889596', N'vanbinh7896@gmail.com', 1, CAST(N'2002-11-16' AS Date), CAST(N'2022-11-19' AS Date), N'Đà Nẵng', N'Khoảng 20 tuổi', 11)
INSERT [dbo].[Customer] ([customerId], [fullname], [phone], [email], [gender], [birthday], [createdate], [address], [notes], [purchaseTimes]) VALUES (N'KH85351', N'Trần Anh Huy', N'0912989654', N'anhhuy@gmail.com', 1, CAST(N'2000-11-08' AS Date), CAST(N'2022-11-20' AS Date), N'Đà Nẵng', N'', 3)
INSERT [dbo].[Customer] ([customerId], [fullname], [phone], [email], [gender], [birthday], [createdate], [address], [notes], [purchaseTimes]) VALUES (N'KH91618', N'Nguyễn Trần Anh', N'0912656989', N'anhtran234@gmail.com', 1, CAST(N'2000-12-01' AS Date), CAST(N'2022-12-01' AS Date), N'Đà Nẵng', N'', 1)
GO
SET IDENTITY_INSERT [dbo].[OrderDetalis] ON 

INSERT [dbo].[OrderDetalis] ([id], [productId], [orderId], [quatity], [totalPrice]) VALUES (70, N'SP2', N'HD407519', 1, 16000000)
INSERT [dbo].[OrderDetalis] ([id], [productId], [orderId], [quatity], [totalPrice]) VALUES (71, N'SP4', N'HD726700', 2, 25000000)
INSERT [dbo].[OrderDetalis] ([id], [productId], [orderId], [quatity], [totalPrice]) VALUES (73, N'SP15', N'HD721125', 1, 5499000)
INSERT [dbo].[OrderDetalis] ([id], [productId], [orderId], [quatity], [totalPrice]) VALUES (75, N'SP11', N'HD363009', 2, 23000000)
INSERT [dbo].[OrderDetalis] ([id], [productId], [orderId], [quatity], [totalPrice]) VALUES (77, N'SP13', N'HD157334', 1, 14999000)
INSERT [dbo].[OrderDetalis] ([id], [productId], [orderId], [quatity], [totalPrice]) VALUES (79, N'SP12', N'HD906488', 1, 9500000)
INSERT [dbo].[OrderDetalis] ([id], [productId], [orderId], [quatity], [totalPrice]) VALUES (82, N'SP11', N'HD216918', 1, 11500000)
INSERT [dbo].[OrderDetalis] ([id], [productId], [orderId], [quatity], [totalPrice]) VALUES (83, N'SP11', N'HD773744', 1, 11500000)
INSERT [dbo].[OrderDetalis] ([id], [productId], [orderId], [quatity], [totalPrice]) VALUES (84, N'SP11', N'HD198186', 2, 23000000)
INSERT [dbo].[OrderDetalis] ([id], [productId], [orderId], [quatity], [totalPrice]) VALUES (85, N'SP8', N'HD198186', 1, 6500000)
INSERT [dbo].[OrderDetalis] ([id], [productId], [orderId], [quatity], [totalPrice]) VALUES (86, N'SP10', N'HD621696', 1, 10500000)
INSERT [dbo].[OrderDetalis] ([id], [productId], [orderId], [quatity], [totalPrice]) VALUES (88, N'SP11', N'HD844131', 1, 11500000)
INSERT [dbo].[OrderDetalis] ([id], [productId], [orderId], [quatity], [totalPrice]) VALUES (90, N'SP12', N'HD391129', 1, 9500000)
INSERT [dbo].[OrderDetalis] ([id], [productId], [orderId], [quatity], [totalPrice]) VALUES (95, N'SP12', N'HD942909', 2, 19000000)
INSERT [dbo].[OrderDetalis] ([id], [productId], [orderId], [quatity], [totalPrice]) VALUES (96, N'SP7', N'HD660922', 2, 36000000)
INSERT [dbo].[OrderDetalis] ([id], [productId], [orderId], [quatity], [totalPrice]) VALUES (97, N'SP12', N'HD45802', 2, 19000000)
INSERT [dbo].[OrderDetalis] ([id], [productId], [orderId], [quatity], [totalPrice]) VALUES (98, N'SP14', N'HD988879', 1, 15999000)
INSERT [dbo].[OrderDetalis] ([id], [productId], [orderId], [quatity], [totalPrice]) VALUES (121, N'SP12', N'HD581022', 1, 9500000)
INSERT [dbo].[OrderDetalis] ([id], [productId], [orderId], [quatity], [totalPrice]) VALUES (122, N'SP11', N'HD581022', 1, 11500000)
INSERT [dbo].[OrderDetalis] ([id], [productId], [orderId], [quatity], [totalPrice]) VALUES (123, N'SP12', N'HD99327', 1, 9500000)
INSERT [dbo].[OrderDetalis] ([id], [productId], [orderId], [quatity], [totalPrice]) VALUES (124, N'SP2', N'HD99327', 1, 16000000)
INSERT [dbo].[OrderDetalis] ([id], [productId], [orderId], [quatity], [totalPrice]) VALUES (125, N'SP15', N'HD99327', 1, 5499000)
INSERT [dbo].[OrderDetalis] ([id], [productId], [orderId], [quatity], [totalPrice]) VALUES (126, N'SP5', N'HD618070', 2, 25000000)
INSERT [dbo].[OrderDetalis] ([id], [productId], [orderId], [quatity], [totalPrice]) VALUES (128, N'SP10', N'HD603711', 1, 10500000)
INSERT [dbo].[OrderDetalis] ([id], [productId], [orderId], [quatity], [totalPrice]) VALUES (129, N'SP5', N'HD603711', 1, 12500000)
INSERT [dbo].[OrderDetalis] ([id], [productId], [orderId], [quatity], [totalPrice]) VALUES (132, N'SP11', N'HD622185', 1, 11500000)
INSERT [dbo].[OrderDetalis] ([id], [productId], [orderId], [quatity], [totalPrice]) VALUES (133, N'SP10', N'HD364050', 1, 10500000)
INSERT [dbo].[OrderDetalis] ([id], [productId], [orderId], [quatity], [totalPrice]) VALUES (134, N'SP5', N'HD695530', 1, 12500000)
INSERT [dbo].[OrderDetalis] ([id], [productId], [orderId], [quatity], [totalPrice]) VALUES (135, N'SP12', N'HD452703', 6, 57000000)
INSERT [dbo].[OrderDetalis] ([id], [productId], [orderId], [quatity], [totalPrice]) VALUES (136, N'SP11', N'HD296981', 1, 11500000)
INSERT [dbo].[OrderDetalis] ([id], [productId], [orderId], [quatity], [totalPrice]) VALUES (137, N'SP11', N'HD262449', 1, 11500000)
INSERT [dbo].[OrderDetalis] ([id], [productId], [orderId], [quatity], [totalPrice]) VALUES (138, N'SP12', N'HD262449', 1, 9500000)
SET IDENTITY_INSERT [dbo].[OrderDetalis] OFF
GO
INSERT [dbo].[Orders] ([orderId], [total], [createDate], [customerId], [voucherCode], [discount], [memberDiscount], [status], [creator]) VALUES (N'HD157334', 14749000, CAST(N'2022-11-19' AS Date), N'KH517638', N'TETDUONGLICH112023', 50000, 200000, N'Đã thanh toán', N'vandu')
INSERT [dbo].[Orders] ([orderId], [total], [createDate], [customerId], [voucherCode], [discount], [memberDiscount], [status], [creator]) VALUES (N'HD198186', 29000000, CAST(N'2022-11-20' AS Date), N'KH517638', N'THANG11SIEUSALE123', 300000, 200000, N'Đã thanh toán', N'vandu')
INSERT [dbo].[Orders] ([orderId], [total], [createDate], [customerId], [voucherCode], [discount], [memberDiscount], [status], [creator]) VALUES (N'HD216918', 11500000, CAST(N'2022-11-20' AS Date), N'KH85351', NULL, 0, 0, N'Đã thanh toán', N'vandu')
INSERT [dbo].[Orders] ([orderId], [total], [createDate], [customerId], [voucherCode], [discount], [memberDiscount], [status], [creator]) VALUES (N'HD262449', 20501000, CAST(N'2022-12-07' AS Date), N'KH136455', N'THANG12UUDAICUINAM', 299000, 200000, N'Đã thanh toán', N'vandu')
INSERT [dbo].[Orders] ([orderId], [total], [createDate], [customerId], [voucherCode], [discount], [memberDiscount], [status], [creator]) VALUES (N'HD296981', 11385000, CAST(N'2022-12-07' AS Date), N'KH136455', NULL, 0, 115000, N'Chưa thanh toán', N'vandu')
INSERT [dbo].[Orders] ([orderId], [total], [createDate], [customerId], [voucherCode], [discount], [memberDiscount], [status], [creator]) VALUES (N'HD363009', 22950000, CAST(N'2022-11-19' AS Date), N'KH517638', N'TETDUONGLICH112023', 50000, 0, N'Đã thanh toán', N'vandu')
INSERT [dbo].[Orders] ([orderId], [total], [createDate], [customerId], [voucherCode], [discount], [memberDiscount], [status], [creator]) VALUES (N'HD364050', 10096000, CAST(N'2022-12-03' AS Date), N'KH136455', N'THANG12UUDAICUINAM', 299000, 105000, N'Đã thanh toán', N'vandu')
INSERT [dbo].[Orders] ([orderId], [total], [createDate], [customerId], [voucherCode], [discount], [memberDiscount], [status], [creator]) VALUES (N'HD391129', 9250000, CAST(N'2022-11-20' AS Date), N'KH517638', N'TETDUONGLICH112023', 50000, 200000, N'Đã thanh toán', N'vandu')
INSERT [dbo].[Orders] ([orderId], [total], [createDate], [customerId], [voucherCode], [discount], [memberDiscount], [status], [creator]) VALUES (N'HD407519', 15950000, CAST(N'2022-11-19' AS Date), N'KH517638', N'TETDUONGLICH112023', 50000, 0, N'Đã thanh toán', N'vandu')
INSERT [dbo].[Orders] ([orderId], [total], [createDate], [customerId], [voucherCode], [discount], [memberDiscount], [status], [creator]) VALUES (N'HD452703', 56501000, CAST(N'2022-12-07' AS Date), N'KH517638', N'THANG12UUDAICUINAM', 299000, 200000, N'Đã thanh toán', N'vandu')
INSERT [dbo].[Orders] ([orderId], [total], [createDate], [customerId], [voucherCode], [discount], [memberDiscount], [status], [creator]) VALUES (N'HD45802', 18950000, CAST(N'2022-11-21' AS Date), N'KH136455', N'TETDUONGLICH112023', 50000, 0, N'Đã thanh toán', N'vandu')
INSERT [dbo].[Orders] ([orderId], [total], [createDate], [customerId], [voucherCode], [discount], [memberDiscount], [status], [creator]) VALUES (N'HD581022', 20800000, CAST(N'2022-11-25' AS Date), N'KH136455', NULL, 0, 200000, N'Đã thanh toán', N'vandu')
INSERT [dbo].[Orders] ([orderId], [total], [createDate], [customerId], [voucherCode], [discount], [memberDiscount], [status], [creator]) VALUES (N'HD603711', 22701000, CAST(N'2022-12-01' AS Date), N'KH91618', N'THANG12UUDAICUINAM', 299000, 0, N'Đã thanh toán', N'vandu')
INSERT [dbo].[Orders] ([orderId], [total], [createDate], [customerId], [voucherCode], [discount], [memberDiscount], [status], [creator]) VALUES (N'HD618070', 24501000, CAST(N'2022-12-01' AS Date), N'KH517638', N'THANG12UUDAICUINAM', 299000, 200000, N'Đã thanh toán', N'vandu')
INSERT [dbo].[Orders] ([orderId], [total], [createDate], [customerId], [voucherCode], [discount], [memberDiscount], [status], [creator]) VALUES (N'HD621696', 10300000, CAST(N'2022-11-20' AS Date), N'KH517638', NULL, 0, 200000, N'Đã thanh toán', N'vandu')
INSERT [dbo].[Orders] ([orderId], [total], [createDate], [customerId], [voucherCode], [discount], [memberDiscount], [status], [creator]) VALUES (N'HD622185', 11001000, CAST(N'2022-12-01' AS Date), N'KH136455', N'THANG12UUDAICUINAM', 299000, 200000, N'Đã thanh toán', N'vandu')
INSERT [dbo].[Orders] ([orderId], [total], [createDate], [customerId], [voucherCode], [discount], [memberDiscount], [status], [creator]) VALUES (N'HD660922', 35950000, CAST(N'2022-11-21' AS Date), N'KH136455', N'TETDUONGLICH112023', 50000, 0, N'Đã thanh toán', N'vandu')
INSERT [dbo].[Orders] ([orderId], [total], [createDate], [customerId], [voucherCode], [discount], [memberDiscount], [status], [creator]) VALUES (N'HD695530', 12375000, CAST(N'2022-12-03' AS Date), N'KH136455', NULL, 0, 125000, N'Đã thanh toán', N'vandu')
INSERT [dbo].[Orders] ([orderId], [total], [createDate], [customerId], [voucherCode], [discount], [memberDiscount], [status], [creator]) VALUES (N'HD721125', 5449000, CAST(N'2022-11-19' AS Date), N'KH517638', N'TETDUONGLICH112023', 50000, 0, N'Đã thanh toán', N'vandu')
INSERT [dbo].[Orders] ([orderId], [total], [createDate], [customerId], [voucherCode], [discount], [memberDiscount], [status], [creator]) VALUES (N'HD726700', 24950000, CAST(N'2022-11-19' AS Date), N'KH517638', N'TETDUONGLICH112023', 50000, 0, N'Đã thanh toán', N'vandu')
INSERT [dbo].[Orders] ([orderId], [total], [createDate], [customerId], [voucherCode], [discount], [memberDiscount], [status], [creator]) VALUES (N'HD773744', 11500000, CAST(N'2022-11-20' AS Date), N'KH85351', NULL, 0, 0, N'Đã thanh toán', N'vandu')
INSERT [dbo].[Orders] ([orderId], [total], [createDate], [customerId], [voucherCode], [discount], [memberDiscount], [status], [creator]) VALUES (N'HD844131', 11300000, CAST(N'2022-11-20' AS Date), N'KH517638', NULL, 0, 200000, N'Đã thanh toán', N'vandu')
INSERT [dbo].[Orders] ([orderId], [total], [createDate], [customerId], [voucherCode], [discount], [memberDiscount], [status], [creator]) VALUES (N'HD906488', 9500000, CAST(N'2022-11-20' AS Date), N'KH85351', NULL, 0, 0, N'Đã thanh toán', N'vandu')
INSERT [dbo].[Orders] ([orderId], [total], [createDate], [customerId], [voucherCode], [discount], [memberDiscount], [status], [creator]) VALUES (N'HD942909', 18750000, CAST(N'2022-11-21' AS Date), N'KH517638', N'TETDUONGLICH112023', 50000, 200000, N'Đã thanh toán', N'vandu')
INSERT [dbo].[Orders] ([orderId], [total], [createDate], [customerId], [voucherCode], [discount], [memberDiscount], [status], [creator]) VALUES (N'HD988879', 15499000, CAST(N'2022-11-21' AS Date), N'KH136455', N'THANG11SIEUSALE123', 300000, 200000, N'Đã thanh toán', N'vandu')
INSERT [dbo].[Orders] ([orderId], [total], [createDate], [customerId], [voucherCode], [discount], [memberDiscount], [status], [creator]) VALUES (N'HD99327', 30749000, CAST(N'2022-11-25' AS Date), N'KH136455', N'TETDUONGLICH112023', 50000, 200000, N'Đã thanh toán', N'vandu')
GO
INSERT [dbo].[Products] ([productId], [title], [image], [price], [importprice], [ram], [rom], [quatity], [color], [companyId]) VALUES (N'SP10', N'REALME 8', N'realme-8-pro-vang-600x600.jpg', 10500000, 10000000, 4, 64, 38, N'Vàng', N'REALME')
INSERT [dbo].[Products] ([productId], [title], [image], [price], [importprice], [ram], [rom], [quatity], [color], [companyId]) VALUES (N'SP11', N'REALME 9', N'realme-9-4g-vang-thumb-1-600x600.jpg', 11500000, 11000000, 4, 64, 32, N'Cam', N'REALME')
INSERT [dbo].[Products] ([productId], [title], [image], [price], [importprice], [ram], [rom], [quatity], [color], [companyId]) VALUES (N'SP12', N'REALME 9I', N'realme-9i-den-thumb-600x600.jpg', 9500000, 9000000, 3, 32, 26, N'Đen', N'REALME')
INSERT [dbo].[Products] ([productId], [title], [image], [price], [importprice], [ram], [rom], [quatity], [color], [companyId]) VALUES (N'SP13', N'REALME  9 PRO', N'realme-9-pro-plus-5g-blue-thumb-600x600.jpg', 14999000, 14000000, 8, 256, 49, N'Đen', N'REALME')
INSERT [dbo].[Products] ([productId], [title], [image], [price], [importprice], [ram], [rom], [quatity], [color], [companyId]) VALUES (N'SP14', N'VIVO X80', N'vivo-x80-xanh-thumb-600x600.jpg', 15999000, 15000000, 8, 128, 49, N'Xanh Ngọc', N'VIVO')
INSERT [dbo].[Products] ([productId], [title], [image], [price], [importprice], [ram], [rom], [quatity], [color], [companyId]) VALUES (N'SP15', N'VIVO Y02', N'vivo-y02s-thumb-1-2-3-600x600.jpg', 5499000, 5000000, 3, 32, 48, N'Xanh Ngọc', N'VIVO')
INSERT [dbo].[Products] ([productId], [title], [image], [price], [importprice], [ram], [rom], [quatity], [color], [companyId]) VALUES (N'SP16', N'VIVO Y16', N'vivo-y16-vang-thumb-600x600.jpg', 8499000, 8000000, 4, 64, 4, N'Vàng', N'VIVO')
INSERT [dbo].[Products] ([productId], [title], [image], [price], [importprice], [ram], [rom], [quatity], [color], [companyId]) VALUES (N'SP17', N'REALME C11', N'realme-c11-2021-blue-1-600x600.jpg', 6500000, 6000000, 4, 64, 5, N'Xanh Ngọc', N'REALME')
INSERT [dbo].[Products] ([productId], [title], [image], [price], [importprice], [ram], [rom], [quatity], [color], [companyId]) VALUES (N'SP18', N'VIVO V23E', N'Vivo-V23e-1-2-600x600.jpg', 8799000, 8000000, 4, 64, 50, N'Hồng', N'VIVO')
INSERT [dbo].[Products] ([productId], [title], [image], [price], [importprice], [ram], [rom], [quatity], [color], [companyId]) VALUES (N'SP19', N'SAMSUNG GALAXY ZFLOD 4', N'samsung-galaxy-z-fold4-kem-256gb-600x600.jpg', 26999000, 26000000, 8, 256, 50, N'Vàng', N'SAMSUNG')
INSERT [dbo].[Products] ([productId], [title], [image], [price], [importprice], [ram], [rom], [quatity], [color], [companyId]) VALUES (N'SP2', N'IPHONE 14', N'iphone-14-pro-max-tim-thumb-600x600.jpg', 16000000, 15000000, 8, 128, 39, N'Xanh Ngọc', N'APLLE')
INSERT [dbo].[Products] ([productId], [title], [image], [price], [importprice], [ram], [rom], [quatity], [color], [companyId]) VALUES (N'SP20', N'VIVO Y01', N'vivi-y01-đen-thumb-600x600.jpg', 5699000, 5000000, 4, 64, 50, N'Đen', N'VIVO')
INSERT [dbo].[Products] ([productId], [title], [image], [price], [importprice], [ram], [rom], [quatity], [color], [companyId]) VALUES (N'SP3', N'OPPO RENO 7', N'OPPO-Reno7-4G-Thumb-cam-1-600x600.jpg', 9500000, 9000000, 4, 64, 45, N'Vàng', N'APLLE')
INSERT [dbo].[Products] ([productId], [title], [image], [price], [importprice], [ram], [rom], [quatity], [color], [companyId]) VALUES (N'SP4', N'SAMSUNG A73', N'samsung-galaxy-a73-5g-xanh-thumb-600x600.jpg', 12500000, 12000000, 4, 64, 47, N'Xanh Lá', N'SAMSUNG')
INSERT [dbo].[Products] ([productId], [title], [image], [price], [importprice], [ram], [rom], [quatity], [color], [companyId]) VALUES (N'SP5', N'IPHONE 12', N'iphone-12-den-new-2-600x600 (1).jpg', 12500000, 12000000, 4, 64, 46, N'Đen', N'APLLE')
INSERT [dbo].[Products] ([productId], [title], [image], [price], [importprice], [ram], [rom], [quatity], [color], [companyId]) VALUES (N'SP6', N'SAMSUNG A03', N'samsung-galaxy-a03-xanh-thumb-600x600.jpg', 4500000, 4000000, 4, 64, 50, N'Xanh Lá', N'SAMSUNG')
INSERT [dbo].[Products] ([productId], [title], [image], [price], [importprice], [ram], [rom], [quatity], [color], [companyId]) VALUES (N'SP7', N'IPHONE 13', N'iphone-13-512gb-(2).jpg', 18000000, 17000000, 4, 64, 48, N'Vàng', N'APLLE')
INSERT [dbo].[Products] ([productId], [title], [image], [price], [importprice], [ram], [rom], [quatity], [color], [companyId]) VALUES (N'SP8', N'SAM SUNG A23', N'samsung-galaxy-a23-cam-thumb-600x600.jpg', 6500000, 6000000, 3, 32, 49, N'Cam', N'SAMSUNG')
INSERT [dbo].[Products] ([productId], [title], [image], [price], [importprice], [ram], [rom], [quatity], [color], [companyId]) VALUES (N'SP9', N'IPHONE SE', N'iphone-se-black-600x600.jpeg', 10500000, 10000000, 4, 64, 50, N'Đen', N'APLLE')
GO
SET IDENTITY_INSERT [dbo].[Salary] ON 

INSERT [dbo].[Salary] ([id], [userId], [basicSalary], [commission], [advanceSalary], [salaryDeducted], [bonus], [startDate], [endDate], [numberDay], [totalSalary], [receivedDate], [notes]) VALUES (1, N'vandu', 150000, 3199960, 0, -200000, 100000, CAST(N'2022-11-01' AS Date), CAST(N'2022-11-30' AS Date), 29, 7449960, CAST(N'2022-12-04' AS Date), N'đi trễ trừ 100 ngàn ,ứng trước 2 triệu')
INSERT [dbo].[Salary] ([id], [userId], [basicSalary], [commission], [advanceSalary], [salaryDeducted], [bonus], [startDate], [endDate], [numberDay], [totalSalary], [receivedDate], [notes]) VALUES (3, N'anhtuan', 150000, 0, 0, 0, 0, CAST(N'2022-11-01' AS Date), CAST(N'2022-11-30' AS Date), 30, 4500000, NULL, N'')
INSERT [dbo].[Salary] ([id], [userId], [basicSalary], [commission], [advanceSalary], [salaryDeducted], [bonus], [startDate], [endDate], [numberDay], [totalSalary], [receivedDate], [notes]) VALUES (5, N'vandu', 150000, 825000, 0, 0, 0, CAST(N'2022-12-01' AS Date), CAST(N'2022-12-31' AS Date), 30, 5325000, NULL, N'')
SET IDENTITY_INSERT [dbo].[Salary] OFF
GO
INSERT [dbo].[Users] ([username], [password], [email], [image], [fullname], [gender], [role]) VALUES (N'anhtuan', N'123456', N'anhtuan123@gmail.com', N'denvau.png', N'Phạm Anh Tuấn', 1, 0)
INSERT [dbo].[Users] ([username], [password], [email], [image], [fullname], [gender], [role]) VALUES (N'Nguyenvana', N'1234', N'vandu@gmail.com', N'anh-gai-xinh-deo-kinh-700x933.jpg', N'Nguyễn Văn a', 0, 0)
INSERT [dbo].[Users] ([username], [password], [email], [image], [fullname], [gender], [role]) VALUES (N'vandu', N'123456', N'dunv123456@gmail.com', N'z3249192778790_001_56833784dd01c798d9c3bbbb007ef65c (1).jpg', N'Nguyễn Văn Dự', 1, 1)
INSERT [dbo].[Users] ([username], [password], [email], [image], [fullname], [gender], [role]) VALUES (N'vandu123', N'123456', N'vandu123456@gmail.com', N'anh-gai-xinh-1.jpg', N'Văn Dự', 1, 0)
GO
INSERT [dbo].[Vouchers] ([voucherCode], [name], [discountByPrice], [discountByPercent], [startDate], [endDate], [amountApplied], [maximumAmount], [notes]) VALUES (N'QUOCTEPHUNU20/10', N'20/10 QUỐC TẾ PHỤ NỮ', 0, 5, CAST(N'2022-10-20' AS Date), CAST(N'2022-10-20' AS Date), 5000000, 210000, N'')
INSERT [dbo].[Vouchers] ([voucherCode], [name], [discountByPrice], [discountByPercent], [startDate], [endDate], [amountApplied], [maximumAmount], [notes]) VALUES (N'TETDUONGLICH112023', N'Tết dương lịch ấm no', 0, 5, CAST(N'2022-11-19' AS Date), CAST(N'2022-11-30' AS Date), 50000, 50000, N'')
INSERT [dbo].[Vouchers] ([voucherCode], [name], [discountByPrice], [discountByPercent], [startDate], [endDate], [amountApplied], [maximumAmount], [notes]) VALUES (N'THANG11SIEUSALE123', N'Tháng 11 siêu sale', 300000, 0, CAST(N'2022-11-19' AS Date), CAST(N'2022-11-26' AS Date), 7000000, 300000, N'')
INSERT [dbo].[Vouchers] ([voucherCode], [name], [discountByPrice], [discountByPercent], [startDate], [endDate], [amountApplied], [maximumAmount], [notes]) VALUES (N'THANG12UUDAICUINAM', N'Tháng 12 ưu đâi cuối năm', 299000, 0, CAST(N'2022-12-01' AS Date), CAST(N'2022-12-30' AS Date), 7000000, 299000, N'')
GO
ALTER TABLE [dbo].[OrderDetalis]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetalis_Orders] FOREIGN KEY([orderId])
REFERENCES [dbo].[Orders] ([orderId])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[OrderDetalis] CHECK CONSTRAINT [FK_OrderDetalis_Orders]
GO
ALTER TABLE [dbo].[OrderDetalis]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetalis_Products] FOREIGN KEY([productId])
REFERENCES [dbo].[Products] ([productId])
GO
ALTER TABLE [dbo].[OrderDetalis] CHECK CONSTRAINT [FK_OrderDetalis_Products]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Customer] FOREIGN KEY([customerId])
REFERENCES [dbo].[Customer] ([customerId])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Customer]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Users] FOREIGN KEY([creator])
REFERENCES [dbo].[Users] ([username])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Users]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Vouchers] FOREIGN KEY([voucherCode])
REFERENCES [dbo].[Vouchers] ([voucherCode])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Vouchers]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Company] FOREIGN KEY([companyId])
REFERENCES [dbo].[Brand] ([id])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Company]
GO
ALTER TABLE [dbo].[Salary]  WITH CHECK ADD  CONSTRAINT [FK_Salary_Users] FOREIGN KEY([userId])
REFERENCES [dbo].[Users] ([username])
GO
ALTER TABLE [dbo].[Salary] CHECK CONSTRAINT [FK_Salary_Users]
GO
/****** Object:  StoredProcedure [dbo].[spTop5Product]    Script Date: 12/9/2022 3:22:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[spTop5Product]
as 
begin 
declare @thongke table(productId nvarchar(50),total float)
                insert into @thongke select top(5)productId,SUM(quatity) from OrderDetalis group by productId order by sum(quatity) desc
                select * from Products a inner join @thongke b on a.productId=b.productId
end
GO
/****** Object:  StoredProcedure [dbo].[spTotalProfitByDate]    Script Date: 12/9/2022 3:22:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[spTotalProfitByDate](@date date)
as
begin
declare @Tong table(orderId nvarchar(50),total float)
insert into @Tong select orderId,SUM(a.quatity*importprice) from OrderDetalis a inner join Products b on a.productId=b.productId group by orderId
declare @Thongke table (id nvarchar(50),total float)
insert into @Thongke select a.orderId,(a.total-b.total) from Orders a inner join @Tong b on a.orderId=b.orderId where createDate = @date

select sum(total) from @Thongke
end
GO
/****** Object:  StoredProcedure [dbo].[spTotalProfitByMonth]    Script Date: 12/9/2022 3:22:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[spTotalProfitByMonth](@month nvarchar(50))
as
begin
declare @Tong table(orderId nvarchar(50),total float)
insert into @Tong select orderId,SUM(a.quatity*importprice) from OrderDetalis a inner join Products b on a.productId=b.productId group by orderId
declare @Thongke table (id nvarchar(50),total float)
insert into @Thongke select a.orderId,(a.total-b.total) from Orders a inner join @Tong b on a.orderId=b.orderId where Month(createDate)=@month

select sum(total) from @Thongke
end
GO
USE [master]
GO
ALTER DATABASE [phonestore_duan1] SET  READ_WRITE 
GO
