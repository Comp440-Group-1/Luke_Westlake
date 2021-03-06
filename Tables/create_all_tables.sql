USE [s16guest58]
GO
/****** Object:  Table [dbo].[address]    Script Date: 5/2/2016 11:14:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[address](
	[address_id] [int] IDENTITY(1,1) NOT NULL,
	[street_address] [varchar](50) NOT NULL,
	[zip_code] [varchar](12) NULL,
	[city_id] [int] NOT NULL,
	[state_id] [tinyint] NULL,
	[country_id] [tinyint] NULL,
 CONSTRAINT [PK_address] PRIMARY KEY CLUSTERED 
(
	[address_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[branch]    Script Date: 5/2/2016 11:14:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[branch](
	[branch_id] [int] IDENTITY(1,1) NOT NULL,
	[branch_number] [varchar](4) NULL,
	[iteration_id] [int] NOT NULL,
 CONSTRAINT [PK_branch] PRIMARY KEY CLUSTERED 
(
	[branch_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[city]    Script Date: 5/2/2016 11:14:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[city](
	[city_id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NOT NULL,
 CONSTRAINT [PK_city] PRIMARY KEY CLUSTERED 
(
	[city_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[company]    Script Date: 5/2/2016 11:14:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[company](
	[company_id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](100) NOT NULL,
 CONSTRAINT [PK_company] PRIMARY KEY CLUSTERED 
(
	[company_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[company_address_xref]    Script Date: 5/2/2016 11:14:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[company_address_xref](
	[company_id] [int] NOT NULL,
	[address_id] [int] NOT NULL,
 CONSTRAINT [PK_company_address_xref] PRIMARY KEY CLUSTERED 
(
	[company_id] ASC,
	[address_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[country]    Script Date: 5/2/2016 11:14:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[country](
	[country_id] [tinyint] IDENTITY(1,1) NOT NULL,
	[name] [varchar](100) NOT NULL,
 CONSTRAINT [PK_country] PRIMARY KEY CLUSTERED 
(
	[country_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[customer]    Script Date: 5/2/2016 11:14:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[customer](
	[customer_id] [int] IDENTITY(1,1) NOT NULL,
	[first_name] [varchar](50) NOT NULL,
	[last_name] [varchar](50) NOT NULL,
	[email_address] [varchar](255) NOT NULL,
	[password] [varchar](64) NOT NULL,
	[company_id] [int] NULL,
 CONSTRAINT [PK_customer] PRIMARY KEY CLUSTERED 
(
	[customer_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[customer_address_xref]    Script Date: 5/2/2016 11:14:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[customer_address_xref](
	[customer_id] [int] NOT NULL,
	[address_id] [int] NOT NULL,
 CONSTRAINT [PK_customer_address_xref] PRIMARY KEY CLUSTERED 
(
	[customer_id] ASC,
	[address_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[customer_phone_number_xref]    Script Date: 5/2/2016 11:14:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[customer_phone_number_xref](
	[customer_id] [int] NOT NULL,
	[phone_number_id] [int] NOT NULL,
 CONSTRAINT [PK_customer_phone_number_xref] PRIMARY KEY CLUSTERED 
(
	[customer_id] ASC,
	[phone_number_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[customer_release]    Script Date: 5/2/2016 11:14:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[customer_release](
	[customer_release_id] [int] IDENTITY(1,1) NOT NULL,
	[release_number] [varchar](5) NOT NULL,
	[version_id] [int] NOT NULL,
	[download_link] [varchar](max) NULL,
	[release_date] [date] NULL,
	[deprecation_date] [date] NULL,
	[is_deprecated] [bit] NOT NULL,
	[branch_id] [int] NULL,
 CONSTRAINT [PK_customer_release] PRIMARY KEY CLUSTERED 
(
	[customer_release_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[customer_release_feature_xref]    Script Date: 5/2/2016 11:14:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[customer_release_feature_xref](
	[customer_release_id] [int] NOT NULL,
	[feature_id] [int] NOT NULL,
	[status_of_feature_id] [tinyint] NULL,
 CONSTRAINT [PK_customer_release_feature_xref] PRIMARY KEY CLUSTERED 
(
	[customer_release_id] ASC,
	[feature_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[development_release]    Script Date: 5/2/2016 11:14:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[development_release](
	[development_release_id] [int] IDENTITY(1,1) NOT NULL,
	[release_number] [varchar](5) NOT NULL,
	[version_id] [int] NOT NULL,
	[release_date] [date] NULL,
	[branch_id] [int] NOT NULL,
 CONSTRAINT [PK_development_release] PRIMARY KEY CLUSTERED 
(
	[development_release_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[download]    Script Date: 5/2/2016 11:14:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[download](
	[download_id] [int] IDENTITY(1,1) NOT NULL,
	[customer_release_id] [int] NOT NULL,
	[customer_id] [int] NOT NULL,
	[date_requested] [date] NOT NULL,
 CONSTRAINT [PK_download] PRIMARY KEY CLUSTERED 
(
	[download_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[feature]    Script Date: 5/2/2016 11:14:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[feature](
	[feature_id] [int] IDENTITY(1,1) NOT NULL,
	[feature_name] [varchar](100) NOT NULL,
	[description] [varchar](500) NULL,
 CONSTRAINT [PK_feature] PRIMARY KEY CLUSTERED 
(
	[feature_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[iteration]    Script Date: 5/2/2016 11:14:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[iteration](
	[iteration_id] [int] IDENTITY(1,1) NOT NULL,
	[label] [varchar](50) NULL,
	[parent_iteration_id] [int] NULL,
 CONSTRAINT [PK_iteration] PRIMARY KEY CLUSTERED 
(
	[iteration_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[phone_number]    Script Date: 5/2/2016 11:14:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[phone_number](
	[phone_number_id] [int] IDENTITY(1,1) NOT NULL,
	[number] [char](10) NOT NULL,
	[phone_type_id] [tinyint] NULL,
 CONSTRAINT [PK_phone_number] PRIMARY KEY CLUSTERED 
(
	[phone_number_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[phone_type]    Script Date: 5/2/2016 11:14:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[phone_type](
	[phone_type_id] [tinyint] IDENTITY(1,1) NOT NULL,
	[name] [varchar](10) NOT NULL,
 CONSTRAINT [PK_phone_type] PRIMARY KEY CLUSTERED 
(
	[phone_type_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[product]    Script Date: 5/2/2016 11:14:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[product](
	[product_id] [smallint] IDENTITY(1,1) NOT NULL,
	[product_name] [varchar](50) NOT NULL,
	[platform] [varchar](50) NOT NULL,
	[description] [varchar](max) NULL,
 CONSTRAINT [PK_product] PRIMARY KEY CLUSTERED 
(
	[product_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[state]    Script Date: 5/2/2016 11:14:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[state](
	[state_id] [tinyint] IDENTITY(1,1) NOT NULL,
	[name] [char](2) NOT NULL,
 CONSTRAINT [PK_state] PRIMARY KEY CLUSTERED 
(
	[state_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[status_of_feature]    Script Date: 5/2/2016 11:14:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[status_of_feature](
	[status_of_feature_id] [tinyint] IDENTITY(1,1) NOT NULL,
	[status_name] [varchar](20) NOT NULL,
 CONSTRAINT [PK_status_of_feature] PRIMARY KEY CLUSTERED 
(
	[status_of_feature_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[version]    Script Date: 5/2/2016 11:14:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[version](
	[version_id] [int] IDENTITY(1,1) NOT NULL,
	[version_number] [varchar](5) NOT NULL,
	[product_id] [smallint] NOT NULL,
	[release_date] [date] NULL,
	[deprecation_date] [date] NULL,
	[is_deprecated] [bit] NOT NULL,
 CONSTRAINT [PK_version] PRIMARY KEY CLUSTERED 
(
	[version_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[customer_release] ADD  CONSTRAINT [DF_customer_release_is_deprecated]  DEFAULT ((0)) FOR [is_deprecated]
GO
ALTER TABLE [dbo].[version] ADD  CONSTRAINT [DF_version_is_deprecated]  DEFAULT ((0)) FOR [is_deprecated]
GO
ALTER TABLE [dbo].[address]  WITH CHECK ADD  CONSTRAINT [FK_address_city] FOREIGN KEY([city_id])
REFERENCES [dbo].[city] ([city_id])
GO
ALTER TABLE [dbo].[address] CHECK CONSTRAINT [FK_address_city]
GO
ALTER TABLE [dbo].[address]  WITH CHECK ADD  CONSTRAINT [FK_address_country] FOREIGN KEY([country_id])
REFERENCES [dbo].[country] ([country_id])
GO
ALTER TABLE [dbo].[address] CHECK CONSTRAINT [FK_address_country]
GO
ALTER TABLE [dbo].[address]  WITH CHECK ADD  CONSTRAINT [FK_address_state] FOREIGN KEY([state_id])
REFERENCES [dbo].[state] ([state_id])
GO
ALTER TABLE [dbo].[address] CHECK CONSTRAINT [FK_address_state]
GO
ALTER TABLE [dbo].[branch]  WITH CHECK ADD  CONSTRAINT [FK_branch_iteration] FOREIGN KEY([iteration_id])
REFERENCES [dbo].[iteration] ([iteration_id])
GO
ALTER TABLE [dbo].[branch] CHECK CONSTRAINT [FK_branch_iteration]
GO
ALTER TABLE [dbo].[company_address_xref]  WITH CHECK ADD  CONSTRAINT [FK_company_address_xref_address] FOREIGN KEY([address_id])
REFERENCES [dbo].[address] ([address_id])
GO
ALTER TABLE [dbo].[company_address_xref] CHECK CONSTRAINT [FK_company_address_xref_address]
GO
ALTER TABLE [dbo].[company_address_xref]  WITH CHECK ADD  CONSTRAINT [FK_company_address_xref_company] FOREIGN KEY([company_id])
REFERENCES [dbo].[company] ([company_id])
GO
ALTER TABLE [dbo].[company_address_xref] CHECK CONSTRAINT [FK_company_address_xref_company]
GO
ALTER TABLE [dbo].[customer]  WITH CHECK ADD  CONSTRAINT [FK_customer_company] FOREIGN KEY([company_id])
REFERENCES [dbo].[company] ([company_id])
GO
ALTER TABLE [dbo].[customer] CHECK CONSTRAINT [FK_customer_company]
GO
ALTER TABLE [dbo].[customer_address_xref]  WITH CHECK ADD  CONSTRAINT [FK_customer_address_xref_address] FOREIGN KEY([address_id])
REFERENCES [dbo].[address] ([address_id])
GO
ALTER TABLE [dbo].[customer_address_xref] CHECK CONSTRAINT [FK_customer_address_xref_address]
GO
ALTER TABLE [dbo].[customer_address_xref]  WITH CHECK ADD  CONSTRAINT [FK_customer_address_xref_customer] FOREIGN KEY([customer_id])
REFERENCES [dbo].[customer] ([customer_id])
GO
ALTER TABLE [dbo].[customer_address_xref] CHECK CONSTRAINT [FK_customer_address_xref_customer]
GO
ALTER TABLE [dbo].[customer_release]  WITH CHECK ADD  CONSTRAINT [FK_customer_release_branch] FOREIGN KEY([branch_id])
REFERENCES [dbo].[branch] ([branch_id])
GO
ALTER TABLE [dbo].[customer_release] CHECK CONSTRAINT [FK_customer_release_branch]
GO
ALTER TABLE [dbo].[customer_release]  WITH CHECK ADD  CONSTRAINT [FK_customer_release_version] FOREIGN KEY([version_id])
REFERENCES [dbo].[version] ([version_id])
GO
ALTER TABLE [dbo].[customer_release] CHECK CONSTRAINT [FK_customer_release_version]
GO
ALTER TABLE [dbo].[customer_release_feature_xref]  WITH CHECK ADD  CONSTRAINT [FK_customer_release_feature_xref_customer_release] FOREIGN KEY([customer_release_id])
REFERENCES [dbo].[customer_release] ([customer_release_id])
GO
ALTER TABLE [dbo].[customer_release_feature_xref] CHECK CONSTRAINT [FK_customer_release_feature_xref_customer_release]
GO
ALTER TABLE [dbo].[customer_release_feature_xref]  WITH CHECK ADD  CONSTRAINT [FK_customer_release_feature_xref_feature] FOREIGN KEY([feature_id])
REFERENCES [dbo].[feature] ([feature_id])
GO
ALTER TABLE [dbo].[customer_release_feature_xref] CHECK CONSTRAINT [FK_customer_release_feature_xref_feature]
GO
ALTER TABLE [dbo].[customer_release_feature_xref]  WITH CHECK ADD  CONSTRAINT [FK_customer_release_feature_xref_status_of_feature] FOREIGN KEY([status_of_feature_id])
REFERENCES [dbo].[status_of_feature] ([status_of_feature_id])
GO
ALTER TABLE [dbo].[customer_release_feature_xref] CHECK CONSTRAINT [FK_customer_release_feature_xref_status_of_feature]
GO
ALTER TABLE [dbo].[development_release]  WITH CHECK ADD  CONSTRAINT [FK_development_release_branch] FOREIGN KEY([branch_id])
REFERENCES [dbo].[branch] ([branch_id])
GO
ALTER TABLE [dbo].[development_release] CHECK CONSTRAINT [FK_development_release_branch]
GO
ALTER TABLE [dbo].[development_release]  WITH CHECK ADD  CONSTRAINT [FK_development_release_version] FOREIGN KEY([version_id])
REFERENCES [dbo].[version] ([version_id])
GO
ALTER TABLE [dbo].[development_release] CHECK CONSTRAINT [FK_development_release_version]
GO
ALTER TABLE [dbo].[download]  WITH CHECK ADD  CONSTRAINT [FK_download_customer] FOREIGN KEY([customer_id])
REFERENCES [dbo].[customer] ([customer_id])
GO
ALTER TABLE [dbo].[download] CHECK CONSTRAINT [FK_download_customer]
GO
ALTER TABLE [dbo].[download]  WITH CHECK ADD  CONSTRAINT [FK_download_customer_release] FOREIGN KEY([customer_release_id])
REFERENCES [dbo].[customer_release] ([customer_release_id])
GO
ALTER TABLE [dbo].[download] CHECK CONSTRAINT [FK_download_customer_release]
GO
ALTER TABLE [dbo].[iteration]  WITH CHECK ADD  CONSTRAINT [FK_iteration_iteration] FOREIGN KEY([parent_iteration_id])
REFERENCES [dbo].[iteration] ([iteration_id])
GO
ALTER TABLE [dbo].[iteration] CHECK CONSTRAINT [FK_iteration_iteration]
GO
ALTER TABLE [dbo].[phone_number]  WITH CHECK ADD  CONSTRAINT [FK_phone_number_phone_type] FOREIGN KEY([phone_type_id])
REFERENCES [dbo].[phone_type] ([phone_type_id])
GO
ALTER TABLE [dbo].[phone_number] CHECK CONSTRAINT [FK_phone_number_phone_type]
GO
ALTER TABLE [dbo].[version]  WITH CHECK ADD  CONSTRAINT [FK_version_product] FOREIGN KEY([product_id])
REFERENCES [dbo].[product] ([product_id])
GO
ALTER TABLE [dbo].[version] CHECK CONSTRAINT [FK_version_product]
GO
