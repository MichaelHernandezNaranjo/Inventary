USE STORE_00
go

create table [authorization](
	userName varchar(120) not null,
	password varchar(120) not null,
	description varchar(120) null,
	createDate datetime not null,
	active bit not null,
	constraint pk_authorization primary key clustered (userName asc)
)
go

create table [country] (
	countryId int identity(1,1) not null,
	name varchar(120) not null unique,
	createDate datetime not null,
	active bit not null,
	constraint pk_country primary key clustered (countryId asc)
)
go

create table [department] (
	departmentId int identity(1,1) not null,
	name varchar(120) not null,
	countryId int not null,
	createDate datetime not null,
	active bit not null,
	constraint pk_department primary key clustered (departmentId asc),
	constraint fk_department_country foreign key (countryId) references country (countryId)
)
go

create table [city] (
	cityId int identity(1,1) not null,
	name varchar(120) not null,
	departmentId int not null,
	createDate datetime not null,
	active bit not null,
	constraint pk_city primary key clustered (cityId asc),
	constraint fk_city_department foreign key (departmentId) references department (departmentId)
)
go

create table [branch](
	branchId int identity(1,1) not null,
	name varchar(120) not null unique,
	cityId int null,
	address varchar(120) null,
	email varchar(30) null,
	phone1 varchar(40) null,
	phone2 varchar(40) null,
	createDate datetime not null,
	active bit not null,
	constraint pk_branch primary key clustered (branchId asc),
	constraint fk_branch_city foreign key (cityId) references city (cityId)
)
go

create table [settingType] (
	settingTypeId int not null identity(1,1) not null,
	name varchar(120) not null unique,
	constraint pk_settingType primary key clustered (settingTypeId asc)
)
go

create table [setting] (
	settingId int not null identity(1,1) not null,
	constant varchar(40) not null unique,
	settingTypeId int not null,
	branchId int null,
	description varchar(120) null,
	value varchar(max) not null,
	constraint pk_setting primary key clustered ( settingId asc),
	constraint fk_setting_settingType foreign key (settingTypeId) references settingType (settingTypeId),
	constraint fk_setting_branch foreign key (branchId) references branch (branchId)
)
go

create table businessPartner(
	businessPartnerId int identity(1,1) not null,
	type varchar(1) not null,
	name varchar(120) not null,
	identificationNumber varchar(40) null,
	typeIdentificationId varchar(3) null,
	cityId int null,
	address varchar(120) null,
	email varchar(30) null,
	phone1 varchar(40) null,
	phone2 varchar(40) null,
	createDate datetime not null,
	active bit not null,
 constraint pk_businessPartner primary key clustered 
(
	businessPartnerId asc
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON primary
) ON primary

go

go
/****** Object:  Table category    Script Date: 17/09/2021 8:43:18 p. m. ******/
SET ANSI_NULLS ON
go
SET QUOTED_IDENTIFIER ON
go
SET ANSI_PADDING ON
go
create table category(
	categoryId int identity(1,1) not null,
	name varchar(120) not null,
	createDate datetime not null,
	active bit not null,
 constraint pk_category primary key clustered 
(
	categoryId asc
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON primary
) ON primary

go

go
/****** Object:  Table city    Script Date: 17/09/2021 8:43:18 p. m. ******/
SET ANSI_NULLS ON
go
SET QUOTED_IDENTIFIER ON
go
SET ANSI_PADDING ON
go


go

go
/****** Object:  Table country    Script Date: 17/09/2021 8:43:18 p. m. ******/
SET ANSI_NULLS ON
go
SET QUOTED_IDENTIFIER ON
go
SET ANSI_PADDING ON
go


go

go
/****** Object:  Table department    Script Date: 17/09/2021 8:43:18 p. m. ******/
SET ANSI_NULLS ON
go
SET QUOTED_IDENTIFIER ON
go
SET ANSI_PADDING ON
go


go

go
/****** Object:  Table invoice    Script Date: 17/09/2021 8:43:18 p. m. ******/
SET ANSI_NULLS ON
go
SET QUOTED_IDENTIFIER ON
go
SET ANSI_PADDING ON
go
create table invoice(
	documentId varchar(40) not null,
	documentType varchar(3) not null,
	documentDate date not null,
	businessPartnerId int not null,
	businessPartnerType varchar(1) not null,
	businessPartnerName varchar(120) null,
	identificationNumber varchar(40) null,
	typeIdentificationId varchar(3) null,
	cityId int null,
	address varchar(120) null,
	email varchar(30) null,
	phone1 varchar(40) null,
	phone2 varchar(40) null,
	sellerId int null,
	sellerName varchar(120) null,
	subTotal decimal(18, 8) null,
	totalDiscount decimal(18, 8) null,
	totalTax decimal(18, 8) null,
	total decimal(18, 8) null,
	comment varchar(500) null,
	branchId int not null,
	createDate datetime not null,
	active bit not null,
 constraint pk_invoice primary key clustered 
(
	documentId asc
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON primary
) ON primary

go

go
/****** Object:  Table invoiceDetail    Script Date: 17/09/2021 8:43:18 p. m. ******/
SET ANSI_NULLS ON
go
SET QUOTED_IDENTIFIER ON
go
SET ANSI_PADDING ON
go
create table invoiceDetail(
	documentId varchar(40) not null,
	documentLine int not null,
	itemId varchar(40) not null,
	itemName varchar(120) null,
	reference varchar(40) null,
	inventory bit null,
	quantity int not null,
	price decimal(18, 8) not null,
	discount decimal(18, 8) not null,
	totalDiscount decimal(18, 8) null,
	taxId int null,
	taxName varchar(120) null,
	tax decimal(18, 8) null,
	totalTax decimal(18, 8) null,
	subTotal decimal(18, 8) null,
	total decimal(18, 8) null,
	warehouseId int null,
 constraint pk_invoiceDetail primary key clustered 
(
	documentId asc,
	documentLine asc
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON primary
) ON primary

go

go
/****** Object:  Table item    Script Date: 17/09/2021 8:43:18 p. m. ******/
SET ANSI_NULLS ON
go
SET QUOTED_IDENTIFIER ON
go
SET ANSI_PADDING ON
go
create table item(
	itemId varchar(40) not null,
	name varchar(120) not null,
	reference varchar(40) null,
	inventory bit not null,
	categoryId int null,
	createDate datetime not null,
	active bit not null,
 constraint pk_item primary key clustered 
(
	itemId asc
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON primary
) ON primary

go

go
/****** Object:  Table numeration    Script Date: 17/09/2021 8:43:18 p. m. ******/
SET ANSI_NULLS ON
go
SET QUOTED_IDENTIFIER ON
go
SET ANSI_PADDING ON
go
create table numeration(
	documentType varchar(3) not null,
	documentId varchar(40) not null,
	numerationMin varchar(40) not null,
	numerationMax varchar(40) not null,
 constraint pk_numeration primary key clustered 
(
	documentType asc
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON primary
) ON primary

go

go
/****** Object:  Table priceList    Script Date: 17/09/2021 8:43:19 p. m. ******/
SET ANSI_NULLS ON
go
SET QUOTED_IDENTIFIER ON
go
SET ANSI_PADDING ON
go
create table priceList(
	priceListId int identity(1,1) not null,
	name varchar(120) not null,
	createDate datetime not null,
	active bit not null,
 constraint pk_priceList primary key clustered 
(
	priceListId asc
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON primary
) ON primary

go

go
/****** Object:  Table priceList_item    Script Date: 17/09/2021 8:43:19 p. m. ******/
SET ANSI_NULLS ON
go
SET QUOTED_IDENTIFIER ON
go
SET ANSI_PADDING ON
go
create table priceList_item(
	priceListId int not null,
	itemId varchar(40) not null,
	quantity int not null,
	price decimal(18, 8) not null,
	discount decimal(18, 8) not null,
 constraint pk_priceList_item primary key clustered 
(
	priceListId asc,
	itemId asc,
	quantity asc
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON primary
) ON primary

go

go
/****** Object:  Table roll    Script Date: 17/09/2021 8:43:19 p. m. ******/
SET ANSI_NULLS ON
go
SET QUOTED_IDENTIFIER ON
go
SET ANSI_PADDING ON
go
create table roll(
	rollId int identity(1,1) not null,
	name varchar(120) not null,
	createDate datetime not null,
	active bit not null,
 constraint pk_roll primary key clustered 
(
	rollId asc
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON primary
) ON primary

go

go
/****** Object:  Table seller    Script Date: 17/09/2021 8:43:19 p. m. ******/
SET ANSI_NULLS ON
go
SET QUOTED_IDENTIFIER ON
go
SET ANSI_PADDING ON
go
create table seller(
	sellerId int identity(1,1) not null,
	name varchar(120) not null,
	createDate datetime not null,
	active bit not null,
 constraint pk_seller primary key clustered 
(
	sellerId asc
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON primary
) ON primary

go

go
/****** Object:  Table tax    Script Date: 17/09/2021 8:43:19 p. m. ******/
SET ANSI_NULLS ON
go
SET QUOTED_IDENTIFIER ON
go
SET ANSI_PADDING ON
go
create table tax(
	taxId int identity(1,1) not null,
	name varchar(120) not null,
	percentage decimal(18, 8) not null,
	createDate datetime not null,
	active bit not null,
 constraint pk_tax primary key clustered 
(
	taxId asc
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON primary
) ON primary

go

go
/****** Object:  Table tax_item    Script Date: 17/09/2021 8:43:19 p. m. ******/
SET ANSI_NULLS ON
go
SET QUOTED_IDENTIFIER ON
go
SET ANSI_PADDING ON
go
create table tax_item(
	taxId int not null,
	itemId varchar(40) not null,
	type varchar(1) not null,
 constraint pk_tax_item primary key clustered 
(
	taxId asc,
	itemId asc
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON primary
) ON primary

go

go
/****** Object:  Table typeIdentification    Script Date: 17/09/2021 8:43:19 p. m. ******/
SET ANSI_NULLS ON
go
SET QUOTED_IDENTIFIER ON
go
SET ANSI_PADDING ON
go
create table typeIdentification(
	typeIdentificationId varchar(3) not null,
	name varchar(120) not null,
	createDate datetime not null,
	active bit not null,
 constraint pk_typeIdentification primary key clustered 
(
	typeIdentificationId asc
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON primary
) ON primary

go

go
/****** Object:  Table user    Script Date: 17/09/2021 8:43:19 p. m. ******/
SET ANSI_NULLS ON
go
SET QUOTED_IDENTIFIER ON
go
SET ANSI_PADDING ON
go
create table user(
	userId varchar(40) not null,
	name varchar(120) not null,
	email varchar(30) null,
	password varchar(100) not null,
	phone varchar(40) null,
	rollId int null,
	createDate datetime not null,
	active bit not null,
 constraint pk_user primary key clustered 
(
	userId asc
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON primary
) ON primary

go

go
/****** Object:  Table warehouse    Script Date: 17/09/2021 8:43:19 p. m. ******/
SET ANSI_NULLS ON
go
SET QUOTED_IDENTIFIER ON
go
SET ANSI_PADDING ON
go
create table warehouse(
	warehouseId int identity(1,1) not null,
	name varchar(120) not null,
	branchId int not null,
	createDate datetime not null,
	active bit not null,
 constraint pk_warehouse primary key clustered 
(
	warehouseId asc
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON primary
) ON primary

go

go
/****** Object:  Table warehouse_item    Script Date: 17/09/2021 8:43:19 p. m. ******/
SET ANSI_NULLS ON
go
SET QUOTED_IDENTIFIER ON
go
SET ANSI_PADDING ON
go
create table warehouse_item(
	warehouseId int not null,
	itemId varchar(40) not null,
	stock int not null,
	compromised int not null,
	available int not null,
 constraint pk_warehouse_item primary key clustered 
(
	warehouseId asc,
	itemId asc
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON primary
) ON primary

go

go

go
ALTER table branch CHECK constraint fk_branch_city
go
ALTER table businessPartner  WITH CHECK ADD  constraint fk_businessPartner_city FOREIGN key(cityId)
REFERENCES city (cityId)
go
ALTER table businessPartner CHECK constraint fk_businessPartner_city
go
ALTER table businessPartner  WITH CHECK ADD  constraint fk_businessPartner_typeIdentification FOREIGN key(typeIdentificationId)
REFERENCES typeIdentification (typeIdentificationId)
go
ALTER table businessPartner CHECK constraint fk_businessPartner_typeIdentification
go

go
ALTER table city CHECK constraint fk_city_department
go

go
ALTER table department CHECK constraint fk_department_country
go
ALTER table invoice  WITH CHECK ADD  constraint fk_invoice_branch FOREIGN key(branchId)
REFERENCES branch (branchId)
go
ALTER table invoice CHECK constraint fk_invoice_branch
go
ALTER table invoice  WITH CHECK ADD  constraint fk_invoice_businessPartner FOREIGN key(businessPartnerId)
REFERENCES businessPartner (businessPartnerId)
go
ALTER table invoice CHECK constraint fk_invoice_businessPartner
go
ALTER table invoice  WITH CHECK ADD  constraint fk_invoice_seller FOREIGN key(sellerId)
REFERENCES seller (sellerId)
go
ALTER table invoice CHECK constraint fk_invoice_seller
go
ALTER table invoiceDetail  WITH CHECK ADD  constraint fk_invoiceDetail_invoice FOREIGN key(documentId)
REFERENCES invoice (documentId)
go
ALTER table invoiceDetail CHECK constraint fk_invoiceDetail_invoice
go
ALTER table invoiceDetail  WITH CHECK ADD  constraint fk_invoiceDetail_item FOREIGN key(itemId)
REFERENCES item (itemId)
go
ALTER table invoiceDetail CHECK constraint fk_invoiceDetail_item
go
ALTER table invoiceDetail  WITH CHECK ADD  constraint fk_invoiceDetail_tax FOREIGN key(taxId)
REFERENCES tax (taxId)
go
ALTER table invoiceDetail CHECK constraint fk_invoiceDetail_tax
go
ALTER table invoiceDetail  WITH CHECK ADD  constraint fk_invoiceDetail_warehouse FOREIGN key(warehouseId)
REFERENCES warehouse (warehouseId)
go
ALTER table invoiceDetail CHECK constraint fk_invoiceDetail_warehouse
go
ALTER table item  WITH CHECK ADD  constraint fk_item_category FOREIGN key(categoryId)
REFERENCES category (categoryId)
go
ALTER table item CHECK constraint fk_item_category
go
ALTER table priceList_item  WITH CHECK ADD  constraint fk_priceList_item_item FOREIGN key(itemId)
REFERENCES item (itemId)
go
ALTER table priceList_item CHECK constraint fk_priceList_item_item
go
ALTER table priceList_item  WITH CHECK ADD  constraint fk_priceList_item_priceList FOREIGN key(priceListId)
REFERENCES priceList (priceListId)
go
ALTER table priceList_item CHECK constraint fk_priceList_item_priceList
go
ALTER table tax_item  WITH CHECK ADD  constraint fk_tax_item_item FOREIGN key(itemId)
REFERENCES item (itemId)
go
ALTER table tax_item CHECK constraint fk_tax_item_item
go
ALTER table tax_item  WITH CHECK ADD  constraint fk_tax_item_tax FOREIGN key(taxId)
REFERENCES tax (taxId)
go
ALTER table tax_item CHECK constraint fk_tax_item_tax
go
ALTER table user  WITH CHECK ADD  constraint fk_user_roll FOREIGN key(rollId)
REFERENCES roll (rollId)
go
ALTER table user CHECK constraint fk_user_roll
go
ALTER table warehouse  WITH CHECK ADD  constraint fk_warehouse_branch FOREIGN key(branchId)
REFERENCES branch (branchId)
go
ALTER table warehouse CHECK constraint fk_warehouse_branch
go
ALTER table warehouse_item  WITH CHECK ADD  constraint fk_warehouse_item_item FOREIGN key(itemId)
REFERENCES item (itemId)
go
ALTER table warehouse_item CHECK constraint fk_warehouse_item_item
go
ALTER table warehouse_item  WITH CHECK ADD  constraint fk_warehouse_item_warehouse FOREIGN key(warehouseId)
REFERENCES warehouse (warehouseId)
go
ALTER table warehouse_item CHECK constraint fk_warehouse_item_warehouse
go






