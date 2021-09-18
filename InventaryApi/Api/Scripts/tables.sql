USE [STORE_00]
GO
/****** Object:  Table [dbo].[authorization]    Script Date: 17/09/2021 8:43:18 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[authorization](
	[userName] [varchar](100) NOT NULL,
	[password] [varchar](100) NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[branch]    Script Date: 17/09/2021 8:43:18 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[branch](
	[branchId] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](120) NOT NULL,
	[cityId] [int] NULL,
	[address] [varchar](120) NULL,
	[email] [varchar](30) NULL,
	[phone1] [varchar](40) NULL,
	[phone2] [varchar](40) NULL,
	[createDate] [datetime] NOT NULL,
	[active] [bit] NOT NULL,
 CONSTRAINT [pk_branch] PRIMARY KEY CLUSTERED 
(
	[branchId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[businessPartner]    Script Date: 17/09/2021 8:43:18 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[businessPartner](
	[businessPartnerId] [int] IDENTITY(1,1) NOT NULL,
	[type] [varchar](1) NOT NULL,
	[name] [varchar](120) NOT NULL,
	[identificationNumber] [varchar](40) NULL,
	[typeIdentificationId] [varchar](3) NULL,
	[cityId] [int] NULL,
	[address] [varchar](120) NULL,
	[email] [varchar](30) NULL,
	[phone1] [varchar](40) NULL,
	[phone2] [varchar](40) NULL,
	[createDate] [datetime] NOT NULL,
	[active] [bit] NOT NULL,
 CONSTRAINT [pk_businessPartner] PRIMARY KEY CLUSTERED 
(
	[businessPartnerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[category]    Script Date: 17/09/2021 8:43:18 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[category](
	[categoryId] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](120) NOT NULL,
	[createDate] [datetime] NOT NULL,
	[active] [bit] NOT NULL,
 CONSTRAINT [pk_category] PRIMARY KEY CLUSTERED 
(
	[categoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[city]    Script Date: 17/09/2021 8:43:18 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[city](
	[cityId] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](120) NOT NULL,
	[departmentId] [int] NOT NULL,
 CONSTRAINT [pk_city] PRIMARY KEY CLUSTERED 
(
	[cityId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[country]    Script Date: 17/09/2021 8:43:18 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[country](
	[countryId] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](120) NOT NULL,
 CONSTRAINT [pk_country] PRIMARY KEY CLUSTERED 
(
	[countryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[department]    Script Date: 17/09/2021 8:43:18 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[department](
	[departmentId] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](120) NOT NULL,
	[countryId] [int] NOT NULL,
 CONSTRAINT [pk_department] PRIMARY KEY CLUSTERED 
(
	[departmentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[invoice]    Script Date: 17/09/2021 8:43:18 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[invoice](
	[documentId] [varchar](40) NOT NULL,
	[documentType] [varchar](3) NOT NULL,
	[documentDate] [date] NOT NULL,
	[businessPartnerId] [int] NOT NULL,
	[businessPartnerType] [varchar](1) NOT NULL,
	[businessPartnerName] [varchar](120) NULL,
	[identificationNumber] [varchar](40) NULL,
	[typeIdentificationId] [varchar](3) NULL,
	[cityId] [int] NULL,
	[address] [varchar](120) NULL,
	[email] [varchar](30) NULL,
	[phone1] [varchar](40) NULL,
	[phone2] [varchar](40) NULL,
	[sellerId] [int] NULL,
	[sellerName] [varchar](120) NULL,
	[subTotal] [decimal](18, 8) NULL,
	[totalDiscount] [decimal](18, 8) NULL,
	[totalTax] [decimal](18, 8) NULL,
	[total] [decimal](18, 8) NULL,
	[comment] [varchar](500) NULL,
	[branchId] [int] NOT NULL,
	[createDate] [datetime] NOT NULL,
	[active] [bit] NOT NULL,
 CONSTRAINT [pk_invoice] PRIMARY KEY CLUSTERED 
(
	[documentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[invoiceDetail]    Script Date: 17/09/2021 8:43:18 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[invoiceDetail](
	[documentId] [varchar](40) NOT NULL,
	[documentLine] [int] NOT NULL,
	[itemId] [varchar](40) NOT NULL,
	[itemName] [varchar](120) NULL,
	[reference] [varchar](40) NULL,
	[inventory] [bit] NULL,
	[quantity] [int] NOT NULL,
	[price] [decimal](18, 8) NOT NULL,
	[discount] [decimal](18, 8) NOT NULL,
	[totalDiscount] [decimal](18, 8) NULL,
	[taxId] [int] NULL,
	[taxName] [varchar](120) NULL,
	[tax] [decimal](18, 8) NULL,
	[totalTax] [decimal](18, 8) NULL,
	[subTotal] [decimal](18, 8) NULL,
	[total] [decimal](18, 8) NULL,
	[warehouseId] [int] NULL,
 CONSTRAINT [pk_invoiceDetail] PRIMARY KEY CLUSTERED 
(
	[documentId] ASC,
	[documentLine] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[item]    Script Date: 17/09/2021 8:43:18 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[item](
	[itemId] [varchar](40) NOT NULL,
	[name] [varchar](120) NOT NULL,
	[reference] [varchar](40) NULL,
	[inventory] [bit] NOT NULL,
	[categoryId] [int] NULL,
	[createDate] [datetime] NOT NULL,
	[active] [bit] NOT NULL,
 CONSTRAINT [pk_item] PRIMARY KEY CLUSTERED 
(
	[itemId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[numeration]    Script Date: 17/09/2021 8:43:18 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[numeration](
	[documentType] [varchar](3) NOT NULL,
	[documentId] [varchar](40) NOT NULL,
	[numerationMin] [varchar](40) NOT NULL,
	[numerationMax] [varchar](40) NOT NULL,
 CONSTRAINT [pk_numeration] PRIMARY KEY CLUSTERED 
(
	[documentType] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[priceList]    Script Date: 17/09/2021 8:43:19 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[priceList](
	[priceListId] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](120) NOT NULL,
	[createDate] [datetime] NOT NULL,
	[active] [bit] NOT NULL,
 CONSTRAINT [pk_priceList] PRIMARY KEY CLUSTERED 
(
	[priceListId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[priceList_item]    Script Date: 17/09/2021 8:43:19 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[priceList_item](
	[priceListId] [int] NOT NULL,
	[itemId] [varchar](40) NOT NULL,
	[quantity] [int] NOT NULL,
	[price] [decimal](18, 8) NOT NULL,
	[discount] [decimal](18, 8) NOT NULL,
 CONSTRAINT [pk_priceList_item] PRIMARY KEY CLUSTERED 
(
	[priceListId] ASC,
	[itemId] ASC,
	[quantity] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[roll]    Script Date: 17/09/2021 8:43:19 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[roll](
	[rollId] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](120) NOT NULL,
	[createDate] [datetime] NOT NULL,
	[active] [bit] NOT NULL,
 CONSTRAINT [pk_roll] PRIMARY KEY CLUSTERED 
(
	[rollId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[seller]    Script Date: 17/09/2021 8:43:19 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[seller](
	[sellerId] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](120) NOT NULL,
	[createDate] [datetime] NOT NULL,
	[active] [bit] NOT NULL,
 CONSTRAINT [pk_seller] PRIMARY KEY CLUSTERED 
(
	[sellerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tax]    Script Date: 17/09/2021 8:43:19 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tax](
	[taxId] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](120) NOT NULL,
	[percentage] [decimal](18, 8) NOT NULL,
	[createDate] [datetime] NOT NULL,
	[active] [bit] NOT NULL,
 CONSTRAINT [pk_tax] PRIMARY KEY CLUSTERED 
(
	[taxId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tax_item]    Script Date: 17/09/2021 8:43:19 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tax_item](
	[taxId] [int] NOT NULL,
	[itemId] [varchar](40) NOT NULL,
	[type] [varchar](1) NOT NULL,
 CONSTRAINT [pk_tax_item] PRIMARY KEY CLUSTERED 
(
	[taxId] ASC,
	[itemId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[typeIdentification]    Script Date: 17/09/2021 8:43:19 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[typeIdentification](
	[typeIdentificationId] [varchar](3) NOT NULL,
	[name] [varchar](120) NOT NULL,
	[createDate] [datetime] NOT NULL,
	[active] [bit] NOT NULL,
 CONSTRAINT [pk_typeIdentification] PRIMARY KEY CLUSTERED 
(
	[typeIdentificationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[user]    Script Date: 17/09/2021 8:43:19 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[user](
	[userId] [varchar](40) NOT NULL,
	[name] [varchar](120) NOT NULL,
	[email] [varchar](30) NULL,
	[password] [varchar](100) NOT NULL,
	[phone] [varchar](40) NULL,
	[rollId] [int] NULL,
	[createDate] [datetime] NOT NULL,
	[active] [bit] NOT NULL,
 CONSTRAINT [pk_user] PRIMARY KEY CLUSTERED 
(
	[userId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[warehouse]    Script Date: 17/09/2021 8:43:19 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[warehouse](
	[warehouseId] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](120) NOT NULL,
	[branchId] [int] NOT NULL,
	[createDate] [datetime] NOT NULL,
	[active] [bit] NOT NULL,
 CONSTRAINT [pk_warehouse] PRIMARY KEY CLUSTERED 
(
	[warehouseId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[warehouse_item]    Script Date: 17/09/2021 8:43:19 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[warehouse_item](
	[warehouseId] [int] NOT NULL,
	[itemId] [varchar](40) NOT NULL,
	[stock] [int] NOT NULL,
	[compromised] [int] NOT NULL,
	[available] [int] NOT NULL,
 CONSTRAINT [pk_warehouse_item] PRIMARY KEY CLUSTERED 
(
	[warehouseId] ASC,
	[itemId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[branch]  WITH CHECK ADD  CONSTRAINT [fk_branch_city] FOREIGN KEY([cityId])
REFERENCES [dbo].[city] ([cityId])
GO
ALTER TABLE [dbo].[branch] CHECK CONSTRAINT [fk_branch_city]
GO
ALTER TABLE [dbo].[businessPartner]  WITH CHECK ADD  CONSTRAINT [fk_businessPartner_city] FOREIGN KEY([cityId])
REFERENCES [dbo].[city] ([cityId])
GO
ALTER TABLE [dbo].[businessPartner] CHECK CONSTRAINT [fk_businessPartner_city]
GO
ALTER TABLE [dbo].[businessPartner]  WITH CHECK ADD  CONSTRAINT [fk_businessPartner_typeIdentification] FOREIGN KEY([typeIdentificationId])
REFERENCES [dbo].[typeIdentification] ([typeIdentificationId])
GO
ALTER TABLE [dbo].[businessPartner] CHECK CONSTRAINT [fk_businessPartner_typeIdentification]
GO
ALTER TABLE [dbo].[city]  WITH CHECK ADD  CONSTRAINT [fk_city_department] FOREIGN KEY([departmentId])
REFERENCES [dbo].[department] ([departmentId])
GO
ALTER TABLE [dbo].[city] CHECK CONSTRAINT [fk_city_department]
GO
ALTER TABLE [dbo].[department]  WITH CHECK ADD  CONSTRAINT [fk_department_country] FOREIGN KEY([countryId])
REFERENCES [dbo].[country] ([countryId])
GO
ALTER TABLE [dbo].[department] CHECK CONSTRAINT [fk_department_country]
GO
ALTER TABLE [dbo].[invoice]  WITH CHECK ADD  CONSTRAINT [fk_invoice_branch] FOREIGN KEY([branchId])
REFERENCES [dbo].[branch] ([branchId])
GO
ALTER TABLE [dbo].[invoice] CHECK CONSTRAINT [fk_invoice_branch]
GO
ALTER TABLE [dbo].[invoice]  WITH CHECK ADD  CONSTRAINT [fk_invoice_businessPartner] FOREIGN KEY([businessPartnerId])
REFERENCES [dbo].[businessPartner] ([businessPartnerId])
GO
ALTER TABLE [dbo].[invoice] CHECK CONSTRAINT [fk_invoice_businessPartner]
GO
ALTER TABLE [dbo].[invoice]  WITH CHECK ADD  CONSTRAINT [fk_invoice_seller] FOREIGN KEY([sellerId])
REFERENCES [dbo].[seller] ([sellerId])
GO
ALTER TABLE [dbo].[invoice] CHECK CONSTRAINT [fk_invoice_seller]
GO
ALTER TABLE [dbo].[invoiceDetail]  WITH CHECK ADD  CONSTRAINT [fk_invoiceDetail_invoice] FOREIGN KEY([documentId])
REFERENCES [dbo].[invoice] ([documentId])
GO
ALTER TABLE [dbo].[invoiceDetail] CHECK CONSTRAINT [fk_invoiceDetail_invoice]
GO
ALTER TABLE [dbo].[invoiceDetail]  WITH CHECK ADD  CONSTRAINT [fk_invoiceDetail_item] FOREIGN KEY([itemId])
REFERENCES [dbo].[item] ([itemId])
GO
ALTER TABLE [dbo].[invoiceDetail] CHECK CONSTRAINT [fk_invoiceDetail_item]
GO
ALTER TABLE [dbo].[invoiceDetail]  WITH CHECK ADD  CONSTRAINT [fk_invoiceDetail_tax] FOREIGN KEY([taxId])
REFERENCES [dbo].[tax] ([taxId])
GO
ALTER TABLE [dbo].[invoiceDetail] CHECK CONSTRAINT [fk_invoiceDetail_tax]
GO
ALTER TABLE [dbo].[invoiceDetail]  WITH CHECK ADD  CONSTRAINT [fk_invoiceDetail_warehouse] FOREIGN KEY([warehouseId])
REFERENCES [dbo].[warehouse] ([warehouseId])
GO
ALTER TABLE [dbo].[invoiceDetail] CHECK CONSTRAINT [fk_invoiceDetail_warehouse]
GO
ALTER TABLE [dbo].[item]  WITH CHECK ADD  CONSTRAINT [fk_item_category] FOREIGN KEY([categoryId])
REFERENCES [dbo].[category] ([categoryId])
GO
ALTER TABLE [dbo].[item] CHECK CONSTRAINT [fk_item_category]
GO
ALTER TABLE [dbo].[priceList_item]  WITH CHECK ADD  CONSTRAINT [fk_priceList_item_item] FOREIGN KEY([itemId])
REFERENCES [dbo].[item] ([itemId])
GO
ALTER TABLE [dbo].[priceList_item] CHECK CONSTRAINT [fk_priceList_item_item]
GO
ALTER TABLE [dbo].[priceList_item]  WITH CHECK ADD  CONSTRAINT [fk_priceList_item_priceList] FOREIGN KEY([priceListId])
REFERENCES [dbo].[priceList] ([priceListId])
GO
ALTER TABLE [dbo].[priceList_item] CHECK CONSTRAINT [fk_priceList_item_priceList]
GO
ALTER TABLE [dbo].[tax_item]  WITH CHECK ADD  CONSTRAINT [fk_tax_item_item] FOREIGN KEY([itemId])
REFERENCES [dbo].[item] ([itemId])
GO
ALTER TABLE [dbo].[tax_item] CHECK CONSTRAINT [fk_tax_item_item]
GO
ALTER TABLE [dbo].[tax_item]  WITH CHECK ADD  CONSTRAINT [fk_tax_item_tax] FOREIGN KEY([taxId])
REFERENCES [dbo].[tax] ([taxId])
GO
ALTER TABLE [dbo].[tax_item] CHECK CONSTRAINT [fk_tax_item_tax]
GO
ALTER TABLE [dbo].[user]  WITH CHECK ADD  CONSTRAINT [fk_user_roll] FOREIGN KEY([rollId])
REFERENCES [dbo].[roll] ([rollId])
GO
ALTER TABLE [dbo].[user] CHECK CONSTRAINT [fk_user_roll]
GO
ALTER TABLE [dbo].[warehouse]  WITH CHECK ADD  CONSTRAINT [fk_warehouse_branch] FOREIGN KEY([branchId])
REFERENCES [dbo].[branch] ([branchId])
GO
ALTER TABLE [dbo].[warehouse] CHECK CONSTRAINT [fk_warehouse_branch]
GO
ALTER TABLE [dbo].[warehouse_item]  WITH CHECK ADD  CONSTRAINT [fk_warehouse_item_item] FOREIGN KEY([itemId])
REFERENCES [dbo].[item] ([itemId])
GO
ALTER TABLE [dbo].[warehouse_item] CHECK CONSTRAINT [fk_warehouse_item_item]
GO
ALTER TABLE [dbo].[warehouse_item]  WITH CHECK ADD  CONSTRAINT [fk_warehouse_item_warehouse] FOREIGN KEY([warehouseId])
REFERENCES [dbo].[warehouse] ([warehouseId])
GO
ALTER TABLE [dbo].[warehouse_item] CHECK CONSTRAINT [fk_warehouse_item_warehouse]
GO






