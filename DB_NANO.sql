USE [DB_NANO]
GO
/****** Object:  User [PAMAPERSADA\GRP_JIEP_FS_CIS_CISD_STDS]    Script Date: 06/05/2018 07:42:33 ******/
CREATE USER [PAMAPERSADA\GRP_JIEP_FS_CIS_CISD_STDS] FOR LOGIN [PAMAPERSADA\GRP_JIEP_FS_CIS_CISD_STDS]
GO
/****** Object:  User [PAMAPERSADA\outs016]    Script Date: 06/05/2018 07:42:33 ******/
CREATE USER [PAMAPERSADA\outs016] FOR LOGIN [PAMAPERSADA\outs016] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Schema [NANO]    Script Date: 06/05/2018 07:42:33 ******/
CREATE SCHEMA [NANO] AUTHORIZATION [dbo]
GO
/****** Object:  Table [NANO].[TBL_R_PELAPOR_VIP]    Script Date: 06/05/2018 07:42:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [NANO].[TBL_R_PELAPOR_VIP](
	[PID_PELAPOR] [varchar](50) NOT NULL,
	[UTAMA] [varchar](10) NULL,
	[URUTAN] [int] NULL,
	[CREATE_DATE] [datetime] NULL,
	[CREATE_BY] [varchar](10) NULL,
	[MODIFIED_DATE] [datetime] NULL,
	[MODIFIED_BY] [varchar](10) NULL,
 CONSTRAINT [PK_TBL_R_PELAPOR_VIP] PRIMARY KEY CLUSTERED 
(
	[PID_PELAPOR] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [IX_TBL_R_PELAPOR_VIP] UNIQUE NONCLUSTERED 
(
	[URUTAN] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [NANO].[TBL_R_PELAPOR_VIP] ([PID_PELAPOR], [UTAMA], [URUTAN], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY]) VALUES (N'087BBF18-6DF9-4EE9-8949-22DD316CC2D0', N'6107067', 4, NULL, NULL, NULL, NULL)
INSERT [NANO].[TBL_R_PELAPOR_VIP] ([PID_PELAPOR], [UTAMA], [URUTAN], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY]) VALUES (N'0E3E3F8D-3033-4BA9-A0DA-EB2DD4718940', N'1708040', 7, CAST(0x0000A84A009BDE42 AS DateTime), N'6113882', CAST(0x0000A84A009BDE42 AS DateTime), N'6113882')
INSERT [NANO].[TBL_R_PELAPOR_VIP] ([PID_PELAPOR], [UTAMA], [URUTAN], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY]) VALUES (N'49235FAF-C8B7-4B37-BF0A-0E6CBB210560', N'2016030', 5, NULL, NULL, NULL, NULL)
INSERT [NANO].[TBL_R_PELAPOR_VIP] ([PID_PELAPOR], [UTAMA], [URUTAN], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY]) VALUES (N'55D3BF58-5CC2-4F13-9DA5-9A4592527A75', N'6198008', NULL, NULL, NULL, NULL, NULL)
INSERT [NANO].[TBL_R_PELAPOR_VIP] ([PID_PELAPOR], [UTAMA], [URUTAN], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY]) VALUES (N'98A3F391-8A2E-45D0-AD1D-1E017D174AC3', N'6196076', 6, NULL, NULL, NULL, NULL)
INSERT [NANO].[TBL_R_PELAPOR_VIP] ([PID_PELAPOR], [UTAMA], [URUTAN], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY]) VALUES (N'A9C2C01A-F3C1-4DB6-9FCB-314532A3AFBB', N'6113882', 1, NULL, NULL, NULL, NULL)
INSERT [NANO].[TBL_R_PELAPOR_VIP] ([PID_PELAPOR], [UTAMA], [URUTAN], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY]) VALUES (N'B0B46249-4A34-43FE-9A5D-29C194F072C0', N'193078', 3, NULL, NULL, NULL, NULL)
INSERT [NANO].[TBL_R_PELAPOR_VIP] ([PID_PELAPOR], [UTAMA], [URUTAN], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY]) VALUES (N'B9C88599-4235-433A-B7DE-32B9C026166E', N'2017038', 2, NULL, NULL, NULL, NULL)
/****** Object:  StoredProcedure [NANO].[cusp_insertTBL_R_PELAPOR_VIP]    Script Date: 06/05/2018 07:42:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Yaqub
-- Create date: 20171107
-- Description:	TRIGER AFTER UPDATE TBL_M_EMPLOYEE_NANO --> TBL_R_PELAPOR_VIP 
-- =============================================
CREATE PROCEDURE [NANO].[cusp_insertTBL_R_PELAPOR_VIP] --'2016030'
	-- Add the parameters for the stored procedure here
	@sNRP varchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	DECLARE @iUrutan varchar(2);
	select @iUrutan= max(Z.URUTAN)
					FROM NANO.TBL_R_PELAPOR_VIP AS Z
			
	-- insert
	insert into	NANO.TBL_R_PELAPOR_VIP
	(
	PID_PELAPOR,
	UTAMA,
	URUTAN,
	CREATE_DATE,
	CREATE_BY
	) 
	select 
	NEWID(),
	@sNRP,
	@iUrutan+1,
	GETDATE(),
	'SYSTEM'
	  
	
END
GO
/****** Object:  Table [NANO].[TBL_M_ABOUT_PERSONS]    Script Date: 06/05/2018 07:42:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [NANO].[TBL_M_ABOUT_PERSONS](
	[PID_PERSON] [varchar](50) NOT NULL,
	[NRP] [varchar](10) NULL,
	[JABATAN] [varchar](50) NULL,
	[DESC] [text] NULL,
	[IMAGES] [varchar](50) NULL,
	[SORT] [int] NULL,
	[MODIFIED_BY] [varchar](10) NULL,
	[MODIFIED_DATE] [datetime] NULL,
 CONSTRAINT [PK_TBL_M_ABOUT_PERSONS] PRIMARY KEY CLUSTERED 
(
	[PID_PERSON] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [NANO].[TBL_M_ABOUT_PERSONS] ([PID_PERSON], [NRP], [JABATAN], [DESC], [IMAGES], [SORT], [MODIFIED_BY], [MODIFIED_DATE]) VALUES (N'087BBF18-6DF9-4EE9-8949-22DD316CC2D0', N'6107067', N'Pelatih Utama', N'Saya tidak menyangka bisa bergabung dengan anggota sel yang dinamis, mari bersama-sama bangun budaya 6 Nilai Inti PAMA melalui agenda kreatif kita.', N'http://jiepwsdv402/APPS/NANO/Images/6107067.jpg', 1, N'6107067', CAST(0x0000A86600AAB7C0 AS DateTime))
INSERT [NANO].[TBL_M_ABOUT_PERSONS] ([PID_PERSON], [NRP], [JABATAN], [DESC], [IMAGES], [SORT], [MODIFIED_BY], [MODIFIED_DATE]) VALUES (N'0E3E3F8D-3033-4BA9-A0DA-EB2DD4718940', N'1708040', N'Anggota', N'test5', N'http://jiepwsdv402/APPS/NANO/Images/1708040.jpg', 7, N'1708040', CAST(0x0000A84D00B90F6E AS DateTime))
INSERT [NANO].[TBL_M_ABOUT_PERSONS] ([PID_PERSON], [NRP], [JABATAN], [DESC], [IMAGES], [SORT], [MODIFIED_BY], [MODIFIED_DATE]) VALUES (N'49235FAF-C8B7-4B37-BF0A-0E6CBB210560', N'2016030', N'Anggota', N'Suasana kekeluargaan sangatlah penting dalam sebuah komunitas, walaupun kita memiliki karakter yang berbeda-beda, disinilah tempat kita untuk belajar dan mengenal sesama anggota komunitas. Kita berkumpul untuk tujuan yang sama.', N'http://jiepwsdv402/APPS/NANO/Images/2016030.jpg', 6, N'2016030', CAST(0x0000A8F500AC1D0E AS DateTime))
INSERT [NANO].[TBL_M_ABOUT_PERSONS] ([PID_PERSON], [NRP], [JABATAN], [DESC], [IMAGES], [SORT], [MODIFIED_BY], [MODIFIED_DATE]) VALUES (N'55D3BF58-5CC2-4F13-9DA5-9A4592527A75', N'6198008', N'Pelatih Utama', NULL, NULL, NULL, NULL, NULL)
INSERT [NANO].[TBL_M_ABOUT_PERSONS] ([PID_PERSON], [NRP], [JABATAN], [DESC], [IMAGES], [SORT], [MODIFIED_BY], [MODIFIED_DATE]) VALUES (N'98A3F391-8A2E-45D0-AD1D-1E017D174AC3', N'6196076', N'Anggota', N'test2', N'http://jiepwsdv402/APPS/NANO/Images/6196076.jpg', 4, N'6196076', CAST(0x0000A83200A565AE AS DateTime))
INSERT [NANO].[TBL_M_ABOUT_PERSONS] ([PID_PERSON], [NRP], [JABATAN], [DESC], [IMAGES], [SORT], [MODIFIED_BY], [MODIFIED_DATE]) VALUES (N'A9C2C01A-F3C1-4DB6-9FCB-314532A3AFBB', N'6113882', N'Ketua Sel', N'test1', N'http://jiepwsdv402/APPS/NANO/Images/6113882.jpg', 2, N'6113882', CAST(0x0000A83200A59E19 AS DateTime))
INSERT [NANO].[TBL_M_ABOUT_PERSONS] ([PID_PERSON], [NRP], [JABATAN], [DESC], [IMAGES], [SORT], [MODIFIED_BY], [MODIFIED_DATE]) VALUES (N'B0B46249-4A34-43FE-9A5D-29C194F072C0', N'193078', N'Anggota', N'test4', N'http://jiepwsdv402/APPS/NANO/Images/193078.jpg', 3, N'193078', CAST(0x0000A83200A58072 AS DateTime))
INSERT [NANO].[TBL_M_ABOUT_PERSONS] ([PID_PERSON], [NRP], [JABATAN], [DESC], [IMAGES], [SORT], [MODIFIED_BY], [MODIFIED_DATE]) VALUES (N'B9C88599-4235-433A-B7DE-32B9C026166E', N'2017038', N'Anggota', N'Bergabung menjadi anggota sel ini membuat pribadi mendapatkan lebih banyak pengalaman melalui kegiatan sel serta sharing-sharing menarik setiap minggu ny', N'http://jiepwsdv402/APPS/NANO/Images/2017038.jpg', 5, N'2017038', CAST(0x0000A83200A5284F AS DateTime))
/****** Object:  StoredProcedure [NANO].[cusp_UpdateTBL_R_PELAPOR_VIP]    Script Date: 06/05/2018 07:42:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Yaqub
-- Create date: 20171107
-- Description:	TRIGER AFTER UPDATE TBL_M_EMPLOYEE_NANO --> TBL_R_PELAPOR_VIP 
-- =============================================
CREATE PROCEDURE [NANO].[cusp_UpdateTBL_R_PELAPOR_VIP] --'2016030'
	-- Add the parameters for the stored procedure here
	@sNRP varchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	DECLARE @iCount int;
	select @iCount= COUNT(*)
					FROM NANO.TBL_R_PELAPOR_VIP AS Z
					WHERE Z.UTAMA = @sNRP
					
	DECLARE @iNRP varchar(50);
    SELECT @iNRP=A.NRP FROM [DB_NANO].[NANO].[TBL_M_EMPLOYEE_NANO] AS A
			WHERE A.STATUS=1
			AND A.MODIFIED_DATE =(SELECT MAX(MODIFIED_DATE) FROM [DB_NANO].[NANO].[TBL_M_EMPLOYEE_NANO]) 
					
	IF @iCount>0
	BEGIN
		DECLARE @iUrutan varchar(2);
		select @iUrutan= Z.URUTAN
						FROM NANO.TBL_R_PELAPOR_VIP AS Z
						WHERE Z.UTAMA = @sNRP
			
		--DELETE BERDASARKAN NRP
		DELETE 	FROM	NANO.TBL_R_PELAPOR_VIP 
		WHERE UTAMA=@sNRP
		
		DELETE 	FROM NANO.TBL_M_ABOUT_PERSONS
		WHERE NRP=@sNRP
		
		--Update  Kalibrasi URUTAN
		 UPDATE	A
		SET		A.URUTAN = A.URUTAN-1,
				A.MODIFIED_BY = 'SYSTEM',
				A.MODIFIED_DATE = GETDATE()
		FROM	NANO.TBL_R_PELAPOR_VIP AS A 
		WHERE A.URUTAN > @iUrutan
	END
	ELSE IF @sNRP=@iNRP
		BEGIN
		DECLARE @iUrutan_ varchar(2),@iPID varchar(50);
		select @iUrutan_= max(Z.URUTAN)
					FROM NANO.TBL_R_PELAPOR_VIP AS Z
		SELECT @iPID=A.PID_EMPLOYEE FROM [DB_NANO].[NANO].[TBL_M_EMPLOYEE_NANO] AS A
			WHERE A.STATUS=1
			AND A.MODIFIED_DATE =(SELECT MAX(MODIFIED_DATE) FROM [DB_NANO].[NANO].[TBL_M_EMPLOYEE_NANO])
			-- insert TBL_R_PELAPOR_VIP
			insert into	NANO.TBL_R_PELAPOR_VIP
			(
			PID_PELAPOR,
			UTAMA,
			URUTAN,
			CREATE_DATE,
			CREATE_BY
			) 
			select 
			NEWID(),
			@sNRP,
			@iUrutan_+1,
			GETDATE(),
			'SYSTEM'
			
			--insert 
			insert into NANO.TBL_M_ABOUT_PERSONS
			(
				PID_PERSON,
				NRP,
				MODIFIED_BY,
				MODIFIED_DATE
			)
			select 
			@iPID,
			@sNRP,
			'SYSTEM',
			GETDATE()
			
			
		END
	  
	
END
GO
/****** Object:  Table [NANO].[TBL_M_EMPLOYEE_NANO]    Script Date: 06/05/2018 07:42:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [NANO].[TBL_M_EMPLOYEE_NANO](
	[PID_EMPLOYEE] [varchar](50) NOT NULL,
	[NRP] [varchar](10) NOT NULL,
	[NAMA] [varchar](100) NULL,
	[COMP_USER] [varchar](10) NULL,
	[STATUS] [bit] NULL,
	[KET] [varchar](50) NULL,
	[TGL_JOIN] [date] NULL,
	[CREATE_DATE] [datetime] NULL,
	[CREATE_BY] [varchar](10) NULL,
	[MODIFIED_DATE] [datetime] NULL,
	[MODIFIED_BY] [varchar](10) NULL,
 CONSTRAINT [PK_TBL_M_EMPLOYEE_NANO_1] PRIMARY KEY CLUSTERED 
(
	[PID_EMPLOYEE] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [IX_TBL_M_EMPLOYEE_NANO] UNIQUE NONCLUSTERED 
(
	[NRP] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [NANO].[TBL_M_EMPLOYEE_NANO] ([PID_EMPLOYEE], [NRP], [NAMA], [COMP_USER], [STATUS], [KET], [TGL_JOIN], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY]) VALUES (N'087BBF18-6DF9-4EE9-8949-22DD316CC2D0', N'6107067', N'AGUS BUDI HARTO', N'P6107067', 1, NULL, CAST(0x0B3D0B00 AS Date), NULL, NULL, NULL, NULL)
INSERT [NANO].[TBL_M_EMPLOYEE_NANO] ([PID_EMPLOYEE], [NRP], [NAMA], [COMP_USER], [STATUS], [KET], [TGL_JOIN], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY]) VALUES (N'0E3E3F8D-3033-4BA9-A0DA-EB2DD4718940', N'1708040', N'CASMITA', N'L1708040', 1, NULL, CAST(0x9C3D0B00 AS Date), NULL, NULL, CAST(0x0000A84A009BDE3D AS DateTime), N'6113882')
INSERT [NANO].[TBL_M_EMPLOYEE_NANO] ([PID_EMPLOYEE], [NRP], [NAMA], [COMP_USER], [STATUS], [KET], [TGL_JOIN], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY]) VALUES (N'49235FAF-C8B7-4B37-BF0A-0E6CBB210560', N'2016030', N'YAQUB EDY SUSILO', N'outs002', 1, NULL, CAST(0x0B3D0B00 AS Date), CAST(0x0000A8F500000000 AS DateTime), NULL, CAST(0x0000A8F500AC1D09 AS DateTime), N'2016030')
INSERT [NANO].[TBL_M_EMPLOYEE_NANO] ([PID_EMPLOYEE], [NRP], [NAMA], [COMP_USER], [STATUS], [KET], [TGL_JOIN], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY]) VALUES (N'55D3BF58-5CC2-4F13-9DA5-9A4592527A75', N'6198008', N'SETYO SETO AJI', N'P6198008', 0, NULL, CAST(0x0B3D0B00 AS Date), NULL, NULL, CAST(0x0000A84B009BDE3D AS DateTime), NULL)
INSERT [NANO].[TBL_M_EMPLOYEE_NANO] ([PID_EMPLOYEE], [NRP], [NAMA], [COMP_USER], [STATUS], [KET], [TGL_JOIN], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY]) VALUES (N'98A3F391-8A2E-45D0-AD1D-1E017D174AC3', N'6196076', N'SATARSO AGUS TJAHJONO', N'P6196076', 1, NULL, CAST(0x0B3D0B00 AS Date), NULL, NULL, NULL, NULL)
INSERT [NANO].[TBL_M_EMPLOYEE_NANO] ([PID_EMPLOYEE], [NRP], [NAMA], [COMP_USER], [STATUS], [KET], [TGL_JOIN], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY]) VALUES (N'A9C2C01A-F3C1-4DB6-9FCB-314532A3AFBB', N'6113882', N'ARTDITYO PRIAMBODHO', N'P6113882', 1, NULL, CAST(0x0B3D0B00 AS Date), NULL, NULL, NULL, NULL)
INSERT [NANO].[TBL_M_EMPLOYEE_NANO] ([PID_EMPLOYEE], [NRP], [NAMA], [COMP_USER], [STATUS], [KET], [TGL_JOIN], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY]) VALUES (N'B0B46249-4A34-43FE-9A5D-29C194F072C0', N'193078', N'SUKRON', N'P193078', 1, NULL, CAST(0x0B3D0B00 AS Date), NULL, NULL, NULL, NULL)
INSERT [NANO].[TBL_M_EMPLOYEE_NANO] ([PID_EMPLOYEE], [NRP], [NAMA], [COMP_USER], [STATUS], [KET], [TGL_JOIN], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY]) VALUES (N'B9C88599-4235-433A-B7DE-32B9C026166E', N'2017038', N'ANNISAA RAHMAYANI NURFAJAR', N'L2017038', 1, NULL, CAST(0x0B3D0B00 AS Date), NULL, NULL, NULL, NULL)
/****** Object:  View [NANO].[VW_TBL_M_EMPLOYEE_NANO]    Script Date: 06/05/2018 07:42:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [NANO].[VW_TBL_M_EMPLOYEE_NANO]
AS
SELECT     '-' AS PID_EMPLOYEE, '-' AS NRP, ' ALL' AS NAMA, '-' AS COMP_USER, '1' AS STATUS, NULL AS KET
UNION ALL
SELECT     PID_EMPLOYEE, NRP, NAMA, COMP_USER, STATUS, KET
FROM         NANO.TBL_M_EMPLOYEE_NANO
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'NANO', @level1type=N'VIEW',@level1name=N'VW_TBL_M_EMPLOYEE_NANO'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'NANO', @level1type=N'VIEW',@level1name=N'VW_TBL_M_EMPLOYEE_NANO'
GO
/****** Object:  UserDefinedFunction [NANO].[cufn_PersentasePerMeering]    Script Date: 06/05/2018 07:42:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author		: Yaqub
-- Create date	: 27-10-2017
-- Description	: Menghitung PERSENTASI KEHADIRAN MEETING hari Terakhir
-- =============================================
CREATE FUNCTION [NANO].[cufn_PersentasePerMeering](@sTgl varchar(10)) 
	
	RETURNS VARCHAR(100)
	AS
	BEGIN

	DECLARE @iHadir FLOAT=(SELECT COUNT(1) 
							from NANO.VW_KEHADIRAN_MEETING 
							WHERE  KEHADIRAN=1 
							AND TGL_PLAN=@sTgl
							AND NRP IN (SELECT NRP FROM NANO.TBL_M_EMPLOYEE_NANO WHERE TGL_JOIN<=@sTgl))

	DECLARE @Return FLOAT=(
		
	select round((@iHadir/COUNT(1))*100,2)
		from NANO.VW_KEHADIRAN_MEETING
		where --STATUS=1
			 TGL_PLAN=@sTgl	
			 AND NRP IN (SELECT NRP FROM NANO.TBL_M_EMPLOYEE_NANO WHERE TGL_JOIN<=@sTgl)
	)

	RETURN @Return
	END
GO
/****** Object:  UserDefinedFunction [NANO].[cufn_PersentaseKehadiran]    Script Date: 06/05/2018 07:42:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author		: Yaqub
-- Create date	: 27-10-2017
-- Description	: Menghitung PERSENTASI KEHADIRAN MEETING per Orang
-- =============================================
CREATE FUNCTION [NANO].[cufn_PersentaseKehadiran]
(
@sNrp varchar(10),
@sTgl varchar(50)
) 
	
	RETURNS FLOAT
	AS
	BEGIN
	
	DECLARE @iTglJoin date=(SELECT TGL_JOIN FROM NANO.TBL_M_EMPLOYEE_NANO WHERE NRP=@sNrp)
	DECLARE	@iHadir FLOAT=(
		SELECT COUNT(1) 
		FROM NANO.VW_KEHADIRAN_MEETING
		where 
			 NRP=@sNrp 
			AND KEHADIRAN=1
			AND TGL_PLAN<=@sTgl
			AND TGL_ACT>=@iTglJoin
		)
	DECLARE @iTdkHadir FLOAT=(
		SELECT COUNT(1) 
		FROM NANO.VW_KEHADIRAN_MEETING
		where --STATUS=1
			 NRP=@sNrp 
			AND TGL_PLAN<=@sTgl
			AND TGL_ACT>=@iTglJoin			
		)
		
	IF(@iHadir=0 AND @iTdkHadir=0)
		BEGIN
			SET @iTdkHadir=1
		END 
	DECLARE @Return FLOAT=(
	
	SELECT ROUND((@iHadir/@iTdkHadir)*100,2) AS PERSENTASE
	
	)

	RETURN @Return
	END


--DECLARE @sNrp VARCHAR(50)=2016030,
--		@sTgl DATE='2017-07-14',
--		@iTglJoin DATE='2017-07-28'
--SELECT COUNT(1) 
--		FROM NANO.VW_KEHADIRAN_MEETING
--		where 
--			 NRP=@sNrp 
--			AND KEHADIRAN=1
--			AND TGL_PLAN<=@sTgl
--			AND TGL_ACT>=@iTglJoin
			
--SELECT COUNT(1) 
--		FROM NANO.VW_KEHADIRAN_MEETING
--		where --STATUS=1
--			 NRP=@sNrp 
--			AND TGL_PLAN<=@sTgl
--			AND TGL_ACT>=@iTglJoin	
			
			
			
--SELECT ROUND((0/1)*2,2)
GO
/****** Object:  Table [NANO].[TBL_M_CHALLENGE]    Script Date: 06/05/2018 07:42:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [NANO].[TBL_M_CHALLENGE](
	[PID_CH] [varchar](50) NOT NULL,
	[CHALLENGE] [varchar](50) NULL,
 CONSTRAINT [PK_TBL_M_CHALLENGE] PRIMARY KEY CLUSTERED 
(
	[PID_CH] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [NANO].[TBL_M_CHALLENGE] ([PID_CH], [CHALLENGE]) VALUES (N'17860A2E-B8C1-4849-A987-4FCDD559A0EA', N'Memberikan masukkan untuk Sel Nilai Inti NaNo')
INSERT [NANO].[TBL_M_CHALLENGE] ([PID_CH], [CHALLENGE]) VALUES (N'28B011D8-3CB8-4294-B8FA-FDE1F956FD50', N'Meminta masukkan atas masalah yang dihadapi')
INSERT [NANO].[TBL_M_CHALLENGE] ([PID_CH], [CHALLENGE]) VALUES (N'2BD0E70E-4468-4E4F-924E-C875B50EF07E', N'Tip & Trik terkait Kesehatan')
INSERT [NANO].[TBL_M_CHALLENGE] ([PID_CH], [CHALLENGE]) VALUES (N'4624273A-BD9E-4D0F-81DB-40A8EF5E3014', N'Opini tentang bisnis PAMA')
INSERT [NANO].[TBL_M_CHALLENGE] ([PID_CH], [CHALLENGE]) VALUES (N'46711E25-B78A-4E72-8A45-F584D756748F', N'Memberi kritik/masukkan yang positif rekan tim')
INSERT [NANO].[TBL_M_CHALLENGE] ([PID_CH], [CHALLENGE]) VALUES (N'521A5E21-64EB-4472-8F97-2120F572B567', N'Memberi Nasehat 5 menit')
INSERT [NANO].[TBL_M_CHALLENGE] ([PID_CH], [CHALLENGE]) VALUES (N'5402739E-D13C-4E38-A2BA-717EED784B4B', N'Stand up comedy')
INSERT [NANO].[TBL_M_CHALLENGE] ([PID_CH], [CHALLENGE]) VALUES (N'5E9CE4F0-1C57-4CFC-9817-890454DBB111', N'Baca Puisi 1 menit')
INSERT [NANO].[TBL_M_CHALLENGE] ([PID_CH], [CHALLENGE]) VALUES (N'637B4AE6-2164-47B8-A8E8-817578BECDB4', N'Tip & Trik terkait Teknis')
INSERT [NANO].[TBL_M_CHALLENGE] ([PID_CH], [CHALLENGE]) VALUES (N'6C29699E-283E-4B9C-9B80-21927165F3FF', N'Opini tentang Negera & Bangsa')
INSERT [NANO].[TBL_M_CHALLENGE] ([PID_CH], [CHALLENGE]) VALUES (N'6C7909D2-DA2B-42FA-92A6-6757C730BD07', N'Memimpin gerakan olahraga selama 5 menit')
INSERT [NANO].[TBL_M_CHALLENGE] ([PID_CH], [CHALLENGE]) VALUES (N'707CBCE5-381F-4F9F-83F4-F74F2486487C', N'Sharing Makna ayat AlQuran & Hadis')
INSERT [NANO].[TBL_M_CHALLENGE] ([PID_CH], [CHALLENGE]) VALUES (N'A17A908F-F5D6-4804-9474-EE3E1CA98140', N'Sharing Pekerjaan 15 menit')
INSERT [NANO].[TBL_M_CHALLENGE] ([PID_CH], [CHALLENGE]) VALUES (N'BCE45F08-B185-44E5-BE83-32FACD71159A', N'Story Telling non bahasa')
INSERT [NANO].[TBL_M_CHALLENGE] ([PID_CH], [CHALLENGE]) VALUES (N'C8F6E349-F872-49E1-A6B3-7A89D2DF14FE', N'Menceritakan film yang pernah ditonton')
INSERT [NANO].[TBL_M_CHALLENGE] ([PID_CH], [CHALLENGE]) VALUES (N'D8015088-601E-42F8-9671-7D9CAB3F4A88', N'Menceritakan isi buku yang pernah dibaca')
INSERT [NANO].[TBL_M_CHALLENGE] ([PID_CH], [CHALLENGE]) VALUES (N'DA0EB649-313E-4AE5-A6B4-810E2473EA7D', N'Menggambar sambil cerita')
INSERT [NANO].[TBL_M_CHALLENGE] ([PID_CH], [CHALLENGE]) VALUES (N'E8061A13-C28C-4466-A7E9-F6BFF94B8BC1', N'Nyanyi ')
INSERT [NANO].[TBL_M_CHALLENGE] ([PID_CH], [CHALLENGE]) VALUES (N'F284EDD6-20C1-42AB-A150-8E3BDF5D0FD0', N'Tip & Trik terkait Pertanian & Peternakan')
INSERT [NANO].[TBL_M_CHALLENGE] ([PID_CH], [CHALLENGE]) VALUES (N'F88399A7-A3DD-4268-A23A-67955A1CB668', N'Sharing Pengalaman 15 menit')
/****** Object:  View [NANO].[VW_TBL_M_ABOUT_PERSONS]    Script Date: 06/05/2018 07:42:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [NANO].[VW_TBL_M_ABOUT_PERSONS]
AS
SELECT     A.PID_PERSON, A.NRP, B.NAMA, A.JABATAN, A.[DESC], A.IMAGES, A.SORT
FROM         NANO.TBL_M_ABOUT_PERSONS AS A INNER JOIN
                          (SELECT     PID_EMPLOYEE, NRP, NAMA, COMP_USER, STATUS, KET, TGL_JOIN, CREATE_DATE, CREATE_BY, MODIFIED_DATE, MODIFIED_BY
                            FROM          NANO.TBL_M_EMPLOYEE_NANO
                            WHERE      (STATUS = 1)) AS B ON A.NRP = B.NRP
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[32] 4[18] 2[13] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "A"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 207
               Right = 198
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "B"
            Begin Extent = 
               Top = 6
               Left = 236
               Bottom = 125
               Right = 407
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'NANO', @level1type=N'VIEW',@level1name=N'VW_TBL_M_ABOUT_PERSONS'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'NANO', @level1type=N'VIEW',@level1name=N'VW_TBL_M_ABOUT_PERSONS'
GO
/****** Object:  View [NANO].[VW_ANGGOTA]    Script Date: 06/05/2018 07:42:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [NANO].[VW_ANGGOTA]
AS
SELECT     NANO.TBL_M_EMPLOYEE_NANO.PID_EMPLOYEE, NANO.TBL_M_EMPLOYEE_NANO.NRP, NANO.TBL_M_EMPLOYEE_NANO.NAMA, 
                      NANO.TBL_M_EMPLOYEE_NANO.COMP_USER, NANO.TBL_M_EMPLOYEE_NANO.STATUS, NANO.TBL_M_EMPLOYEE_NANO.TGL_JOIN, 
                      NANO.TBL_M_ABOUT_PERSONS.JABATAN, NANO.TBL_M_ABOUT_PERSONS.SORT, NANO.TBL_M_EMPLOYEE_NANO.KET
FROM         NANO.TBL_M_EMPLOYEE_NANO LEFT OUTER JOIN
                      NANO.TBL_M_ABOUT_PERSONS ON NANO.TBL_M_EMPLOYEE_NANO.PID_EMPLOYEE = NANO.TBL_M_ABOUT_PERSONS.PID_PERSON
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[41] 4[20] 2[11] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "TBL_M_EMPLOYEE_NANO (NANO)"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 263
               Right = 209
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "TBL_M_ABOUT_PERSONS (NANO)"
            Begin Extent = 
               Top = 76
               Left = 270
               Bottom = 263
               Right = 441
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 10
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'NANO', @level1type=N'VIEW',@level1name=N'VW_ANGGOTA'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'NANO', @level1type=N'VIEW',@level1name=N'VW_ANGGOTA'
GO
/****** Object:  Table [NANO].[TBL_R_SCORE]    Script Date: 06/05/2018 07:42:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [NANO].[TBL_R_SCORE](
	[ID_SCORE] [int] NOT NULL,
	[SCORE_DESC] [varchar](50) NULL,
 CONSTRAINT [PK_TBL_R_SCORE] PRIMARY KEY CLUSTERED 
(
	[ID_SCORE] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [NANO].[TBL_R_SCORE] ([ID_SCORE], [SCORE_DESC]) VALUES (1, N'MENOLAK')
INSERT [NANO].[TBL_R_SCORE] ([ID_SCORE], [SCORE_DESC]) VALUES (2, N'TIDAK SEMPURNA')
INSERT [NANO].[TBL_R_SCORE] ([ID_SCORE], [SCORE_DESC]) VALUES (3, N'BERHASIL')
/****** Object:  Table [NANO].[TBL_R_PELAPOR_VIP_backup]    Script Date: 06/05/2018 07:42:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [NANO].[TBL_R_PELAPOR_VIP_backup](
	[PID_PELAPOR] [varchar](50) NOT NULL,
	[UTAMA] [varchar](10) NULL,
	[URUTAN] [int] NULL,
	[CREATE_DATE] [datetime] NULL,
	[CREATE_BY] [varchar](10) NULL,
	[MODIFIED_DATE] [datetime] NULL,
	[MODIFIED_BY] [varchar](10) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [NANO].[TBL_R_PELAPOR_VIP_backup] ([PID_PELAPOR], [UTAMA], [URUTAN], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY]) VALUES (N'087BBF18-6DF9-4EE9-8949-22DD316CC2D0', N'6107067', 4, NULL, NULL, NULL, NULL)
INSERT [NANO].[TBL_R_PELAPOR_VIP_backup] ([PID_PELAPOR], [UTAMA], [URUTAN], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY]) VALUES (N'0E3E3F8D-3033-4BA9-A0DA-EB2DD4718940', N'1708040', 7, CAST(0x0000A84A009BDE42 AS DateTime), N'6113882', CAST(0x0000A84A009BDE42 AS DateTime), N'6113882')
INSERT [NANO].[TBL_R_PELAPOR_VIP_backup] ([PID_PELAPOR], [UTAMA], [URUTAN], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY]) VALUES (N'49235FAF-C8B7-4B37-BF0A-0E6CBB210560', N'2016030', 5, NULL, NULL, NULL, NULL)
INSERT [NANO].[TBL_R_PELAPOR_VIP_backup] ([PID_PELAPOR], [UTAMA], [URUTAN], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY]) VALUES (N'55D3BF58-5CC2-4F13-9DA5-9A4592527A75', N'6198008', NULL, NULL, NULL, NULL, NULL)
INSERT [NANO].[TBL_R_PELAPOR_VIP_backup] ([PID_PELAPOR], [UTAMA], [URUTAN], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY]) VALUES (N'98A3F391-8A2E-45D0-AD1D-1E017D174AC3', N'6196076', 6, NULL, NULL, NULL, NULL)
INSERT [NANO].[TBL_R_PELAPOR_VIP_backup] ([PID_PELAPOR], [UTAMA], [URUTAN], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY]) VALUES (N'A9C2C01A-F3C1-4DB6-9FCB-314532A3AFBB', N'6113882', 1, NULL, NULL, NULL, NULL)
INSERT [NANO].[TBL_R_PELAPOR_VIP_backup] ([PID_PELAPOR], [UTAMA], [URUTAN], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY]) VALUES (N'B0B46249-4A34-43FE-9A5D-29C194F072C0', N'193078', 3, NULL, NULL, NULL, NULL)
INSERT [NANO].[TBL_R_PELAPOR_VIP_backup] ([PID_PELAPOR], [UTAMA], [URUTAN], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY]) VALUES (N'B9C88599-4235-433A-B7DE-32B9C026166E', N'2017038', 2, NULL, NULL, NULL, NULL)
/****** Object:  View [NANO].[VW_PLAN_PIC]    Script Date: 06/05/2018 07:42:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [NANO].[VW_PLAN_PIC]
AS
SELECT    A.PID_PELAPOR, A.UTAMA,C.NAMA AS UTAMA_DESC, B.UTAMA AS CADANGAN,D.NAMA AS CADANGAN_DESC, A.URUTAN
FROM         (SELECT    PID_PELAPOR, UTAMA, CASE WHEN URUTAN =
                                                  (SELECT     MAX(URUTAN)
                                                    FROM          NANO.TBL_R_PELAPOR_VIP) THEN 0 ELSE URUTAN END AS URUTAN_, URUTAN
                       FROM          NANO.TBL_R_PELAPOR_VIP) AS A INNER JOIN
                          (SELECT     UTAMA, URUTAN - 1 AS URUTAN_
                            FROM          NANO.TBL_R_PELAPOR_VIP AS TBL_R_PELAPOR_VIP_1) AS B ON A.URUTAN_ = B.URUTAN_
                            LEFT OUTER JOIN
                      (select * from NANO.TBL_M_EMPLOYEE_NANO where STATUS=1) AS C ON A.UTAMA = C.NRP LEFT OUTER JOIN
                      (select * from NANO.TBL_M_EMPLOYEE_NANO where STATUS=1) AS D ON B.UTAMA = D.NRP
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "A"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 198
               Right = 209
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "B"
            Begin Extent = 
               Top = 18
               Left = 325
               Bottom = 137
               Right = 496
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "C"
            Begin Extent = 
               Top = 140
               Left = 329
               Bottom = 259
               Right = 500
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'NANO', @level1type=N'VIEW',@level1name=N'VW_PLAN_PIC'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'NANO', @level1type=N'VIEW',@level1name=N'VW_PLAN_PIC'
GO
/****** Object:  Table [NANO].[TBL_R_KEHADIRAN]    Script Date: 06/05/2018 07:42:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [NANO].[TBL_R_KEHADIRAN](
	[ID_KEHADIRAN] [varchar](1) NOT NULL,
	[KEHADIRAN_DESC] [varchar](50) NULL,
 CONSTRAINT [PK_TBL_R_KEHADIRAN] PRIMARY KEY CLUSTERED 
(
	[ID_KEHADIRAN] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [NANO].[TBL_R_KEHADIRAN] ([ID_KEHADIRAN], [KEHADIRAN_DESC]) VALUES (N'1', N'HADIR')
INSERT [NANO].[TBL_R_KEHADIRAN] ([ID_KEHADIRAN], [KEHADIRAN_DESC]) VALUES (N'2', N'TIDAK HADIR')
INSERT [NANO].[TBL_R_KEHADIRAN] ([ID_KEHADIRAN], [KEHADIRAN_DESC]) VALUES (N'3', N'MEETING LAIN')
INSERT [NANO].[TBL_R_KEHADIRAN] ([ID_KEHADIRAN], [KEHADIRAN_DESC]) VALUES (N'4', N'DINAS KE SITE')
INSERT [NANO].[TBL_R_KEHADIRAN] ([ID_KEHADIRAN], [KEHADIRAN_DESC]) VALUES (N'5', N'TRAINING')
INSERT [NANO].[TBL_R_KEHADIRAN] ([ID_KEHADIRAN], [KEHADIRAN_DESC]) VALUES (N'6', N'SAKIT')
INSERT [NANO].[TBL_R_KEHADIRAN] ([ID_KEHADIRAN], [KEHADIRAN_DESC]) VALUES (N'7', N'IJIN')
INSERT [NANO].[TBL_R_KEHADIRAN] ([ID_KEHADIRAN], [KEHADIRAN_DESC]) VALUES (N'8', N'CUTI')
/****** Object:  Table [NANO].[TBL_M_PLAN_VIP]    Script Date: 06/05/2018 07:42:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [NANO].[TBL_M_PLAN_VIP](
	[PID_PLAN_VIP] [varchar](50) NOT NULL,
	[TANGGAL] [date] NULL,
	[URUTAN] [int] NULL,
	[KET] [varchar](50) NULL,
	[CREATE_BY] [varchar](50) NULL,
	[CREATE_DATE] [datetime] NULL,
	[MODIFIED_BY] [varchar](50) NULL,
	[MODIFIED_DATE] [datetime] NULL,
 CONSTRAINT [PK_TBL_M_PLAN_VIP] PRIMARY KEY CLUSTERED 
(
	[PID_PLAN_VIP] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [NANO].[TBL_M_PLAN_VIP] ([PID_PLAN_VIP], [TANGGAL], [URUTAN], [KET], [CREATE_BY], [CREATE_DATE], [MODIFIED_BY], [MODIFIED_DATE]) VALUES (N'02EF85FF-E2B9-47EB-B157-C71AFE8629CA', CAST(0xD43D0B00 AS Date), 7, NULL, N'2016030', CAST(0x0000A87400822046 AS DateTime), N'2016030', CAST(0x0000A87400822046 AS DateTime))
INSERT [NANO].[TBL_M_PLAN_VIP] ([PID_PLAN_VIP], [TANGGAL], [URUTAN], [KET], [CREATE_BY], [CREATE_DATE], [MODIFIED_BY], [MODIFIED_DATE]) VALUES (N'03E1BCE9-98D1-403A-A755-BDC8B7CD5969', CAST(0x723D0B00 AS Date), 6, NULL, NULL, NULL, NULL, NULL)
INSERT [NANO].[TBL_M_PLAN_VIP] ([PID_PLAN_VIP], [TANGGAL], [URUTAN], [KET], [CREATE_BY], [CREATE_DATE], [MODIFIED_BY], [MODIFIED_DATE]) VALUES (N'1C621B4C-1F46-4098-AD81-ADC0C7217647', CAST(0xE23D0B00 AS Date), 1, NULL, N'2016030', CAST(0x0000A88100AC5727 AS DateTime), N'2016030', CAST(0x0000A88100AC5727 AS DateTime))
INSERT [NANO].[TBL_M_PLAN_VIP] ([PID_PLAN_VIP], [TANGGAL], [URUTAN], [KET], [CREATE_BY], [CREATE_DATE], [MODIFIED_BY], [MODIFIED_DATE]) VALUES (N'3D6741FB-6B01-4929-B9AC-84719942E880', CAST(0x3A3D0B00 AS Date), 2, NULL, NULL, NULL, NULL, NULL)
INSERT [NANO].[TBL_M_PLAN_VIP] ([PID_PLAN_VIP], [TANGGAL], [URUTAN], [KET], [CREATE_BY], [CREATE_DATE], [MODIFIED_BY], [MODIFIED_DATE]) VALUES (N'465D9432-2AEC-4F13-8143-E9EFEA299021', CAST(0x103D0B00 AS Date), 5, NULL, NULL, NULL, NULL, NULL)
INSERT [NANO].[TBL_M_PLAN_VIP] ([PID_PLAN_VIP], [TANGGAL], [URUTAN], [KET], [CREATE_BY], [CREATE_DATE], [MODIFIED_BY], [MODIFIED_DATE]) VALUES (N'4B44ACAC-E435-41D7-9062-07FFE1DA19B0', CAST(0xFE3D0B00 AS Date), 3, NULL, N'6107067', CAST(0x0000A89E00888810 AS DateTime), N'6107067', CAST(0x0000A89E00888810 AS DateTime))
INSERT [NANO].[TBL_M_PLAN_VIP] ([PID_PLAN_VIP], [TANGGAL], [URUTAN], [KET], [CREATE_BY], [CREATE_DATE], [MODIFIED_BY], [MODIFIED_DATE]) VALUES (N'4ED5DCDF-096E-40B9-8F48-3BE9274BAEA8', CAST(0x9C3D0B00 AS Date), 3, NULL, N'2016030', CAST(0x0000A83900A63B9E AS DateTime), N'2016030', CAST(0x0000A83900A63B9E AS DateTime))
INSERT [NANO].[TBL_M_PLAN_VIP] ([PID_PLAN_VIP], [TANGGAL], [URUTAN], [KET], [CREATE_BY], [CREATE_DATE], [MODIFIED_BY], [MODIFIED_DATE]) VALUES (N'529B823C-A2FD-4E00-B6DD-F3933B93A65E', CAST(0x283E0B00 AS Date), 6, NULL, N'6107067', CAST(0x0000A8C800987B07 AS DateTime), N'6107067', CAST(0x0000A8C800987B07 AS DateTime))
INSERT [NANO].[TBL_M_PLAN_VIP] ([PID_PLAN_VIP], [TANGGAL], [URUTAN], [KET], [CREATE_BY], [CREATE_DATE], [MODIFIED_BY], [MODIFIED_DATE]) VALUES (N'567CE51A-083A-42B0-B432-84D5B0BC7C92', CAST(0xB83D0B00 AS Date), 5, NULL, N'2016030', CAST(0x0000A857008777AC AS DateTime), N'2016030', CAST(0x0000A857008777AC AS DateTime))
INSERT [NANO].[TBL_M_PLAN_VIP] ([PID_PLAN_VIP], [TANGGAL], [URUTAN], [KET], [CREATE_BY], [CREATE_DATE], [MODIFIED_BY], [MODIFIED_DATE]) VALUES (N'616F8ACC-350A-4250-B312-F124BAD7BA38', CAST(0x1E3D0B00 AS Date), 6, NULL, NULL, NULL, NULL, NULL)
INSERT [NANO].[TBL_M_PLAN_VIP] ([PID_PLAN_VIP], [TANGGAL], [URUTAN], [KET], [CREATE_BY], [CREATE_DATE], [MODIFIED_BY], [MODIFIED_DATE]) VALUES (N'62671277-693F-4430-B710-0A119E7B4912', CAST(0x643D0B00 AS Date), 5, NULL, NULL, NULL, NULL, NULL)
INSERT [NANO].[TBL_M_PLAN_VIP] ([PID_PLAN_VIP], [TANGGAL], [URUTAN], [KET], [CREATE_BY], [CREATE_DATE], [MODIFIED_BY], [MODIFIED_DATE]) VALUES (N'6560328F-539B-4E0A-A07F-F7A0AA933B3A', CAST(0xC63D0B00 AS Date), 6, NULL, N'2016030', CAST(0x0000A8630083D43A AS DateTime), N'2016030', CAST(0x0000A8630083D43A AS DateTime))
INSERT [NANO].[TBL_M_PLAN_VIP] ([PID_PLAN_VIP], [TANGGAL], [URUTAN], [KET], [CREATE_BY], [CREATE_DATE], [MODIFIED_BY], [MODIFIED_DATE]) VALUES (N'7CB21EBB-D6A9-4221-9D9B-8BCD031B4969', CAST(0x563D0B00 AS Date), 4, NULL, NULL, NULL, NULL, NULL)
INSERT [NANO].[TBL_M_PLAN_VIP] ([PID_PLAN_VIP], [TANGGAL], [URUTAN], [KET], [CREATE_BY], [CREATE_DATE], [MODIFIED_BY], [MODIFIED_DATE]) VALUES (N'812F9056-790F-44B5-A3DB-5EAAC0ADE033', CAST(0x2C3D0B00 AS Date), 1, NULL, NULL, NULL, NULL, NULL)
INSERT [NANO].[TBL_M_PLAN_VIP] ([PID_PLAN_VIP], [TANGGAL], [URUTAN], [KET], [CREATE_BY], [CREATE_DATE], [MODIFIED_BY], [MODIFIED_DATE]) VALUES (N'81C58F4F-A584-445E-8140-080E31C2C2B0', CAST(0x803D0B00 AS Date), 1, NULL, NULL, NULL, NULL, NULL)
INSERT [NANO].[TBL_M_PLAN_VIP] ([PID_PLAN_VIP], [TANGGAL], [URUTAN], [KET], [CREATE_BY], [CREATE_DATE], [MODIFIED_BY], [MODIFIED_DATE]) VALUES (N'86271DDC-8A47-4C26-8016-9450C4C6BA34', CAST(0x0C3E0B00 AS Date), 4, NULL, N'2016030', CAST(0x0000A8B000DD2988 AS DateTime), N'2016030', CAST(0x0000A8B000DD2988 AS DateTime))
INSERT [NANO].[TBL_M_PLAN_VIP] ([PID_PLAN_VIP], [TANGGAL], [URUTAN], [KET], [CREATE_BY], [CREATE_DATE], [MODIFIED_BY], [MODIFIED_DATE]) VALUES (N'86322FC6-B30B-43B9-905D-8F39222A32D4', CAST(0x483D0B00 AS Date), 3, NULL, NULL, NULL, NULL, NULL)
INSERT [NANO].[TBL_M_PLAN_VIP] ([PID_PLAN_VIP], [TANGGAL], [URUTAN], [KET], [CREATE_BY], [CREATE_DATE], [MODIFIED_BY], [MODIFIED_DATE]) VALUES (N'8BFF926B-E655-497A-B991-6FCF0DFB6F67', CAST(0xAA3D0B00 AS Date), 4, NULL, N'2016030', CAST(0x0000A8470098D06A AS DateTime), N'2016030', CAST(0x0000A8470098D06A AS DateTime))
INSERT [NANO].[TBL_M_PLAN_VIP] ([PID_PLAN_VIP], [TANGGAL], [URUTAN], [KET], [CREATE_BY], [CREATE_DATE], [MODIFIED_BY], [MODIFIED_DATE]) VALUES (N'94443FEF-97BF-4D2E-9FA6-5B7D8FD4DD6E', CAST(0x523E0B00 AS Date), 2, NULL, N'2017038', CAST(0x0000A8F000E93EAD AS DateTime), N'2017038', CAST(0x0000A8F000E93EAD AS DateTime))
INSERT [NANO].[TBL_M_PLAN_VIP] ([PID_PLAN_VIP], [TANGGAL], [URUTAN], [KET], [CREATE_BY], [CREATE_DATE], [MODIFIED_BY], [MODIFIED_DATE]) VALUES (N'9F3E9E8E-B04E-43A1-8968-E435CA7D3827', CAST(0x363E0B00 AS Date), 7, NULL, N'6107067', CAST(0x0000A8D6008CFC4E AS DateTime), N'6107067', CAST(0x0000A8D6008CFC4E AS DateTime))
INSERT [NANO].[TBL_M_PLAN_VIP] ([PID_PLAN_VIP], [TANGGAL], [URUTAN], [KET], [CREATE_BY], [CREATE_DATE], [MODIFIED_BY], [MODIFIED_DATE]) VALUES (N'B5E0942D-79A8-48DD-93CA-1C9363707742', CAST(0x443E0B00 AS Date), 1, NULL, N'2016030', CAST(0x0000A8E40090C933 AS DateTime), N'2016030', CAST(0x0000A8E40090C933 AS DateTime))
INSERT [NANO].[TBL_M_PLAN_VIP] ([PID_PLAN_VIP], [TANGGAL], [URUTAN], [KET], [CREATE_BY], [CREATE_DATE], [MODIFIED_BY], [MODIFIED_DATE]) VALUES (N'BA35D6DB-5800-4E82-95ED-2DA3B4ED7BCA', CAST(0x1A3E0B00 AS Date), 5, NULL, N'6107067', CAST(0x0000A8BA0082E511 AS DateTime), N'6107067', CAST(0x0000A8BA0082E511 AS DateTime))
INSERT [NANO].[TBL_M_PLAN_VIP] ([PID_PLAN_VIP], [TANGGAL], [URUTAN], [KET], [CREATE_BY], [CREATE_DATE], [MODIFIED_BY], [MODIFIED_DATE]) VALUES (N'D447C777-1D9E-4AD4-8D18-F86027C2BD29', CAST(0x8E3D0B00 AS Date), 2, NULL, NULL, NULL, NULL, NULL)
INSERT [NANO].[TBL_M_PLAN_VIP] ([PID_PLAN_VIP], [TANGGAL], [URUTAN], [KET], [CREATE_BY], [CREATE_DATE], [MODIFIED_BY], [MODIFIED_DATE]) VALUES (N'DA3B8350-7901-46ED-BD5B-FD0AFFACB023', CAST(0xF03D0B00 AS Date), 2, NULL, N'2016030', CAST(0x0000A88F008DED65 AS DateTime), N'2016030', CAST(0x0000A88F008DED65 AS DateTime))
/****** Object:  UserDefinedFunction [NANO].[cufn_pelaporVipCadangan]    Script Date: 06/05/2018 07:42:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author		: YAQUB
-- Create date	: 02-01-2018
-- Description	: Pelapor VIP cadangan berikutnya
-- =============================================
CREATE FUNCTION [NANO].[cufn_pelaporVipCadangan]
(	
	-- Add the parameters for the function here
	@sCadangan varchar(50)	
)
RETURNS @TBL TABLE 
(
	-- Add the SELECT statement with parameter references here
	CADANGAN varchar(50),
	CADANGAN_DESC varchar(50),
	CADANGAN_NEXT varchar(50),
	CADANGAN_DESC_NEXT varchar(50)
)
AS
BEGIN

--declare @sCadangan varchar(50)='6196076'
WITH CTE AS(
    SELECT rownum = ROW_NUMBER()OVER(ORDER BY F.TANGGAL), G.CADANGAN, G.CADANGAN_DESC
					FROM NANO.VW_PLAN_PIC AS G left outer JOIN
					NANO.TBL_M_PLAN_VIP AS F ON G.URUTAN = F.URUTAN
)
INSERT INTO @TBL
SELECT top 1 
    CTE.CADANGAN,
    CTE.CADANGAN_DESC,
	nex.CADANGAN CADANGAN_NEXT,
    nex.CADANGAN_DESC CADANGAN_DESC_NEXT
FROM CTE
LEFT JOIN CTE nex ON nex.rownum = CTE.rownum + 1
where CTE.CADANGAN=@sCadangan and nex.CADANGAN is not null
order by CTE.rownum desc



RETURN;
END
GO
/****** Object:  Table [NANO].[TBL_M_PLAN_K_MEETING_2]    Script Date: 06/05/2018 07:42:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [NANO].[TBL_M_PLAN_K_MEETING_2](
	[PID_PLAN_K_MEETING] [varchar](50) NOT NULL,
	[TGL_PLAN] [date] NULL,
	[URUTAN] [int] NULL,
	[CREATE_DATE] [datetime] NULL,
	[CREATE_BY] [varchar](10) NULL,
	[MODIFIED_DATE] [datetime] NULL,
	[MODIFIED_BY] [varchar](10) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [NANO].[TBL_M_PLAN_K_MEETING_2] ([PID_PLAN_K_MEETING], [TGL_PLAN], [URUTAN], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY]) VALUES (N'0BB99E8A-8D50-489B-A4C2-494E37E026A5', CAST(0x513D0B00 AS Date), 1, NULL, NULL, NULL, NULL)
INSERT [NANO].[TBL_M_PLAN_K_MEETING_2] ([PID_PLAN_K_MEETING], [TGL_PLAN], [URUTAN], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY]) VALUES (N'213D53CD-4344-43BA-BF0B-F15A05941AAC', CAST(0xA53D0B00 AS Date), 7, CAST(0x0000A8470098D06A AS DateTime), N'2016030', CAST(0x0000A8470098D06A AS DateTime), N'2016030')
INSERT [NANO].[TBL_M_PLAN_K_MEETING_2] ([PID_PLAN_K_MEETING], [TGL_PLAN], [URUTAN], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY]) VALUES (N'3184BF49-DBBF-4862-B32F-C1707C39A9D3', CAST(0x433D0B00 AS Date), 6, NULL, NULL, NULL, NULL)
INSERT [NANO].[TBL_M_PLAN_K_MEETING_2] ([PID_PLAN_K_MEETING], [TGL_PLAN], [URUTAN], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY]) VALUES (N'32DF0A7A-4B13-498F-858D-CA23DFCD888D', CAST(0x893D0B00 AS Date), 5, NULL, NULL, NULL, NULL)
INSERT [NANO].[TBL_M_PLAN_K_MEETING_2] ([PID_PLAN_K_MEETING], [TGL_PLAN], [URUTAN], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY]) VALUES (N'32FEE2D2-B153-4923-9055-2C3726533C6B', CAST(0x353D0B00 AS Date), 5, NULL, NULL, NULL, NULL)
INSERT [NANO].[TBL_M_PLAN_K_MEETING_2] ([PID_PLAN_K_MEETING], [TGL_PLAN], [URUTAN], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY]) VALUES (N'3542D523-B9A7-488B-9313-FE9503CAE39F', CAST(0x273D0B00 AS Date), 4, NULL, NULL, NULL, NULL)
INSERT [NANO].[TBL_M_PLAN_K_MEETING_2] ([PID_PLAN_K_MEETING], [TGL_PLAN], [URUTAN], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY]) VALUES (N'66B69073-4977-46DD-893D-8B3ABC08B214', CAST(0x0B3D0B00 AS Date), 2, NULL, NULL, NULL, NULL)
INSERT [NANO].[TBL_M_PLAN_K_MEETING_2] ([PID_PLAN_K_MEETING], [TGL_PLAN], [URUTAN], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY]) VALUES (N'6B9E4584-2239-402F-91FE-D651E7173E76', CAST(0x973D0B00 AS Date), 6, CAST(0x0000A83900A63B9E AS DateTime), N'2016030', CAST(0x0000A83900A63B9E AS DateTime), N'2016030')
INSERT [NANO].[TBL_M_PLAN_K_MEETING_2] ([PID_PLAN_K_MEETING], [TGL_PLAN], [URUTAN], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY]) VALUES (N'7A629D66-36C8-4BC4-84FA-7AF08E29D8B4', CAST(0x193D0B00 AS Date), 3, NULL, NULL, NULL, NULL)
INSERT [NANO].[TBL_M_PLAN_K_MEETING_2] ([PID_PLAN_K_MEETING], [TGL_PLAN], [URUTAN], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY]) VALUES (N'929665F4-14E7-4EFA-B6F9-A626D63BAAF3', CAST(0x5F3D0B00 AS Date), 2, NULL, NULL, NULL, NULL)
INSERT [NANO].[TBL_M_PLAN_K_MEETING_2] ([PID_PLAN_K_MEETING], [TGL_PLAN], [URUTAN], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY]) VALUES (N'B2F1A1CD-FE8C-4EE6-8913-B5A9DDECB0D5', CAST(0xC13D0B00 AS Date), 2, CAST(0x0000A8630083D437 AS DateTime), N'2016030', CAST(0x0000A8630083D437 AS DateTime), N'2016030')
INSERT [NANO].[TBL_M_PLAN_K_MEETING_2] ([PID_PLAN_K_MEETING], [TGL_PLAN], [URUTAN], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY]) VALUES (N'B466FA88-588D-4938-8929-1D920B64BB46', CAST(0xCF3D0B00 AS Date), 3, CAST(0x0000A87400822045 AS DateTime), N'2016030', CAST(0x0000A87400822045 AS DateTime), N'2016030')
INSERT [NANO].[TBL_M_PLAN_K_MEETING_2] ([PID_PLAN_K_MEETING], [TGL_PLAN], [URUTAN], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY]) VALUES (N'BC4B98E3-1884-4CF4-89F6-3236A0C06920', CAST(0x6D3D0B00 AS Date), 3, NULL, NULL, NULL, NULL)
INSERT [NANO].[TBL_M_PLAN_K_MEETING_2] ([PID_PLAN_K_MEETING], [TGL_PLAN], [URUTAN], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY]) VALUES (N'C7A4E5FE-85B0-45FF-AE3E-F60047E1F19D', CAST(0x7B3D0B00 AS Date), 4, NULL, NULL, NULL, NULL)
INSERT [NANO].[TBL_M_PLAN_K_MEETING_2] ([PID_PLAN_K_MEETING], [TGL_PLAN], [URUTAN], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY]) VALUES (N'D48C8E9D-3242-43ED-9929-A54F3151B4B0', CAST(0xB33D0B00 AS Date), 1, CAST(0x0000A857008777AB AS DateTime), N'2016030', CAST(0x0000A857008777AB AS DateTime), N'2016030')
/****** Object:  Table [NANO].[TBL_M_PLAN_K_MEETING]    Script Date: 06/05/2018 07:42:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [NANO].[TBL_M_PLAN_K_MEETING](
	[PID_PLAN_K_MEETING] [varchar](50) NOT NULL,
	[TGL_PLAN] [date] NULL,
	[URUTAN] [int] NULL,
	[CREATE_DATE] [datetime] NULL,
	[CREATE_BY] [varchar](10) NULL,
	[MODIFIED_DATE] [datetime] NULL,
	[MODIFIED_BY] [varchar](10) NULL,
 CONSTRAINT [PK_TBL_M_PLAN_K_MEETING] PRIMARY KEY CLUSTERED 
(
	[PID_PLAN_K_MEETING] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [NANO].[TBL_M_PLAN_K_MEETING] ([PID_PLAN_K_MEETING], [TGL_PLAN], [URUTAN], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY]) VALUES (N'0BB99E8A-8D50-489B-A4C2-494E37E026A5', CAST(0x513D0B00 AS Date), 1, NULL, NULL, NULL, NULL)
INSERT [NANO].[TBL_M_PLAN_K_MEETING] ([PID_PLAN_K_MEETING], [TGL_PLAN], [URUTAN], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY]) VALUES (N'1BA12A80-FCCE-487C-A2FE-19F5E58C7F7C', CAST(0x233E0B00 AS Date), 2, CAST(0x0000A8C800987B03 AS DateTime), N'6107067', CAST(0x0000A8C800987B03 AS DateTime), N'6107067')
INSERT [NANO].[TBL_M_PLAN_K_MEETING] ([PID_PLAN_K_MEETING], [TGL_PLAN], [URUTAN], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY]) VALUES (N'1DCBE92E-B40E-4EFC-A607-B6656990D254', CAST(0xEB3D0B00 AS Date), 5, CAST(0x0000A88F008DED62 AS DateTime), N'2016030', CAST(0x0000A88F008DED62 AS DateTime), N'2016030')
INSERT [NANO].[TBL_M_PLAN_K_MEETING] ([PID_PLAN_K_MEETING], [TGL_PLAN], [URUTAN], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY]) VALUES (N'213D53CD-4344-43BA-BF0B-F15A05941AAC', CAST(0xA53D0B00 AS Date), 7, CAST(0x0000A8470098D06A AS DateTime), N'2016030', CAST(0x0000A8470098D06A AS DateTime), N'2016030')
INSERT [NANO].[TBL_M_PLAN_K_MEETING] ([PID_PLAN_K_MEETING], [TGL_PLAN], [URUTAN], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY]) VALUES (N'3184BF49-DBBF-4862-B32F-C1707C39A9D3', CAST(0x433D0B00 AS Date), 6, NULL, NULL, NULL, NULL)
INSERT [NANO].[TBL_M_PLAN_K_MEETING] ([PID_PLAN_K_MEETING], [TGL_PLAN], [URUTAN], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY]) VALUES (N'32DF0A7A-4B13-498F-858D-CA23DFCD888D', CAST(0x893D0B00 AS Date), 5, NULL, NULL, NULL, NULL)
INSERT [NANO].[TBL_M_PLAN_K_MEETING] ([PID_PLAN_K_MEETING], [TGL_PLAN], [URUTAN], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY]) VALUES (N'32FEE2D2-B153-4923-9055-2C3726533C6B', CAST(0x353D0B00 AS Date), 5, NULL, NULL, NULL, NULL)
INSERT [NANO].[TBL_M_PLAN_K_MEETING] ([PID_PLAN_K_MEETING], [TGL_PLAN], [URUTAN], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY]) VALUES (N'3542D523-B9A7-488B-9313-FE9503CAE39F', CAST(0x273D0B00 AS Date), 4, NULL, NULL, NULL, NULL)
INSERT [NANO].[TBL_M_PLAN_K_MEETING] ([PID_PLAN_K_MEETING], [TGL_PLAN], [URUTAN], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY]) VALUES (N'476DB4D8-E76B-4C98-8FB6-796BC66EF494', CAST(0x073E0B00 AS Date), 7, CAST(0x0000A8B000DD2986 AS DateTime), N'2016030', CAST(0x0000A8B000DD2986 AS DateTime), N'2016030')
INSERT [NANO].[TBL_M_PLAN_K_MEETING] ([PID_PLAN_K_MEETING], [TGL_PLAN], [URUTAN], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY]) VALUES (N'66B69073-4977-46DD-893D-8B3ABC08B214', CAST(0x0B3D0B00 AS Date), 2, NULL, NULL, NULL, NULL)
INSERT [NANO].[TBL_M_PLAN_K_MEETING] ([PID_PLAN_K_MEETING], [TGL_PLAN], [URUTAN], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY]) VALUES (N'6B9E4584-2239-402F-91FE-D651E7173E76', CAST(0x973D0B00 AS Date), 6, CAST(0x0000A83900A63B9E AS DateTime), N'2016030', CAST(0x0000A83900A63B9E AS DateTime), N'2016030')
INSERT [NANO].[TBL_M_PLAN_K_MEETING] ([PID_PLAN_K_MEETING], [TGL_PLAN], [URUTAN], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY]) VALUES (N'7A629D66-36C8-4BC4-84FA-7AF08E29D8B4', CAST(0x193D0B00 AS Date), 3, NULL, NULL, NULL, NULL)
INSERT [NANO].[TBL_M_PLAN_K_MEETING] ([PID_PLAN_K_MEETING], [TGL_PLAN], [URUTAN], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY]) VALUES (N'7A6C6277-74D5-4F0C-8B91-DC2309FC498B', CAST(0x153E0B00 AS Date), 1, CAST(0x0000A8BA0082E50F AS DateTime), N'6107067', CAST(0x0000A8BA0082E50F AS DateTime), N'6107067')
INSERT [NANO].[TBL_M_PLAN_K_MEETING] ([PID_PLAN_K_MEETING], [TGL_PLAN], [URUTAN], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY]) VALUES (N'929665F4-14E7-4EFA-B6F9-A626D63BAAF3', CAST(0x5F3D0B00 AS Date), 2, NULL, NULL, NULL, NULL)
INSERT [NANO].[TBL_M_PLAN_K_MEETING] ([PID_PLAN_K_MEETING], [TGL_PLAN], [URUTAN], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY]) VALUES (N'ADB37FE1-6A04-4393-9C0D-ACD41AA92B77', CAST(0x313E0B00 AS Date), 3, CAST(0x0000A8D6008CFC46 AS DateTime), N'6107067', CAST(0x0000A8D6008CFC46 AS DateTime), N'6107067')
INSERT [NANO].[TBL_M_PLAN_K_MEETING] ([PID_PLAN_K_MEETING], [TGL_PLAN], [URUTAN], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY]) VALUES (N'B2F1A1CD-FE8C-4EE6-8913-B5A9DDECB0D5', CAST(0xC13D0B00 AS Date), 2, CAST(0x0000A8630083D437 AS DateTime), N'2016030', CAST(0x0000A8630083D437 AS DateTime), N'2016030')
INSERT [NANO].[TBL_M_PLAN_K_MEETING] ([PID_PLAN_K_MEETING], [TGL_PLAN], [URUTAN], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY]) VALUES (N'B466FA88-588D-4938-8929-1D920B64BB46', CAST(0xCF3D0B00 AS Date), 3, CAST(0x0000A87400822045 AS DateTime), N'2016030', CAST(0x0000A87400822045 AS DateTime), N'2016030')
INSERT [NANO].[TBL_M_PLAN_K_MEETING] ([PID_PLAN_K_MEETING], [TGL_PLAN], [URUTAN], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY]) VALUES (N'BC4B98E3-1884-4CF4-89F6-3236A0C06920', CAST(0x6D3D0B00 AS Date), 3, NULL, NULL, NULL, NULL)
INSERT [NANO].[TBL_M_PLAN_K_MEETING] ([PID_PLAN_K_MEETING], [TGL_PLAN], [URUTAN], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY]) VALUES (N'BEAE2F37-BA1B-4879-9B05-56A801509879', CAST(0x4D3E0B00 AS Date), 5, CAST(0x0000A8F000E93EA9 AS DateTime), N'2017038', CAST(0x0000A8F000E93EA9 AS DateTime), N'2017038')
INSERT [NANO].[TBL_M_PLAN_K_MEETING] ([PID_PLAN_K_MEETING], [TGL_PLAN], [URUTAN], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY]) VALUES (N'C5CCE051-542A-4695-9187-95A712AF5178', CAST(0xF93D0B00 AS Date), 6, CAST(0x0000A89E0088880B AS DateTime), N'6107067', CAST(0x0000A89E0088880B AS DateTime), N'6107067')
INSERT [NANO].[TBL_M_PLAN_K_MEETING] ([PID_PLAN_K_MEETING], [TGL_PLAN], [URUTAN], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY]) VALUES (N'C7A4E5FE-85B0-45FF-AE3E-F60047E1F19D', CAST(0x7B3D0B00 AS Date), 4, NULL, NULL, NULL, NULL)
INSERT [NANO].[TBL_M_PLAN_K_MEETING] ([PID_PLAN_K_MEETING], [TGL_PLAN], [URUTAN], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY]) VALUES (N'D48C8E9D-3242-43ED-9929-A54F3151B4B0', CAST(0xB33D0B00 AS Date), 1, CAST(0x0000A857008777AB AS DateTime), N'2016030', CAST(0x0000A857008777AB AS DateTime), N'2016030')
INSERT [NANO].[TBL_M_PLAN_K_MEETING] ([PID_PLAN_K_MEETING], [TGL_PLAN], [URUTAN], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY]) VALUES (N'EB5DA2AE-51D9-4FE5-95D3-3D370579028A', CAST(0x3F3E0B00 AS Date), 4, CAST(0x0000A8E40090C932 AS DateTime), N'2016030', CAST(0x0000A8E40090C932 AS DateTime), N'2016030')
INSERT [NANO].[TBL_M_PLAN_K_MEETING] ([PID_PLAN_K_MEETING], [TGL_PLAN], [URUTAN], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY]) VALUES (N'F1341B63-7C87-428C-BC52-2F1C3DBA238E', CAST(0xDD3D0B00 AS Date), 4, CAST(0x0000A88100AC5726 AS DateTime), N'2016030', CAST(0x0000A88100AC5726 AS DateTime), N'2016030')
/****** Object:  View [NANO].[VW_PLAN_MEETING]    Script Date: 06/05/2018 07:42:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [NANO].[VW_PLAN_MEETING]
AS
SELECT     A.PID_PLAN_K_MEETING, A.TGL_PLAN, B.UTAMA AS SHEARING_PL, C.NAMA AS SHEARING_PL_NAMA, B.CADANGAN AS PL_NOTULEN, 
                      D.NAMA AS PL_NOTULEN_NAMA
FROM         [DB_NANO].[NANO].[VW_PLAN_PIC] AS B LEFT OUTER JOIN
                      NANO.TBL_M_EMPLOYEE_NANO AS D ON B.CADANGAN = D.NRP RIGHT OUTER JOIN
                      NANO.TBL_M_PLAN_K_MEETING AS A ON B.URUTAN = A.URUTAN LEFT OUTER JOIN
                      NANO.TBL_M_EMPLOYEE_NANO AS C ON B.UTAMA = C.NRP
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "B"
            Begin Extent = 
               Top = 6
               Left = 290
               Bottom = 199
               Right = 461
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "D"
            Begin Extent = 
               Top = 145
               Left = 597
               Bottom = 264
               Right = 768
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "C"
            Begin Extent = 
               Top = 28
               Left = 603
               Bottom = 147
               Right = 774
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "A"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 247
               Right = 237
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 2055
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 3285
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'NANO', @level1type=N'VIEW',@level1name=N'VW_PLAN_MEETING'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'NANO', @level1type=N'VIEW',@level1name=N'VW_PLAN_MEETING'
GO
/****** Object:  StoredProcedure [NANO].[cusp_Generate_Plan]    Script Date: 06/05/2018 07:42:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author	:	Yaqub
-- Create date: 20171023
-- Description:	Generate data to TBL_M_PLAN_K_MEETING and TBL_M_PLAN_VIP
-- =============================================
CREATE PROCEDURE [NANO].[cusp_Generate_Plan] --'2016030'
	-- Add the parameters for the stored procedure here
	@pNRP varchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;   			
		
	DECLARE @TglAwal varchar(10)='2017-06-30',
			@Urutan int=1,
			@UrutanVIP int=4,
			@TglAwalVIP varchar(10)='2017-07-05'
	
	
		
	--MAX TBL_M_PLAN_K_MEETING
	DECLARE @TglMax DATETIME=(SELECT TOP 1  TGL_PLAN FROM 
								(SELECT PID_PLAN_K_MEETING,TGL_PLAN  as TGL_PLAN,URUTAN FROM [DB_NANO].[NANO].TBL_M_PLAN_K_MEETING
								UNION ALL	
								SELECT '0' AS PID_PLAN_K_MEETING,@TglAwal AS TGL_PLAN, @Urutan AS URUTAN 
								)AS Z
							GROUP BY PID_PLAN_K_MEETING,TGL_PLAN,URUTAN
							ORDER BY TGL_PLAN DESC)
	
	--MAX TBL_M_PLAN_VIP
	DECLARE @TglMaxVIP DATETIME=(SELECT TOP 1  TGL_PLAN FROM 
								(SELECT PID_PLAN_VIP,TANGGAL as TGL_PLAN,URUTAN FROM [DB_NANO].[NANO].[TBL_M_PLAN_VIP]
								UNION ALL	
								SELECT '0' AS PID_PLAN_VIP,@TglAwalVIP AS TGL_PLAN, @Urutan AS URUTAN 
								)AS Z
							GROUP BY PID_PLAN_VIP,TGL_PLAN,URUTAN
							ORDER BY TGL_PLAN DESC)
						
	IF(CONVERT(DATE, GETDATE()) >= CONVERT(DATE,@TglMax+11))
		BEGIN
		
		-- generate TBL_T_KEHADIRAN_MEETING
		--DECLARE @TglMax DATETIME='2018-02-09';
		--DECLARE @pNRP varchar(50)='2016030';
		--INSERT INTO [DB_NANO].[NANO].[TBL_T_KEHADIRAN_MEETING]
  --         (
  --         [PID_KEHADIRAN]
  --         ,[TGL_PLAN]
  --         ,[TGL_ACT]
  --         ,[NRP]
  --         ,[NAMA]
  --         ,[CREATE_DATE]
  --         ,[CREATE_BY]
  --         )
  --         SELECT 
		--	NEWID(),
		--	convert(date,(@TglMax + 14)),
		--	CONVERT(DATE,GETDATE()),
		--	NRP,
		--	NAMA,
		--	GETDATE(),
		--	@pNRP			
		--	FROM NANO.TBL_M_EMPLOYEE_NANO 
		--	WHERE STATUS=1			
			
		--	DELETE FROM [DB_NANO].[NANO].[TBL_M_PLAN_K_MEETING]
		--	WHERE TGL_PLAN=CONVERT(DATE,@TglMax)
			
		--	DELETE FROM [DB_NANO].[NANO].[TBL_M_PLAN_VIP]
		--	WHERE TANGGAL=CONVERT(DATE,@TglMaxVIP)
		--END
		-- Insert TBL_M_PLAN_K_MEETING
		INSERT INTO [DB_NANO].NANO.TBL_M_PLAN_K_MEETING
			(
			PID_PLAN_K_MEETING,
			TGL_PLAN,
			URUTAN,
			
			CREATE_BY,
			CREATE_DATE,
			MODIFIED_BY,
			MODIFIED_DATE
			)	
				
			SELECT TOP 1 
			NEWID() AS PID_PLAN_K_MEETING
			,CONVERT(DATE,CONVERT(DATETIME,MAX(TGL_PLAN))+14) AS TGL_PLAN
			,CASE 	
				WHEN URUTAN<(SELECT MAX(URUTAN) FROM [DB_NANO].[NANO].[VW_PLAN_PIC])
					THEN URUTAN+1
				WHEN URUTAN=(SELECT MAX(URUTAN) FROM [DB_NANO].[NANO].[VW_PLAN_PIC])
					THEN 1		
			END AS URUTAN
			
			,@pNRP
			,GETDATE()
			,@pNRP
			,GETDATE()

			FROM 
				(SELECT PID_PLAN_K_MEETING,TGL_PLAN  as TGL_PLAN,URUTAN
				FROM
					[DB_NANO].[NANO].TBL_M_PLAN_K_MEETING
				UNION ALL	
				SELECT '0' AS PID_PLAN_K_MEETING,@TglAwal AS TGL_PLAN, @Urutan AS URUTAN 
				)AS Z
			GROUP BY PID_PLAN_K_MEETING,TGL_PLAN,URUTAN
			ORDER BY TGL_PLAN DESC
		
		
		--Insert TBL_M_PLAN_VIP		
		INSERT INTO [DB_NANO].[NANO].[TBL_M_PLAN_VIP]
			(
			PID_PLAN_VIP,
			TANGGAL,
			URUTAN,
			
			CREATE_BY,
			CREATE_DATE,
			MODIFIED_BY,
			MODIFIED_DATE
			)	
				
			SELECT TOP 1 
			NEWID() AS PID_PLAN_VIP
			,CONVERT(DATE,CONVERT(DATETIME,MAX(TANGGAL))+14) AS TANGGAL
			,CASE 	
				WHEN URUTAN<(SELECT MAX(URUTAN) FROM [DB_NANO].[NANO].[VW_PLAN_PIC])
					THEN URUTAN+1
				WHEN URUTAN=(SELECT MAX(URUTAN) FROM [DB_NANO].[NANO].[VW_PLAN_PIC])
					THEN 1		
			END AS URUTAN
			
			,@pNRP
			,GETDATE()
			,@pNRP
			,GETDATE()

			FROM 
				(SELECT PID_PLAN_VIP,TANGGAL,URUTAN
				FROM
					[DB_NANO].[NANO].[TBL_M_PLAN_VIP]
				UNION ALL	
				SELECT NEWID() AS PID_PLAN_VIP,@TglAwalVIP AS TANGGAL, @UrutanVIP AS URUTAN 
				)AS Z
			GROUP BY PID_PLAN_VIP,[TANGGAL],URUTAN
			ORDER BY [TANGGAL] DESC
		END

	
	--declare @aa DATETIME=(select top 1 TGL_PLAN FROM [DB_NANO].[NANO].TBL_M_PLAN_K_MEETING order by TGL_PLAN desc)
	--select convert (date,GETDATE()), convert(date,@aa+11) , 
	--case when convert (date,GETDATE())< convert(date,@aa+11) then 'DELETE' else 'INSERT' end 
								
							
	--IF(@TglMaxVIP!= CONVERT(DATETIME,@TglAwalVIP)+14)
	--	BEGIN
	--		DELETE FROM [DB_NANO].[NANO].[TBL_M_PLAN_VIP]
	--		WHERE TANGGAL=CONVERT(DATE,@TglMaxVIP)
	--	END
		
		
END
GO
/****** Object:  Table [NANO].[TBL_M_MICRO_SHEARING_TEMP]    Script Date: 06/05/2018 07:42:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [NANO].[TBL_M_MICRO_SHEARING_TEMP](
	[SESSION_UPLOAD] [varchar](50) NOT NULL,
	[PID_MICRO_SHEARING] [varchar](50) NOT NULL,
	[TANGGAL] [varchar](50) NULL,
	[PENULIS] [varchar](50) NULL,
	[TEMA] [varchar](1000) NULL,
	[ISI] [text] NULL,
	[REMARKS] [varchar](100) NULL,
 CONSTRAINT [PK_TBL_MICRO_SHEARING_TEMP] PRIMARY KEY CLUSTERED 
(
	[PID_MICRO_SHEARING] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  StoredProcedure [NANO].[cusp_RemarksToMicroShearingTemp]    Script Date: 06/05/2018 07:42:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Yaqub
-- Create date: 20171107
-- Description:	Remarks from file (*.csv) to NANO.TBL_M_MICRO_SHEARING_TEMP 
-- Note	: Gak jadi dipakai
-- =============================================
CREATE PROCEDURE [NANO].[cusp_RemarksToMicroShearingTemp] --'13017bb9-0726-46d5-b296-264c20c06c1e'
	-- Add the parameters for the stored procedure here
	@sSESSION_UPLOAD varchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
    --Update  statements for procedure here
    UPDATE	A
	SET		A.REMARKS = B.REMARKS_
	FROM	NANO.TBL_M_MICRO_SHEARING_TEMP AS A INNER JOIN (SELECT
		SESSION_UPLOAD,
		PID_MICRO_SHEARING,
		
		CASE WHEN ISDATE(TANGGAL) =1 THEN ''
		ELSE 'TANGGAL Harus Format Date(YYYY-MM-DD), '
		END 
		+ 		
		CASE WHEN E.NAMA IS NOT NULL THEN ''
		ELSE 'PENULIS Tidak Terdaftar, '			
		END	

		AS REMARKS_
--SELECT     D.PENULIS, E.NAMA
FROM         NANO.TBL_M_MICRO_SHEARING_TEMP AS D LEFT OUTER JOIN
                      NANO.TBL_M_EMPLOYEE_NANO AS E ON D.PENULIS = E.NRP) B
                      
ON	A.SESSION_UPLOAD = B.SESSION_UPLOAD
WHERE A.SESSION_UPLOAD = @sSESSION_UPLOAD
  
	
END
GO
/****** Object:  Table [NANO].[TBL_M_MICRO_SHEARING]    Script Date: 06/05/2018 07:42:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [NANO].[TBL_M_MICRO_SHEARING](
	[PID_MICRO_SHEARING] [varchar](50) NOT NULL,
	[TANGGAL] [date] NULL,
	[PENULIS] [varchar](10) NULL,
	[TEMA] [varchar](1000) NULL,
	[ISI] [text] NULL,
	[UPDATE_DATE] [date] NULL,
	[UPDATE_BY] [varchar](10) NULL,
 CONSTRAINT [PK_TBL_MICRO_SHEARING] PRIMARY KEY CLUSTERED 
(
	[PID_MICRO_SHEARING] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [NANO].[TBL_M_MICRO_SHEARING] ([PID_MICRO_SHEARING], [TANGGAL], [PENULIS], [TEMA], [ISI], [UPDATE_DATE], [UPDATE_BY]) VALUES (N'016EDA4B-F1CF-4310-A7F4-91775439A0EA', CAST(0x9C3D0B00 AS Date), N'6107067', N'Most people do not listen with intent to understand', N'', CAST(0xC03D0B00 AS Date), N'2016030')
INSERT [NANO].[TBL_M_MICRO_SHEARING] ([PID_MICRO_SHEARING], [TANGGAL], [PENULIS], [TEMA], [ISI], [UPDATE_DATE], [UPDATE_BY]) VALUES (N'02D1FA61-C410-40B6-841B-BB371A5BFB25', CAST(0x8B3D0B00 AS Date), N'6107067', N'Foto Lucu Gratis Bensin Pertamina tanggal 31 Nopember 2017', N'', CAST(0xC03D0B00 AS Date), N'2016030')
INSERT [NANO].[TBL_M_MICRO_SHEARING] ([PID_MICRO_SHEARING], [TANGGAL], [PENULIS], [TEMA], [ISI], [UPDATE_DATE], [UPDATE_BY]) VALUES (N'03C04584-E837-46EC-B220-06F4AF2057AE', CAST(0xA23D0B00 AS Date), N'6196076', N'Video: Bersyukur', N'', CAST(0xC03D0B00 AS Date), N'2016030')
INSERT [NANO].[TBL_M_MICRO_SHEARING] ([PID_MICRO_SHEARING], [TANGGAL], [PENULIS], [TEMA], [ISI], [UPDATE_DATE], [UPDATE_BY]) VALUES (N'0ABA588D-A4E1-4D3C-A704-CD3923ACBF37', CAST(0x6B3D0B00 AS Date), N'193078', N'Penyakit Ain', N'', CAST(0xC03D0B00 AS Date), N'2016030')
INSERT [NANO].[TBL_M_MICRO_SHEARING] ([PID_MICRO_SHEARING], [TANGGAL], [PENULIS], [TEMA], [ISI], [UPDATE_DATE], [UPDATE_BY]) VALUES (N'0D639C01-4002-4C9F-9F16-F1ECE2476612', CAST(0x953D0B00 AS Date), N'193078', N'Menyindir diri sendiri', N'', CAST(0xC03D0B00 AS Date), N'2016030')
INSERT [NANO].[TBL_M_MICRO_SHEARING] ([PID_MICRO_SHEARING], [TANGGAL], [PENULIS], [TEMA], [ISI], [UPDATE_DATE], [UPDATE_BY]) VALUES (N'0EA353FD-918C-4E98-80E3-1C2E6F78BA56', CAST(0xA93D0B00 AS Date), N'6196076', N'Video: tidak selayaknya kita sombong jika mengantuk', N'', CAST(0xC03D0B00 AS Date), N'2016030')
INSERT [NANO].[TBL_M_MICRO_SHEARING] ([PID_MICRO_SHEARING], [TANGGAL], [PENULIS], [TEMA], [ISI], [UPDATE_DATE], [UPDATE_BY]) VALUES (N'104F4D40-192B-44C7-BC57-A7BC775F9F56', CAST(0x6F3D0B00 AS Date), N'6198008', N'Cara registrasi kartu prabayar', N'', CAST(0xC03D0B00 AS Date), N'2016030')
INSERT [NANO].[TBL_M_MICRO_SHEARING] ([PID_MICRO_SHEARING], [TANGGAL], [PENULIS], [TEMA], [ISI], [UPDATE_DATE], [UPDATE_BY]) VALUES (N'16A04791-5203-4AEA-9034-5953CDC2D89B', CAST(0x873D0B00 AS Date), N'6107067', N'Pengiriman usulan proposal program TASAKUR melalui email anggota sel Nano', N'', CAST(0xC03D0B00 AS Date), N'2016030')
INSERT [NANO].[TBL_M_MICRO_SHEARING] ([PID_MICRO_SHEARING], [TANGGAL], [PENULIS], [TEMA], [ISI], [UPDATE_DATE], [UPDATE_BY]) VALUES (N'1766CB52-DB52-456B-A850-BF933E70CBF5', CAST(0xA43D0B00 AS Date), N'6113882', N'Putuskan pindah keyakinan', N'', CAST(0xC03D0B00 AS Date), N'2016030')
INSERT [NANO].[TBL_M_MICRO_SHEARING] ([PID_MICRO_SHEARING], [TANGGAL], [PENULIS], [TEMA], [ISI], [UPDATE_DATE], [UPDATE_BY]) VALUES (N'177F5060-45D8-4DED-9D84-33A98DD77693', CAST(0x773D0B00 AS Date), N'6113882', N'Video', N'https://dl.dropboxusercontent.com/1/view/sfks10bcyvz0inu/Simpan/nano2.mp4', CAST(0xC03D0B00 AS Date), N'2016030')
INSERT [NANO].[TBL_M_MICRO_SHEARING] ([PID_MICRO_SHEARING], [TANGGAL], [PENULIS], [TEMA], [ISI], [UPDATE_DATE], [UPDATE_BY]) VALUES (N'17FAA091-4B66-478B-80EE-2ED74E30FB1F', CAST(0x843D0B00 AS Date), N'2016030', N'Harga Masuk Toilet', N'', CAST(0xC03D0B00 AS Date), N'2016030')
INSERT [NANO].[TBL_M_MICRO_SHEARING] ([PID_MICRO_SHEARING], [TANGGAL], [PENULIS], [TEMA], [ISI], [UPDATE_DATE], [UPDATE_BY]) VALUES (N'1CE82287-E8D3-46C0-BE28-B1D5B0DE27EB', CAST(0x923D0B00 AS Date), N'2017038', N'Pentingnya sarapan', N'', CAST(0xC03D0B00 AS Date), N'2016030')
INSERT [NANO].[TBL_M_MICRO_SHEARING] ([PID_MICRO_SHEARING], [TANGGAL], [PENULIS], [TEMA], [ISI], [UPDATE_DATE], [UPDATE_BY]) VALUES (N'1E3FFEC2-93F0-445F-9218-4A8E51638793', CAST(0x903D0B00 AS Date), N'6107067', N'Permintaan kerjasama dari Jooble.org', N'', CAST(0xC03D0B00 AS Date), N'2016030')
INSERT [NANO].[TBL_M_MICRO_SHEARING] ([PID_MICRO_SHEARING], [TANGGAL], [PENULIS], [TEMA], [ISI], [UPDATE_DATE], [UPDATE_BY]) VALUES (N'2094BEEF-38BB-4A35-B335-7076B0B56B0F', CAST(0x683D0B00 AS Date), N'2016030', N'Registrasi nomor prabayar', N'', CAST(0xC03D0B00 AS Date), N'2016030')
INSERT [NANO].[TBL_M_MICRO_SHEARING] ([PID_MICRO_SHEARING], [TANGGAL], [PENULIS], [TEMA], [ISI], [UPDATE_DATE], [UPDATE_BY]) VALUES (N'21CA0B66-9BCB-4D95-9FA1-A7477E39BE9A', CAST(0x943D0B00 AS Date), N'6196076', N'Sok Sibuk ben Pantes Dibayar', N'', CAST(0xC03D0B00 AS Date), N'2016030')
INSERT [NANO].[TBL_M_MICRO_SHEARING] ([PID_MICRO_SHEARING], [TANGGAL], [PENULIS], [TEMA], [ISI], [UPDATE_DATE], [UPDATE_BY]) VALUES (N'22C61BC8-C5B8-4F86-8FFC-D0BF5073C09C', CAST(0x713D0B00 AS Date), N'6198008', N'Bubur langganan', N'', CAST(0xC03D0B00 AS Date), N'2016030')
INSERT [NANO].[TBL_M_MICRO_SHEARING] ([PID_MICRO_SHEARING], [TANGGAL], [PENULIS], [TEMA], [ISI], [UPDATE_DATE], [UPDATE_BY]) VALUES (N'22C7AAAE-8596-427B-A42E-7FB11CF01A36', CAST(0x9C3D0B00 AS Date), N'6113882', N'Rumah yang berantakan pertanda orang tuanya baik', N'', CAST(0xC03D0B00 AS Date), N'2016030')
INSERT [NANO].[TBL_M_MICRO_SHEARING] ([PID_MICRO_SHEARING], [TANGGAL], [PENULIS], [TEMA], [ISI], [UPDATE_DATE], [UPDATE_BY]) VALUES (N'254CAAC8-886F-4CE4-85EF-8A19B5CFAD18', CAST(0x883D0B00 AS Date), N'6196076', N'Tombo ngantuk (jawa version)', N'', CAST(0xC03D0B00 AS Date), N'2016030')
INSERT [NANO].[TBL_M_MICRO_SHEARING] ([PID_MICRO_SHEARING], [TANGGAL], [PENULIS], [TEMA], [ISI], [UPDATE_DATE], [UPDATE_BY]) VALUES (N'28617DE6-15B4-44C8-921D-0F73EB7E05EE', CAST(0xB13D0B00 AS Date), N'193078', N'Bentuk-bentuk Berbakti Kepada Orang Tua', N'', CAST(0xC03D0B00 AS Date), N'2016030')
INSERT [NANO].[TBL_M_MICRO_SHEARING] ([PID_MICRO_SHEARING], [TANGGAL], [PENULIS], [TEMA], [ISI], [UPDATE_DATE], [UPDATE_BY]) VALUES (N'2B12A435-0668-4108-903A-611C25F32C53', CAST(0x743D0B00 AS Date), N'6107067', N'Gambar bahasa banjar', N'', CAST(0xC03D0B00 AS Date), N'2016030')
INSERT [NANO].[TBL_M_MICRO_SHEARING] ([PID_MICRO_SHEARING], [TANGGAL], [PENULIS], [TEMA], [ISI], [UPDATE_DATE], [UPDATE_BY]) VALUES (N'2C8953F2-DB4A-4892-82CB-C33567B1333D', CAST(0x6C3D0B00 AS Date), N'6198008', N'Bagi yang doyan Ngopi', N'', CAST(0xC03D0B00 AS Date), N'2016030')
INSERT [NANO].[TBL_M_MICRO_SHEARING] ([PID_MICRO_SHEARING], [TANGGAL], [PENULIS], [TEMA], [ISI], [UPDATE_DATE], [UPDATE_BY]) VALUES (N'3039D673-3C00-4143-9499-B8B46E2D55E0', CAST(0x8E3D0B00 AS Date), N'193078', N'Hubungan Kakak-Adik', N'', CAST(0xC03D0B00 AS Date), N'2016030')
INSERT [NANO].[TBL_M_MICRO_SHEARING] ([PID_MICRO_SHEARING], [TANGGAL], [PENULIS], [TEMA], [ISI], [UPDATE_DATE], [UPDATE_BY]) VALUES (N'311E1A37-2B75-42E1-847E-8B5A16591B9D', CAST(0x683D0B00 AS Date), N'6107067', N'Foto vessel dumptruck di Jalan Raya Cakung', N'https://dl.dropboxusercontent.com/1/view/ga35d6wqcyc77jd/Simpan/Nano35.jpg', CAST(0xC03D0B00 AS Date), N'2016030')
INSERT [NANO].[TBL_M_MICRO_SHEARING] ([PID_MICRO_SHEARING], [TANGGAL], [PENULIS], [TEMA], [ISI], [UPDATE_DATE], [UPDATE_BY]) VALUES (N'32997A77-28B8-4A11-9E2F-84A0B3ABB802', CAST(0xB03D0B00 AS Date), N'6196076', N'Jangan Sepelekan KATA-KATA', N'', CAST(0xC03D0B00 AS Date), N'2016030')
INSERT [NANO].[TBL_M_MICRO_SHEARING] ([PID_MICRO_SHEARING], [TANGGAL], [PENULIS], [TEMA], [ISI], [UPDATE_DATE], [UPDATE_BY]) VALUES (N'3E18FE15-80A2-4F57-9DB8-1587AF2DC8B5', CAST(0x783D0B00 AS Date), N'6196076', N'Video', N'https://dl.dropboxusercontent.com/1/view/9igia3bhksgl5do/Simpan/Tes.mp4', CAST(0xC03D0B00 AS Date), N'2016030')
INSERT [NANO].[TBL_M_MICRO_SHEARING] ([PID_MICRO_SHEARING], [TANGGAL], [PENULIS], [TEMA], [ISI], [UPDATE_DATE], [UPDATE_BY]) VALUES (N'3ECA43D7-67DA-4C44-AFF8-B4D80DF01D30', CAST(0x7E3D0B00 AS Date), N'6107067', N'Jangan kau ludahi sumur yang kau timba dan minum airnya', N' ', CAST(0xC03D0B00 AS Date), N'2016030')
INSERT [NANO].[TBL_M_MICRO_SHEARING] ([PID_MICRO_SHEARING], [TANGGAL], [PENULIS], [TEMA], [ISI], [UPDATE_DATE], [UPDATE_BY]) VALUES (N'4106DE9B-4E47-44A0-BBE4-779BC63B8770', CAST(0xB83D0B00 AS Date), N'6107067', N'Alquran Online dari University King Saud', N'', CAST(0xC03D0B00 AS Date), N'2016030')
INSERT [NANO].[TBL_M_MICRO_SHEARING] ([PID_MICRO_SHEARING], [TANGGAL], [PENULIS], [TEMA], [ISI], [UPDATE_DATE], [UPDATE_BY]) VALUES (N'466E9A6D-94A4-4E7D-BD1F-A22584275B9D', CAST(0x633D0B00 AS Date), N'6113882', N'PT Astra Modernland', N'', CAST(0xC03D0B00 AS Date), N'2016030')
INSERT [NANO].[TBL_M_MICRO_SHEARING] ([PID_MICRO_SHEARING], [TANGGAL], [PENULIS], [TEMA], [ISI], [UPDATE_DATE], [UPDATE_BY]) VALUES (N'4A1B372A-5EAB-4505-972F-DC9D2871C82D', CAST(0x6C3D0B00 AS Date), N'6107067', N'Menkeu rajin menulis', N'', CAST(0xC03D0B00 AS Date), N'2016030')
INSERT [NANO].[TBL_M_MICRO_SHEARING] ([PID_MICRO_SHEARING], [TANGGAL], [PENULIS], [TEMA], [ISI], [UPDATE_DATE], [UPDATE_BY]) VALUES (N'4E6AC5B0-A78A-4BAC-BE4D-83031D996A01', CAST(0xB33D0B00 AS Date), N'2016030', N'Kembang Api Online', N'', CAST(0xC03D0B00 AS Date), N'2016030')
INSERT [NANO].[TBL_M_MICRO_SHEARING] ([PID_MICRO_SHEARING], [TANGGAL], [PENULIS], [TEMA], [ISI], [UPDATE_DATE], [UPDATE_BY]) VALUES (N'4E958D47-07BD-4D36-8480-8F3161B66E39', CAST(0x683D0B00 AS Date), N'2017038', N'Bank syariah', N'', CAST(0xC03D0B00 AS Date), N'2016030')
INSERT [NANO].[TBL_M_MICRO_SHEARING] ([PID_MICRO_SHEARING], [TANGGAL], [PENULIS], [TEMA], [ISI], [UPDATE_DATE], [UPDATE_BY]) VALUES (N'516B430E-7A2E-4309-9691-442B0891BA56', CAST(0x723D0B00 AS Date), N'6107067', N'Buku amalan pembuka rejeki', N'', CAST(0xC03D0B00 AS Date), N'2016030')
INSERT [NANO].[TBL_M_MICRO_SHEARING] ([PID_MICRO_SHEARING], [TANGGAL], [PENULIS], [TEMA], [ISI], [UPDATE_DATE], [UPDATE_BY]) VALUES (N'51E8BE52-7BE1-4C04-BFBE-C8CB33544659', CAST(0x7F3D0B00 AS Date), N'193078', N'Buat anak2 kita (dari Najwa Shihab)', N' ', CAST(0xC03D0B00 AS Date), N'2016030')
INSERT [NANO].[TBL_M_MICRO_SHEARING] ([PID_MICRO_SHEARING], [TANGGAL], [PENULIS], [TEMA], [ISI], [UPDATE_DATE], [UPDATE_BY]) VALUES (N'5FB257E3-0991-4286-8DEB-7F94E20A1C36', CAST(0x673D0B00 AS Date), N'2016030', N'Beda tapi Sama', N'', CAST(0xC03D0B00 AS Date), N'2016030')
INSERT [NANO].[TBL_M_MICRO_SHEARING] ([PID_MICRO_SHEARING], [TANGGAL], [PENULIS], [TEMA], [ISI], [UPDATE_DATE], [UPDATE_BY]) VALUES (N'606FD53D-258B-46D8-9BBE-2AB488F0B45B', CAST(0xA53D0B00 AS Date), N'1708040', N'Abdul Hamid II dan Baitul Maqdis', N'', CAST(0xC03D0B00 AS Date), N'2016030')
INSERT [NANO].[TBL_M_MICRO_SHEARING] ([PID_MICRO_SHEARING], [TANGGAL], [PENULIS], [TEMA], [ISI], [UPDATE_DATE], [UPDATE_BY]) VALUES (N'647D1C1C-81D0-469E-9052-5402E6D1C493', CAST(0x713D0B00 AS Date), N'6196076', N'Ayat merubah nasib suatu kaum', N'', CAST(0xC03D0B00 AS Date), N'2016030')
INSERT [NANO].[TBL_M_MICRO_SHEARING] ([PID_MICRO_SHEARING], [TANGGAL], [PENULIS], [TEMA], [ISI], [UPDATE_DATE], [UPDATE_BY]) VALUES (N'66C70F85-A9A6-4E10-BAB7-D7F042052A69', CAST(0x923D0B00 AS Date), N'6107067', N'Kevin Mitnick: The Importance Of Human Awareness of Security', N'', CAST(0xC03D0B00 AS Date), N'2016030')
INSERT [NANO].[TBL_M_MICRO_SHEARING] ([PID_MICRO_SHEARING], [TANGGAL], [PENULIS], [TEMA], [ISI], [UPDATE_DATE], [UPDATE_BY]) VALUES (N'67F37B2A-E60D-4A91-8B0F-3246B3D9E7B4', CAST(0xAF3D0B00 AS Date), N'6107067', N'Foto Bandara Sepinggan Tempo Doeloe', N'', CAST(0xC03D0B00 AS Date), N'2016030')
INSERT [NANO].[TBL_M_MICRO_SHEARING] ([PID_MICRO_SHEARING], [TANGGAL], [PENULIS], [TEMA], [ISI], [UPDATE_DATE], [UPDATE_BY]) VALUES (N'6898A060-88F7-4DFC-9CA6-BB06D374C295', CAST(0x7F3D0B00 AS Date), N'6196076', N'Allah tidak membebani seseorang melainkan sesuai kesanggupannya', N' ', CAST(0xC03D0B00 AS Date), N'2016030')
INSERT [NANO].[TBL_M_MICRO_SHEARING] ([PID_MICRO_SHEARING], [TANGGAL], [PENULIS], [TEMA], [ISI], [UPDATE_DATE], [UPDATE_BY]) VALUES (N'6AD7E1A1-D6D2-4A18-9D9A-0CD841601E4A', CAST(0xA13D0B00 AS Date), N'2016030', N'Andai hidayah itu berhubungan dengan kecerdasan', N'', CAST(0xC03D0B00 AS Date), N'2016030')
INSERT [NANO].[TBL_M_MICRO_SHEARING] ([PID_MICRO_SHEARING], [TANGGAL], [PENULIS], [TEMA], [ISI], [UPDATE_DATE], [UPDATE_BY]) VALUES (N'6B4C319D-8FD2-4250-8439-AF80397130E4', CAST(0x913D0B00 AS Date), N'6107067', N'Menulis blog tentang Pengangguran dan Pencarian Lowongan Kerja', N'', CAST(0xC03D0B00 AS Date), N'2016030')
INSERT [NANO].[TBL_M_MICRO_SHEARING] ([PID_MICRO_SHEARING], [TANGGAL], [PENULIS], [TEMA], [ISI], [UPDATE_DATE], [UPDATE_BY]) VALUES (N'6B9E6F02-CC63-4155-BF38-274CC68F1B23', CAST(0xB73D0B00 AS Date), N'6196076', N'Jangan Mengharap Sahabat yang Sempurna', N'', CAST(0xC03D0B00 AS Date), N'2016030')
INSERT [NANO].[TBL_M_MICRO_SHEARING] ([PID_MICRO_SHEARING], [TANGGAL], [PENULIS], [TEMA], [ISI], [UPDATE_DATE], [UPDATE_BY]) VALUES (N'6ECDD4B4-B4D2-4D08-9BB4-75ECBBDE41B5', CAST(0x993D0B00 AS Date), N'6113882', N'5 foto ilustrasi', N'', CAST(0xC03D0B00 AS Date), N'2016030')
INSERT [NANO].[TBL_M_MICRO_SHEARING] ([PID_MICRO_SHEARING], [TANGGAL], [PENULIS], [TEMA], [ISI], [UPDATE_DATE], [UPDATE_BY]) VALUES (N'71CC9733-EFA6-4B80-8D0D-B76C8011FBD3', CAST(0x793D0B00 AS Date), N'193078', N'Kisah seorang ibu yang dititipkan di pantai jompo di Malaysia', N'', CAST(0xC03D0B00 AS Date), N'2016030')
INSERT [NANO].[TBL_M_MICRO_SHEARING] ([PID_MICRO_SHEARING], [TANGGAL], [PENULIS], [TEMA], [ISI], [UPDATE_DATE], [UPDATE_BY]) VALUES (N'73F696F9-E663-4C9F-B0C5-B18D57941A6F', CAST(0xA63D0B00 AS Date), N'2016030', N'Menuju Aksi Bela Palestina', N'', CAST(0xC03D0B00 AS Date), N'2016030')
INSERT [NANO].[TBL_M_MICRO_SHEARING] ([PID_MICRO_SHEARING], [TANGGAL], [PENULIS], [TEMA], [ISI], [UPDATE_DATE], [UPDATE_BY]) VALUES (N'74D86304-C7BD-4888-8DA0-0C02D9D0626F', CAST(0xA23D0B00 AS Date), N'6107067', N'Foto mobil terperosok di pertigaan tol Cakung pagi', N'', CAST(0xC03D0B00 AS Date), N'2016030')
INSERT [NANO].[TBL_M_MICRO_SHEARING] ([PID_MICRO_SHEARING], [TANGGAL], [PENULIS], [TEMA], [ISI], [UPDATE_DATE], [UPDATE_BY]) VALUES (N'75C02642-E36E-42FB-A339-9398B1C7EB22', CAST(0x843D0B00 AS Date), N'6107067', N'Cara terbaik meraih mimpi', N'', CAST(0xC03D0B00 AS Date), N'2016030')
INSERT [NANO].[TBL_M_MICRO_SHEARING] ([PID_MICRO_SHEARING], [TANGGAL], [PENULIS], [TEMA], [ISI], [UPDATE_DATE], [UPDATE_BY]) VALUES (N'7A305C2E-9E1C-42B6-A0DC-9FDFF4CAF3AB', CAST(0x843D0B00 AS Date), N'6107067', N'Knowledge, Experience & Creativity', N'', CAST(0xC03D0B00 AS Date), N'2016030')
INSERT [NANO].[TBL_M_MICRO_SHEARING] ([PID_MICRO_SHEARING], [TANGGAL], [PENULIS], [TEMA], [ISI], [UPDATE_DATE], [UPDATE_BY]) VALUES (N'7CA8E5AD-C67E-4DB3-913E-9462017244D4', CAST(0xB63D0B00 AS Date), N'6107067', N'Bahasa Arab 1-100', N'', CAST(0xC03D0B00 AS Date), N'2016030')
INSERT [NANO].[TBL_M_MICRO_SHEARING] ([PID_MICRO_SHEARING], [TANGGAL], [PENULIS], [TEMA], [ISI], [UPDATE_DATE], [UPDATE_BY]) VALUES (N'7FC7A5EF-C3AF-47F6-B956-F12CAADEED87', CAST(0x903D0B00 AS Date), N'6107067', N'Renungan hari ini, jika kita berbuat baik kepada orang lain.', N'', CAST(0xC03D0B00 AS Date), N'2016030')
INSERT [NANO].[TBL_M_MICRO_SHEARING] ([PID_MICRO_SHEARING], [TANGGAL], [PENULIS], [TEMA], [ISI], [UPDATE_DATE], [UPDATE_BY]) VALUES (N'7FD04AAE-285C-47DF-9466-05E10EE30603', CAST(0x8A3D0B00 AS Date), N'2016030', N'Cinta tapi Gerimis:)', N'', CAST(0xC03D0B00 AS Date), N'2016030')
INSERT [NANO].[TBL_M_MICRO_SHEARING] ([PID_MICRO_SHEARING], [TANGGAL], [PENULIS], [TEMA], [ISI], [UPDATE_DATE], [UPDATE_BY]) VALUES (N'84280EA8-F668-404E-8DBE-537A34BA4D4C', CAST(0x6A3D0B00 AS Date), N'6196076', N'Hukum jual beli kucing', N'', CAST(0xC03D0B00 AS Date), N'2016030')
INSERT [NANO].[TBL_M_MICRO_SHEARING] ([PID_MICRO_SHEARING], [TANGGAL], [PENULIS], [TEMA], [ISI], [UPDATE_DATE], [UPDATE_BY]) VALUES (N'87016BD9-A931-4687-97B6-04D5649279FB', CAST(0x703D0B00 AS Date), N'6107067', N'3 cara agar lancar berbicara di depan umum', N'', CAST(0xC03D0B00 AS Date), N'2016030')
INSERT [NANO].[TBL_M_MICRO_SHEARING] ([PID_MICRO_SHEARING], [TANGGAL], [PENULIS], [TEMA], [ISI], [UPDATE_DATE], [UPDATE_BY]) VALUES (N'87580EB9-51EF-48FA-8F5A-49405A4DD10F', CAST(0xA33D0B00 AS Date), N'193078', N'Fitrah Seksualitas', N'', CAST(0xC03D0B00 AS Date), N'2016030')
INSERT [NANO].[TBL_M_MICRO_SHEARING] ([PID_MICRO_SHEARING], [TANGGAL], [PENULIS], [TEMA], [ISI], [UPDATE_DATE], [UPDATE_BY]) VALUES (N'8C903C11-43D5-4E0F-8204-04779A2D9A47', CAST(0x8D3D0B00 AS Date), N'6107067', N'Informasi penutupan jalan tol Jakarta-Cikampek KM 4 tgl 21-30 Nov 2017 karena adanya pemasangan balok Girder', N'', CAST(0xC03D0B00 AS Date), N'2016030')
INSERT [NANO].[TBL_M_MICRO_SHEARING] ([PID_MICRO_SHEARING], [TANGGAL], [PENULIS], [TEMA], [ISI], [UPDATE_DATE], [UPDATE_BY]) VALUES (N'95203797-95AD-4DA4-B86C-FDB246C87181', CAST(0x983D0B00 AS Date), N'2016030', N'7 kebiasaan yang tidak baik untuk kesehatan', N'', CAST(0xC03D0B00 AS Date), N'2016030')
INSERT [NANO].[TBL_M_MICRO_SHEARING] ([PID_MICRO_SHEARING], [TANGGAL], [PENULIS], [TEMA], [ISI], [UPDATE_DATE], [UPDATE_BY]) VALUES (N'962B8103-B2B3-4406-B7A3-F0C2DFC3A65B', CAST(0x6C3D0B00 AS Date), N'6107067', N'Menkeu rajin menulis', N'', CAST(0xC03D0B00 AS Date), N'2016030')
INSERT [NANO].[TBL_M_MICRO_SHEARING] ([PID_MICRO_SHEARING], [TANGGAL], [PENULIS], [TEMA], [ISI], [UPDATE_DATE], [UPDATE_BY]) VALUES (N'9680E6CD-4472-4C1B-808A-691689CC6F90', CAST(0x873D0B00 AS Date), N'193078', N'Cemburu yang dibenarkan dalam Islam', N'', CAST(0xC03D0B00 AS Date), N'2016030')
INSERT [NANO].[TBL_M_MICRO_SHEARING] ([PID_MICRO_SHEARING], [TANGGAL], [PENULIS], [TEMA], [ISI], [UPDATE_DATE], [UPDATE_BY]) VALUES (N'A1CA87E7-BDB7-416D-B5E1-1177215E2BAD', CAST(0xB33D0B00 AS Date), N'1708040', N'Pekerja Penyapu Jalan', N'', CAST(0xC03D0B00 AS Date), N'2016030')
INSERT [NANO].[TBL_M_MICRO_SHEARING] ([PID_MICRO_SHEARING], [TANGGAL], [PENULIS], [TEMA], [ISI], [UPDATE_DATE], [UPDATE_BY]) VALUES (N'A33205E7-5351-4A9D-B7A5-62281973193F', CAST(0x923D0B00 AS Date), N'6196076', N'Video Jawa Lucu dari MadLipz', N'', CAST(0xC03D0B00 AS Date), N'2016030')
INSERT [NANO].[TBL_M_MICRO_SHEARING] ([PID_MICRO_SHEARING], [TANGGAL], [PENULIS], [TEMA], [ISI], [UPDATE_DATE], [UPDATE_BY]) VALUES (N'A3DBA146-9D51-4C05-97DB-795044CA3BBC', CAST(0x623D0B00 AS Date), N'6107067', N'Reminder jadwal sharing WA', N'', CAST(0xC03D0B00 AS Date), N'2016030')
INSERT [NANO].[TBL_M_MICRO_SHEARING] ([PID_MICRO_SHEARING], [TANGGAL], [PENULIS], [TEMA], [ISI], [UPDATE_DATE], [UPDATE_BY]) VALUES (N'A502CA08-6E7D-4296-88B0-8C9C6BC685BE', CAST(0x793D0B00 AS Date), N'6113882', N'Bocah ini Kena Gangguan Jiwa karena Terlalu Banyak Ikut Les', N'', CAST(0xC03D0B00 AS Date), N'2016030')
INSERT [NANO].[TBL_M_MICRO_SHEARING] ([PID_MICRO_SHEARING], [TANGGAL], [PENULIS], [TEMA], [ISI], [UPDATE_DATE], [UPDATE_BY]) VALUES (N'A6306978-1031-4F5B-A981-8E8B06A0E532', CAST(0x883D0B00 AS Date), N'6196076', N'Video bakso super size', N'', CAST(0xC03D0B00 AS Date), N'2016030')
INSERT [NANO].[TBL_M_MICRO_SHEARING] ([PID_MICRO_SHEARING], [TANGGAL], [PENULIS], [TEMA], [ISI], [UPDATE_DATE], [UPDATE_BY]) VALUES (N'A86E6BFE-0243-479E-BAA3-0B6704661F4A', CAST(0x6F3D0B00 AS Date), N'2017038', N'Pemutihan Pajak Kendaraan Bermotor', N'', CAST(0xC03D0B00 AS Date), N'2016030')
INSERT [NANO].[TBL_M_MICRO_SHEARING] ([PID_MICRO_SHEARING], [TANGGAL], [PENULIS], [TEMA], [ISI], [UPDATE_DATE], [UPDATE_BY]) VALUES (N'A8EFB779-1568-4E8E-9357-22EB488E52FF', CAST(0xA13D0B00 AS Date), N'6107067', N'Nasehat untuk para istri', N'', CAST(0xC03D0B00 AS Date), N'2016030')
INSERT [NANO].[TBL_M_MICRO_SHEARING] ([PID_MICRO_SHEARING], [TANGGAL], [PENULIS], [TEMA], [ISI], [UPDATE_DATE], [UPDATE_BY]) VALUES (N'A9F9BFB9-2932-4F70-9670-8773AD6E4D43', CAST(0x6A3D0B00 AS Date), N'6107067', N'Foto kebun hidroponik milik Pak Gun', N'https://dl.dropboxusercontent.com/1/view/dhj3eln7oau0j8c/Simpan/Nano31.jpg', CAST(0xC03D0B00 AS Date), N'2016030')
INSERT [NANO].[TBL_M_MICRO_SHEARING] ([PID_MICRO_SHEARING], [TANGGAL], [PENULIS], [TEMA], [ISI], [UPDATE_DATE], [UPDATE_BY]) VALUES (N'AE860B29-6CA8-4282-9778-888CF3119F41', CAST(0x7B3D0B00 AS Date), N'6107067', N'Hidup terintegrasi di jaman modern', N'', CAST(0xC03D0B00 AS Date), N'2016030')
INSERT [NANO].[TBL_M_MICRO_SHEARING] ([PID_MICRO_SHEARING], [TANGGAL], [PENULIS], [TEMA], [ISI], [UPDATE_DATE], [UPDATE_BY]) VALUES (N'B2753192-0144-4984-BA64-4472F9B1C024', CAST(0x923D0B00 AS Date), N'6107067', N'Kevin Mitnick: The Importance Of Human Awareness of Security', N'', CAST(0xC03D0B00 AS Date), N'2016030')
INSERT [NANO].[TBL_M_MICRO_SHEARING] ([PID_MICRO_SHEARING], [TANGGAL], [PENULIS], [TEMA], [ISI], [UPDATE_DATE], [UPDATE_BY]) VALUES (N'B3202437-EEFE-498A-BB9D-040BCEFA0D6F', CAST(0xB53D0B00 AS Date), N'2017038', N'Tidur Sesuai Tuntunan Rasulullah', N'', CAST(0xC03D0B00 AS Date), N'2016030')
INSERT [NANO].[TBL_M_MICRO_SHEARING] ([PID_MICRO_SHEARING], [TANGGAL], [PENULIS], [TEMA], [ISI], [UPDATE_DATE], [UPDATE_BY]) VALUES (N'B48F0525-98E2-43C6-B3E5-9379068863F0', CAST(0x713D0B00 AS Date), N'6107067', N'Poster Marketing pemasaran properti yang unik', N'', CAST(0xC03D0B00 AS Date), N'2016030')
INSERT [NANO].[TBL_M_MICRO_SHEARING] ([PID_MICRO_SHEARING], [TANGGAL], [PENULIS], [TEMA], [ISI], [UPDATE_DATE], [UPDATE_BY]) VALUES (N'B5A66474-6EAA-480D-AF20-7EE455248FEF', CAST(0x7E3D0B00 AS Date), N'2017038', N'Perbedaan file JPEG dan PNG', N'', CAST(0xC03D0B00 AS Date), N'2016030')
INSERT [NANO].[TBL_M_MICRO_SHEARING] ([PID_MICRO_SHEARING], [TANGGAL], [PENULIS], [TEMA], [ISI], [UPDATE_DATE], [UPDATE_BY]) VALUES (N'B66D70FA-8752-449A-AC4C-17EEF4129189', CAST(0x833D0B00 AS Date), N'6107067', N'Ingin fokus menganggur', N'', CAST(0xC03D0B00 AS Date), N'2016030')
INSERT [NANO].[TBL_M_MICRO_SHEARING] ([PID_MICRO_SHEARING], [TANGGAL], [PENULIS], [TEMA], [ISI], [UPDATE_DATE], [UPDATE_BY]) VALUES (N'BB77314A-F90C-4B87-8318-7FDEB33F774F', CAST(0xA13D0B00 AS Date), N'2017038', N'Siklus putaran rejeki', N'', CAST(0xC03D0B00 AS Date), N'2016030')
INSERT [NANO].[TBL_M_MICRO_SHEARING] ([PID_MICRO_SHEARING], [TANGGAL], [PENULIS], [TEMA], [ISI], [UPDATE_DATE], [UPDATE_BY]) VALUES (N'BDDEBFAA-8C76-41B0-BF31-64244B36ADAC', CAST(0xA13D0B00 AS Date), N'6107067', N'Obrolan keluarga tikus', N'', CAST(0xC03D0B00 AS Date), N'2016030')
INSERT [NANO].[TBL_M_MICRO_SHEARING] ([PID_MICRO_SHEARING], [TANGGAL], [PENULIS], [TEMA], [ISI], [UPDATE_DATE], [UPDATE_BY]) VALUES (N'C127E3A7-ACD8-47A6-B64E-910A8F3D6080', CAST(0x863D0B00 AS Date), N'6196076', N'Ayat: Kemudahan dibalik kesulitan', N'', CAST(0xC03D0B00 AS Date), N'2016030')
INSERT [NANO].[TBL_M_MICRO_SHEARING] ([PID_MICRO_SHEARING], [TANGGAL], [PENULIS], [TEMA], [ISI], [UPDATE_DATE], [UPDATE_BY]) VALUES (N'C1778694-2F86-4324-9C11-3763BF4BC2C8', CAST(0x9C3D0B00 AS Date), N'193078', N'Baiti Jannati', N'', CAST(0xC03D0B00 AS Date), N'2016030')
INSERT [NANO].[TBL_M_MICRO_SHEARING] ([PID_MICRO_SHEARING], [TANGGAL], [PENULIS], [TEMA], [ISI], [UPDATE_DATE], [UPDATE_BY]) VALUES (N'C47BA9BE-29E2-447B-A870-9C44E0FFA25C', CAST(0x6C3D0B00 AS Date), N'6196076', N'Link kopi hijau', N'', CAST(0xC03D0B00 AS Date), N'2016030')
INSERT [NANO].[TBL_M_MICRO_SHEARING] ([PID_MICRO_SHEARING], [TANGGAL], [PENULIS], [TEMA], [ISI], [UPDATE_DATE], [UPDATE_BY]) VALUES (N'C5ADB775-AC67-4951-8095-4E3F6F301004', CAST(0x6A3D0B00 AS Date), N'6196076', N'Hukum jual beli kucing', N'', CAST(0xC03D0B00 AS Date), N'2016030')
INSERT [NANO].[TBL_M_MICRO_SHEARING] ([PID_MICRO_SHEARING], [TANGGAL], [PENULIS], [TEMA], [ISI], [UPDATE_DATE], [UPDATE_BY]) VALUES (N'C6AE8EF9-7FB7-4E39-A75C-7CD02C541B1C', CAST(0x883D0B00 AS Date), N'6107067', N'Interviewer and Candidate (funny conversation)', N'', CAST(0xC03D0B00 AS Date), N'2016030')
INSERT [NANO].[TBL_M_MICRO_SHEARING] ([PID_MICRO_SHEARING], [TANGGAL], [PENULIS], [TEMA], [ISI], [UPDATE_DATE], [UPDATE_BY]) VALUES (N'C7BACB33-8579-4D3C-BF2E-90F3B8065797', CAST(0x7F3D0B00 AS Date), N'6196076', N'Allah tidak membebani seseorang melainkan sesuai kesanggupannya', N' ', CAST(0xC03D0B00 AS Date), N'2016030')
INSERT [NANO].[TBL_M_MICRO_SHEARING] ([PID_MICRO_SHEARING], [TANGGAL], [PENULIS], [TEMA], [ISI], [UPDATE_DATE], [UPDATE_BY]) VALUES (N'C83C2250-C53A-4BBD-B732-3C24E2EF6145', CAST(0x7F3D0B00 AS Date), N'6107067', N'Usulan program Tahiti, tantangan hidup atau mati :)', N' ', CAST(0xC03D0B00 AS Date), N'2016030')
INSERT [NANO].[TBL_M_MICRO_SHEARING] ([PID_MICRO_SHEARING], [TANGGAL], [PENULIS], [TEMA], [ISI], [UPDATE_DATE], [UPDATE_BY]) VALUES (N'CDA60940-455E-469A-B158-07E13AF24163', CAST(0x663D0B00 AS Date), N'193078', N'Rahasia sujud', N'', CAST(0xC03D0B00 AS Date), N'2016030')
INSERT [NANO].[TBL_M_MICRO_SHEARING] ([PID_MICRO_SHEARING], [TANGGAL], [PENULIS], [TEMA], [ISI], [UPDATE_DATE], [UPDATE_BY]) VALUES (N'D087D99A-2B67-4D17-BE54-BEA4FF80A688', CAST(0x833D0B00 AS Date), N'2016030', N'Ada cinta-Nya dibalik ujian-Mu', N'', CAST(0xC03D0B00 AS Date), N'2016030')
INSERT [NANO].[TBL_M_MICRO_SHEARING] ([PID_MICRO_SHEARING], [TANGGAL], [PENULIS], [TEMA], [ISI], [UPDATE_DATE], [UPDATE_BY]) VALUES (N'D1A73CA1-D7CB-4309-87CC-0AD7862BCD23', CAST(0x943D0B00 AS Date), N'6196076', N'Sok Sibuk ben Pantes Dibayar', N'', CAST(0xC03D0B00 AS Date), N'2016030')
INSERT [NANO].[TBL_M_MICRO_SHEARING] ([PID_MICRO_SHEARING], [TANGGAL], [PENULIS], [TEMA], [ISI], [UPDATE_DATE], [UPDATE_BY]) VALUES (N'D6501DAE-0F44-4272-8B36-86ADC3EDE8F3', CAST(0xA73D0B00 AS Date), N'2017038', N'Doa ketika ditimpa musibah', N'', CAST(0xC03D0B00 AS Date), N'2016030')
INSERT [NANO].[TBL_M_MICRO_SHEARING] ([PID_MICRO_SHEARING], [TANGGAL], [PENULIS], [TEMA], [ISI], [UPDATE_DATE], [UPDATE_BY]) VALUES (N'D9062C4A-DE31-4D48-9107-0BC2B7E093AB', CAST(0x9E3D0B00 AS Date), N'1708040', N'Saling memaafkan', N'', CAST(0xC03D0B00 AS Date), N'2016030')
INSERT [NANO].[TBL_M_MICRO_SHEARING] ([PID_MICRO_SHEARING], [TANGGAL], [PENULIS], [TEMA], [ISI], [UPDATE_DATE], [UPDATE_BY]) VALUES (N'DB80F8F6-8C67-4F46-9CA4-CAF4DC49EC13', CAST(0x843D0B00 AS Date), N'2017038', N'Berbahagialah dengan cara paling sederhana', N'', CAST(0xC03D0B00 AS Date), N'2016030')
INSERT [NANO].[TBL_M_MICRO_SHEARING] ([PID_MICRO_SHEARING], [TANGGAL], [PENULIS], [TEMA], [ISI], [UPDATE_DATE], [UPDATE_BY]) VALUES (N'DB906342-6831-44FC-914D-A34BE06FE830', CAST(0x773D0B00 AS Date), N'2016030', N'Minum air putih terbaik', N'', CAST(0xC03D0B00 AS Date), N'2016030')
INSERT [NANO].[TBL_M_MICRO_SHEARING] ([PID_MICRO_SHEARING], [TANGGAL], [PENULIS], [TEMA], [ISI], [UPDATE_DATE], [UPDATE_BY]) VALUES (N'E3DF987A-7C71-4DE3-9025-D37B3C63850D', CAST(0xA83D0B00 AS Date), N'6107067', N'Si Jono', N'', CAST(0xC03D0B00 AS Date), N'2016030')
INSERT [NANO].[TBL_M_MICRO_SHEARING] ([PID_MICRO_SHEARING], [TANGGAL], [PENULIS], [TEMA], [ISI], [UPDATE_DATE], [UPDATE_BY]) VALUES (N'E3F3473D-340B-4836-882A-0F16BA9A0AC9', CAST(0x913D0B00 AS Date), N'2016030', N'Selamat Hari Guru', N'', CAST(0xC03D0B00 AS Date), N'2016030')
INSERT [NANO].[TBL_M_MICRO_SHEARING] ([PID_MICRO_SHEARING], [TANGGAL], [PENULIS], [TEMA], [ISI], [UPDATE_DATE], [UPDATE_BY]) VALUES (N'E423AB2A-12B7-4DD0-A5F5-33F537D6C934', CAST(0x923D0B00 AS Date), N'6107067', N'Pembangunan office PAMA BRCB bermanfaat', N'', CAST(0xC03D0B00 AS Date), N'2016030')
INSERT [NANO].[TBL_M_MICRO_SHEARING] ([PID_MICRO_SHEARING], [TANGGAL], [PENULIS], [TEMA], [ISI], [UPDATE_DATE], [UPDATE_BY]) VALUES (N'E5F95F32-1533-4C12-BE97-AED783E58DF5', CAST(0xAB3D0B00 AS Date), N'6196076', N'Banci LGBT Ziarah Kubur', N'', CAST(0xC03D0B00 AS Date), N'2016030')
INSERT [NANO].[TBL_M_MICRO_SHEARING] ([PID_MICRO_SHEARING], [TANGGAL], [PENULIS], [TEMA], [ISI], [UPDATE_DATE], [UPDATE_BY]) VALUES (N'E71A1C81-111A-4750-933D-755CD4581DE9', CAST(0xB33D0B00 AS Date), N'6107067', N'Koran: Difteri Menular Melalui Terompet Tahun Baru', N'', CAST(0xC03D0B00 AS Date), N'2016030')
INSERT [NANO].[TBL_M_MICRO_SHEARING] ([PID_MICRO_SHEARING], [TANGGAL], [PENULIS], [TEMA], [ISI], [UPDATE_DATE], [UPDATE_BY]) VALUES (N'E8BFEE4E-16EA-4543-92F3-B656927D3331', CAST(0x9A3D0B00 AS Date), N'6107067', N'Sifatul Insan', N'', CAST(0xC03D0B00 AS Date), N'2016030')
INSERT [NANO].[TBL_M_MICRO_SHEARING] ([PID_MICRO_SHEARING], [TANGGAL], [PENULIS], [TEMA], [ISI], [UPDATE_DATE], [UPDATE_BY]) VALUES (N'E9EC2546-7B90-44FC-8B1D-70B2E9AC815B', CAST(0x9D3D0B00 AS Date), N'6107067', N'Potret Semangat', N'', CAST(0xC03D0B00 AS Date), N'2016030')
INSERT [NANO].[TBL_M_MICRO_SHEARING] ([PID_MICRO_SHEARING], [TANGGAL], [PENULIS], [TEMA], [ISI], [UPDATE_DATE], [UPDATE_BY]) VALUES (N'EAD82603-96B6-48A2-8512-50396B547A19', CAST(0x773D0B00 AS Date), N'6196076', N'Foto Jalan mudah belum tentu terbaik', N'https://dl.dropboxusercontent.com/1/view/d30s7fyp4a8lvk4/Simpan/nano2.jpg', CAST(0xC03D0B00 AS Date), N'2016030')
INSERT [NANO].[TBL_M_MICRO_SHEARING] ([PID_MICRO_SHEARING], [TANGGAL], [PENULIS], [TEMA], [ISI], [UPDATE_DATE], [UPDATE_BY]) VALUES (N'EE6C171E-26B3-4320-875C-35097B0B747A', CAST(0x823D0B00 AS Date), N'6196076', N'Ayo dapatkan waktu yang barokah', N'', CAST(0xC03D0B00 AS Date), N'2016030')
INSERT [NANO].[TBL_M_MICRO_SHEARING] ([PID_MICRO_SHEARING], [TANGGAL], [PENULIS], [TEMA], [ISI], [UPDATE_DATE], [UPDATE_BY]) VALUES (N'EF4EAA65-B5DF-4D00-901A-C6281AE08444', CAST(0x6C3D0B00 AS Date), N'6113882', N'Mengapa rambut putih', N'', CAST(0xC03D0B00 AS Date), N'2016030')
INSERT [NANO].[TBL_M_MICRO_SHEARING] ([PID_MICRO_SHEARING], [TANGGAL], [PENULIS], [TEMA], [ISI], [UPDATE_DATE], [UPDATE_BY]) VALUES (N'EF6D1976-7FB8-4DD1-8303-19B0FCB302F7', CAST(0x933D0B00 AS Date), N'6107067', N'Humor: Mukidi Bantu Nenek', N'', CAST(0xC03D0B00 AS Date), N'2016030')
INSERT [NANO].[TBL_M_MICRO_SHEARING] ([PID_MICRO_SHEARING], [TANGGAL], [PENULIS], [TEMA], [ISI], [UPDATE_DATE], [UPDATE_BY]) VALUES (N'EF7A3305-D69C-4514-9128-35D4E802B87F', CAST(0x683D0B00 AS Date), N'6113882', N'Menyindir diri sendiri', N'', CAST(0xC03D0B00 AS Date), N'2016030')
INSERT [NANO].[TBL_M_MICRO_SHEARING] ([PID_MICRO_SHEARING], [TANGGAL], [PENULIS], [TEMA], [ISI], [UPDATE_DATE], [UPDATE_BY]) VALUES (N'F023FBA0-72DC-4148-9CB9-C0194F63FD39', CAST(0x8C3D0B00 AS Date), N'6107067', N'Sebuah Cerita untuk Ayah', N'', CAST(0xC03D0B00 AS Date), N'2016030')
GO
print 'Processed 100 total records'
INSERT [NANO].[TBL_M_MICRO_SHEARING] ([PID_MICRO_SHEARING], [TANGGAL], [PENULIS], [TEMA], [ISI], [UPDATE_DATE], [UPDATE_BY]) VALUES (N'F836715B-41CE-4FCF-85D4-45993F110410', CAST(0x733D0B00 AS Date), N'6107067', N'Meme lucu basa jowo', N'', CAST(0xC03D0B00 AS Date), N'2016030')
INSERT [NANO].[TBL_M_MICRO_SHEARING] ([PID_MICRO_SHEARING], [TANGGAL], [PENULIS], [TEMA], [ISI], [UPDATE_DATE], [UPDATE_BY]) VALUES (N'F89451B6-A877-4920-B393-734981A5DAEA', CAST(0x9B3D0B00 AS Date), N'6196076', N'Tawakkal', N'', CAST(0xC03D0B00 AS Date), N'2016030')
INSERT [NANO].[TBL_M_MICRO_SHEARING] ([PID_MICRO_SHEARING], [TANGGAL], [PENULIS], [TEMA], [ISI], [UPDATE_DATE], [UPDATE_BY]) VALUES (N'FA63232E-A5BB-4644-B888-3F16F433E832', CAST(0x853D0B00 AS Date), N'6107067', N'Reuni', N'', CAST(0xC03D0B00 AS Date), N'2016030')
INSERT [NANO].[TBL_M_MICRO_SHEARING] ([PID_MICRO_SHEARING], [TANGGAL], [PENULIS], [TEMA], [ISI], [UPDATE_DATE], [UPDATE_BY]) VALUES (N'FA77D31D-6820-43C5-816D-636D89954790', CAST(0x633D0B00 AS Date), N'6196076', N'Rintangan dan Rantangan', N'', CAST(0xC03D0B00 AS Date), N'2016030')
INSERT [NANO].[TBL_M_MICRO_SHEARING] ([PID_MICRO_SHEARING], [TANGGAL], [PENULIS], [TEMA], [ISI], [UPDATE_DATE], [UPDATE_BY]) VALUES (N'FB1BEA18-34AE-48BE-857B-3F1C34350FCA', CAST(0x633D0B00 AS Date), N'6107067', N'Kalau sendirian', N'', CAST(0xC03D0B00 AS Date), N'2016030')
INSERT [NANO].[TBL_M_MICRO_SHEARING] ([PID_MICRO_SHEARING], [TANGGAL], [PENULIS], [TEMA], [ISI], [UPDATE_DATE], [UPDATE_BY]) VALUES (N'FB606371-B3CB-4C3B-8E2A-5BDA5518FA81', CAST(0xB03D0B00 AS Date), N'2017038', N'4 Teknik Charge Ponsel', N'', CAST(0xC03D0B00 AS Date), N'2016030')
INSERT [NANO].[TBL_M_MICRO_SHEARING] ([PID_MICRO_SHEARING], [TANGGAL], [PENULIS], [TEMA], [ISI], [UPDATE_DATE], [UPDATE_BY]) VALUES (N'FBCF42CC-E333-4C5A-9B54-3580A976B62D', CAST(0xB53D0B00 AS Date), N'6107067', N'Foto interview lucu', N'', CAST(0xC03D0B00 AS Date), N'2016030')
/****** Object:  View [NANO].[VW_MICRO_SHEARING]    Script Date: 06/05/2018 07:42:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [NANO].[VW_MICRO_SHEARING]
AS
SELECT     A.PID_MICRO_SHEARING, A.TANGGAL, A.PENULIS, B.NAMA, A.TEMA, A.ISI
FROM         NANO.TBL_M_EMPLOYEE_NANO AS B INNER JOIN
                      NANO.TBL_M_MICRO_SHEARING AS A ON B.NRP = A.PENULIS
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "B"
            Begin Extent = 
               Top = 6
               Left = 520
               Bottom = 125
               Right = 691
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "A"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 204
               Right = 241
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'NANO', @level1type=N'VIEW',@level1name=N'VW_MICRO_SHEARING'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'NANO', @level1type=N'VIEW',@level1name=N'VW_MICRO_SHEARING'
GO
/****** Object:  Table [NANO].[TBL_T_PELAPOR_VIP]    Script Date: 06/05/2018 07:42:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [NANO].[TBL_T_PELAPOR_VIP](
	[PID_PELAPOR_VIP] [varchar](50) NOT NULL,
	[TANGGAL] [date] NULL,
	[UTAMA] [varchar](10) NULL,
	[CADANGAN] [varchar](10) NULL,
	[ACTUAL] [varchar](10) NULL,
	[KET] [varchar](50) NULL,
	[CREATE_DATE] [datetime] NULL,
	[CREATE_BY] [varchar](10) NULL,
	[MODIFIED_DATE] [datetime] NULL,
	[MODIFIED_BY] [varchar](10) NULL,
 CONSTRAINT [PK_TBL_T_PELAPOR_VIP] PRIMARY KEY CLUSTERED 
(
	[PID_PELAPOR_VIP] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [NANO].[TBL_T_PELAPOR_VIP] ([PID_PELAPOR_VIP], [TANGGAL], [UTAMA], [CADANGAN], [ACTUAL], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY]) VALUES (N'01dfef79-8167-40e9-bcd7-7647b5663e44', CAST(0x8E3D0B00 AS Date), N'2017038', N'193078', NULL, N'Tidak Ada Laporan SEL', CAST(0x0000A83900A680E6 AS DateTime), N'2016030', CAST(0x0000A83900A680E6 AS DateTime), N'2016030')
INSERT [NANO].[TBL_T_PELAPOR_VIP] ([PID_PELAPOR_VIP], [TANGGAL], [UTAMA], [CADANGAN], [ACTUAL], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY]) VALUES (N'0361315c-c539-477d-b1a9-e9045df645f7', CAST(0x2C3D0B00 AS Date), N'6107067', N'2016030', N'2017038', NULL, CAST(0x0000A81801124119 AS DateTime), N'2016030', CAST(0x0000A81801124119 AS DateTime), N'2016030')
INSERT [NANO].[TBL_T_PELAPOR_VIP] ([PID_PELAPOR_VIP], [TANGGAL], [UTAMA], [CADANGAN], [ACTUAL], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY]) VALUES (N'036bf71b-8ec9-4d62-9785-8de51e77c0d6', CAST(0xD43D0B00 AS Date), N'6196076', N'6113882', N'6113882', NULL, CAST(0x0000A882008931A3 AS DateTime), N'2016030', CAST(0x0000A882008931A3 AS DateTime), N'2016030')
INSERT [NANO].[TBL_T_PELAPOR_VIP] ([PID_PELAPOR_VIP], [TANGGAL], [UTAMA], [CADANGAN], [ACTUAL], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY]) VALUES (N'1cc174e7-237f-4108-874a-03ca9755576b', CAST(0x363E0B00 AS Date), N'6113882', N'2017038', N'2017038', NULL, CAST(0x0000A8E40091450A AS DateTime), N'2016030', CAST(0x0000A8E40091450A AS DateTime), N'2016030')
INSERT [NANO].[TBL_T_PELAPOR_VIP] ([PID_PELAPOR_VIP], [TANGGAL], [UTAMA], [CADANGAN], [ACTUAL], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY]) VALUES (N'2b23d5ae-c145-4a87-82d7-ecb4358a9a3a', CAST(0xF03D0B00 AS Date), N'6196076', N'193078', N'6107067', NULL, CAST(0x0000A89E008A39EF AS DateTime), N'6107067', CAST(0x0000A89E008A39EF AS DateTime), N'6107067')
INSERT [NANO].[TBL_T_PELAPOR_VIP] ([PID_PELAPOR_VIP], [TANGGAL], [UTAMA], [CADANGAN], [ACTUAL], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY]) VALUES (N'35e6299b-14b0-415f-ab32-6683ba0c1a82', CAST(0xE23D0B00 AS Date), N'6196076', N'2017038', N'2016030', NULL, CAST(0x0000A8870086BAC9 AS DateTime), N'2016030', CAST(0x0000A8870086BAC9 AS DateTime), N'2016030')
INSERT [NANO].[TBL_T_PELAPOR_VIP] ([PID_PELAPOR_VIP], [TANGGAL], [UTAMA], [CADANGAN], [ACTUAL], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY]) VALUES (N'3fa468df-3d6c-4d83-b5f7-c9e7a84f00f7', CAST(0x0C3E0B00 AS Date), N'6196076', N'6196076', N'2017038', NULL, CAST(0x0000A8BA00969D8A AS DateTime), N'2017038', CAST(0x0000A8BA00969D8A AS DateTime), N'2017038')
INSERT [NANO].[TBL_T_PELAPOR_VIP] ([PID_PELAPOR_VIP], [TANGGAL], [UTAMA], [CADANGAN], [ACTUAL], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY]) VALUES (N'43f15363-fd0b-48a4-a503-0231781dc7dc', CAST(0x1A3E0B00 AS Date), N'6196076', N'1708040', N'1708040', NULL, CAST(0x0000A8C800ACD943 AS DateTime), N'193078', CAST(0x0000A8C800ACD943 AS DateTime), N'193078')
INSERT [NANO].[TBL_T_PELAPOR_VIP] ([PID_PELAPOR_VIP], [TANGGAL], [UTAMA], [CADANGAN], [ACTUAL], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY]) VALUES (N'4def0465-4141-4157-8d9c-e1fa030a7e86', CAST(0x1E3D0B00 AS Date), N'6196076', N'6113882', N'6113882', NULL, CAST(0x0000A82000BD7CC7 AS DateTime), N'2016030', CAST(0x0000A82000BD7CC7 AS DateTime), N'2016030')
INSERT [NANO].[TBL_T_PELAPOR_VIP] ([PID_PELAPOR_VIP], [TANGGAL], [UTAMA], [CADANGAN], [ACTUAL], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY]) VALUES (N'78da4101-e2ac-48c7-a803-a91e0f9c78e1', CAST(0x643D0B00 AS Date), N'2017038', N'193078', N'193078', NULL, CAST(0x0000A81801127688 AS DateTime), N'2016030', CAST(0x0000A81801127688 AS DateTime), N'2016030')
INSERT [NANO].[TBL_T_PELAPOR_VIP] ([PID_PELAPOR_VIP], [TANGGAL], [UTAMA], [CADANGAN], [ACTUAL], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY]) VALUES (N'8f1bb6e6-bb52-481b-84f7-c7f9556e0b5b', CAST(0x9C3D0B00 AS Date), N'6196076', N'6107067', N'193078', NULL, CAST(0x0000A84300A57EEF AS DateTime), N'2016030', CAST(0x0000A84300A57EEF AS DateTime), N'2016030')
INSERT [NANO].[TBL_T_PELAPOR_VIP] ([PID_PELAPOR_VIP], [TANGGAL], [UTAMA], [CADANGAN], [ACTUAL], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY]) VALUES (N'99b8340f-aae1-44f5-88a8-b9ef4b86ed42', CAST(0xFE3D0B00 AS Date), N'6196076', N'2016030', N'2016030', NULL, CAST(0x0000A8A300E8EBCE AS DateTime), N'2016030', CAST(0x0000A8A300E8EBCE AS DateTime), N'2016030')
INSERT [NANO].[TBL_T_PELAPOR_VIP] ([PID_PELAPOR_VIP], [TANGGAL], [UTAMA], [CADANGAN], [ACTUAL], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY]) VALUES (N'a2b276d5-f7e7-4dd2-8c49-53786fdf788b', CAST(0x563D0B00 AS Date), N'6113882', N'2017038', N'2016030', NULL, CAST(0x0000A818011272B2 AS DateTime), N'2016030', CAST(0x0000A818011272B2 AS DateTime), N'2016030')
INSERT [NANO].[TBL_T_PELAPOR_VIP] ([PID_PELAPOR_VIP], [TANGGAL], [UTAMA], [CADANGAN], [ACTUAL], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY]) VALUES (N'a4d63798-4315-47e3-98db-6f9a86055ee7', CAST(0xC63D0B00 AS Date), N'6196076', N'2017038', N'2017038', NULL, CAST(0x0000A86D00EE6064 AS DateTime), N'2016030', CAST(0x0000A86D00EE6064 AS DateTime), N'2016030')
INSERT [NANO].[TBL_T_PELAPOR_VIP] ([PID_PELAPOR_VIP], [TANGGAL], [UTAMA], [CADANGAN], [ACTUAL], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY]) VALUES (N'b6477cb2-4ab0-4c6f-8593-a628101421ae', CAST(0x483D0B00 AS Date), N'6196076', N'6113882', N'193078', NULL, CAST(0x0000A818011263BD AS DateTime), N'2016030', CAST(0x0000A818011263BD AS DateTime), N'2016030')
INSERT [NANO].[TBL_T_PELAPOR_VIP] ([PID_PELAPOR_VIP], [TANGGAL], [UTAMA], [CADANGAN], [ACTUAL], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY]) VALUES (N'c1b19b18-7ca0-4f09-a252-76d0318531b1', CAST(0x803D0B00 AS Date), N'6113882', N'2017038', N'2017038', N'Pic Utama Dinas Ke Site', CAST(0x0000A82B00AF3FD5 AS DateTime), N'2016030', CAST(0x0000A84000AD9D7B AS DateTime), N'2016030')
INSERT [NANO].[TBL_T_PELAPOR_VIP] ([PID_PELAPOR_VIP], [TANGGAL], [UTAMA], [CADANGAN], [ACTUAL], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY]) VALUES (N'c52faf57-69ab-470e-bc48-a7d70bcd09f9', CAST(0xAA3D0B00 AS Date), N'6196076', N'2016030', N'2016030', NULL, CAST(0x0000A857008B94B2 AS DateTime), N'2016030', CAST(0x0000A857008B94B2 AS DateTime), N'2016030')
INSERT [NANO].[TBL_T_PELAPOR_VIP] ([PID_PELAPOR_VIP], [TANGGAL], [UTAMA], [CADANGAN], [ACTUAL], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY]) VALUES (N'd022dee4-3ee1-4a6a-ac5d-03da73cab751', CAST(0x723D0B00 AS Date), N'6196076', N'6113882', NULL, N'Tidak Ada Yang Lapor', CAST(0x0000A82000BDF30A AS DateTime), N'2016030', CAST(0x0000A82000BDF30A AS DateTime), N'2016030')
INSERT [NANO].[TBL_T_PELAPOR_VIP] ([PID_PELAPOR_VIP], [TANGGAL], [UTAMA], [CADANGAN], [ACTUAL], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY]) VALUES (N'd4c8c9ac-279e-46c8-88d5-ea78db737e41', CAST(0x283E0B00 AS Date), N'6196076', N'6113882', N'6196076', NULL, CAST(0x0000A8CD00AB7DCE AS DateTime), N'2016030', CAST(0x0000A8CD00E2A0CD AS DateTime), N'2016030')
INSERT [NANO].[TBL_T_PELAPOR_VIP] ([PID_PELAPOR_VIP], [TANGGAL], [UTAMA], [CADANGAN], [ACTUAL], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY]) VALUES (N'efbbc6b4-c768-423c-aa2f-96738a41b02f', CAST(0xB83D0B00 AS Date), N'6196076', N'1708040', N'1708040', NULL, CAST(0x0000A866009712E9 AS DateTime), N'193078', CAST(0x0000A866009712E9 AS DateTime), N'193078')
INSERT [NANO].[TBL_T_PELAPOR_VIP] ([PID_PELAPOR_VIP], [TANGGAL], [UTAMA], [CADANGAN], [ACTUAL], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY]) VALUES (N'f10dbb44-7d63-4a39-85cc-000eafbf1d56', CAST(0x103D0B00 AS Date), N'2016030', N'6196076', N'6107067', NULL, CAST(0x0000A82000BE0185 AS DateTime), N'2016030', CAST(0x0000A82000BE2094 AS DateTime), N'2016030')
INSERT [NANO].[TBL_T_PELAPOR_VIP] ([PID_PELAPOR_VIP], [TANGGAL], [UTAMA], [CADANGAN], [ACTUAL], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY]) VALUES (N'f7a9b96e-b0db-422e-be34-779b8fa2011d', CAST(0x3A3D0B00 AS Date), N'2016030', N'6196076', N'6107067', NULL, CAST(0x0000A81801125551 AS DateTime), N'2016030', CAST(0x0000A81801125551 AS DateTime), N'2016030')
/****** Object:  UserDefinedFunction [NANO].[cufn_pelaporVipUtama]    Script Date: 06/05/2018 07:42:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author		: YAQUB
-- Create date	: 05-12-2017
-- Description	: Pelapor VIP Utama berikutnya
-- =============================================
CREATE FUNCTION [NANO].[cufn_pelaporVipUtama]
(	
	-- Add the parameters for the function here
	@sUtama varchar(50)	,
	@sTanggal date
)
RETURNS @TBL TABLE 
(
	-- Add the SELECT statement with parameter references here
	NRP varchar(50),
	NAMA varchar(50)
)
AS
BEGIN
	INSERT INTO @TBL	
		select TOP 1 A.UTAMA,NRP.NAMA
		from [DB_NANO].NANO.TBL_T_PELAPOR_VIP as A	inner join
		 NANO.TBL_M_EMPLOYEE_NANO AS NRP on A.UTAMA=NRP.NRP
			where A.PID_PELAPOR_VIP IS NOT NULL 
			AND NRP.STATUS=1 
			and A.TANGGAL<@sTanggal
			and A.UTAMA not in
				(select top (select COUNT(1)-1 from [DB_NANO].[NANO].[TBL_M_EMPLOYEE_NANO] where STATUS=1) ACTUAL
				FROM  NANO.TBL_T_PELAPOR_VIP WHERE TANGGAL<@sTanggal AND ACTUAL IS NOT NULL
				order by TANGGAL desc)
		ORDER BY A.TANGGAL DESC
	
	
	--DECLARE @Icount1 INT=(SELECT TOP 1  COUNT(ACTUAL) AS COUNT_ACTUAL
	--			FROM  NANO.TBL_T_PELAPOR_VIP
	--			WHERE --ACTUAL_DESC IS NOT NULL 
	--			 ACTUAL=@sUtama
	--			AND TANGGAL<@sTanggal
	--			GROUP BY ACTUAL)
	--DECLARE @Icount2 INT=(SELECT TOP 1 CASE WHEN A.COUNT_ACTUAL IS NULL THEN 0 ELSE A.COUNT_ACTUAL END AS COUNT_ACTUAL
	--			FROM (SELECT ACTUAL,COUNT(ACTUAL) AS COUNT_ACTUAL 
	--					FROM   NANO.TBL_T_PELAPOR_VIP
	--					--WHERE ACTUAL_DESC IS NOT NULL
	--					GROUP BY ACTUAL)AS A RIGHT OUTER JOIN
	--					(SELECT G.UTAMA, H.NAMA, COUNT(G.UTAMA) AS UTAMA_COUNT
	--					FROM (SELECT UTAMA,TANGGAL FROM NANO.TBL_T_PELAPOR_VIP WHERE TANGGAL<@sTanggal) AS G LEFT OUTER JOIN
 --                     NANO.TBL_M_EMPLOYEE_NANO AS H ON G.UTAMA = H.NRP
	--			GROUP BY G.UTAMA, H.NAMA) AS B
	--					ON A.ACTUAL=B.UTAMA
	--			ORDER BY A.COUNT_ACTUAL)
		
	----CONDISI INSERT
	--IF (SELECT CASE WHEN @Icount1 IS NULL THEN 0 ELSE @Icount1 END) > @Icount2
	--	BEGIN 	
	--		INSERT INTO @TBL	
	--			SELECT 	Z.UTAMA,Z.NAMA
	--			FROM
	--			(
	--				SELECT TOP 1 B.UTAMA,B.NAMA
	--				FROM (SELECT ACTUAL,COUNT(ACTUAL) AS COUNT_ACTUAL 
	--						FROM   [NANO].[VW_PELAPOR_VIP]
	--						WHERE ACTUAL_DESC IS NOT NULL
	--						GROUP BY ACTUAL)AS A RIGHT OUTER JOIN
	--						(SELECT G.UTAMA, H.NAMA, COUNT(G.UTAMA) AS UTAMA_COUNT
	--						FROM (SELECT UTAMA,TANGGAL FROM NANO.TBL_T_PELAPOR_VIP WHERE TANGGAL<@sTanggal) AS G LEFT OUTER JOIN
	--						NANO.TBL_M_EMPLOYEE_NANO AS H ON G.UTAMA = H.NRP
	--						GROUP BY G.UTAMA, H.NAMA) AS B
	--						ON A.ACTUAL=B.UTAMA
	--				ORDER BY A.COUNT_ACTUAL
	--			)AS Z
	--	END
	--ELSE
	--	BEGIN
	--		INSERT INTO @TBL	
	--				SELECT 	Z.NRP,Z.NAMA
	--				FROM
	--				(
	--					SELECT TOP 1 NRP,NAMA FROM NANO.TBL_M_EMPLOYEE_NANO
	--					WHERE NRP=@sUtama
	--				)AS Z
	--	END	
	
RETURN;
END
GO
/****** Object:  View [NANO].[VW_PELAPOR_VIP]    Script Date: 06/05/2018 07:42:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [NANO].[VW_PELAPOR_VIP]
AS

SELECT L.PID_PELAPOR_VIP,L.TANGGAL,L.UTAMA,L.UTAMA_DESC,
CASE WHEN L.CADANGAN=L.UTAMA THEN  (SELECT CADANGAN_NEXT FROM [NANO].[cufn_pelaporVipCadangan](L.CADANGAN))
 ELSE 
	CASE WHEN L.CADANGAN=(SELECT TOP 1 ACTUAL FROM [DB_NANO].[NANO].[TBL_T_PELAPOR_VIP] WHERE TANGGAL =CONVERT(DATE,CONVERT(DATETIME,L.TANGGAL)-14) ORDER BY TANGGAL DESC)
		THEN (SELECT CADANGAN_NEXT FROM [NANO].[cufn_pelaporVipCadangan](L.CADANGAN))
		ELSE L.CADANGAN
	END
END AS CADANGAN,
CASE WHEN L.CADANGAN=L.UTAMA 
	THEN (SELECT CADANGAN_DESC_NEXT FROM [NANO].[cufn_pelaporVipCadangan](L.CADANGAN))
	ELSE 
		CASE WHEN L.CADANGAN=(SELECT TOP 1 ACTUAL FROM [DB_NANO].[NANO].[TBL_T_PELAPOR_VIP] WHERE TANGGAL =CONVERT(DATE,CONVERT(DATETIME,L.TANGGAL)-14) ORDER BY TANGGAL DESC)
		THEN (SELECT CADANGAN_DESC_NEXT FROM [NANO].[cufn_pelaporVipCadangan](L.CADANGAN))
		ELSE L.CADANGAN_DESC
		END
END	
AS CADANGAN_DESC,
L.ACTUAL,L.ACTUAL_DESC,L.KET
FROM
(
SELECT 
Z.PID_PELAPOR_VIP,Z.TANGGAL,Z.UTAMA,Z.UTAMA_DESC,
CASE WHEN Z.CADANGAN=Z.UTAMA 
	THEN (SELECT CADANGAN_NEXT FROM [NANO].[cufn_pelaporVipCadangan](Z.CADANGAN))
	ELSE 
		CASE WHEN Z.CADANGAN=(SELECT TOP 1 ACTUAL FROM [DB_NANO].[NANO].[TBL_T_PELAPOR_VIP] WHERE TANGGAL =CONVERT(DATE,CONVERT(DATETIME,Z.TANGGAL)-14) ORDER BY TANGGAL DESC)
		THEN (SELECT CADANGAN_NEXT FROM [NANO].[cufn_pelaporVipCadangan](Z.CADANGAN))
		ELSE Z.CADANGAN
		END 
END	
AS CADANGAN,
CASE WHEN Z.CADANGAN=Z.UTAMA 
	THEN (SELECT CADANGAN_DESC_NEXT FROM [NANO].[cufn_pelaporVipCadangan](Z.CADANGAN))
	ELSE 
		CASE WHEN Z.CADANGAN=(SELECT TOP 1 ACTUAL FROM [DB_NANO].[NANO].[TBL_T_PELAPOR_VIP] WHERE TANGGAL =CONVERT(DATE,CONVERT(DATETIME,Z.TANGGAL)-14) ORDER BY TANGGAL DESC)
		THEN (SELECT CADANGAN_DESC_NEXT FROM [NANO].[cufn_pelaporVipCadangan](Z.CADANGAN))
		ELSE Z.CADANGAN_DESC
		END
END	
AS CADANGAN_DESC,
--Z.CADANGAN_DESC,
Z.ACTUAL,
Z.ACTUAL_DESC,
Z.KET
FROM 
(
SELECT     A.PID_PELAPOR_VIP, B.TANGGAL, 
CASE WHEN A.UTAMA IS NULL THEN (select NRP from NANO.cufn_pelaporVipUtama(B.UTAMA,B.TANGGAL)) ELSE A.UTAMA END AS UTAMA, 
CASE WHEN A.UTAMA IS NULL THEN (select NAMA from NANO.cufn_pelaporVipUtama(B.UTAMA,B.TANGGAL)) ELSE NRP2.NAMA END AS UTAMA_DESC, 
CASE WHEN A.CADANGAN IS NULL THEN B.CADANGAN ELSE A.CADANGAN END AS CADANGAN, 
CASE WHEN A.CADANGAN IS NULL THEN B.CADANGAN_DESC ELSE NRP1.NAMA END AS CADANGAN_DESC, 
A.ACTUAL, NRP.NAMA AS ACTUAL_DESC, A.KET
FROM         NANO.TBL_T_PELAPOR_VIP AS A LEFT OUTER JOIN
                      NANO.TBL_M_EMPLOYEE_NANO AS NRP2 ON A.UTAMA = NRP2.NRP LEFT OUTER JOIN
                      NANO.TBL_M_EMPLOYEE_NANO AS NRP ON A.ACTUAL = NRP.NRP LEFT OUTER JOIN
                      NANO.TBL_M_EMPLOYEE_NANO AS NRP1 ON A.CADANGAN = NRP1.NRP RIGHT OUTER JOIN
                          (SELECT     F.TANGGAL, G.UTAMA, G.UTAMA_DESC, G.CADANGAN, G.CADANGAN_DESC
                            FROM          NANO.VW_PLAN_PIC AS G INNER JOIN
                                                   NANO.TBL_M_PLAN_VIP AS F ON G.URUTAN = F.URUTAN) AS B 
                                                   ON A.TANGGAL = B.TANGGAL 
             --                                      AND A.UTAMA = B.UTAMA AND 
													--A.CADANGAN = B.CADANGAN
            -- ORDER BY B.TANGGAL DESC

)AS Z
)AS L
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[32] 4[29] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "A"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 215
               Right = 217
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "B"
            Begin Extent = 
               Top = 6
               Left = 255
               Bottom = 157
               Right = 432
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "NRP"
            Begin Extent = 
               Top = 45
               Left = 525
               Bottom = 164
               Right = 696
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'NANO', @level1type=N'VIEW',@level1name=N'VW_PELAPOR_VIP'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'NANO', @level1type=N'VIEW',@level1name=N'VW_PELAPOR_VIP'
GO
/****** Object:  Table [NANO].[TBL_T_NOTULEN_2]    Script Date: 06/05/2018 07:42:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [NANO].[TBL_T_NOTULEN_2](
	[PID_NOTULEN] [varchar](50) NOT NULL,
	[TGL_PLAN] [date] NULL,
	[TGL_ACT] [datetime] NULL,
	[URAIAN] [varchar](5000) NULL,
	[KET] [varchar](50) NULL,
	[CREATE_DATE] [datetime] NULL,
	[CREATE_BY] [varchar](10) NULL,
	[MODIFIED_DATE] [datetime] NULL,
	[MODIFIED_BY] [varchar](10) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [NANO].[TBL_T_NOTULEN_2] ([PID_NOTULEN], [TGL_PLAN], [TGL_ACT], [URAIAN], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY]) VALUES (N'1', CAST(0xC13D0B00 AS Date), CAST(0x0000A86D009C2C88 AS DateTime), N'tes', NULL, CAST(0x0000A86D009C2C88 AS DateTime), N'1234', CAST(0x0000A86D009C2C88 AS DateTime), N'1234')
INSERT [NANO].[TBL_T_NOTULEN_2] ([PID_NOTULEN], [TGL_PLAN], [TGL_ACT], [URAIAN], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY]) VALUES (N'367c882f-a44c-417b-b564-ee44d3f2bbf3', CAST(0x5F3D0B00 AS Date), CAST(0x0000A80400000000 AS DateTime), N'1. Tujuan sharing adalah untuk melatih membiasakan diri memimpin regu/kelompok/organisasi/perusahaan: Satarso A., Sukron, Agus BH.
2. Keputusan, petugas sharing harus berdiri di depan audience, kecuali akhwat yang secara syar''i bukan untuk menjadi tujuan pandangan ikhwan
3. Sharing oleh Annissaa tentang kegiatan Employee Gathering
4. Dibuat sharing harian di WA Group sesuai dengan jadwal di tabel
', NULL, CAST(0x0000A8190095D5F1 AS DateTime), N'2016030', CAST(0x0000A8190095D5F1 AS DateTime), N'2016030')
INSERT [NANO].[TBL_T_NOTULEN_2] ([PID_NOTULEN], [TGL_PLAN], [TGL_ACT], [URAIAN], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY]) VALUES (N'564c81fb-4440-4079-b65d-86cb89a08218', CAST(0x893D0B00 AS Date), CAST(0x0000A82E00000000 AS DateTime), N'# Membahas lebih lanjut apa saja tantangan yang akan diberikan pada saat kegiatan meeting
1.Baca Puisi 1 menit
2.Memberi Nasehat 5 menit
3.Sharing Pekerjaan 15 menit
4.Sharing Pengalaman 15 menit
5.Story Telling non bahasa
6.Memimpin gerakan olahraga selama 5 menit', NULL, CAST(0x0000A82E0094BF38 AS DateTime), N'2017038', CAST(0x0000A82E0094BF38 AS DateTime), N'2017038')
INSERT [NANO].[TBL_T_NOTULEN_2] ([PID_NOTULEN], [TGL_PLAN], [TGL_ACT], [URAIAN], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY]) VALUES (N'56ccad52-38d8-49c9-9adc-1b59d0d20f86', CAST(0x353D0B00 AS Date), CAST(0x0000A7DA00000000 AS DateTime), N'1. Sharing oleh Yaqub tentang manfaat mandi pagi sebelum Shubuh
2. Makan-makanan sehat bersama
3. Diskusi tentang Pengisian Kuestioner, lembar sudah dibagi, sepakat minggu depan dikumpulkan, dan minggu depannya lagi sudah dapat dilihat nilai terkecil dari sel Kita
4. Masukan dari tim: kegiatan/program diutamakan yang menyenangkan dan membuat semangat untuk melakukannya.
', NULL, CAST(0x0000A8190095A846 AS DateTime), N'2016030', CAST(0x0000A8190095A846 AS DateTime), N'2016030')
INSERT [NANO].[TBL_T_NOTULEN_2] ([PID_NOTULEN], [TGL_PLAN], [TGL_ACT], [URAIAN], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY]) VALUES (N'5e54d10e-011a-4f65-bb6f-4762ec7e8177', CAST(0x513D0B00 AS Date), CAST(0x0000A7F600000000 AS DateTime), N'1. Sharing oleh Pak Agus Budi Topik, website sel nano sebagai sebuah bentuk marketing
2. Membahas lebih lanjut tentang penilaian nilai inti
', NULL, CAST(0x0000A8190095C66C AS DateTime), N'2016030', CAST(0x0000A8190095C66C AS DateTime), N'2016030')
INSERT [NANO].[TBL_T_NOTULEN_2] ([PID_NOTULEN], [TGL_PLAN], [TGL_ACT], [URAIAN], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY]) VALUES (N'63f74db7-f1d6-4302-83ea-751ffccdfc6c', CAST(0xB33D0B00 AS Date), CAST(0x0000A85C0093C8A0 AS DateTime), N'1. Menjalankan program TASAKUR untuk yang kedua kalinya serta mereview programnya
2. Brainstorming program untuk diajukan ke GNI
', NULL, CAST(0x0000A85C0093C8A0 AS DateTime), N'2017038', CAST(0x0000A85C0093C8A0 AS DateTime), N'2017038')
INSERT [NANO].[TBL_T_NOTULEN_2] ([PID_NOTULEN], [TGL_PLAN], [TGL_ACT], [URAIAN], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY]) VALUES (N'6caa9f03-0840-40bf-b5d5-44ba5667f54f', CAST(0x7B3D0B00 AS Date), CAST(0x0000A82E00E8F32E AS DateTime), N'# Siap menghadapi setiap tantangan dan mewujudkannya
  ~ Mengumpulkan ide-ide untuk nilai inti diatas
    1. Menunjuk orang untuk melakukan sesuatu
    2. Memberikan poin pada orang yang bisa melakukan tantangan yang diberikan
    3. Tantangan yang diberikan akan didiskusikan lagi', NULL, CAST(0x0000A8200090BEC0 AS DateTime), N'2016030', CAST(0x0000A82E00E8F333 AS DateTime), N'2016030')
INSERT [NANO].[TBL_T_NOTULEN_2] ([PID_NOTULEN], [TGL_PLAN], [TGL_ACT], [URAIAN], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY]) VALUES (N'71db624b-ade0-47ea-bc1b-9ae1f1c403ec', CAST(0x193D0B00 AS Date), CAST(0x0000A7BE00000000 AS DateTime), N'Absensi dibuatkan hard copy sebagai catatan fisik kehadiran
Agenda rutin sel : 
1. Sharing 15 menit pertama
2. Pembahasan program inti sel , sebelumnya masing2 menyampaikan ide untuk program inti dikumpulan dan di review bersama
3. Status Ketua selama 1 periode sel
4. Rencana makan sehat bersama (masing2 membawa makanan )
', NULL, CAST(0x0000A819009568EE AS DateTime), N'2016030', CAST(0x0000A81900959915 AS DateTime), N'2016030')
INSERT [NANO].[TBL_T_NOTULEN_2] ([PID_NOTULEN], [TGL_PLAN], [TGL_ACT], [URAIAN], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY]) VALUES (N'b202a41d-d36f-4c8b-8a7b-3dd7779ecbb1', CAST(0xA53D0B00 AS Date), CAST(0x0000A84A0095DA72 AS DateTime), N'Sudah menjalankan TASAKUR 

#Diskkusi menambahkan Tantangan Spontanitas Terukur : 
1. Menggambar sambil cerita
2. Sharing Makna ayat AlQuran & Hadis
3. Stand up comedy', NULL, CAST(0x0000A84A0095DA72 AS DateTime), N'6113882', CAST(0x0000A84A0095DA72 AS DateTime), N'6113882')
INSERT [NANO].[TBL_T_NOTULEN_2] ([PID_NOTULEN], [TGL_PLAN], [TGL_ACT], [URAIAN], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY]) VALUES (N'c1befa45-8057-4382-bdd5-9754cc927aa0', CAST(0x273D0B00 AS Date), CAST(0x0000A7CC00000000 AS DateTime), N'1. Sharing oleh ABH topik Pengambilan Keputusan
2. Makan sehat bersama dimulai pada pertemuan berikutnya dengan masing-masing membawa makanan sehat secukupnya
3. Kesepakatan petugas VIP, notulen meeting dan sharing
4. Diskusi tentang rencana pengisian Kuestioner Nilai Inti, PIC: ARP&ANR
', NULL, CAST(0x0000A81900958EF0 AS DateTime), N'2016030', CAST(0x0000A81900958EF0 AS DateTime), N'2016030')
INSERT [NANO].[TBL_T_NOTULEN_2] ([PID_NOTULEN], [TGL_PLAN], [TGL_ACT], [URAIAN], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY]) VALUES (N'c4183146-eb2e-44f6-ad7e-4e937ca4b84e', CAST(0x6D3D0B00 AS Date), CAST(0x0000A81200000000 AS DateTime), N'-', NULL, CAST(0x0000A81E00DED6AE AS DateTime), N'2016030', CAST(0x0000A81E00DED6AE AS DateTime), N'2016030')
INSERT [NANO].[TBL_T_NOTULEN_2] ([PID_NOTULEN], [TGL_PLAN], [TGL_ACT], [URAIAN], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY]) VALUES (N'c52cd402-8a16-4210-9592-72fe53f484be', CAST(0x433D0B00 AS Date), CAST(0x0000A7E800000000 AS DateTime), N'1. Minum susu pagi bersama supaya sehat sebelum kerja 
2. Pengumpulan Quistioner Artdit, Yaqub, & Annisaa . Menunggu dari rekan-rekan yang lainnya
3. Sharing oleh Artdit Topik , tips  & trick tentang tanaman
', NULL, CAST(0x0000A8190095B866 AS DateTime), N'2016030', CAST(0x0000A8190095B866 AS DateTime), N'2016030')
INSERT [NANO].[TBL_T_NOTULEN_2] ([PID_NOTULEN], [TGL_PLAN], [TGL_ACT], [URAIAN], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY]) VALUES (N'f20f423d-e087-412c-8d28-faa8b648d21b', CAST(0x973D0B00 AS Date), CAST(0x0000A83B0104D047 AS DateTime), N'# Diskusi program Sel Nano
1. Pemberian nilai => Kesiapan Fisik dan Kesiapan Mental
     => Tingkat kesiapan = hasil kesiapan fisik * hasil kesiapan mental
2. Test Challenge => AGUS BUDI HARTO >>Memimpin Gerakan Olahraga 
                            => YAQUB >> Sharing Pengalaman
3. Pertemuan berikutnya WAJIB melaksanakan program TASAKUR (Tantangan Spontanitas Terukur)', NULL, CAST(0x0000A83B0089E16D AS DateTime), N'2016030', CAST(0x0000A83B0104D047 AS DateTime), N'2016030')
INSERT [NANO].[TBL_T_NOTULEN_2] ([PID_NOTULEN], [TGL_PLAN], [TGL_ACT], [URAIAN], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY]) VALUES (N'fab97fcc-7b65-403a-9fdb-718fa59e5e32', CAST(0xC13D0B00 AS Date), CAST(0x0000A866009C2C88 AS DateTime), N'- Usulan tambahan Chalenge: 
   1. Memberi kritik/masukkan yang positif rekan tim
   2. Meminta masukkan atas masalah yang dihadapi
   3. Memberikan masukkan untuk Sel Nilai Inti NaNo
   4. Menceritakan isi buku yang pernah dibaca
   5. Menceritakan film yang pernah ditonton
   6. Tip & Trik terkait Kesehatan
   7. Tip & Trik terkait Teknis
   8. Tip & Trik terkait Pertanian & Peternakan
   9. Opini tentang Negera & Bangsa
  10. Opini tentang bisnis PAMA
  11. Nyanyi ', NULL, CAST(0x0000A866009BBD57 AS DateTime), N'193078', CAST(0x0000A866009C2C8C AS DateTime), N'193078')
/****** Object:  Table [NANO].[TBL_T_NOTULEN]    Script Date: 06/05/2018 07:42:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [NANO].[TBL_T_NOTULEN](
	[PID_NOTULEN] [varchar](50) NOT NULL,
	[TGL_PLAN] [date] NULL,
	[TGL_ACT] [datetime] NULL,
	[URAIAN] [varchar](5000) NULL,
	[KET] [varchar](50) NULL,
	[CREATE_DATE] [datetime] NULL,
	[CREATE_BY] [varchar](10) NULL,
	[MODIFIED_DATE] [datetime] NULL,
	[MODIFIED_BY] [varchar](10) NULL,
 CONSTRAINT [PK_TBL_T_NOTULEN] PRIMARY KEY CLUSTERED 
(
	[PID_NOTULEN] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [NANO].[TBL_T_NOTULEN] ([PID_NOTULEN], [TGL_PLAN], [TGL_ACT], [URAIAN], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY]) VALUES (N'0ad99807-9473-4a54-b864-482f9755e7fb', CAST(0x153E0B00 AS Date), CAST(0x0000A8BA0089EB3E AS DateTime), N'- Review singkat mengenai risalah yang telah dibuat dan dikirimkan untuk GNI
- Diskusi masalah-masalah yang terdapat dalam pelaksanaan nilai inti', NULL, CAST(0x0000A8BA0089EB3E AS DateTime), N'2017038', CAST(0x0000A8BA0089EB3E AS DateTime), N'2017038')
INSERT [NANO].[TBL_T_NOTULEN] ([PID_NOTULEN], [TGL_PLAN], [TGL_ACT], [URAIAN], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY]) VALUES (N'233176a5-38dd-49cb-8e98-4bb9755d9c26', CAST(0x233E0B00 AS Date), CAST(0x0000A8C800000000 AS DateTime), N'Review hasil acara GNI
1. Jika hasilnya bagus, maka harus mempersiapkan yel-yel, tetapi jika tidak berhasil maka harus mempersiapkan project berikut.
2. Sebelum pelaksanaan kita harus mempersiapkan lebih baik materinya ( secara personal)
3. Sharing dari Pak Agus Budi "Project berikutnya"', NULL, CAST(0x0000A8C800AC8F55 AS DateTime), N'193078', CAST(0x0000A8C800AC8F55 AS DateTime), N'193078')
INSERT [NANO].[TBL_T_NOTULEN] ([PID_NOTULEN], [TGL_PLAN], [TGL_ACT], [URAIAN], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY]) VALUES (N'26d89a1a-e7a5-4a0f-98af-cbd52cadfa9c', CAST(0x313E0B00 AS Date), CAST(0x0000A8D600000000 AS DateTime), N'Persiapan lomba Gebyar Nilai Inti (GNI) tanggal 8 Mei 2018:
1. Revisi Risalah
2. Revisi Presentasi
3. Pembuatan Yel2
', NULL, CAST(0x0000A8D600B5C970 AS DateTime), N'6107067', CAST(0x0000A8D600B5C970 AS DateTime), N'6107067')
INSERT [NANO].[TBL_T_NOTULEN] ([PID_NOTULEN], [TGL_PLAN], [TGL_ACT], [URAIAN], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY]) VALUES (N'367c882f-a44c-417b-b564-ee44d3f2bbf3', CAST(0x5F3D0B00 AS Date), CAST(0x0000A80400000000 AS DateTime), N'1. Tujuan sharing adalah untuk melatih membiasakan diri memimpin regu/kelompok/organisasi/perusahaan: Satarso A., Sukron, Agus BH.
2. Keputusan, petugas sharing harus berdiri di depan audience, kecuali akhwat yang secara syar''i bukan untuk menjadi tujuan pandangan ikhwan
3. Sharing oleh Annissaa tentang kegiatan Employee Gathering
4. Dibuat sharing harian di WA Group sesuai dengan jadwal di tabel
', NULL, CAST(0x0000A8190095D5F1 AS DateTime), N'2016030', CAST(0x0000A8190095D5F1 AS DateTime), N'2016030')
INSERT [NANO].[TBL_T_NOTULEN] ([PID_NOTULEN], [TGL_PLAN], [TGL_ACT], [URAIAN], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY]) VALUES (N'564c81fb-4440-4079-b65d-86cb89a08218', CAST(0x893D0B00 AS Date), CAST(0x0000A82E00000000 AS DateTime), N'# Membahas lebih lanjut apa saja tantangan yang akan diberikan pada saat kegiatan meeting
1.Baca Puisi 1 menit
2.Memberi Nasehat 5 menit
3.Sharing Pekerjaan 15 menit
4.Sharing Pengalaman 15 menit
5.Story Telling non bahasa
6.Memimpin gerakan olahraga selama 5 menit', NULL, CAST(0x0000A82E0094BF38 AS DateTime), N'2017038', CAST(0x0000A82E0094BF38 AS DateTime), N'2017038')
INSERT [NANO].[TBL_T_NOTULEN] ([PID_NOTULEN], [TGL_PLAN], [TGL_ACT], [URAIAN], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY]) VALUES (N'56ccad52-38d8-49c9-9adc-1b59d0d20f86', CAST(0x353D0B00 AS Date), CAST(0x0000A7DA00000000 AS DateTime), N'1. Sharing oleh Yaqub tentang manfaat mandi pagi sebelum Shubuh
2. Makan-makanan sehat bersama
3. Diskusi tentang Pengisian Kuestioner, lembar sudah dibagi, sepakat minggu depan dikumpulkan, dan minggu depannya lagi sudah dapat dilihat nilai terkecil dari sel Kita
4. Masukan dari tim: kegiatan/program diutamakan yang menyenangkan dan membuat semangat untuk melakukannya.
', NULL, CAST(0x0000A8190095A846 AS DateTime), N'2016030', CAST(0x0000A8190095A846 AS DateTime), N'2016030')
INSERT [NANO].[TBL_T_NOTULEN] ([PID_NOTULEN], [TGL_PLAN], [TGL_ACT], [URAIAN], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY]) VALUES (N'57ce4fdf-1c84-4fd7-92d5-5b1de0242814', CAST(0x3F3E0B00 AS Date), CAST(0x0000A8E400AC5AC5 AS DateTime), N'# Diskusi program selanjutnya
Kategori :
1. K3LH
2. Positif Environment
3. Produktifitas
4. Company image
5. Togetherness

--> Usulan Kegiatan
1. Cara menurunkan Kolesterol
2. Smart Watch
3. Mengembangkan program TASAKUR
4. Ucapan TERIMAKASIH
5. Ucapan Salam
6. Menyebut nama Orang
7. Pendengar yang baik
8. Semangat Berangkat Kerja
9. Naik Tangga
', NULL, CAST(0x0000A8E400941FC5 AS DateTime), N'2016030', CAST(0x0000A8E400AC5AC5 AS DateTime), N'2016030')
INSERT [NANO].[TBL_T_NOTULEN] ([PID_NOTULEN], [TGL_PLAN], [TGL_ACT], [URAIAN], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY]) VALUES (N'5e54d10e-011a-4f65-bb6f-4762ec7e8177', CAST(0x513D0B00 AS Date), CAST(0x0000A7F600000000 AS DateTime), N'1. Sharing oleh Pak Agus Budi Topik, website sel nano sebagai sebuah bentuk marketing
2. Membahas lebih lanjut tentang penilaian nilai inti
', NULL, CAST(0x0000A8190095C66C AS DateTime), N'2016030', CAST(0x0000A8190095C66C AS DateTime), N'2016030')
INSERT [NANO].[TBL_T_NOTULEN] ([PID_NOTULEN], [TGL_PLAN], [TGL_ACT], [URAIAN], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY]) VALUES (N'63f74db7-f1d6-4302-83ea-751ffccdfc6c', CAST(0xB33D0B00 AS Date), CAST(0x0000A85C0093C8A0 AS DateTime), N'1. Menjalankan program TASAKUR untuk yang kedua kalinya serta mereview programnya
2. Brainstorming program untuk diajukan ke GNI
', NULL, CAST(0x0000A85C0093C8A0 AS DateTime), N'2017038', CAST(0x0000A85C0093C8A0 AS DateTime), N'2017038')
INSERT [NANO].[TBL_T_NOTULEN] ([PID_NOTULEN], [TGL_PLAN], [TGL_ACT], [URAIAN], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY]) VALUES (N'6caa9f03-0840-40bf-b5d5-44ba5667f54f', CAST(0x7B3D0B00 AS Date), CAST(0x0000A82E00E8F32E AS DateTime), N'# Siap menghadapi setiap tantangan dan mewujudkannya
  ~ Mengumpulkan ide-ide untuk nilai inti diatas
    1. Menunjuk orang untuk melakukan sesuatu
    2. Memberikan poin pada orang yang bisa melakukan tantangan yang diberikan
    3. Tantangan yang diberikan akan didiskusikan lagi', NULL, CAST(0x0000A8200090BEC0 AS DateTime), N'2016030', CAST(0x0000A82E00E8F333 AS DateTime), N'2016030')
INSERT [NANO].[TBL_T_NOTULEN] ([PID_NOTULEN], [TGL_PLAN], [TGL_ACT], [URAIAN], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY]) VALUES (N'71db624b-ade0-47ea-bc1b-9ae1f1c403ec', CAST(0x193D0B00 AS Date), CAST(0x0000A7BE00000000 AS DateTime), N'Absensi dibuatkan hard copy sebagai catatan fisik kehadiran
Agenda rutin sel : 
1. Sharing 15 menit pertama
2. Pembahasan program inti sel , sebelumnya masing2 menyampaikan ide untuk program inti dikumpulan dan di review bersama
3. Status Ketua selama 1 periode sel
4. Rencana makan sehat bersama (masing2 membawa makanan )
', NULL, CAST(0x0000A819009568EE AS DateTime), N'2016030', CAST(0x0000A81900959915 AS DateTime), N'2016030')
INSERT [NANO].[TBL_T_NOTULEN] ([PID_NOTULEN], [TGL_PLAN], [TGL_ACT], [URAIAN], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY]) VALUES (N'7d6dd2a1-dc3b-4a2f-be59-e29dea4ab808', CAST(0xDD3D0B00 AS Date), CAST(0x0000A88200950083 AS DateTime), N'Memberikan leveling pada challange
1. mudah
2. sedang
3. susah
', NULL, CAST(0x0000A88200950083 AS DateTime), N'2016030', CAST(0x0000A88200950083 AS DateTime), N'2016030')
INSERT [NANO].[TBL_T_NOTULEN] ([PID_NOTULEN], [TGL_PLAN], [TGL_ACT], [URAIAN], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY]) VALUES (N'83b4f691-86d3-44b7-983c-879cdc80c3d8', CAST(0x073E0B00 AS Date), CAST(0x0000A8B000F443AD AS DateTime), N'#Menyiapkan data pendukung untuk risalah yang diajukan ke GNI
- Membuat contoh timeframe
- Menyiapkan data hasil Challenge', NULL, CAST(0x0000A8B000F443AD AS DateTime), N'2017038', CAST(0x0000A8B000F443AD AS DateTime), N'2017038')
INSERT [NANO].[TBL_T_NOTULEN] ([PID_NOTULEN], [TGL_PLAN], [TGL_ACT], [URAIAN], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY]) VALUES (N'b202a41d-d36f-4c8b-8a7b-3dd7779ecbb1', CAST(0xA53D0B00 AS Date), CAST(0x0000A84A0095DA72 AS DateTime), N'Sudah menjalankan TASAKUR 

#Diskkusi menambahkan Tantangan Spontanitas Terukur : 
1. Menggambar sambil cerita
2. Sharing Makna ayat AlQuran & Hadis
3. Stand up comedy', NULL, CAST(0x0000A84A0095DA72 AS DateTime), N'6113882', CAST(0x0000A84A0095DA72 AS DateTime), N'6113882')
INSERT [NANO].[TBL_T_NOTULEN] ([PID_NOTULEN], [TGL_PLAN], [TGL_ACT], [URAIAN], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY]) VALUES (N'c1befa45-8057-4382-bdd5-9754cc927aa0', CAST(0x273D0B00 AS Date), CAST(0x0000A7CC00000000 AS DateTime), N'1. Sharing oleh ABH topik Pengambilan Keputusan
2. Makan sehat bersama dimulai pada pertemuan berikutnya dengan masing-masing membawa makanan sehat secukupnya
3. Kesepakatan petugas VIP, notulen meeting dan sharing
4. Diskusi tentang rencana pengisian Kuestioner Nilai Inti, PIC: ARP&ANR
', NULL, CAST(0x0000A81900958EF0 AS DateTime), N'2016030', CAST(0x0000A81900958EF0 AS DateTime), N'2016030')
INSERT [NANO].[TBL_T_NOTULEN] ([PID_NOTULEN], [TGL_PLAN], [TGL_ACT], [URAIAN], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY]) VALUES (N'c3d632b0-d069-45a9-b578-c70d74313748', CAST(0xCF3D0B00 AS Date), CAST(0x0000A87400951F8B AS DateTime), N'Usulan TASAKUR :
A. Menghilangkan item TASAKUR dari challenge , jika sudah sering keluar dan selalu berhasil 
B. Melisting peringkat item-item TASAKUR yang akan di diskusikan oleh Team Sel NANO
1. Listing Level Beginners 
2. Listing Level Intermediate
3. Listing Level Advance', NULL, CAST(0x0000A87400951F8B AS DateTime), N'6113882', CAST(0x0000A87400951F8B AS DateTime), N'6113882')
INSERT [NANO].[TBL_T_NOTULEN] ([PID_NOTULEN], [TGL_PLAN], [TGL_ACT], [URAIAN], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY]) VALUES (N'c4183146-eb2e-44f6-ad7e-4e937ca4b84e', CAST(0x6D3D0B00 AS Date), CAST(0x0000A81200000000 AS DateTime), N'-', NULL, CAST(0x0000A81E00DED6AE AS DateTime), N'2016030', CAST(0x0000A81E00DED6AE AS DateTime), N'2016030')
INSERT [NANO].[TBL_T_NOTULEN] ([PID_NOTULEN], [TGL_PLAN], [TGL_ACT], [URAIAN], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY]) VALUES (N'c52cd402-8a16-4210-9592-72fe53f484be', CAST(0x433D0B00 AS Date), CAST(0x0000A7E800000000 AS DateTime), N'1. Minum susu pagi bersama supaya sehat sebelum kerja 
2. Pengumpulan Quistioner Artdit, Yaqub, & Annisaa . Menunggu dari rekan-rekan yang lainnya
3. Sharing oleh Artdit Topik , tips  & trick tentang tanaman
', NULL, CAST(0x0000A8190095B866 AS DateTime), N'2016030', CAST(0x0000A8190095B866 AS DateTime), N'2016030')
INSERT [NANO].[TBL_T_NOTULEN] ([PID_NOTULEN], [TGL_PLAN], [TGL_ACT], [URAIAN], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY]) VALUES (N'dd556882-1943-4afd-86e2-31b2885b5bb1', CAST(0xEB3D0B00 AS Date), CAST(0x0000A8900096F87F AS DateTime), N'Menentukan cara sampling data baru dengan aplikasi ''Zelo''', NULL, CAST(0x0000A8900096F87F AS DateTime), N'2017038', CAST(0x0000A8900096F87F AS DateTime), N'2017038')
INSERT [NANO].[TBL_T_NOTULEN] ([PID_NOTULEN], [TGL_PLAN], [TGL_ACT], [URAIAN], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY]) VALUES (N'f20f423d-e087-412c-8d28-faa8b648d21b', CAST(0x973D0B00 AS Date), CAST(0x0000A83B0104D047 AS DateTime), N'# Diskusi program Sel Nano
1. Pemberian nilai => Kesiapan Fisik dan Kesiapan Mental
     => Tingkat kesiapan = hasil kesiapan fisik * hasil kesiapan mental
2. Test Challenge => AGUS BUDI HARTO >>Memimpin Gerakan Olahraga 
                            => YAQUB >> Sharing Pengalaman
3. Pertemuan berikutnya WAJIB melaksanakan program TASAKUR (Tantangan Spontanitas Terukur)', NULL, CAST(0x0000A83B0089E16D AS DateTime), N'2016030', CAST(0x0000A83B0104D047 AS DateTime), N'2016030')
INSERT [NANO].[TBL_T_NOTULEN] ([PID_NOTULEN], [TGL_PLAN], [TGL_ACT], [URAIAN], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY]) VALUES (N'fab97fcc-7b65-403a-9fdb-718fa59e5e32', CAST(0xC13D0B00 AS Date), CAST(0x0000A866009C2C88 AS DateTime), N'- Usulan tambahan Chalenge: 
   1. Memberi kritik/masukkan yang positif rekan tim
   2. Meminta masukkan atas masalah yang dihadapi
   3. Memberikan masukkan untuk Sel Nilai Inti NaNo
   4. Menceritakan isi buku yang pernah dibaca
   5. Menceritakan film yang pernah ditonton
   6. Tip & Trik terkait Kesehatan
   7. Tip & Trik terkait Teknis
   8. Tip & Trik terkait Pertanian & Peternakan
   9. Opini tentang Negera & Bangsa
  10. Opini tentang bisnis PAMA
  11. Nyanyi ', NULL, CAST(0x0000A866009BBD57 AS DateTime), N'193078', CAST(0x0000A866009C2C8C AS DateTime), N'193078')
/****** Object:  Table [NANO].[TBL_T_KEHADIRAN_MEETING_2]    Script Date: 06/05/2018 07:42:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [NANO].[TBL_T_KEHADIRAN_MEETING_2](
	[PID_KEHADIRAN] [varchar](50) NOT NULL,
	[TGL_PLAN] [date] NULL,
	[TGL_ACT] [date] NULL,
	[NRP] [varchar](10) NULL,
	[NAMA] [varchar](100) NULL,
	[KEHADIRAN] [varchar](1) NULL,
	[KEHADIRAN_DESC] [varchar](50) NULL,
	[KET] [varchar](100) NULL,
	[CREATE_DATE] [datetime] NULL,
	[CREATE_BY] [varchar](10) NULL,
	[MODIFIED_DATE] [datetime] NULL,
	[MODIFIED_BY] [varchar](10) NULL,
	[PID_PLAN_K_MEETING] [varchar](50) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [NANO].[TBL_T_KEHADIRAN_MEETING_2] ([PID_KEHADIRAN], [TGL_PLAN], [TGL_ACT], [NRP], [NAMA], [KEHADIRAN], [KEHADIRAN_DESC], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY], [PID_PLAN_K_MEETING]) VALUES (N'00a164eb-7dc8-4e43-8802-067558f448c0', CAST(0xCF3D0B00 AS Date), CAST(0xCF3D0B00 AS Date), N'193078', N'SUKRON', N'1', N'HADIR', NULL, CAST(0x0000A874008B8B5D AS DateTime), N'6113882', CAST(0x0000A874008B8B5D AS DateTime), N'6113882', NULL)
INSERT [NANO].[TBL_T_KEHADIRAN_MEETING_2] ([PID_KEHADIRAN], [TGL_PLAN], [TGL_ACT], [NRP], [NAMA], [KEHADIRAN], [KEHADIRAN_DESC], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY], [PID_PLAN_K_MEETING]) VALUES (N'469c34c1-149e-45ce-9161-7e25305c5c0d', CAST(0xCF3D0B00 AS Date), CAST(0xCF3D0B00 AS Date), N'1708040', N'CASMITA', N'5', N'TRAINING', NULL, CAST(0x0000A874008B8B54 AS DateTime), N'6113882', CAST(0x0000A874008B8B54 AS DateTime), N'6113882', NULL)
INSERT [NANO].[TBL_T_KEHADIRAN_MEETING_2] ([PID_KEHADIRAN], [TGL_PLAN], [TGL_ACT], [NRP], [NAMA], [KEHADIRAN], [KEHADIRAN_DESC], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY], [PID_PLAN_K_MEETING]) VALUES (N'951f43f2-1fc8-4b98-af58-956ffd7fb318', CAST(0xCF3D0B00 AS Date), CAST(0xCF3D0B00 AS Date), N'2016030', N'YAQUB EDY SUSILO', N'1', N'HADIR', NULL, CAST(0x0000A874008B8B5D AS DateTime), N'6113882', CAST(0x0000A874008B8B5D AS DateTime), N'6113882', NULL)
INSERT [NANO].[TBL_T_KEHADIRAN_MEETING_2] ([PID_KEHADIRAN], [TGL_PLAN], [TGL_ACT], [NRP], [NAMA], [KEHADIRAN], [KEHADIRAN_DESC], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY], [PID_PLAN_K_MEETING]) VALUES (N'cdc94976-cf89-4218-badb-0bf8148daec8', CAST(0xCF3D0B00 AS Date), CAST(0xCF3D0B00 AS Date), N'6196076', N'SATARSO AGUS TJAHJONO', N'4', N'DINAS KE SITE', NULL, CAST(0x0000A874008B8B5D AS DateTime), N'6113882', CAST(0x0000A874008B8B5D AS DateTime), N'6113882', NULL)
INSERT [NANO].[TBL_T_KEHADIRAN_MEETING_2] ([PID_KEHADIRAN], [TGL_PLAN], [TGL_ACT], [NRP], [NAMA], [KEHADIRAN], [KEHADIRAN_DESC], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY], [PID_PLAN_K_MEETING]) VALUES (N'c301cfaf-52f8-4b63-9853-61e57b7c5779', CAST(0xCF3D0B00 AS Date), CAST(0xCF3D0B00 AS Date), N'2017038', N'ANNISAA RAHMAYANI NURFAJAR', N'1', N'HADIR', NULL, CAST(0x0000A874008B8B58 AS DateTime), N'6113882', CAST(0x0000A874008B8B58 AS DateTime), N'6113882', NULL)
INSERT [NANO].[TBL_T_KEHADIRAN_MEETING_2] ([PID_KEHADIRAN], [TGL_PLAN], [TGL_ACT], [NRP], [NAMA], [KEHADIRAN], [KEHADIRAN_DESC], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY], [PID_PLAN_K_MEETING]) VALUES (N'f92a81fd-ff72-4416-8537-08c06dfa0951', CAST(0xCF3D0B00 AS Date), CAST(0xCF3D0B00 AS Date), N'6113882', N'ARTDITYO PRIAMBODHO', N'1', N'HADIR', NULL, CAST(0x0000A874008B8B58 AS DateTime), N'6113882', CAST(0x0000A874008B8B58 AS DateTime), N'6113882', NULL)
INSERT [NANO].[TBL_T_KEHADIRAN_MEETING_2] ([PID_KEHADIRAN], [TGL_PLAN], [TGL_ACT], [NRP], [NAMA], [KEHADIRAN], [KEHADIRAN_DESC], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY], [PID_PLAN_K_MEETING]) VALUES (N'fd002171-830e-4c27-888a-517f1c7d7180', CAST(0xCF3D0B00 AS Date), CAST(0xCF3D0B00 AS Date), N'6107067', N'AGUS BUDI HARTO', N'4', N'DINAS KE SITE', NULL, CAST(0x0000A874008B8B58 AS DateTime), N'6113882', CAST(0x0000A874008B8B58 AS DateTime), N'6113882', NULL)
INSERT [NANO].[TBL_T_KEHADIRAN_MEETING_2] ([PID_KEHADIRAN], [TGL_PLAN], [TGL_ACT], [NRP], [NAMA], [KEHADIRAN], [KEHADIRAN_DESC], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY], [PID_PLAN_K_MEETING]) VALUES (N'fbad3634-476e-4f13-8f14-75582168499f', CAST(0xC13D0B00 AS Date), CAST(0xC13D0B00 AS Date), N'1708040', N'CASMITA', N'1', N'HADIR', NULL, CAST(0x0000A866008E3952 AS DateTime), N'193078', CAST(0x0000A866008E3952 AS DateTime), N'193078', NULL)
INSERT [NANO].[TBL_T_KEHADIRAN_MEETING_2] ([PID_KEHADIRAN], [TGL_PLAN], [TGL_ACT], [NRP], [NAMA], [KEHADIRAN], [KEHADIRAN_DESC], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY], [PID_PLAN_K_MEETING]) VALUES (N'ef1342f4-849e-46c4-9976-d95552f2160f', CAST(0xC13D0B00 AS Date), CAST(0xC13D0B00 AS Date), N'6196076', N'SATARSO AGUS TJAHJONO', N'1', N'HADIR', NULL, CAST(0x0000A866008E39FB AS DateTime), N'193078', CAST(0x0000A866008E39FB AS DateTime), N'193078', NULL)
INSERT [NANO].[TBL_T_KEHADIRAN_MEETING_2] ([PID_KEHADIRAN], [TGL_PLAN], [TGL_ACT], [NRP], [NAMA], [KEHADIRAN], [KEHADIRAN_DESC], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY], [PID_PLAN_K_MEETING]) VALUES (N'db95eae5-c89d-4e16-b097-072848f806b5', CAST(0xC13D0B00 AS Date), CAST(0xC13D0B00 AS Date), N'193078', N'SUKRON', N'1', N'HADIR', NULL, CAST(0x0000A866008E39FF AS DateTime), N'193078', CAST(0x0000A866008E39FF AS DateTime), N'193078', NULL)
INSERT [NANO].[TBL_T_KEHADIRAN_MEETING_2] ([PID_KEHADIRAN], [TGL_PLAN], [TGL_ACT], [NRP], [NAMA], [KEHADIRAN], [KEHADIRAN_DESC], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY], [PID_PLAN_K_MEETING]) VALUES (N'822356fa-83ec-437f-a28f-ab77594a08fd', CAST(0xC13D0B00 AS Date), CAST(0xC13D0B00 AS Date), N'2016030', N'YAQUB EDY SUSILO', N'1', N'HADIR', NULL, CAST(0x0000A866008E3981 AS DateTime), N'193078', CAST(0x0000A866008E3981 AS DateTime), N'193078', NULL)
INSERT [NANO].[TBL_T_KEHADIRAN_MEETING_2] ([PID_KEHADIRAN], [TGL_PLAN], [TGL_ACT], [NRP], [NAMA], [KEHADIRAN], [KEHADIRAN_DESC], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY], [PID_PLAN_K_MEETING]) VALUES (N'a29b727b-b0c8-4cd9-a0bb-1bff7ef148d5', CAST(0xC13D0B00 AS Date), CAST(0xC13D0B00 AS Date), N'6107067', N'AGUS BUDI HARTO', N'1', N'HADIR', NULL, CAST(0x0000A866008E3998 AS DateTime), N'193078', CAST(0x0000A866008E3998 AS DateTime), N'193078', NULL)
INSERT [NANO].[TBL_T_KEHADIRAN_MEETING_2] ([PID_KEHADIRAN], [TGL_PLAN], [TGL_ACT], [NRP], [NAMA], [KEHADIRAN], [KEHADIRAN_DESC], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY], [PID_PLAN_K_MEETING]) VALUES (N'0c6e1658-4de7-4a1a-9538-b45c74277a85', CAST(0xC13D0B00 AS Date), CAST(0xC13D0B00 AS Date), N'6113882', N'ARTDITYO PRIAMBODHO', N'1', N'HADIR', NULL, CAST(0x0000A866008E398F AS DateTime), N'193078', CAST(0x0000A866008E398F AS DateTime), N'193078', NULL)
INSERT [NANO].[TBL_T_KEHADIRAN_MEETING_2] ([PID_KEHADIRAN], [TGL_PLAN], [TGL_ACT], [NRP], [NAMA], [KEHADIRAN], [KEHADIRAN_DESC], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY], [PID_PLAN_K_MEETING]) VALUES (N'2365ec59-e0c0-4dc2-81a0-44933f584047', CAST(0xC13D0B00 AS Date), CAST(0xC13D0B00 AS Date), N'2017038', N'ANNISAA RAHMAYANI NURFAJAR', N'1', N'HADIR', NULL, CAST(0x0000A866008E3978 AS DateTime), N'193078', CAST(0x0000A866008E3978 AS DateTime), N'193078', NULL)
INSERT [NANO].[TBL_T_KEHADIRAN_MEETING_2] ([PID_KEHADIRAN], [TGL_PLAN], [TGL_ACT], [NRP], [NAMA], [KEHADIRAN], [KEHADIRAN_DESC], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY], [PID_PLAN_K_MEETING]) VALUES (N'2d2a8aeb-d846-4cac-9e48-e25482d64bc9', CAST(0xB33D0B00 AS Date), CAST(0xB73D0B00 AS Date), N'193078', N'SUKRON', N'1', N'HADIR', NULL, CAST(0x0000A85C00872AFE AS DateTime), N'2017038', CAST(0x0000A85C00872AFE AS DateTime), N'2017038', NULL)
INSERT [NANO].[TBL_T_KEHADIRAN_MEETING_2] ([PID_KEHADIRAN], [TGL_PLAN], [TGL_ACT], [NRP], [NAMA], [KEHADIRAN], [KEHADIRAN_DESC], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY], [PID_PLAN_K_MEETING]) VALUES (N'46adf240-bf14-4386-82f8-8a6918674466', CAST(0xB33D0B00 AS Date), CAST(0xB73D0B00 AS Date), N'6107067', N'AGUS BUDI HARTO', N'1', N'HADIR', NULL, CAST(0x0000A85C00872AE7 AS DateTime), N'2017038', CAST(0x0000A85C00872AE7 AS DateTime), N'2017038', NULL)
INSERT [NANO].[TBL_T_KEHADIRAN_MEETING_2] ([PID_KEHADIRAN], [TGL_PLAN], [TGL_ACT], [NRP], [NAMA], [KEHADIRAN], [KEHADIRAN_DESC], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY], [PID_PLAN_K_MEETING]) VALUES (N'4ed6106b-a624-4741-b9e4-6edf597a0ec4', CAST(0xB33D0B00 AS Date), CAST(0xB73D0B00 AS Date), N'6113882', N'ARTDITYO PRIAMBODHO', N'1', N'HADIR', NULL, CAST(0x0000A85C00872AEB AS DateTime), N'2017038', CAST(0x0000A85C00872AEB AS DateTime), N'2017038', NULL)
INSERT [NANO].[TBL_T_KEHADIRAN_MEETING_2] ([PID_KEHADIRAN], [TGL_PLAN], [TGL_ACT], [NRP], [NAMA], [KEHADIRAN], [KEHADIRAN_DESC], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY], [PID_PLAN_K_MEETING]) VALUES (N'467c4019-1153-4424-8575-75583ff5576f', CAST(0xB33D0B00 AS Date), CAST(0xB73D0B00 AS Date), N'2016030', N'YAQUB EDY SUSILO', N'1', N'HADIR', NULL, CAST(0x0000A85C00872AB8 AS DateTime), N'2017038', CAST(0x0000A85C00872AB8 AS DateTime), N'2017038', NULL)
INSERT [NANO].[TBL_T_KEHADIRAN_MEETING_2] ([PID_KEHADIRAN], [TGL_PLAN], [TGL_ACT], [NRP], [NAMA], [KEHADIRAN], [KEHADIRAN_DESC], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY], [PID_PLAN_K_MEETING]) VALUES (N'810167dc-dfce-4e21-81af-c5efb2fa70ea', CAST(0xB33D0B00 AS Date), CAST(0xB73D0B00 AS Date), N'6196076', N'SATARSO AGUS TJAHJONO', N'8', N'CUTI', NULL, CAST(0x0000A85C00872AF9 AS DateTime), N'2017038', CAST(0x0000A85C00872AF9 AS DateTime), N'2017038', NULL)
INSERT [NANO].[TBL_T_KEHADIRAN_MEETING_2] ([PID_KEHADIRAN], [TGL_PLAN], [TGL_ACT], [NRP], [NAMA], [KEHADIRAN], [KEHADIRAN_DESC], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY], [PID_PLAN_K_MEETING]) VALUES (N'916e357c-f05c-42c0-a28e-d257e2f12f38', CAST(0xB33D0B00 AS Date), CAST(0xB73D0B00 AS Date), N'2017038', N'ANNISAA RAHMAYANI NURFAJAR', N'1', N'HADIR', NULL, CAST(0x0000A85C00872AB3 AS DateTime), N'2017038', CAST(0x0000A85C00872AB3 AS DateTime), N'2017038', NULL)
INSERT [NANO].[TBL_T_KEHADIRAN_MEETING_2] ([PID_KEHADIRAN], [TGL_PLAN], [TGL_ACT], [NRP], [NAMA], [KEHADIRAN], [KEHADIRAN_DESC], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY], [PID_PLAN_K_MEETING]) VALUES (N'fcf0eeb2-e69b-4b44-9f73-a1705be72919', CAST(0xB33D0B00 AS Date), CAST(0xB73D0B00 AS Date), N'1708040', N'CASMITA', N'1', N'HADIR', NULL, CAST(0x0000A85C00872AA5 AS DateTime), N'2017038', CAST(0x0000A85C00872AA5 AS DateTime), N'2017038', NULL)
INSERT [NANO].[TBL_T_KEHADIRAN_MEETING_2] ([PID_KEHADIRAN], [TGL_PLAN], [TGL_ACT], [NRP], [NAMA], [KEHADIRAN], [KEHADIRAN_DESC], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY], [PID_PLAN_K_MEETING]) VALUES (N'f590b236-d6cd-42ee-b002-e463c9d51169', CAST(0xA53D0B00 AS Date), CAST(0xA53D0B00 AS Date), N'6113882', N'ARTDITYO PRIAMBODHO', N'1', N'HADIR', NULL, CAST(0x0000A84A0097AD8D AS DateTime), N'6113882', CAST(0x0000A84D00937281 AS DateTime), N'6113882', NULL)
INSERT [NANO].[TBL_T_KEHADIRAN_MEETING_2] ([PID_KEHADIRAN], [TGL_PLAN], [TGL_ACT], [NRP], [NAMA], [KEHADIRAN], [KEHADIRAN_DESC], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY], [PID_PLAN_K_MEETING]) VALUES (N'a1b9216e-e659-4453-847c-3b9303951b22', CAST(0xA53D0B00 AS Date), CAST(0xA53D0B00 AS Date), N'2016030', N'YAQUB EDY SUSILO', N'1', N'HADIR', NULL, CAST(0x0000A84A0097AD88 AS DateTime), N'6113882', CAST(0x0000A84D00937286 AS DateTime), N'6113882', NULL)
INSERT [NANO].[TBL_T_KEHADIRAN_MEETING_2] ([PID_KEHADIRAN], [TGL_PLAN], [TGL_ACT], [NRP], [NAMA], [KEHADIRAN], [KEHADIRAN_DESC], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY], [PID_PLAN_K_MEETING]) VALUES (N'a7e0a4e8-e418-487d-952a-1a7180c27684', CAST(0xA53D0B00 AS Date), CAST(0xA53D0B00 AS Date), N'193078', N'SUKRON', N'1', N'HADIR', NULL, CAST(0x0000A84A0097AD8D AS DateTime), N'6113882', CAST(0x0000A84D0093728F AS DateTime), N'6113882', NULL)
INSERT [NANO].[TBL_T_KEHADIRAN_MEETING_2] ([PID_KEHADIRAN], [TGL_PLAN], [TGL_ACT], [NRP], [NAMA], [KEHADIRAN], [KEHADIRAN_DESC], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY], [PID_PLAN_K_MEETING]) VALUES (N'a81b5792-4b67-4e4a-9d54-92e70c2d86f5', CAST(0xA53D0B00 AS Date), CAST(0xA53D0B00 AS Date), N'6196076', N'SATARSO AGUS TJAHJONO', N'1', N'HADIR', NULL, CAST(0x0000A84A0097AD8D AS DateTime), N'6113882', CAST(0x0000A84D0093728F AS DateTime), N'6113882', NULL)
INSERT [NANO].[TBL_T_KEHADIRAN_MEETING_2] ([PID_KEHADIRAN], [TGL_PLAN], [TGL_ACT], [NRP], [NAMA], [KEHADIRAN], [KEHADIRAN_DESC], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY], [PID_PLAN_K_MEETING]) VALUES (N'c3f7efcf-487c-4147-bedf-7cacef47136e', CAST(0xA53D0B00 AS Date), CAST(0xA53D0B00 AS Date), N'2017038', N'ANNISAA RAHMAYANI NURFAJAR', N'1', N'HADIR', NULL, CAST(0x0000A84A0097AD88 AS DateTime), N'6113882', CAST(0x0000A84D0093726A AS DateTime), N'6113882', NULL)
INSERT [NANO].[TBL_T_KEHADIRAN_MEETING_2] ([PID_KEHADIRAN], [TGL_PLAN], [TGL_ACT], [NRP], [NAMA], [KEHADIRAN], [KEHADIRAN_DESC], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY], [PID_PLAN_K_MEETING]) VALUES (N'c4696cf4-b1c2-49a0-b485-d3d537b315ff', CAST(0xA53D0B00 AS Date), CAST(0xA83D0B00 AS Date), N'1708040', N'CASMITA', N'1', N'HADIR', NULL, CAST(0x0000A84D00937294 AS DateTime), N'6113882', CAST(0x0000A84D00937294 AS DateTime), N'6113882', NULL)
INSERT [NANO].[TBL_T_KEHADIRAN_MEETING_2] ([PID_KEHADIRAN], [TGL_PLAN], [TGL_ACT], [NRP], [NAMA], [KEHADIRAN], [KEHADIRAN_DESC], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY], [PID_PLAN_K_MEETING]) VALUES (N'300e31ad-894b-4045-94ac-152fb30ccadf', CAST(0xA53D0B00 AS Date), CAST(0xA53D0B00 AS Date), N'0001', N'CASMITA', N'1', N'HADIR', NULL, CAST(0x0000A84A0097AD92 AS DateTime), N'6113882', CAST(0x0000A84A0097AD92 AS DateTime), N'6113882', NULL)
INSERT [NANO].[TBL_T_KEHADIRAN_MEETING_2] ([PID_KEHADIRAN], [TGL_PLAN], [TGL_ACT], [NRP], [NAMA], [KEHADIRAN], [KEHADIRAN_DESC], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY], [PID_PLAN_K_MEETING]) VALUES (N'3b0c5ebf-0e44-4191-8be8-0853d336f898', CAST(0xA53D0B00 AS Date), CAST(0xA53D0B00 AS Date), N'6107067', N'AGUS BUDI HARTO', N'1', N'HADIR', NULL, CAST(0x0000A84A0097AD88 AS DateTime), N'6113882', CAST(0x0000A84D0093728B AS DateTime), N'6113882', NULL)
INSERT [NANO].[TBL_T_KEHADIRAN_MEETING_2] ([PID_KEHADIRAN], [TGL_PLAN], [TGL_ACT], [NRP], [NAMA], [KEHADIRAN], [KEHADIRAN_DESC], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY], [PID_PLAN_K_MEETING]) VALUES (N'391aef9d-f2f3-4a22-9149-c0a3e9990d54', CAST(0x973D0B00 AS Date), CAST(0x963D0B00 AS Date), N'6107067', N'AGUS BUDI HARTO', N'1', N'HADIR', NULL, CAST(0x0000A83B00871329 AS DateTime), N'2016030', CAST(0x0000A83B008ABD19 AS DateTime), N'2016030', NULL)
INSERT [NANO].[TBL_T_KEHADIRAN_MEETING_2] ([PID_KEHADIRAN], [TGL_PLAN], [TGL_ACT], [NRP], [NAMA], [KEHADIRAN], [KEHADIRAN_DESC], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY], [PID_PLAN_K_MEETING]) VALUES (N'06c03a3e-238d-450b-9db8-d006856f7dbd', CAST(0x973D0B00 AS Date), CAST(0x963D0B00 AS Date), N'6113882', N'ARTDITYO PRIAMBODHO', N'1', N'HADIR', NULL, CAST(0x0000A83B0087131F AS DateTime), N'2016030', CAST(0x0000A83B008ABD1E AS DateTime), N'2016030', NULL)
INSERT [NANO].[TBL_T_KEHADIRAN_MEETING_2] ([PID_KEHADIRAN], [TGL_PLAN], [TGL_ACT], [NRP], [NAMA], [KEHADIRAN], [KEHADIRAN_DESC], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY], [PID_PLAN_K_MEETING]) VALUES (N'4fcf681b-a3b6-402f-928b-97c947647c2e', CAST(0x973D0B00 AS Date), CAST(0x963D0B00 AS Date), N'193078', N'SUKRON', N'4', N'DINAS KE SITE', NULL, CAST(0x0000A83B00871332 AS DateTime), N'2016030', CAST(0x0000A83B008ABD27 AS DateTime), N'2016030', NULL)
INSERT [NANO].[TBL_T_KEHADIRAN_MEETING_2] ([PID_KEHADIRAN], [TGL_PLAN], [TGL_ACT], [NRP], [NAMA], [KEHADIRAN], [KEHADIRAN_DESC], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY], [PID_PLAN_K_MEETING]) VALUES (N'95273148-3ee4-431f-88eb-a4367c883d6f', CAST(0x973D0B00 AS Date), CAST(0x963D0B00 AS Date), N'2017038', N'ANNISAA RAHMAYANI NURFAJAR', N'1', N'HADIR', NULL, CAST(0x0000A83B0087130D AS DateTime), N'2016030', CAST(0x0000A83B008ABD06 AS DateTime), N'2016030', NULL)
INSERT [NANO].[TBL_T_KEHADIRAN_MEETING_2] ([PID_KEHADIRAN], [TGL_PLAN], [TGL_ACT], [NRP], [NAMA], [KEHADIRAN], [KEHADIRAN_DESC], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY], [PID_PLAN_K_MEETING]) VALUES (N'8a1135d6-f949-47c1-a3ef-6d62ec2c2b08', CAST(0x973D0B00 AS Date), CAST(0x963D0B00 AS Date), N'6196076', N'SATARSO AGUS TJAHJONO', N'3', N'MEETING LAIN', NULL, CAST(0x0000A83B0087132D AS DateTime), N'2016030', CAST(0x0000A83B008ABD22 AS DateTime), N'2016030', NULL)
INSERT [NANO].[TBL_T_KEHADIRAN_MEETING_2] ([PID_KEHADIRAN], [TGL_PLAN], [TGL_ACT], [NRP], [NAMA], [KEHADIRAN], [KEHADIRAN_DESC], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY], [PID_PLAN_K_MEETING]) VALUES (N'eb9117e0-92fd-441d-bcda-b4612fe92137', CAST(0x973D0B00 AS Date), CAST(0x963D0B00 AS Date), N'2016030', N'YAQUB EDY SUSILO', N'1', N'HADIR', NULL, CAST(0x0000A83B0087131F AS DateTime), N'2016030', CAST(0x0000A83B008ABD14 AS DateTime), N'2016030', NULL)
INSERT [NANO].[TBL_T_KEHADIRAN_MEETING_2] ([PID_KEHADIRAN], [TGL_PLAN], [TGL_ACT], [NRP], [NAMA], [KEHADIRAN], [KEHADIRAN_DESC], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY], [PID_PLAN_K_MEETING]) VALUES (N'f9ee0da7-c873-434d-b1fb-358d027a8900', CAST(0x893D0B00 AS Date), CAST(0x893D0B00 AS Date), N'6113882', N'ARTDITYO PRIAMBODHO', N'1', N'HADIR', NULL, CAST(0x0000A82E008CF9C6 AS DateTime), N'2017038', CAST(0x0000A82E00915C8F AS DateTime), N'2017038', NULL)
INSERT [NANO].[TBL_T_KEHADIRAN_MEETING_2] ([PID_KEHADIRAN], [TGL_PLAN], [TGL_ACT], [NRP], [NAMA], [KEHADIRAN], [KEHADIRAN_DESC], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY], [PID_PLAN_K_MEETING]) VALUES (N'e6c1cf87-7bf6-485f-99c6-9ca7fa708b49', CAST(0x893D0B00 AS Date), CAST(0x893D0B00 AS Date), N'193078', N'SUKRON', N'7', N'IJIN', NULL, CAST(0x0000A82E008CFB91 AS DateTime), N'2017038', CAST(0x0000A82E00915C9D AS DateTime), N'2017038', NULL)
INSERT [NANO].[TBL_T_KEHADIRAN_MEETING_2] ([PID_KEHADIRAN], [TGL_PLAN], [TGL_ACT], [NRP], [NAMA], [KEHADIRAN], [KEHADIRAN_DESC], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY], [PID_PLAN_K_MEETING]) VALUES (N'ce0d1dcc-f1ed-40e5-ba0d-a90275b8ec3a', CAST(0x893D0B00 AS Date), CAST(0x893D0B00 AS Date), N'2016030', N'YAQUB EDY SUSILO', N'7', N'IJIN', NULL, CAST(0x0000A82E008CF94D AS DateTime), N'2017038', CAST(0x0000A82E00915C7D AS DateTime), N'2017038', NULL)
INSERT [NANO].[TBL_T_KEHADIRAN_MEETING_2] ([PID_KEHADIRAN], [TGL_PLAN], [TGL_ACT], [NRP], [NAMA], [KEHADIRAN], [KEHADIRAN_DESC], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY], [PID_PLAN_K_MEETING]) VALUES (N'b52c89cc-f81c-45a1-ab88-dbb6c5f67297', CAST(0x893D0B00 AS Date), CAST(0x893D0B00 AS Date), N'2017038', N'ANNISAA RAHMAYANI NURFAJAR', N'1', N'HADIR', NULL, CAST(0x0000A82E008CF8C0 AS DateTime), N'2017038', CAST(0x0000A82E00915C65 AS DateTime), N'2017038', NULL)
INSERT [NANO].[TBL_T_KEHADIRAN_MEETING_2] ([PID_KEHADIRAN], [TGL_PLAN], [TGL_ACT], [NRP], [NAMA], [KEHADIRAN], [KEHADIRAN_DESC], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY], [PID_PLAN_K_MEETING]) VALUES (N'a8de3c52-b4ed-4bdf-abd6-2024be7dc939', CAST(0x893D0B00 AS Date), CAST(0x893D0B00 AS Date), N'6196076', N'SATARSO AGUS TJAHJONO', N'1', N'HADIR', NULL, CAST(0x0000A82E008CFAF2 AS DateTime), N'2017038', CAST(0x0000A82E00915C99 AS DateTime), N'2017038', NULL)
INSERT [NANO].[TBL_T_KEHADIRAN_MEETING_2] ([PID_KEHADIRAN], [TGL_PLAN], [TGL_ACT], [NRP], [NAMA], [KEHADIRAN], [KEHADIRAN_DESC], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY], [PID_PLAN_K_MEETING]) VALUES (N'a3b03b79-71d4-4e95-9b0e-8b5267c44487', CAST(0x893D0B00 AS Date), CAST(0x893D0B00 AS Date), N'6107067', N'AGUS BUDI HARTO', N'1', N'HADIR', NULL, CAST(0x0000A82E008CFA37 AS DateTime), N'2017038', CAST(0x0000A82E00915C86 AS DateTime), N'2017038', NULL)
INSERT [NANO].[TBL_T_KEHADIRAN_MEETING_2] ([PID_KEHADIRAN], [TGL_PLAN], [TGL_ACT], [NRP], [NAMA], [KEHADIRAN], [KEHADIRAN_DESC], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY], [PID_PLAN_K_MEETING]) VALUES (N'b4cc6000-c6ee-4df2-90c5-c0e5dcb1e048', CAST(0x7B3D0B00 AS Date), CAST(0x7B3D0B00 AS Date), N'6196076', N'SATARSO AGUS TJAHJONO', N'1', N'HADIR', NULL, CAST(0x0000A820008DDF03 AS DateTime), N'2016030', CAST(0x0000A820009028F9 AS DateTime), N'2016030', NULL)
INSERT [NANO].[TBL_T_KEHADIRAN_MEETING_2] ([PID_KEHADIRAN], [TGL_PLAN], [TGL_ACT], [NRP], [NAMA], [KEHADIRAN], [KEHADIRAN_DESC], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY], [PID_PLAN_K_MEETING]) VALUES (N'e864492d-061c-4b55-923d-a5508fd920a3', CAST(0x7B3D0B00 AS Date), CAST(0x7B3D0B00 AS Date), N'193078', N'SUKRON', N'6', N'SAKIT', NULL, CAST(0x0000A820008DDF1F AS DateTime), N'2016030', CAST(0x0000A820009028FD AS DateTime), N'2016030', NULL)
INSERT [NANO].[TBL_T_KEHADIRAN_MEETING_2] ([PID_KEHADIRAN], [TGL_PLAN], [TGL_ACT], [NRP], [NAMA], [KEHADIRAN], [KEHADIRAN_DESC], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY], [PID_PLAN_K_MEETING]) VALUES (N'3dcc5182-708f-4117-946b-4d846539d259', CAST(0x7B3D0B00 AS Date), CAST(0x7B3D0B00 AS Date), N'6113882', N'ARTDITYO PRIAMBODHO', N'4', N'DINAS KE SITE', NULL, CAST(0x0000A820008DDF0D AS DateTime), N'2016030', CAST(0x0000A820009028F9 AS DateTime), N'2016030', NULL)
INSERT [NANO].[TBL_T_KEHADIRAN_MEETING_2] ([PID_KEHADIRAN], [TGL_PLAN], [TGL_ACT], [NRP], [NAMA], [KEHADIRAN], [KEHADIRAN_DESC], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY], [PID_PLAN_K_MEETING]) VALUES (N'4063685c-ad58-4f18-bd91-990bff369d74', CAST(0x7B3D0B00 AS Date), CAST(0x7B3D0B00 AS Date), N'2017038', N'ANNISAA RAHMAYANI NURFAJAR', N'1', N'HADIR', NULL, CAST(0x0000A820008DDF37 AS DateTime), N'2016030', CAST(0x0000A82000902902 AS DateTime), N'2016030', NULL)
INSERT [NANO].[TBL_T_KEHADIRAN_MEETING_2] ([PID_KEHADIRAN], [TGL_PLAN], [TGL_ACT], [NRP], [NAMA], [KEHADIRAN], [KEHADIRAN_DESC], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY], [PID_PLAN_K_MEETING]) VALUES (N'6db9b087-4186-4f36-9986-bdfaa56a4d00', CAST(0x7B3D0B00 AS Date), CAST(0x7B3D0B00 AS Date), N'6107067', N'AGUS BUDI HARTO', N'1', N'HADIR', NULL, CAST(0x0000A820008DDEC6 AS DateTime), N'2016030', CAST(0x0000A820009028EF AS DateTime), N'2016030', NULL)
INSERT [NANO].[TBL_T_KEHADIRAN_MEETING_2] ([PID_KEHADIRAN], [TGL_PLAN], [TGL_ACT], [NRP], [NAMA], [KEHADIRAN], [KEHADIRAN_DESC], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY], [PID_PLAN_K_MEETING]) VALUES (N'167a57c8-dd00-494f-8c68-280375774047', CAST(0x7B3D0B00 AS Date), CAST(0x7B3D0B00 AS Date), N'2016030', N'YAQUB EDY SUSILO', N'1', N'HADIR', NULL, CAST(0x0000A820008DDEF1 AS DateTime), N'2016030', CAST(0x0000A820009028F4 AS DateTime), N'2016030', NULL)
INSERT [NANO].[TBL_T_KEHADIRAN_MEETING_2] ([PID_KEHADIRAN], [TGL_PLAN], [TGL_ACT], [NRP], [NAMA], [KEHADIRAN], [KEHADIRAN_DESC], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY], [PID_PLAN_K_MEETING]) VALUES (N'25ea555d-98ae-4ee0-9e3d-c17aad09c554', CAST(0x6D3D0B00 AS Date), CAST(0x6D3D0B00 AS Date), N'193078', N'SUKRON', N'2', N'TIDAK HADIR', NULL, CAST(0x0000A8180111991B AS DateTime), N'2016030', CAST(0x0000A8190119CB11 AS DateTime), N'2016030', NULL)
INSERT [NANO].[TBL_T_KEHADIRAN_MEETING_2] ([PID_KEHADIRAN], [TGL_PLAN], [TGL_ACT], [NRP], [NAMA], [KEHADIRAN], [KEHADIRAN_DESC], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY], [PID_PLAN_K_MEETING]) VALUES (N'7875abaf-8f48-46a8-9889-dc670cd5b580', CAST(0x6D3D0B00 AS Date), CAST(0x6D3D0B00 AS Date), N'2017038', N'ANNISAA RAHMAYANI NURFAJAR', N'1', N'HADIR', NULL, CAST(0x0000A8180111AB92 AS DateTime), N'2016030', CAST(0x0000A8190119CB11 AS DateTime), N'2016030', NULL)
INSERT [NANO].[TBL_T_KEHADIRAN_MEETING_2] ([PID_KEHADIRAN], [TGL_PLAN], [TGL_ACT], [NRP], [NAMA], [KEHADIRAN], [KEHADIRAN_DESC], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY], [PID_PLAN_K_MEETING]) VALUES (N'47b48356-bd13-419a-8095-660b1489aa0b', CAST(0x6D3D0B00 AS Date), CAST(0x6D3D0B00 AS Date), N'2016030', N'YAQUB EDY SUSILO', N'1', N'HADIR', NULL, CAST(0x0000A81900929D52 AS DateTime), N'2016030', CAST(0x0000A8190119CB0D AS DateTime), N'2016030', NULL)
INSERT [NANO].[TBL_T_KEHADIRAN_MEETING_2] ([PID_KEHADIRAN], [TGL_PLAN], [TGL_ACT], [NRP], [NAMA], [KEHADIRAN], [KEHADIRAN_DESC], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY], [PID_PLAN_K_MEETING]) VALUES (N'c4bb9dfe-1ae7-4a69-beb4-9dc76d772e02', CAST(0x6D3D0B00 AS Date), CAST(0x6D3D0B00 AS Date), N'6107067', N'AGUS BUDI HARTO', N'1', N'HADIR', NULL, CAST(0x0000A8180111B08B AS DateTime), N'2016030', CAST(0x0000A8190119CB16 AS DateTime), N'2016030', NULL)
INSERT [NANO].[TBL_T_KEHADIRAN_MEETING_2] ([PID_KEHADIRAN], [TGL_PLAN], [TGL_ACT], [NRP], [NAMA], [KEHADIRAN], [KEHADIRAN_DESC], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY], [PID_PLAN_K_MEETING]) VALUES (N'7e21c8fd-68fa-4a85-8801-fe4e9a4fc7c8', CAST(0x6D3D0B00 AS Date), CAST(0x6D3D0B00 AS Date), N'6113882', N'ARTDITYO PRIAMBODHO', N'1', N'HADIR', NULL, CAST(0x0000A8180111A6BF AS DateTime), N'2016030', CAST(0x0000A8190119CB11 AS DateTime), N'2016030', NULL)
INSERT [NANO].[TBL_T_KEHADIRAN_MEETING_2] ([PID_KEHADIRAN], [TGL_PLAN], [TGL_ACT], [NRP], [NAMA], [KEHADIRAN], [KEHADIRAN_DESC], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY], [PID_PLAN_K_MEETING]) VALUES (N'a21a9c99-a471-4fc9-856b-da8b39810760', CAST(0x6D3D0B00 AS Date), CAST(0x6D3D0B00 AS Date), N'6196076', N'SATARSO AGUS TJAHJONO', N'1', N'HADIR', NULL, CAST(0x0000A8180111A23F AS DateTime), N'2016030', CAST(0x0000A8190119CB0D AS DateTime), N'2016030', NULL)
INSERT [NANO].[TBL_T_KEHADIRAN_MEETING_2] ([PID_KEHADIRAN], [TGL_PLAN], [TGL_ACT], [NRP], [NAMA], [KEHADIRAN], [KEHADIRAN_DESC], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY], [PID_PLAN_K_MEETING]) VALUES (N'e5b09c17-644d-4d18-9f3c-2c0f81253abc', CAST(0x5F3D0B00 AS Date), CAST(0x5F3D0B00 AS Date), N'6107067', N'AGUS BUDI HARTO', N'1', N'HADIR', NULL, CAST(0x0000A81801117E9E AS DateTime), N'2016030', CAST(0x0000A81801117E9E AS DateTime), N'2016030', NULL)
INSERT [NANO].[TBL_T_KEHADIRAN_MEETING_2] ([PID_KEHADIRAN], [TGL_PLAN], [TGL_ACT], [NRP], [NAMA], [KEHADIRAN], [KEHADIRAN_DESC], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY], [PID_PLAN_K_MEETING]) VALUES (N'454af3bf-6e12-4341-b641-8764b9392fbd', CAST(0x5F3D0B00 AS Date), CAST(0x5F3D0B00 AS Date), N'6113882', N'ARTDITYO PRIAMBODHO', N'1', N'HADIR', NULL, CAST(0x0000A81801117567 AS DateTime), N'2016030', CAST(0x0000A81801117567 AS DateTime), N'2016030', NULL)
INSERT [NANO].[TBL_T_KEHADIRAN_MEETING_2] ([PID_KEHADIRAN], [TGL_PLAN], [TGL_ACT], [NRP], [NAMA], [KEHADIRAN], [KEHADIRAN_DESC], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY], [PID_PLAN_K_MEETING]) VALUES (N'7365c4e7-7f97-40e8-aee6-498478eb4066', CAST(0x5F3D0B00 AS Date), CAST(0x5F3D0B00 AS Date), N'2017038', N'ANNISAA RAHMAYANI NURFAJAR', N'1', N'HADIR', NULL, CAST(0x0000A818011179E6 AS DateTime), N'2016030', CAST(0x0000A818011179E6 AS DateTime), N'2016030', NULL)
INSERT [NANO].[TBL_T_KEHADIRAN_MEETING_2] ([PID_KEHADIRAN], [TGL_PLAN], [TGL_ACT], [NRP], [NAMA], [KEHADIRAN], [KEHADIRAN_DESC], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY], [PID_PLAN_K_MEETING]) VALUES (N'630a3905-4758-4d4b-a01b-b8ec65154090', CAST(0x5F3D0B00 AS Date), CAST(0x5F3D0B00 AS Date), N'2016030', N'YAQUB EDY SUSILO', N'1', N'HADIR', NULL, CAST(0x0000A81801116C5B AS DateTime), N'2016030', CAST(0x0000A81801116C5B AS DateTime), N'2016030', NULL)
INSERT [NANO].[TBL_T_KEHADIRAN_MEETING_2] ([PID_KEHADIRAN], [TGL_PLAN], [TGL_ACT], [NRP], [NAMA], [KEHADIRAN], [KEHADIRAN_DESC], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY], [PID_PLAN_K_MEETING]) VALUES (N'2e2cd864-84ab-4089-9782-ede2c537fb2a', CAST(0x5F3D0B00 AS Date), CAST(0x5F3D0B00 AS Date), N'6196076', N'SATARSO AGUS TJAHJONO', N'1', N'HADIR', NULL, CAST(0x0000A818011170A6 AS DateTime), N'2016030', CAST(0x0000A818011170A6 AS DateTime), N'2016030', NULL)
INSERT [NANO].[TBL_T_KEHADIRAN_MEETING_2] ([PID_KEHADIRAN], [TGL_PLAN], [TGL_ACT], [NRP], [NAMA], [KEHADIRAN], [KEHADIRAN_DESC], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY], [PID_PLAN_K_MEETING]) VALUES (N'2ee27405-72bc-4d0a-b3e7-ff8c4a55c2b3', CAST(0x5F3D0B00 AS Date), CAST(0x5F3D0B00 AS Date), N'193078', N'SUKRON', N'4', N'DINAS KE SITE', NULL, CAST(0x0000A81801116462 AS DateTime), N'2016030', CAST(0x0000A81801116462 AS DateTime), N'2016030', NULL)
INSERT [NANO].[TBL_T_KEHADIRAN_MEETING_2] ([PID_KEHADIRAN], [TGL_PLAN], [TGL_ACT], [NRP], [NAMA], [KEHADIRAN], [KEHADIRAN_DESC], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY], [PID_PLAN_K_MEETING]) VALUES (N'2abff031-2069-4ed6-b365-a74cb32d2976', CAST(0x513D0B00 AS Date), CAST(0x513D0B00 AS Date), N'2017038', N'ANNISAA RAHMAYANI NURFAJAR', N'1', N'HADIR', NULL, CAST(0x0000A81801114933 AS DateTime), N'2016030', CAST(0x0000A81801114933 AS DateTime), N'2016030', NULL)
INSERT [NANO].[TBL_T_KEHADIRAN_MEETING_2] ([PID_KEHADIRAN], [TGL_PLAN], [TGL_ACT], [NRP], [NAMA], [KEHADIRAN], [KEHADIRAN_DESC], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY], [PID_PLAN_K_MEETING]) VALUES (N'0318144c-e6f3-4f1e-9e3c-bf8e009c4418', CAST(0x513D0B00 AS Date), CAST(0x513D0B00 AS Date), N'2016030', N'YAQUB EDY SUSILO', N'1', N'HADIR', NULL, CAST(0x0000A81801113BBA AS DateTime), N'2016030', CAST(0x0000A81801113BBA AS DateTime), N'2016030', NULL)
INSERT [NANO].[TBL_T_KEHADIRAN_MEETING_2] ([PID_KEHADIRAN], [TGL_PLAN], [TGL_ACT], [NRP], [NAMA], [KEHADIRAN], [KEHADIRAN_DESC], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY], [PID_PLAN_K_MEETING]) VALUES (N'da69c729-bf1a-4a7a-ba6b-ec92ffa68608', CAST(0x513D0B00 AS Date), CAST(0x513D0B00 AS Date), N'6113882', N'ARTDITYO PRIAMBODHO', N'1', N'HADIR', NULL, CAST(0x0000A81801114034 AS DateTime), N'2016030', CAST(0x0000A81801114034 AS DateTime), N'2016030', NULL)
INSERT [NANO].[TBL_T_KEHADIRAN_MEETING_2] ([PID_KEHADIRAN], [TGL_PLAN], [TGL_ACT], [NRP], [NAMA], [KEHADIRAN], [KEHADIRAN_DESC], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY], [PID_PLAN_K_MEETING]) VALUES (N'b6434a5d-f054-4080-bdff-ee5bda720b4e', CAST(0x513D0B00 AS Date), CAST(0x513D0B00 AS Date), N'6107067', N'AGUS BUDI HARTO', N'1', N'HADIR', NULL, CAST(0x0000A81801114DAD AS DateTime), N'2016030', CAST(0x0000A81801114DAD AS DateTime), N'2016030', NULL)
INSERT [NANO].[TBL_T_KEHADIRAN_MEETING_2] ([PID_KEHADIRAN], [TGL_PLAN], [TGL_ACT], [NRP], [NAMA], [KEHADIRAN], [KEHADIRAN_DESC], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY], [PID_PLAN_K_MEETING]) VALUES (N'a637237a-20e1-4230-bd89-8656fa3a512e', CAST(0x513D0B00 AS Date), CAST(0x513D0B00 AS Date), N'193078', N'SUKRON', N'1', N'HADIR', NULL, CAST(0x0000A81801114516 AS DateTime), N'2016030', CAST(0x0000A81801114516 AS DateTime), N'2016030', NULL)
INSERT [NANO].[TBL_T_KEHADIRAN_MEETING_2] ([PID_KEHADIRAN], [TGL_PLAN], [TGL_ACT], [NRP], [NAMA], [KEHADIRAN], [KEHADIRAN_DESC], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY], [PID_PLAN_K_MEETING]) VALUES (N'a99613ab-ac21-4f0d-ae47-faaa4e8f82cc', CAST(0x433D0B00 AS Date), CAST(0x433D0B00 AS Date), N'2016030', N'YAQUB EDY SUSILO', N'1', N'HADIR', NULL, CAST(0x0000A8180110F00A AS DateTime), N'2016030', CAST(0x0000A8180110F00A AS DateTime), N'2016030', NULL)
INSERT [NANO].[TBL_T_KEHADIRAN_MEETING_2] ([PID_KEHADIRAN], [TGL_PLAN], [TGL_ACT], [NRP], [NAMA], [KEHADIRAN], [KEHADIRAN_DESC], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY], [PID_PLAN_K_MEETING]) VALUES (N'950912a3-8f44-4f36-a760-de96a013de6b', CAST(0x433D0B00 AS Date), CAST(0x433D0B00 AS Date), N'193078', N'SUKRON', N'4', N'DINAS KE SITE', NULL, CAST(0x0000A81801110FB4 AS DateTime), N'2016030', CAST(0x0000A81801110FB4 AS DateTime), N'2016030', NULL)
INSERT [NANO].[TBL_T_KEHADIRAN_MEETING_2] ([PID_KEHADIRAN], [TGL_PLAN], [TGL_ACT], [NRP], [NAMA], [KEHADIRAN], [KEHADIRAN_DESC], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY], [PID_PLAN_K_MEETING]) VALUES (N'2656b97c-f8c9-41ca-8ac3-bfca5ac2e7ff', CAST(0x433D0B00 AS Date), CAST(0x433D0B00 AS Date), N'6107067', N'AGUS BUDI HARTO', N'8', N'CUTI', NULL, CAST(0x0000A81801111BC0 AS DateTime), N'2016030', CAST(0x0000A81801111BC0 AS DateTime), N'2016030', NULL)
INSERT [NANO].[TBL_T_KEHADIRAN_MEETING_2] ([PID_KEHADIRAN], [TGL_PLAN], [TGL_ACT], [NRP], [NAMA], [KEHADIRAN], [KEHADIRAN_DESC], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY], [PID_PLAN_K_MEETING]) VALUES (N'6a137305-68a8-4ec1-8adf-e956742e1834', CAST(0x433D0B00 AS Date), CAST(0x433D0B00 AS Date), N'2017038', N'ANNISAA RAHMAYANI NURFAJAR', N'1', N'HADIR', NULL, CAST(0x0000A8180110EABD AS DateTime), N'2016030', CAST(0x0000A8180110EABD AS DateTime), N'2016030', NULL)
INSERT [NANO].[TBL_T_KEHADIRAN_MEETING_2] ([PID_KEHADIRAN], [TGL_PLAN], [TGL_ACT], [NRP], [NAMA], [KEHADIRAN], [KEHADIRAN_DESC], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY], [PID_PLAN_K_MEETING]) VALUES (N'7999d818-5549-4663-85c2-931b924de61e', CAST(0x433D0B00 AS Date), CAST(0x433D0B00 AS Date), N'6196076', N'SATARSO AGUS TJAHJONO', N'5', N'TRAINING', NULL, CAST(0x0000A8180111044C AS DateTime), N'2016030', CAST(0x0000A8180111044C AS DateTime), N'2016030', NULL)
INSERT [NANO].[TBL_T_KEHADIRAN_MEETING_2] ([PID_KEHADIRAN], [TGL_PLAN], [TGL_ACT], [NRP], [NAMA], [KEHADIRAN], [KEHADIRAN_DESC], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY], [PID_PLAN_K_MEETING]) VALUES (N'0b8fca18-95a1-4836-b1ae-6ad0b1dcfb36', CAST(0x433D0B00 AS Date), CAST(0x433D0B00 AS Date), N'6113882', N'ARTDITYO PRIAMBODHO', N'1', N'HADIR', NULL, CAST(0x0000A8180110F6CE AS DateTime), N'2016030', CAST(0x0000A8180110F6CE AS DateTime), N'2016030', NULL)
INSERT [NANO].[TBL_T_KEHADIRAN_MEETING_2] ([PID_KEHADIRAN], [TGL_PLAN], [TGL_ACT], [NRP], [NAMA], [KEHADIRAN], [KEHADIRAN_DESC], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY], [PID_PLAN_K_MEETING]) VALUES (N'4a7f38e0-7fb9-46a5-8f3c-7bd2b2f94b12', CAST(0x353D0B00 AS Date), CAST(0x353D0B00 AS Date), N'2017038', N'ANNISAA RAHMAYANI NURFAJAR', N'1', N'HADIR', NULL, CAST(0x0000A8180110D06A AS DateTime), N'2016030', CAST(0x0000A8180110D06A AS DateTime), N'2016030', NULL)
INSERT [NANO].[TBL_T_KEHADIRAN_MEETING_2] ([PID_KEHADIRAN], [TGL_PLAN], [TGL_ACT], [NRP], [NAMA], [KEHADIRAN], [KEHADIRAN_DESC], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY], [PID_PLAN_K_MEETING]) VALUES (N'6b1656f7-3a13-45db-a2ec-9fbf1b1c7424', CAST(0x353D0B00 AS Date), CAST(0x353D0B00 AS Date), N'6113882', N'ARTDITYO PRIAMBODHO', N'8', N'CUTI', NULL, CAST(0x0000A8180110BE1D AS DateTime), N'2016030', CAST(0x0000A8180110BE1D AS DateTime), N'2016030', NULL)
INSERT [NANO].[TBL_T_KEHADIRAN_MEETING_2] ([PID_KEHADIRAN], [TGL_PLAN], [TGL_ACT], [NRP], [NAMA], [KEHADIRAN], [KEHADIRAN_DESC], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY], [PID_PLAN_K_MEETING]) VALUES (N'5f228376-abb2-4ae5-b730-e748288908cc', CAST(0x353D0B00 AS Date), CAST(0x353D0B00 AS Date), N'6196076', N'SATARSO AGUS TJAHJONO', N'1', N'HADIR', NULL, CAST(0x0000A8180110CAD6 AS DateTime), N'2016030', CAST(0x0000A8180110CAD6 AS DateTime), N'2016030', NULL)
INSERT [NANO].[TBL_T_KEHADIRAN_MEETING_2] ([PID_KEHADIRAN], [TGL_PLAN], [TGL_ACT], [NRP], [NAMA], [KEHADIRAN], [KEHADIRAN_DESC], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY], [PID_PLAN_K_MEETING]) VALUES (N'0e10e5fd-a75b-4577-9581-12852371b2b7', CAST(0x353D0B00 AS Date), CAST(0x353D0B00 AS Date), N'193078', N'SUKRON', N'4', N'DINAS KE SITE', NULL, CAST(0x0000A8180110B059 AS DateTime), N'2016030', CAST(0x0000A8180110B059 AS DateTime), N'2016030', NULL)
INSERT [NANO].[TBL_T_KEHADIRAN_MEETING_2] ([PID_KEHADIRAN], [TGL_PLAN], [TGL_ACT], [NRP], [NAMA], [KEHADIRAN], [KEHADIRAN_DESC], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY], [PID_PLAN_K_MEETING]) VALUES (N'859ed962-218c-40f2-a380-c404bf3c870d', CAST(0x353D0B00 AS Date), CAST(0x353D0B00 AS Date), N'2016030', N'YAQUB EDY SUSILO', N'1', N'HADIR', NULL, CAST(0x0000A8180110C6C3 AS DateTime), N'2016030', CAST(0x0000A8180110C6C3 AS DateTime), N'2016030', NULL)
INSERT [NANO].[TBL_T_KEHADIRAN_MEETING_2] ([PID_KEHADIRAN], [TGL_PLAN], [TGL_ACT], [NRP], [NAMA], [KEHADIRAN], [KEHADIRAN_DESC], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY], [PID_PLAN_K_MEETING]) VALUES (N'd92571d4-10c0-4976-9a68-639bd83e5421', CAST(0x353D0B00 AS Date), CAST(0x353D0B00 AS Date), N'6107067', N'AGUS BUDI HARTO', N'1', N'HADIR', NULL, CAST(0x0000A8180110D534 AS DateTime), N'2016030', CAST(0x0000A8180110D534 AS DateTime), N'2016030', NULL)
INSERT [NANO].[TBL_T_KEHADIRAN_MEETING_2] ([PID_KEHADIRAN], [TGL_PLAN], [TGL_ACT], [NRP], [NAMA], [KEHADIRAN], [KEHADIRAN_DESC], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY], [PID_PLAN_K_MEETING]) VALUES (N'ce57b3a3-0ce2-4def-a3cf-6b336aa773ca', CAST(0x273D0B00 AS Date), CAST(0x273D0B00 AS Date), N'6107067', N'AGUS BUDI HARTO', N'1', N'HADIR', NULL, CAST(0x0000A8180110653A AS DateTime), N'2016030', CAST(0x0000A8180110653A AS DateTime), N'2016030', NULL)
INSERT [NANO].[TBL_T_KEHADIRAN_MEETING_2] ([PID_KEHADIRAN], [TGL_PLAN], [TGL_ACT], [NRP], [NAMA], [KEHADIRAN], [KEHADIRAN_DESC], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY], [PID_PLAN_K_MEETING]) VALUES (N'7ecb621b-88cf-4f1b-bdef-8a46ef4e79f9', CAST(0x273D0B00 AS Date), CAST(0x273D0B00 AS Date), N'2016030', N'YAQUB EDY SUSILO', N'7', N'IJIN', NULL, CAST(0x0000A81801107C56 AS DateTime), N'2016030', CAST(0x0000A81801107C56 AS DateTime), N'2016030', NULL)
INSERT [NANO].[TBL_T_KEHADIRAN_MEETING_2] ([PID_KEHADIRAN], [TGL_PLAN], [TGL_ACT], [NRP], [NAMA], [KEHADIRAN], [KEHADIRAN_DESC], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY], [PID_PLAN_K_MEETING]) VALUES (N'aec104aa-9883-4f61-95f0-df7087241056', CAST(0x273D0B00 AS Date), CAST(0x273D0B00 AS Date), N'2017038', N'ANNISAA RAHMAYANI NURFAJAR', N'1', N'HADIR', NULL, CAST(0x0000A81801106A9A AS DateTime), N'2016030', CAST(0x0000A81801106A9A AS DateTime), N'2016030', NULL)
INSERT [NANO].[TBL_T_KEHADIRAN_MEETING_2] ([PID_KEHADIRAN], [TGL_PLAN], [TGL_ACT], [NRP], [NAMA], [KEHADIRAN], [KEHADIRAN_DESC], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY], [PID_PLAN_K_MEETING]) VALUES (N'b1cce014-d503-4ec7-b8a3-cc1ca7694a39', CAST(0x273D0B00 AS Date), CAST(0x273D0B00 AS Date), N'6196076', N'SATARSO AGUS TJAHJONO', N'8', N'CUTI', NULL, CAST(0x0000A81801108A28 AS DateTime), N'2016030', CAST(0x0000A81801108A28 AS DateTime), N'2016030', NULL)
INSERT [NANO].[TBL_T_KEHADIRAN_MEETING_2] ([PID_KEHADIRAN], [TGL_PLAN], [TGL_ACT], [NRP], [NAMA], [KEHADIRAN], [KEHADIRAN_DESC], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY], [PID_PLAN_K_MEETING]) VALUES (N'257116f0-4611-4878-840c-fb5d639df920', CAST(0x273D0B00 AS Date), CAST(0x273D0B00 AS Date), N'193078', N'SUKRON', N'4', N'DINAS KE SITE', NULL, CAST(0x0000A818011096D3 AS DateTime), N'2016030', CAST(0x0000A818011096D3 AS DateTime), N'2016030', NULL)
INSERT [NANO].[TBL_T_KEHADIRAN_MEETING_2] ([PID_KEHADIRAN], [TGL_PLAN], [TGL_ACT], [NRP], [NAMA], [KEHADIRAN], [KEHADIRAN_DESC], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY], [PID_PLAN_K_MEETING]) VALUES (N'730bfd07-d341-4d16-8f2b-31cc93c7a36e', CAST(0x273D0B00 AS Date), CAST(0x273D0B00 AS Date), N'6113882', N'ARTDITYO PRIAMBODHO', N'1', N'HADIR', NULL, CAST(0x0000A818011070B5 AS DateTime), N'2016030', CAST(0x0000A818011070B5 AS DateTime), N'2016030', NULL)
INSERT [NANO].[TBL_T_KEHADIRAN_MEETING_2] ([PID_KEHADIRAN], [TGL_PLAN], [TGL_ACT], [NRP], [NAMA], [KEHADIRAN], [KEHADIRAN_DESC], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY], [PID_PLAN_K_MEETING]) VALUES (N'32b42f20-5165-44fe-93c0-840ee084e07a', CAST(0x193D0B00 AS Date), CAST(0x193D0B00 AS Date), N'2017038', N'ANNISAA RAHMAYANI NURFAJAR', N'1', N'HADIR', NULL, CAST(0x0000A81801103F63 AS DateTime), N'2016030', CAST(0x0000A81801103F63 AS DateTime), N'2016030', NULL)
INSERT [NANO].[TBL_T_KEHADIRAN_MEETING_2] ([PID_KEHADIRAN], [TGL_PLAN], [TGL_ACT], [NRP], [NAMA], [KEHADIRAN], [KEHADIRAN_DESC], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY], [PID_PLAN_K_MEETING]) VALUES (N'3c281d16-f4b7-4ca2-8942-2266ecf008e1', CAST(0x193D0B00 AS Date), CAST(0x193D0B00 AS Date), N'6196076', N'SATARSO AGUS TJAHJONO', N'5', N'TRAINING', NULL, CAST(0x0000A8180110280F AS DateTime), N'2016030', CAST(0x0000A8180110280F AS DateTime), N'2016030', NULL)
INSERT [NANO].[TBL_T_KEHADIRAN_MEETING_2] ([PID_KEHADIRAN], [TGL_PLAN], [TGL_ACT], [NRP], [NAMA], [KEHADIRAN], [KEHADIRAN_DESC], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY], [PID_PLAN_K_MEETING]) VALUES (N'3d77390c-25df-4959-9552-884f143aa092', CAST(0x193D0B00 AS Date), CAST(0x193D0B00 AS Date), N'6113882', N'ARTDITYO PRIAMBODHO', N'1', N'HADIR', NULL, CAST(0x0000A8180110350A AS DateTime), N'2016030', CAST(0x0000A8180110350A AS DateTime), N'2016030', NULL)
INSERT [NANO].[TBL_T_KEHADIRAN_MEETING_2] ([PID_KEHADIRAN], [TGL_PLAN], [TGL_ACT], [NRP], [NAMA], [KEHADIRAN], [KEHADIRAN_DESC], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY], [PID_PLAN_K_MEETING]) VALUES (N'0d2dc6cc-a315-47db-8416-58a9b9106c2f', CAST(0x193D0B00 AS Date), CAST(0x193D0B00 AS Date), N'193078', N'SUKRON', N'1', N'HADIR', NULL, CAST(0x0000A81801103A7C AS DateTime), N'2016030', CAST(0x0000A81801103A7C AS DateTime), N'2016030', NULL)
INSERT [NANO].[TBL_T_KEHADIRAN_MEETING_2] ([PID_KEHADIRAN], [TGL_PLAN], [TGL_ACT], [NRP], [NAMA], [KEHADIRAN], [KEHADIRAN_DESC], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY], [PID_PLAN_K_MEETING]) VALUES (N'ce5c955b-4e50-464a-9a57-4cf2e3a5cf0c', CAST(0x193D0B00 AS Date), CAST(0x193D0B00 AS Date), N'2016030', N'YAQUB EDY SUSILO', N'1', N'HADIR', NULL, CAST(0x0000A8180110308F AS DateTime), N'2016030', CAST(0x0000A8180110308F AS DateTime), N'2016030', NULL)
INSERT [NANO].[TBL_T_KEHADIRAN_MEETING_2] ([PID_KEHADIRAN], [TGL_PLAN], [TGL_ACT], [NRP], [NAMA], [KEHADIRAN], [KEHADIRAN_DESC], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY], [PID_PLAN_K_MEETING]) VALUES (N'ff19ec33-6e36-467d-9135-f3aa05d6d257', CAST(0x193D0B00 AS Date), CAST(0x193D0B00 AS Date), N'6107067', N'AGUS BUDI HARTO', N'6', N'SAKIT', NULL, CAST(0x0000A81801101E7B AS DateTime), N'2016030', CAST(0x0000A81801101E7B AS DateTime), N'2016030', NULL)
INSERT [NANO].[TBL_T_KEHADIRAN_MEETING_2] ([PID_KEHADIRAN], [TGL_PLAN], [TGL_ACT], [NRP], [NAMA], [KEHADIRAN], [KEHADIRAN_DESC], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY], [PID_PLAN_K_MEETING]) VALUES (N'ff0f49d5-039e-46d7-ac32-bd5bb88a69be', CAST(0x0B3D0B00 AS Date), CAST(0x0B3D0B00 AS Date), N'6107067', N'AGUS BUDI HARTO', N'1', N'HADIR', NULL, CAST(0x0000A818010FFFC4 AS DateTime), N'2016030', CAST(0x0000A818010FFFC4 AS DateTime), N'2016030', NULL)
INSERT [NANO].[TBL_T_KEHADIRAN_MEETING_2] ([PID_KEHADIRAN], [TGL_PLAN], [TGL_ACT], [NRP], [NAMA], [KEHADIRAN], [KEHADIRAN_DESC], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY], [PID_PLAN_K_MEETING]) VALUES (N'03f61773-1337-4196-a125-457a20ed8abc', CAST(0x0B3D0B00 AS Date), CAST(0x0B3D0B00 AS Date), N'193078', N'SUKRON', N'3', N'MEETING LAIN', NULL, CAST(0x0000A818010FCC44 AS DateTime), N'2016030', CAST(0x0000A818010FCC44 AS DateTime), N'2016030', NULL)
INSERT [NANO].[TBL_T_KEHADIRAN_MEETING_2] ([PID_KEHADIRAN], [TGL_PLAN], [TGL_ACT], [NRP], [NAMA], [KEHADIRAN], [KEHADIRAN_DESC], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY], [PID_PLAN_K_MEETING]) VALUES (N'10e12279-ad11-4d41-8af5-d00108ba3c51', CAST(0x0B3D0B00 AS Date), CAST(0x0B3D0B00 AS Date), N'2017038', N'ANNISAA RAHMAYANI NURFAJAR', N'1', N'HADIR', NULL, CAST(0x0000A818010FFB29 AS DateTime), N'2016030', CAST(0x0000A818010FFB29 AS DateTime), N'2016030', NULL)
INSERT [NANO].[TBL_T_KEHADIRAN_MEETING_2] ([PID_KEHADIRAN], [TGL_PLAN], [TGL_ACT], [NRP], [NAMA], [KEHADIRAN], [KEHADIRAN_DESC], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY], [PID_PLAN_K_MEETING]) VALUES (N'1187263a-a263-45d3-982d-25868288246b', CAST(0x0B3D0B00 AS Date), CAST(0x0B3D0B00 AS Date), N'2016030', N'YAQUB EDY SUSILO', N'1', N'HADIR', NULL, CAST(0x0000A818010FEB66 AS DateTime), N'2016030', CAST(0x0000A818010FEB66 AS DateTime), N'2016030', NULL)
INSERT [NANO].[TBL_T_KEHADIRAN_MEETING_2] ([PID_KEHADIRAN], [TGL_PLAN], [TGL_ACT], [NRP], [NAMA], [KEHADIRAN], [KEHADIRAN_DESC], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY], [PID_PLAN_K_MEETING]) VALUES (N'6025bb81-7efc-4c20-879b-2cb6abfca0e0', CAST(0x0B3D0B00 AS Date), CAST(0x0B3D0B00 AS Date), N'6196076', N'SATARSO AGUS TJAHJONO', N'1', N'HADIR', NULL, CAST(0x0000A818010FF03F AS DateTime), N'2016030', CAST(0x0000A818010FF03F AS DateTime), N'2016030', NULL)
INSERT [NANO].[TBL_T_KEHADIRAN_MEETING_2] ([PID_KEHADIRAN], [TGL_PLAN], [TGL_ACT], [NRP], [NAMA], [KEHADIRAN], [KEHADIRAN_DESC], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY], [PID_PLAN_K_MEETING]) VALUES (N'5756734d-2524-479a-b03b-8caa292516dd', CAST(0x0B3D0B00 AS Date), CAST(0x0B3D0B00 AS Date), N'6113882', N'ARTDITYO PRIAMBODHO', N'1', N'HADIR', NULL, CAST(0x0000A818010FF509 AS DateTime), N'2016030', CAST(0x0000A818010FF509 AS DateTime), N'2016030', NULL)
INSERT [NANO].[TBL_T_KEHADIRAN_MEETING_2] ([PID_KEHADIRAN], [TGL_PLAN], [TGL_ACT], [NRP], [NAMA], [KEHADIRAN], [KEHADIRAN_DESC], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY], [PID_PLAN_K_MEETING]) VALUES (N'58a8d5e1-9a79-4dba-9c23-8c7f602232c3', NULL, CAST(0x7B3D0B00 AS Date), NULL, NULL, NULL, NULL, NULL, CAST(0x0000A820008ACB93 AS DateTime), N'2016030', CAST(0x0000A820008ACB93 AS DateTime), N'2016030', NULL)
INSERT [NANO].[TBL_T_KEHADIRAN_MEETING_2] ([PID_KEHADIRAN], [TGL_PLAN], [TGL_ACT], [NRP], [NAMA], [KEHADIRAN], [KEHADIRAN_DESC], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY], [PID_PLAN_K_MEETING]) VALUES (N'5e157c83-2d5e-45d4-b22e-6a33985df1c4', NULL, CAST(0x7B3D0B00 AS Date), NULL, NULL, NULL, NULL, NULL, CAST(0x0000A820008930CA AS DateTime), N'2016030', CAST(0x0000A820008930CA AS DateTime), N'2016030', NULL)
INSERT [NANO].[TBL_T_KEHADIRAN_MEETING_2] ([PID_KEHADIRAN], [TGL_PLAN], [TGL_ACT], [NRP], [NAMA], [KEHADIRAN], [KEHADIRAN_DESC], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY], [PID_PLAN_K_MEETING]) VALUES (N'5ea1937a-57d6-4043-9acc-ca72a5be7a0f', NULL, CAST(0x7B3D0B00 AS Date), NULL, NULL, NULL, NULL, NULL, CAST(0x0000A820008ACB8E AS DateTime), N'2016030', CAST(0x0000A820008ACB8E AS DateTime), N'2016030', NULL)
INSERT [NANO].[TBL_T_KEHADIRAN_MEETING_2] ([PID_KEHADIRAN], [TGL_PLAN], [TGL_ACT], [NRP], [NAMA], [KEHADIRAN], [KEHADIRAN_DESC], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY], [PID_PLAN_K_MEETING]) VALUES (N'4d2837bf-e1ad-48c0-a0c4-d7374913bde9', NULL, CAST(0x7B3D0B00 AS Date), NULL, NULL, NULL, NULL, NULL, CAST(0x0000A820008CE80C AS DateTime), N'2016030', CAST(0x0000A820008CE80C AS DateTime), N'2016030', NULL)
INSERT [NANO].[TBL_T_KEHADIRAN_MEETING_2] ([PID_KEHADIRAN], [TGL_PLAN], [TGL_ACT], [NRP], [NAMA], [KEHADIRAN], [KEHADIRAN_DESC], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY], [PID_PLAN_K_MEETING]) VALUES (N'4a6a2b94-c7b3-4440-b9d7-df1f03f37e5b', NULL, CAST(0x7B3D0B00 AS Date), NULL, NULL, NULL, NULL, NULL, CAST(0x0000A820008BAF16 AS DateTime), N'2016030', CAST(0x0000A820008BAF16 AS DateTime), N'2016030', NULL)
INSERT [NANO].[TBL_T_KEHADIRAN_MEETING_2] ([PID_KEHADIRAN], [TGL_PLAN], [TGL_ACT], [NRP], [NAMA], [KEHADIRAN], [KEHADIRAN_DESC], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY], [PID_PLAN_K_MEETING]) VALUES (N'421ac0ea-4f06-4888-8c36-14043bda80f9', NULL, CAST(0x7B3D0B00 AS Date), NULL, NULL, NULL, NULL, NULL, CAST(0x0000A820008D2068 AS DateTime), N'2016030', CAST(0x0000A820008D207D AS DateTime), N'2016030', NULL)
INSERT [NANO].[TBL_T_KEHADIRAN_MEETING_2] ([PID_KEHADIRAN], [TGL_PLAN], [TGL_ACT], [NRP], [NAMA], [KEHADIRAN], [KEHADIRAN_DESC], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY], [PID_PLAN_K_MEETING]) VALUES (N'44c6263b-dd08-4a3f-a7e5-c6cfeba7d324', NULL, CAST(0x7B3D0B00 AS Date), NULL, NULL, NULL, NULL, NULL, CAST(0x0000A820008D1DBC AS DateTime), N'2016030', CAST(0x0000A820008D1DD1 AS DateTime), N'2016030', NULL)
GO
print 'Processed 100 total records'
INSERT [NANO].[TBL_T_KEHADIRAN_MEETING_2] ([PID_KEHADIRAN], [TGL_PLAN], [TGL_ACT], [NRP], [NAMA], [KEHADIRAN], [KEHADIRAN_DESC], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY], [PID_PLAN_K_MEETING]) VALUES (N'6079074a-aa51-4074-82f5-3bce443b0903', NULL, CAST(0x7B3D0B00 AS Date), NULL, NULL, NULL, NULL, NULL, CAST(0x0000A820008930CA AS DateTime), N'2016030', CAST(0x0000A820008930CA AS DateTime), N'2016030', NULL)
INSERT [NANO].[TBL_T_KEHADIRAN_MEETING_2] ([PID_KEHADIRAN], [TGL_PLAN], [TGL_ACT], [NRP], [NAMA], [KEHADIRAN], [KEHADIRAN_DESC], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY], [PID_PLAN_K_MEETING]) VALUES (N'6661b48b-e03c-47a5-ae22-b79b42d8f169', NULL, CAST(0x7B3D0B00 AS Date), NULL, NULL, NULL, NULL, NULL, CAST(0x0000A820008BAF16 AS DateTime), N'2016030', CAST(0x0000A820008BAF16 AS DateTime), N'2016030', NULL)
INSERT [NANO].[TBL_T_KEHADIRAN_MEETING_2] ([PID_KEHADIRAN], [TGL_PLAN], [TGL_ACT], [NRP], [NAMA], [KEHADIRAN], [KEHADIRAN_DESC], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY], [PID_PLAN_K_MEETING]) VALUES (N'679aee75-6bee-4486-b105-d676552241f7', NULL, CAST(0x7B3D0B00 AS Date), NULL, NULL, NULL, NULL, NULL, CAST(0x0000A820008BAF11 AS DateTime), N'2016030', CAST(0x0000A820008BAF11 AS DateTime), N'2016030', NULL)
INSERT [NANO].[TBL_T_KEHADIRAN_MEETING_2] ([PID_KEHADIRAN], [TGL_PLAN], [TGL_ACT], [NRP], [NAMA], [KEHADIRAN], [KEHADIRAN_DESC], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY], [PID_PLAN_K_MEETING]) VALUES (N'69e42498-f0d6-4ac5-b751-e9bf55e25e5a', NULL, CAST(0x7B3D0B00 AS Date), NULL, NULL, NULL, NULL, NULL, CAST(0x0000A820008BE420 AS DateTime), N'2016030', CAST(0x0000A820008BE420 AS DateTime), N'2016030', NULL)
INSERT [NANO].[TBL_T_KEHADIRAN_MEETING_2] ([PID_KEHADIRAN], [TGL_PLAN], [TGL_ACT], [NRP], [NAMA], [KEHADIRAN], [KEHADIRAN_DESC], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY], [PID_PLAN_K_MEETING]) VALUES (N'785b7b06-4fe7-4d6f-aba0-1eb0853c8834', NULL, CAST(0x7B3D0B00 AS Date), NULL, NULL, NULL, NULL, NULL, CAST(0x0000A820008ACB8E AS DateTime), N'2016030', CAST(0x0000A820008ACB8E AS DateTime), N'2016030', NULL)
INSERT [NANO].[TBL_T_KEHADIRAN_MEETING_2] ([PID_KEHADIRAN], [TGL_PLAN], [TGL_ACT], [NRP], [NAMA], [KEHADIRAN], [KEHADIRAN_DESC], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY], [PID_PLAN_K_MEETING]) VALUES (N'7aa07c7d-abb2-4044-b832-3c56b1d75a50', NULL, CAST(0x7B3D0B00 AS Date), NULL, NULL, NULL, NULL, NULL, CAST(0x0000A820008D21D4 AS DateTime), N'2016030', CAST(0x0000A820008D21EA AS DateTime), N'2016030', NULL)
INSERT [NANO].[TBL_T_KEHADIRAN_MEETING_2] ([PID_KEHADIRAN], [TGL_PLAN], [TGL_ACT], [NRP], [NAMA], [KEHADIRAN], [KEHADIRAN_DESC], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY], [PID_PLAN_K_MEETING]) VALUES (N'7df81ac7-4496-4507-8da5-5406194c0ade', NULL, CAST(0x7B3D0B00 AS Date), NULL, NULL, NULL, NULL, NULL, CAST(0x0000A820008BE420 AS DateTime), N'2016030', CAST(0x0000A820008BE420 AS DateTime), N'2016030', NULL)
INSERT [NANO].[TBL_T_KEHADIRAN_MEETING_2] ([PID_KEHADIRAN], [TGL_PLAN], [TGL_ACT], [NRP], [NAMA], [KEHADIRAN], [KEHADIRAN_DESC], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY], [PID_PLAN_K_MEETING]) VALUES (N'124124a1-7043-4a57-9ba6-c4a5bd4cbaf0', NULL, CAST(0x7B3D0B00 AS Date), NULL, NULL, NULL, NULL, NULL, CAST(0x0000A820008BFFEE AS DateTime), N'2016030', CAST(0x0000A820008BFFEE AS DateTime), N'2016030', NULL)
INSERT [NANO].[TBL_T_KEHADIRAN_MEETING_2] ([PID_KEHADIRAN], [TGL_PLAN], [TGL_ACT], [NRP], [NAMA], [KEHADIRAN], [KEHADIRAN_DESC], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY], [PID_PLAN_K_MEETING]) VALUES (N'12fd5b09-c522-4587-b19d-cce942c46910', NULL, CAST(0x7B3D0B00 AS Date), NULL, NULL, NULL, NULL, NULL, CAST(0x0000A820008CE7E2 AS DateTime), N'2016030', CAST(0x0000A820008CE7E2 AS DateTime), N'2016030', NULL)
INSERT [NANO].[TBL_T_KEHADIRAN_MEETING_2] ([PID_KEHADIRAN], [TGL_PLAN], [TGL_ACT], [NRP], [NAMA], [KEHADIRAN], [KEHADIRAN_DESC], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY], [PID_PLAN_K_MEETING]) VALUES (N'1457cd39-f640-4d2f-9a58-6f4b291e3e9c', NULL, CAST(0x7B3D0B00 AS Date), NULL, NULL, NULL, NULL, NULL, CAST(0x0000A82000886969 AS DateTime), N'2016030', CAST(0x0000A82000886969 AS DateTime), N'2016030', NULL)
INSERT [NANO].[TBL_T_KEHADIRAN_MEETING_2] ([PID_KEHADIRAN], [TGL_PLAN], [TGL_ACT], [NRP], [NAMA], [KEHADIRAN], [KEHADIRAN_DESC], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY], [PID_PLAN_K_MEETING]) VALUES (N'10e9f3fa-94b1-467a-8bef-71046853e6f2', NULL, CAST(0x7B3D0B00 AS Date), NULL, NULL, NULL, NULL, NULL, CAST(0x0000A820008BAF16 AS DateTime), N'2016030', CAST(0x0000A820008BAF16 AS DateTime), N'2016030', NULL)
INSERT [NANO].[TBL_T_KEHADIRAN_MEETING_2] ([PID_KEHADIRAN], [TGL_PLAN], [TGL_ACT], [NRP], [NAMA], [KEHADIRAN], [KEHADIRAN_DESC], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY], [PID_PLAN_K_MEETING]) VALUES (N'22e7546b-8708-42d5-b30e-b8daeb32e962', NULL, CAST(0x7B3D0B00 AS Date), NULL, NULL, NULL, NULL, NULL, CAST(0x0000A820008BFFEF AS DateTime), N'2016030', CAST(0x0000A820008BFFEF AS DateTime), N'2016030', NULL)
INSERT [NANO].[TBL_T_KEHADIRAN_MEETING_2] ([PID_KEHADIRAN], [TGL_PLAN], [TGL_ACT], [NRP], [NAMA], [KEHADIRAN], [KEHADIRAN_DESC], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY], [PID_PLAN_K_MEETING]) VALUES (N'0ada64e1-e592-40a8-a801-74ea980b2e22', NULL, CAST(0x7B3D0B00 AS Date), NULL, NULL, NULL, NULL, NULL, CAST(0x0000A820008BE41F AS DateTime), N'2016030', CAST(0x0000A820008BE41F AS DateTime), N'2016030', NULL)
INSERT [NANO].[TBL_T_KEHADIRAN_MEETING_2] ([PID_KEHADIRAN], [TGL_PLAN], [TGL_ACT], [NRP], [NAMA], [KEHADIRAN], [KEHADIRAN_DESC], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY], [PID_PLAN_K_MEETING]) VALUES (N'0d4b1a35-61ca-45bb-9824-b867c2fe4e24', NULL, CAST(0x7B3D0B00 AS Date), NULL, NULL, NULL, NULL, NULL, CAST(0x0000A820008930CA AS DateTime), N'2016030', CAST(0x0000A820008930CA AS DateTime), N'2016030', NULL)
INSERT [NANO].[TBL_T_KEHADIRAN_MEETING_2] ([PID_KEHADIRAN], [TGL_PLAN], [TGL_ACT], [NRP], [NAMA], [KEHADIRAN], [KEHADIRAN_DESC], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY], [PID_PLAN_K_MEETING]) VALUES (N'0fd7632a-50d5-4587-bace-e34f83c39e86', NULL, CAST(0x7B3D0B00 AS Date), NULL, NULL, NULL, NULL, NULL, CAST(0x0000A820008BFFEF AS DateTime), N'2016030', CAST(0x0000A820008BFFEF AS DateTime), N'2016030', NULL)
INSERT [NANO].[TBL_T_KEHADIRAN_MEETING_2] ([PID_KEHADIRAN], [TGL_PLAN], [TGL_ACT], [NRP], [NAMA], [KEHADIRAN], [KEHADIRAN_DESC], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY], [PID_PLAN_K_MEETING]) VALUES (N'3b5b4dce-8db1-49e5-80c6-de9b983469a0', NULL, CAST(0x7B3D0B00 AS Date), NULL, NULL, NULL, NULL, NULL, CAST(0x0000A820008BE421 AS DateTime), N'2016030', CAST(0x0000A820008BE421 AS DateTime), N'2016030', NULL)
INSERT [NANO].[TBL_T_KEHADIRAN_MEETING_2] ([PID_KEHADIRAN], [TGL_PLAN], [TGL_ACT], [NRP], [NAMA], [KEHADIRAN], [KEHADIRAN_DESC], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY], [PID_PLAN_K_MEETING]) VALUES (N'388f89e8-aaab-4a0f-b5f4-754d1b39bfd1', NULL, CAST(0x7B3D0B00 AS Date), NULL, NULL, NULL, NULL, NULL, CAST(0x0000A820008CE7C6 AS DateTime), N'2016030', CAST(0x0000A820008CE7C6 AS DateTime), N'2016030', NULL)
INSERT [NANO].[TBL_T_KEHADIRAN_MEETING_2] ([PID_KEHADIRAN], [TGL_PLAN], [TGL_ACT], [NRP], [NAMA], [KEHADIRAN], [KEHADIRAN_DESC], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY], [PID_PLAN_K_MEETING]) VALUES (N'3ac6c582-3977-4460-85ce-54670211768a', NULL, CAST(0x7B3D0B00 AS Date), NULL, NULL, NULL, NULL, NULL, CAST(0x0000A820008CE7A1 AS DateTime), N'2016030', CAST(0x0000A820008CE7A1 AS DateTime), N'2016030', NULL)
INSERT [NANO].[TBL_T_KEHADIRAN_MEETING_2] ([PID_KEHADIRAN], [TGL_PLAN], [TGL_ACT], [NRP], [NAMA], [KEHADIRAN], [KEHADIRAN_DESC], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY], [PID_PLAN_K_MEETING]) VALUES (N'2c8e6c67-5e8c-49e1-95c4-798017c185e7', NULL, CAST(0x7B3D0B00 AS Date), NULL, NULL, NULL, NULL, NULL, CAST(0x0000A820008CE849 AS DateTime), N'2016030', CAST(0x0000A820008CE849 AS DateTime), N'2016030', NULL)
INSERT [NANO].[TBL_T_KEHADIRAN_MEETING_2] ([PID_KEHADIRAN], [TGL_PLAN], [TGL_ACT], [NRP], [NAMA], [KEHADIRAN], [KEHADIRAN_DESC], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY], [PID_PLAN_K_MEETING]) VALUES (N'fe684038-b72f-4351-9b5e-8e9ce9bfc581', NULL, CAST(0x7B3D0B00 AS Date), NULL, NULL, NULL, NULL, NULL, CAST(0x0000A82000886969 AS DateTime), N'2016030', CAST(0x0000A82000886969 AS DateTime), N'2016030', NULL)
INSERT [NANO].[TBL_T_KEHADIRAN_MEETING_2] ([PID_KEHADIRAN], [TGL_PLAN], [TGL_ACT], [NRP], [NAMA], [KEHADIRAN], [KEHADIRAN_DESC], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY], [PID_PLAN_K_MEETING]) VALUES (N'fae4fb67-90be-4ad7-a5f9-409aa8577f43', NULL, CAST(0x7B3D0B00 AS Date), NULL, NULL, NULL, NULL, NULL, CAST(0x0000A820008BAF1B AS DateTime), N'2016030', CAST(0x0000A820008BAF1B AS DateTime), N'2016030', NULL)
INSERT [NANO].[TBL_T_KEHADIRAN_MEETING_2] ([PID_KEHADIRAN], [TGL_PLAN], [TGL_ACT], [NRP], [NAMA], [KEHADIRAN], [KEHADIRAN_DESC], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY], [PID_PLAN_K_MEETING]) VALUES (N'f764143a-196e-4bda-8f59-8bbebdbdc4b6', NULL, CAST(0x7B3D0B00 AS Date), NULL, NULL, NULL, NULL, NULL, CAST(0x0000A820008D263A AS DateTime), N'2016030', CAST(0x0000A820008D2651 AS DateTime), N'2016030', NULL)
INSERT [NANO].[TBL_T_KEHADIRAN_MEETING_2] ([PID_KEHADIRAN], [TGL_PLAN], [TGL_ACT], [NRP], [NAMA], [KEHADIRAN], [KEHADIRAN_DESC], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY], [PID_PLAN_K_MEETING]) VALUES (N'd2c72106-078f-4fde-8f7c-867b3203f905', NULL, CAST(0x7B3D0B00 AS Date), NULL, NULL, NULL, NULL, NULL, CAST(0x0000A820008930CA AS DateTime), N'2016030', CAST(0x0000A820008930CA AS DateTime), N'2016030', NULL)
INSERT [NANO].[TBL_T_KEHADIRAN_MEETING_2] ([PID_KEHADIRAN], [TGL_PLAN], [TGL_ACT], [NRP], [NAMA], [KEHADIRAN], [KEHADIRAN_DESC], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY], [PID_PLAN_K_MEETING]) VALUES (N'd5d17514-b5eb-4038-bf55-14b72b2e5e03', NULL, CAST(0x7B3D0B00 AS Date), NULL, NULL, NULL, NULL, NULL, CAST(0x0000A82000886964 AS DateTime), N'2016030', CAST(0x0000A82000886964 AS DateTime), N'2016030', NULL)
INSERT [NANO].[TBL_T_KEHADIRAN_MEETING_2] ([PID_KEHADIRAN], [TGL_PLAN], [TGL_ACT], [NRP], [NAMA], [KEHADIRAN], [KEHADIRAN_DESC], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY], [PID_PLAN_K_MEETING]) VALUES (N'd792a035-c72e-4669-b13b-877faffd8e93', NULL, CAST(0x7B3D0B00 AS Date), NULL, NULL, NULL, NULL, NULL, CAST(0x0000A820008D243C AS DateTime), N'2016030', CAST(0x0000A820008D2452 AS DateTime), N'2016030', NULL)
INSERT [NANO].[TBL_T_KEHADIRAN_MEETING_2] ([PID_KEHADIRAN], [TGL_PLAN], [TGL_ACT], [NRP], [NAMA], [KEHADIRAN], [KEHADIRAN_DESC], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY], [PID_PLAN_K_MEETING]) VALUES (N'c3cbe447-438b-45dd-a92e-357d3b8fc507', NULL, CAST(0x7B3D0B00 AS Date), NULL, NULL, NULL, NULL, NULL, CAST(0x0000A820008BFFEE AS DateTime), N'2016030', CAST(0x0000A820008BFFEE AS DateTime), N'2016030', NULL)
INSERT [NANO].[TBL_T_KEHADIRAN_MEETING_2] ([PID_KEHADIRAN], [TGL_PLAN], [TGL_ACT], [NRP], [NAMA], [KEHADIRAN], [KEHADIRAN_DESC], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY], [PID_PLAN_K_MEETING]) VALUES (N'ef40811c-bc9b-48dc-8536-b553f4b85775', CAST(0x513D0B00 AS Date), CAST(0x513D0B00 AS Date), N'6196076', N'SATARSO AGUS TJAHJONO', N'8', N'CUTI', NULL, CAST(0x0000A818011135E0 AS DateTime), N'2016030', CAST(0x0000A818011135E0 AS DateTime), N'2016030', NULL)
INSERT [NANO].[TBL_T_KEHADIRAN_MEETING_2] ([PID_KEHADIRAN], [TGL_PLAN], [TGL_ACT], [NRP], [NAMA], [KEHADIRAN], [KEHADIRAN_DESC], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY], [PID_PLAN_K_MEETING]) VALUES (N'dba26c8d-b8c9-4502-8bae-c06ef33a54b2', NULL, CAST(0x7B3D0B00 AS Date), NULL, NULL, NULL, NULL, NULL, CAST(0x0000A820008CE824 AS DateTime), N'2016030', CAST(0x0000A820008CE824 AS DateTime), N'2016030', NULL)
INSERT [NANO].[TBL_T_KEHADIRAN_MEETING_2] ([PID_KEHADIRAN], [TGL_PLAN], [TGL_ACT], [NRP], [NAMA], [KEHADIRAN], [KEHADIRAN_DESC], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY], [PID_PLAN_K_MEETING]) VALUES (N'dd0a121f-c254-4742-aecc-06e9e7e9d4e0', NULL, CAST(0x7B3D0B00 AS Date), NULL, NULL, NULL, NULL, NULL, CAST(0x0000A820008930CA AS DateTime), N'2016030', CAST(0x0000A820008930CA AS DateTime), N'2016030', NULL)
INSERT [NANO].[TBL_T_KEHADIRAN_MEETING_2] ([PID_KEHADIRAN], [TGL_PLAN], [TGL_ACT], [NRP], [NAMA], [KEHADIRAN], [KEHADIRAN_DESC], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY], [PID_PLAN_K_MEETING]) VALUES (N'ddabf31d-4e7c-4759-82f3-c3efd49ce914', NULL, CAST(0x7B3D0B00 AS Date), NULL, NULL, NULL, NULL, NULL, CAST(0x0000A820008BE41E AS DateTime), N'2016030', CAST(0x0000A820008BE41E AS DateTime), N'2016030', NULL)
INSERT [NANO].[TBL_T_KEHADIRAN_MEETING_2] ([PID_KEHADIRAN], [TGL_PLAN], [TGL_ACT], [NRP], [NAMA], [KEHADIRAN], [KEHADIRAN_DESC], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY], [PID_PLAN_K_MEETING]) VALUES (N'ded7c1ed-4f6d-42c7-856f-43a9b1d5b479', NULL, CAST(0x7B3D0B00 AS Date), NULL, NULL, NULL, NULL, NULL, CAST(0x0000A820008BAF11 AS DateTime), N'2016030', CAST(0x0000A820008BAF11 AS DateTime), N'2016030', NULL)
INSERT [NANO].[TBL_T_KEHADIRAN_MEETING_2] ([PID_KEHADIRAN], [TGL_PLAN], [TGL_ACT], [NRP], [NAMA], [KEHADIRAN], [KEHADIRAN_DESC], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY], [PID_PLAN_K_MEETING]) VALUES (N'e019aee3-41d5-42e7-ae44-b8461932c5a6', NULL, CAST(0x7B3D0B00 AS Date), NULL, NULL, NULL, NULL, NULL, CAST(0x0000A820008D2340 AS DateTime), N'2016030', CAST(0x0000A820008D2356 AS DateTime), N'2016030', NULL)
INSERT [NANO].[TBL_T_KEHADIRAN_MEETING_2] ([PID_KEHADIRAN], [TGL_PLAN], [TGL_ACT], [NRP], [NAMA], [KEHADIRAN], [KEHADIRAN_DESC], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY], [PID_PLAN_K_MEETING]) VALUES (N'e51f4e1e-36db-4399-b4c8-f057f4f4aab1', NULL, CAST(0x7B3D0B00 AS Date), NULL, NULL, NULL, NULL, NULL, CAST(0x0000A820008BFFED AS DateTime), N'2016030', CAST(0x0000A820008BFFED AS DateTime), N'2016030', NULL)
INSERT [NANO].[TBL_T_KEHADIRAN_MEETING_2] ([PID_KEHADIRAN], [TGL_PLAN], [TGL_ACT], [NRP], [NAMA], [KEHADIRAN], [KEHADIRAN_DESC], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY], [PID_PLAN_K_MEETING]) VALUES (N'e599433d-7d67-421f-9077-8b5d3493d4bc', NULL, CAST(0x7B3D0B00 AS Date), NULL, NULL, NULL, NULL, NULL, CAST(0x0000A820008BE421 AS DateTime), N'2016030', CAST(0x0000A820008BE421 AS DateTime), N'2016030', NULL)
INSERT [NANO].[TBL_T_KEHADIRAN_MEETING_2] ([PID_KEHADIRAN], [TGL_PLAN], [TGL_ACT], [NRP], [NAMA], [KEHADIRAN], [KEHADIRAN_DESC], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY], [PID_PLAN_K_MEETING]) VALUES (N'adcf4df5-7cb1-48bf-b93a-369c2c6161f3', NULL, CAST(0x7B3D0B00 AS Date), NULL, NULL, NULL, NULL, NULL, CAST(0x0000A82000886969 AS DateTime), N'2016030', CAST(0x0000A82000886969 AS DateTime), N'2016030', NULL)
INSERT [NANO].[TBL_T_KEHADIRAN_MEETING_2] ([PID_KEHADIRAN], [TGL_PLAN], [TGL_ACT], [NRP], [NAMA], [KEHADIRAN], [KEHADIRAN_DESC], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY], [PID_PLAN_K_MEETING]) VALUES (N'bd4446c9-b52f-413c-822b-ebd2bd22b77c', NULL, CAST(0x7B3D0B00 AS Date), NULL, NULL, NULL, NULL, NULL, CAST(0x0000A820008ACB8E AS DateTime), N'2016030', CAST(0x0000A820008ACB8E AS DateTime), N'2016030', NULL)
INSERT [NANO].[TBL_T_KEHADIRAN_MEETING_2] ([PID_KEHADIRAN], [TGL_PLAN], [TGL_ACT], [NRP], [NAMA], [KEHADIRAN], [KEHADIRAN_DESC], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY], [PID_PLAN_K_MEETING]) VALUES (N'c01ae01a-4fec-4509-96c0-f8ecab3c2df5', NULL, CAST(0x7B3D0B00 AS Date), NULL, NULL, NULL, NULL, NULL, CAST(0x0000A820008BFFD5 AS DateTime), N'2016030', CAST(0x0000A820008BFFD5 AS DateTime), N'2016030', NULL)
INSERT [NANO].[TBL_T_KEHADIRAN_MEETING_2] ([PID_KEHADIRAN], [TGL_PLAN], [TGL_ACT], [NRP], [NAMA], [KEHADIRAN], [KEHADIRAN_DESC], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY], [PID_PLAN_K_MEETING]) VALUES (N'c5e5576a-6d41-451f-9cbc-51809ce08b74', NULL, CAST(0x7B3D0B00 AS Date), NULL, NULL, NULL, NULL, NULL, CAST(0x0000A82000886969 AS DateTime), N'2016030', CAST(0x0000A82000886969 AS DateTime), N'2016030', NULL)
INSERT [NANO].[TBL_T_KEHADIRAN_MEETING_2] ([PID_KEHADIRAN], [TGL_PLAN], [TGL_ACT], [NRP], [NAMA], [KEHADIRAN], [KEHADIRAN_DESC], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY], [PID_PLAN_K_MEETING]) VALUES (N'c5eb4f77-337f-4132-963e-c9443dbc6e82', NULL, CAST(0x7B3D0B00 AS Date), NULL, NULL, NULL, NULL, NULL, CAST(0x0000A820008ACB93 AS DateTime), N'2016030', CAST(0x0000A820008ACB93 AS DateTime), N'2016030', NULL)
INSERT [NANO].[TBL_T_KEHADIRAN_MEETING_2] ([PID_KEHADIRAN], [TGL_PLAN], [TGL_ACT], [NRP], [NAMA], [KEHADIRAN], [KEHADIRAN_DESC], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY], [PID_PLAN_K_MEETING]) VALUES (N'8d6e9c1f-bc34-494b-a6b4-81bd045a2f17', NULL, CAST(0x7B3D0B00 AS Date), NULL, NULL, NULL, NULL, NULL, CAST(0x0000A820008930CA AS DateTime), N'2016030', CAST(0x0000A820008930CA AS DateTime), N'2016030', NULL)
INSERT [NANO].[TBL_T_KEHADIRAN_MEETING_2] ([PID_KEHADIRAN], [TGL_PLAN], [TGL_ACT], [NRP], [NAMA], [KEHADIRAN], [KEHADIRAN_DESC], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY], [PID_PLAN_K_MEETING]) VALUES (N'958df60f-c65c-4e39-bbc2-99cb3f21b017', NULL, CAST(0x7B3D0B00 AS Date), NULL, NULL, NULL, NULL, NULL, CAST(0x0000A82000886969 AS DateTime), N'2016030', CAST(0x0000A82000886969 AS DateTime), N'2016030', NULL)
INSERT [NANO].[TBL_T_KEHADIRAN_MEETING_2] ([PID_KEHADIRAN], [TGL_PLAN], [TGL_ACT], [NRP], [NAMA], [KEHADIRAN], [KEHADIRAN_DESC], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY], [PID_PLAN_K_MEETING]) VALUES (N'9fdfda7a-2917-440a-b96c-1294e0c5b4db', NULL, CAST(0x7B3D0B00 AS Date), NULL, NULL, NULL, NULL, NULL, CAST(0x0000A820008ACB93 AS DateTime), N'2016030', CAST(0x0000A820008ACB93 AS DateTime), N'2016030', NULL)
INSERT [NANO].[TBL_T_KEHADIRAN_MEETING_2] ([PID_KEHADIRAN], [TGL_PLAN], [TGL_ACT], [NRP], [NAMA], [KEHADIRAN], [KEHADIRAN_DESC], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY], [PID_PLAN_K_MEETING]) VALUES (N'02824809-E17C-4DD3-AE40-362E8E68FAB6', CAST(0xDD3D0B00 AS Date), CAST(0xD23D0B00 AS Date), N'6107067', N'AGUS BUDI HARTO', NULL, NULL, NULL, CAST(0x0000A877010A5E89 AS DateTime), N'1234', NULL, NULL, N'B466FA88-588D-4938-8929-1D920B64BB46')
INSERT [NANO].[TBL_T_KEHADIRAN_MEETING_2] ([PID_KEHADIRAN], [TGL_PLAN], [TGL_ACT], [NRP], [NAMA], [KEHADIRAN], [KEHADIRAN_DESC], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY], [PID_PLAN_K_MEETING]) VALUES (N'2CD8C37A-920A-46AE-BB5F-5EFA5D2F1EE2', CAST(0xDD3D0B00 AS Date), CAST(0xD23D0B00 AS Date), N'1708040', N'CASMITA', NULL, NULL, NULL, CAST(0x0000A877010A5E89 AS DateTime), N'1234', NULL, NULL, N'B466FA88-588D-4938-8929-1D920B64BB46')
INSERT [NANO].[TBL_T_KEHADIRAN_MEETING_2] ([PID_KEHADIRAN], [TGL_PLAN], [TGL_ACT], [NRP], [NAMA], [KEHADIRAN], [KEHADIRAN_DESC], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY], [PID_PLAN_K_MEETING]) VALUES (N'D600577C-4426-47BC-BF7D-DE59905F2CB9', CAST(0xDD3D0B00 AS Date), CAST(0xD23D0B00 AS Date), N'2016030', N'YAQUB EDY SUSILO', NULL, NULL, NULL, CAST(0x0000A877010A5E89 AS DateTime), N'1234', NULL, NULL, N'B466FA88-588D-4938-8929-1D920B64BB46')
INSERT [NANO].[TBL_T_KEHADIRAN_MEETING_2] ([PID_KEHADIRAN], [TGL_PLAN], [TGL_ACT], [NRP], [NAMA], [KEHADIRAN], [KEHADIRAN_DESC], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY], [PID_PLAN_K_MEETING]) VALUES (N'F565D5E1-2CF3-406F-8520-5382A2EA256E', CAST(0xDD3D0B00 AS Date), CAST(0xD23D0B00 AS Date), N'6196076', N'SATARSO AGUS TJAHJONO', NULL, NULL, NULL, CAST(0x0000A877010A5E89 AS DateTime), N'1234', NULL, NULL, N'B466FA88-588D-4938-8929-1D920B64BB46')
INSERT [NANO].[TBL_T_KEHADIRAN_MEETING_2] ([PID_KEHADIRAN], [TGL_PLAN], [TGL_ACT], [NRP], [NAMA], [KEHADIRAN], [KEHADIRAN_DESC], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY], [PID_PLAN_K_MEETING]) VALUES (N'78DFC7C6-9F49-4AAA-B520-653A7C5626DC', CAST(0xDD3D0B00 AS Date), CAST(0xD23D0B00 AS Date), N'6113882', N'ARTDITYO PRIAMBODHO', NULL, NULL, NULL, CAST(0x0000A877010A5E89 AS DateTime), N'1234', NULL, NULL, N'B466FA88-588D-4938-8929-1D920B64BB46')
INSERT [NANO].[TBL_T_KEHADIRAN_MEETING_2] ([PID_KEHADIRAN], [TGL_PLAN], [TGL_ACT], [NRP], [NAMA], [KEHADIRAN], [KEHADIRAN_DESC], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY], [PID_PLAN_K_MEETING]) VALUES (N'43208A20-5031-4610-9CD2-B3F0EE1BA284', CAST(0xDD3D0B00 AS Date), CAST(0xD23D0B00 AS Date), N'193078', N'SUKRON', NULL, NULL, NULL, CAST(0x0000A877010A5E89 AS DateTime), N'1234', NULL, NULL, N'B466FA88-588D-4938-8929-1D920B64BB46')
INSERT [NANO].[TBL_T_KEHADIRAN_MEETING_2] ([PID_KEHADIRAN], [TGL_PLAN], [TGL_ACT], [NRP], [NAMA], [KEHADIRAN], [KEHADIRAN_DESC], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY], [PID_PLAN_K_MEETING]) VALUES (N'C7787097-EB42-48F1-B8BA-C649F7691383', CAST(0xDD3D0B00 AS Date), CAST(0xD23D0B00 AS Date), N'2017038', N'ANNISAA RAHMAYANI NURFAJAR', NULL, NULL, NULL, CAST(0x0000A877010A5E89 AS DateTime), N'1234', NULL, NULL, N'B466FA88-588D-4938-8929-1D920B64BB46')
/****** Object:  UserDefinedFunction [NANO].[cufn_PersentaseKehadiran_2]    Script Date: 06/05/2018 07:42:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author		: Yaqub
-- Create date	: 27-10-2017
-- Description	: Menghitung PERSENTASI KEHADIRAN MEETING per Orang
-- =============================================
CREATE FUNCTION [NANO].[cufn_PersentaseKehadiran_2]
(
@sNrp varchar(10),
@sTgl varchar(50)
) 
	
	RETURNS FLOAT
	AS
	BEGIN
	
	DECLARE @iTglJoin date=(SELECT TGL_JOIN FROM NANO.TBL_M_EMPLOYEE_NANO WHERE NRP=@sNrp)
	DECLARE	@iHadir FLOAT=(
		SELECT COUNT(1) 
		FROM NANO.TBL_T_KEHADIRAN_MEETING_2
		where 
			 NRP=@sNrp 
			AND KEHADIRAN=1
			AND TGL_PLAN<=@sTgl
			AND TGL_ACT>=@iTglJoin
		)
	DECLARE @iTdkHadir FLOAT=(
		SELECT COUNT(1) 
		FROM NANO.TBL_T_KEHADIRAN_MEETING_2
		where --STATUS=1
			 NRP=@sNrp 
			AND TGL_PLAN<=@sTgl
			AND TGL_ACT>=@iTglJoin			
		)
		
	IF(@iHadir=0 AND @iTdkHadir=0)
		BEGIN
			SET @iTdkHadir=1
		END 
	DECLARE @Return FLOAT=(
	
	SELECT ROUND((@iHadir/@iTdkHadir)*100,2) AS PERSENTASE
	
	)

	RETURN @Return
	END


--DECLARE @sNrp VARCHAR(50)=2016030,
--		@sTgl DATE='2017-07-14',
--		@iTglJoin DATE='2017-07-28'
--SELECT COUNT(1) 
--		FROM NANO.VW_KEHADIRAN_MEETING
--		where 
--			 NRP=@sNrp 
--			AND KEHADIRAN=1
--			AND TGL_PLAN<=@sTgl
--			AND TGL_ACT>=@iTglJoin
			
--SELECT COUNT(1) 
--		FROM NANO.VW_KEHADIRAN_MEETING
--		where --STATUS=1
--			 NRP=@sNrp 
--			AND TGL_PLAN<=@sTgl
--			AND TGL_ACT>=@iTglJoin	
			
			
			
--SELECT ROUND((0/1)*2,2)
GO
/****** Object:  UserDefinedFunction [NANO].[cufn_PersentasePerMeering_2]    Script Date: 06/05/2018 07:42:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author		: Yaqub
-- Create date	: 27-10-2017
-- Description	: Menghitung PERSENTASI KEHADIRAN MEETING hari Terakhir
-- =============================================
CREATE FUNCTION [NANO].[cufn_PersentasePerMeering_2](
@sTglPlan varchar(10),
@sTglAct varchar(10)
) 
	
	RETURNS VARCHAR(100)
	AS
	BEGIN

	--DECLARE @sTglPlan DATE='2018-01-12', @sTglAct date='2018-01-19'
	DECLARE @iHadir FLOAT=(SELECT COUNT(1) 
							from NANO.TBL_T_KEHADIRAN_MEETING_2
							WHERE  KEHADIRAN=1 
							AND TGL_PLAN=@sTglPlan
							AND TGL_ACT=@sTglAct
							AND NRP IN (SELECT NRP FROM NANO.TBL_M_EMPLOYEE_NANO WHERE  TGL_JOIN<=@sTglPlan))


	DECLARE @Return FLOAT=(
		
	select round((@iHadir/COUNT(1))*100,2)
		from NANO.TBL_T_KEHADIRAN_MEETING_2
		where --STATUS=1
			 TGL_PLAN=@sTglPlan	
			 AND TGL_ACT=@sTglAct
			 AND NRP IN (SELECT NRP FROM NANO.TBL_M_EMPLOYEE_NANO WHERE  TGL_JOIN<=@sTglPlan)
	)

	RETURN @Return
	END
GO
/****** Object:  View [NANO].[VW_KEHADIRAN_MEETING_2]    Script Date: 06/05/2018 07:42:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [NANO].[VW_KEHADIRAN_MEETING_2]
AS
SELECT     
PID_KEHADIRAN, 
TGL_PLAN, 
TGL_ACT, 
NRP, 
NAMA, 
KEHADIRAN, 
KEHADIRAN_DESC, 
NANO.cufn_PersentaseKehadiran_2(NRP, TGL_PLAN) 
                      AS PERSENTASE, NANO.cufn_PersentasePerMeering_2(TGL_PLAN,TGL_ACT) AS PERSEN_NOW, KET,MODIFIED_DATE
FROM NANO.TBL_T_KEHADIRAN_MEETING_2
GO
/****** Object:  StoredProcedure [NANO].[cusp_Generate_Plan_2]    Script Date: 06/05/2018 07:42:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author	:	Yaqub
-- Create date: 20171023
-- Description:	Generate data to TBL_M_PLAN_K_MEETING and TBL_M_PLAN_VIP
-- =============================================
CREATE PROCEDURE [NANO].[cusp_Generate_Plan_2] --'2016030'
	-- Add the parameters for the stored procedure here
	 @pNRP varchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;   			
		
	DECLARE @TglAwal varchar(10)='2017-06-30',
			@Urutan int=1,
			@UrutanVIP int=4,
			@TglAwalVIP varchar(10)='2017-07-05'
			--,@pNRP varchar(50)='1234'
	
	
		
	--MAX TBL_M_PLAN_K_MEETING
	DECLARE @TglMax DATETIME=(SELECT TOP 1  TGL_PLAN FROM 
								(SELECT PID_PLAN_K_MEETING,TGL_PLAN  as TGL_PLAN,URUTAN FROM [DB_NANO].[NANO].TBL_M_PLAN_K_MEETING_2
								--UNION ALL	
								--SELECT '0' AS PID_PLAN_K_MEETING,@TglAwal AS TGL_PLAN, @Urutan AS URUTAN 
								)AS Z
							GROUP BY PID_PLAN_K_MEETING,TGL_PLAN,URUTAN
							ORDER BY TGL_PLAN DESC)
	--SELECT @TglMax +14
	
	IF (GETDATE() < @TglMax + 14)
		BEGIN
		
			DECLARE @PidPlanKMeeting VARCHAR(50)=(SELECT PID_PLAN_K_MEETING
			FROM [DB_NANO].[NANO].TBL_M_PLAN_K_MEETING
			WHERE TGL_PLAN= CONVERT(DATE,@TglMax)) 
			
			INSERT INTO NANO.TBL_T_KEHADIRAN_MEETING_2
			(
			PID_KEHADIRAN,
			TGL_PLAN,
			TGL_ACT,
			NRP,
			NAMA,
			CREATE_DATE,
			CREATE_BY,
			PID_PLAN_K_MEETING
			)
			SELECT 
			NEWID(),
			@TglMax + 14,
			CONVERT(DATE,GETDATE()),
			NRP,
			NAMA,
			GETDATE(),
			@pNRP,
			@PidPlanKMeeting			
			FROM NANO.TBL_M_EMPLOYEE_NANO 
			WHERE STATUS=1			
			
			
		END 
	--ELSE
	--	BEGIN 
	--		SELECT 'NO'
	--	END

		
	----MAX TBL_M_PLAN_VIP
	--DECLARE @TglMaxVIP DATETIME=(SELECT TOP 1  TGL_PLAN FROM 
	--							(SELECT PID_PLAN_VIP,TANGGAL as TGL_PLAN,URUTAN FROM [DB_NANO].[NANO].[TBL_M_PLAN_VIP]
	--							UNION ALL	
	--							SELECT '0' AS PID_PLAN_VIP,@TglAwalVIP AS TGL_PLAN, @Urutan AS URUTAN 
	--							)AS Z
	--						GROUP BY PID_PLAN_VIP,TGL_PLAN,URUTAN
	--						ORDER BY TGL_PLAN DESC)
							
							

							
						
	--IF(CONVERT(DATE, GETDATE()) >= CONVERT(DATE,@TglMax+11))
	--	BEGIN
	
		
	--	-- Insert TBL_M_PLAN_K_MEETING
	--	INSERT INTO [DB_NANO].NANO.TBL_M_PLAN_K_MEETING
	--		(
	--		PID_PLAN_K_MEETING,
	--		TGL_PLAN,
	--		URUTAN,
			
	--		CREATE_BY,
	--		CREATE_DATE,
	--		MODIFIED_BY,
	--		MODIFIED_DATE
	--		)	
				
	--		SELECT TOP 1 
	--		NEWID() AS PID_PLAN_K_MEETING
	--		,CONVERT(DATE,CONVERT(DATETIME,MAX(TGL_PLAN))+14) AS TGL_PLAN
	--		,CASE 	
	--			WHEN URUTAN<(SELECT MAX(URUTAN) FROM [DB_NANO].[NANO].[VW_PLAN_PIC])
	--				THEN URUTAN+1
	--			WHEN URUTAN=(SELECT MAX(URUTAN) FROM [DB_NANO].[NANO].[VW_PLAN_PIC])
	--				THEN 1		
	--		END AS URUTAN
			
	--		,@pNRP
	--		,GETDATE()
	--		,@pNRP
	--		,GETDATE()

	--		FROM 
	--			(SELECT PID_PLAN_K_MEETING,TGL_PLAN  as TGL_PLAN,URUTAN
	--			FROM
	--				[DB_NANO].[NANO].TBL_M_PLAN_K_MEETING
	--			UNION ALL	
	--			SELECT '0' AS PID_PLAN_K_MEETING,@TglAwal AS TGL_PLAN, @Urutan AS URUTAN 
	--			)AS Z
	--		GROUP BY PID_PLAN_K_MEETING,TGL_PLAN,URUTAN
	--		ORDER BY TGL_PLAN DESC
		
		
	--	--Insert TBL_M_PLAN_VIP		
	--	INSERT INTO [DB_NANO].[NANO].[TBL_M_PLAN_VIP]
	--		(
	--		PID_PLAN_VIP,
	--		TANGGAL,
	--		URUTAN,
			
	--		CREATE_BY,
	--		CREATE_DATE,
	--		MODIFIED_BY,
	--		MODIFIED_DATE
	--		)	
				
	--		SELECT TOP 1 
	--		NEWID() AS PID_PLAN_VIP
	--		,CONVERT(DATE,CONVERT(DATETIME,MAX(TANGGAL))+14) AS TANGGAL
	--		,CASE 	
	--			WHEN URUTAN<(SELECT MAX(URUTAN) FROM [DB_NANO].[NANO].[VW_PLAN_PIC])
	--				THEN URUTAN+1
	--			WHEN URUTAN=(SELECT MAX(URUTAN) FROM [DB_NANO].[NANO].[VW_PLAN_PIC])
	--				THEN 1		
	--		END AS URUTAN
			
	--		,@pNRP
	--		,GETDATE()
	--		,@pNRP
	--		,GETDATE()

	--		FROM 
	--			(SELECT PID_PLAN_VIP,TANGGAL,URUTAN
	--			FROM
	--				[DB_NANO].[NANO].[TBL_M_PLAN_VIP]
	--			UNION ALL	
	--			SELECT NEWID() AS PID_PLAN_VIP,@TglAwalVIP AS TANGGAL, @UrutanVIP AS URUTAN 
	--			)AS Z
	--		GROUP BY PID_PLAN_VIP,[TANGGAL],URUTAN
	--		ORDER BY [TANGGAL] DESC
	--	END

	
		
		
END
GO
/****** Object:  Table [dbo].[CH]    Script Date: 06/05/2018 07:42:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CH](
	[CH] [varchar](100) NULL,
	[LEVEL] [varchar](50) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[CH] ([CH], [LEVEL]) VALUES (N'Memberikan masukkan untuk Sel Nilai Inti NaNo', N'2-Sedang')
INSERT [dbo].[CH] ([CH], [LEVEL]) VALUES (N'Meminta masukkan atas masalah yang dihadapi', N'2-Sedang')
INSERT [dbo].[CH] ([CH], [LEVEL]) VALUES (N'Tip & Trik terkait Kesehatan', N'2-Sedang')
INSERT [dbo].[CH] ([CH], [LEVEL]) VALUES (N'Opini tentang bisnis PAMA', N'3-susah')
INSERT [dbo].[CH] ([CH], [LEVEL]) VALUES (N'Memberi kritik/masukkan yang positif rekan tim', N'3-susah')
INSERT [dbo].[CH] ([CH], [LEVEL]) VALUES (N'Memberi Nasehat 5 menit', N'2-Sedang')
INSERT [dbo].[CH] ([CH], [LEVEL]) VALUES (N'Stand up comedy', N'3-susah')
INSERT [dbo].[CH] ([CH], [LEVEL]) VALUES (N'Baca Puisi 1 menit', N'3-susah')
INSERT [dbo].[CH] ([CH], [LEVEL]) VALUES (N'Tip & Trik terkait Teknis', N'2-Sedang')
INSERT [dbo].[CH] ([CH], [LEVEL]) VALUES (N'Opini tentang Negera & Bangsa', N'3-susah')
INSERT [dbo].[CH] ([CH], [LEVEL]) VALUES (N'Memimpin gerakan olahraga selama 5 menit', N'1-Mudah')
INSERT [dbo].[CH] ([CH], [LEVEL]) VALUES (N'Sharing Makna ayat AlQuran & Hadis', N'3-susah')
INSERT [dbo].[CH] ([CH], [LEVEL]) VALUES (N'Sharing Pekerjaan 15 menit', N'1-Mudah')
INSERT [dbo].[CH] ([CH], [LEVEL]) VALUES (N'Story Telling non bahasa', N'3-susah')
INSERT [dbo].[CH] ([CH], [LEVEL]) VALUES (N'Menceritakan film yang pernah ditonton', N'2-Sedang')
INSERT [dbo].[CH] ([CH], [LEVEL]) VALUES (N'Menceritakan isi buku yang pernah dibaca', N'3-susah')
INSERT [dbo].[CH] ([CH], [LEVEL]) VALUES (N'Menggambar sambil cerita', N'1-Mudah')
INSERT [dbo].[CH] ([CH], [LEVEL]) VALUES (N'Nyanyi ', N'3-susah')
INSERT [dbo].[CH] ([CH], [LEVEL]) VALUES (N'Tip & Trik terkait Pertanian & Peternakan', N'2-Sedang')
INSERT [dbo].[CH] ([CH], [LEVEL]) VALUES (N'Sharing Pengalaman 15 menit', N'1-Mudah')
/****** Object:  Table [NANO].[TBL_T_KEGIATAN_MEETING]    Script Date: 06/05/2018 07:42:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [NANO].[TBL_T_KEGIATAN_MEETING](
	[PID_K_MEETING] [varchar](50) NOT NULL,
	[TGL_PLAN] [datetime] NULL,
	[TGL_ACT] [datetime] NULL,
	[SHEARING_PLAN] [varchar](10) NULL,
	[SHEARING_ACT] [varchar](10) NULL,
	[SHEARING_TOPIC] [varchar](200) NULL,
	[NOTULEN_PLAN] [varchar](10) NULL,
	[NOTULEN_ACT] [varchar](10) NULL,
	[KET] [varchar](100) NULL,
	[CREATE_DATE] [datetime] NULL,
	[CREATE_BY] [varchar](10) NULL,
	[MODIFIED_DATE] [datetime] NULL,
	[MODIFIED_BY] [varchar](10) NULL,
 CONSTRAINT [PK_TBL_KEGIATAN_MEETING] PRIMARY KEY CLUSTERED 
(
	[PID_K_MEETING] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [NANO].[TBL_T_KEGIATAN_MEETING] ([PID_K_MEETING], [TGL_PLAN], [TGL_ACT], [SHEARING_PLAN], [SHEARING_ACT], [SHEARING_TOPIC], [NOTULEN_PLAN], [NOTULEN_ACT], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY]) VALUES (N'038c7c1f-4969-47bc-b861-56f70229c20e', CAST(0x0000A81200000000 AS DateTime), CAST(0x0000A81200000000 AS DateTime), N'193078', N'6107067', N'English Conversation', N'6107067', N'2017038', NULL, CAST(0x0000A81900A6D828 AS DateTime), N'2017038', CAST(0x0000A81900A6D828 AS DateTime), N'2017038')
INSERT [NANO].[TBL_T_KEGIATAN_MEETING] ([PID_K_MEETING], [TGL_PLAN], [TGL_ACT], [SHEARING_PLAN], [SHEARING_ACT], [SHEARING_TOPIC], [NOTULEN_PLAN], [NOTULEN_ACT], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY]) VALUES (N'04140287-4f72-4470-8203-f8352c13a1e3', CAST(0x0000A7CC00000000 AS DateTime), CAST(0x0000A7CC00000000 AS DateTime), N'6107067', N'6107067', N'Pengambilan Keputusan', N'2016030', N'6107067', NULL, CAST(0x0000A81900A603BE AS DateTime), N'6107067', CAST(0x0000A81900A603BE AS DateTime), N'6107067')
INSERT [NANO].[TBL_T_KEGIATAN_MEETING] ([PID_K_MEETING], [TGL_PLAN], [TGL_ACT], [SHEARING_PLAN], [SHEARING_ACT], [SHEARING_TOPIC], [NOTULEN_PLAN], [NOTULEN_ACT], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY]) VALUES (N'074ea617-23a0-4ce7-93ed-332e0d982c97', CAST(0x0000A80400000000 AS DateTime), CAST(0x0000A80400000000 AS DateTime), N'2017038', N'2017038', N'Aktivitas dalam Employee Gathering', N'193078', N'6107067', NULL, CAST(0x0000A81900A6A5C1 AS DateTime), N'6107067', CAST(0x0000A81900A6A5C1 AS DateTime), N'6107067')
INSERT [NANO].[TBL_T_KEGIATAN_MEETING] ([PID_K_MEETING], [TGL_PLAN], [TGL_ACT], [SHEARING_PLAN], [SHEARING_ACT], [SHEARING_TOPIC], [NOTULEN_PLAN], [NOTULEN_ACT], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY]) VALUES (N'285a3d7c-5af1-44e1-915c-0a6b9f4ece94', CAST(0x0000A82000000000 AS DateTime), CAST(0x0000A820009099C9 AS DateTime), N'6107067', N'6107067', N'Digitalisasi Kegiatan Sel Nano', N'2016030', N'2016030', N'Perbandingan ASP.NET dengan ASP', CAST(0x0000A820008A7836 AS DateTime), N'2016030', CAST(0x0000A820009099C9 AS DateTime), N'2016030')
INSERT [NANO].[TBL_T_KEGIATAN_MEETING] ([PID_K_MEETING], [TGL_PLAN], [TGL_ACT], [SHEARING_PLAN], [SHEARING_ACT], [SHEARING_TOPIC], [NOTULEN_PLAN], [NOTULEN_ACT], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY]) VALUES (N'4fad4fb2-f564-4649-907d-35f8b0cc14d4', CAST(0x0000A7DA00000000 AS DateTime), CAST(0x0000A7DA00000000 AS DateTime), N'2016030', N'2016030', N'Manfaat mandi pagi sebelum sholat shubuh', N'6196076', N'6107067', NULL, CAST(0x0000A81900A628B6 AS DateTime), N'6107067', CAST(0x0000A81900A628B6 AS DateTime), N'6107067')
INSERT [NANO].[TBL_T_KEGIATAN_MEETING] ([PID_K_MEETING], [TGL_PLAN], [TGL_ACT], [SHEARING_PLAN], [SHEARING_ACT], [SHEARING_TOPIC], [NOTULEN_PLAN], [NOTULEN_ACT], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY]) VALUES (N'59fabf43-61d1-4f6c-bf7f-df1fbf64c5bc', CAST(0x0000A7E800000000 AS DateTime), CAST(0x0000A7E800000000 AS DateTime), N'6196076', N'6113882', N'Tips  & trick tentang tanaman', N'6113882', N'6113882', NULL, CAST(0x0000A81900A71BA2 AS DateTime), N'6113882', CAST(0x0000A81900A71BA2 AS DateTime), N'6113882')
INSERT [NANO].[TBL_T_KEGIATAN_MEETING] ([PID_K_MEETING], [TGL_PLAN], [TGL_ACT], [SHEARING_PLAN], [SHEARING_ACT], [SHEARING_TOPIC], [NOTULEN_PLAN], [NOTULEN_ACT], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY]) VALUES (N'672dbf1e-9c9e-4044-9bb0-ff190b7cc5c2', CAST(0x0000A7F600000000 AS DateTime), CAST(0x0000A7F600000000 AS DateTime), N'6113882', N'6107067', N'Website Sel Nano', N'2017038', N'6107067', NULL, CAST(0x0000A81900A67E2D AS DateTime), N'6107067', CAST(0x0000A81900A67E2D AS DateTime), N'6107067')
INSERT [NANO].[TBL_T_KEGIATAN_MEETING] ([PID_K_MEETING], [TGL_PLAN], [TGL_ACT], [SHEARING_PLAN], [SHEARING_ACT], [SHEARING_TOPIC], [NOTULEN_PLAN], [NOTULEN_ACT], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY]) VALUES (N'708e3df7-290a-4b54-877a-7823485f7441', CAST(0x0000A88200000000 AS DateTime), CAST(0x0000A88200894D71 AS DateTime), N'6107067', N'6107067', NULL, N'2016030', N'2016030', NULL, CAST(0x0000A88200894D71 AS DateTime), N'2016030', CAST(0x0000A88200894D71 AS DateTime), N'2016030')
INSERT [NANO].[TBL_T_KEGIATAN_MEETING] ([PID_K_MEETING], [TGL_PLAN], [TGL_ACT], [SHEARING_PLAN], [SHEARING_ACT], [SHEARING_TOPIC], [NOTULEN_PLAN], [NOTULEN_ACT], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY]) VALUES (N'72212e42-0c93-476e-9eb1-2d1f004227dc', CAST(0x0000A85800000000 AS DateTime), CAST(0x0000A85C0087BE7D AS DateTime), N'6113882', N'6113882', NULL, N'2017038', N'2017038', NULL, CAST(0x0000A85C0087BE7D AS DateTime), N'2017038', CAST(0x0000A85C0087BE7D AS DateTime), N'2017038')
INSERT [NANO].[TBL_T_KEGIATAN_MEETING] ([PID_K_MEETING], [TGL_PLAN], [TGL_ACT], [SHEARING_PLAN], [SHEARING_ACT], [SHEARING_TOPIC], [NOTULEN_PLAN], [NOTULEN_ACT], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY]) VALUES (N'7f22272a-d780-4c63-ac43-4038156e03ed', CAST(0x0000A8C800000000 AS DateTime), CAST(0x0000A8C800F62971 AS DateTime), N'2017038', N'2017038', NULL, N'193078', N'193078', NULL, CAST(0x0000A8C800F62971 AS DateTime), N'193078', CAST(0x0000A8C800F62971 AS DateTime), N'193078')
INSERT [NANO].[TBL_T_KEGIATAN_MEETING] ([PID_K_MEETING], [TGL_PLAN], [TGL_ACT], [SHEARING_PLAN], [SHEARING_ACT], [SHEARING_TOPIC], [NOTULEN_PLAN], [NOTULEN_ACT], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY]) VALUES (N'84c97d2f-713e-4eb6-bce9-3980a466358e', CAST(0x0000A83C00000000 AS DateTime), CAST(0x0000A83B00982679 AS DateTime), N'6196076', N'-', N'Diskusi Program TASAKUR (Tantangan Spontanitas Terukur)', N'6113882', N'2016030', NULL, CAST(0x0000A83B00885496 AS DateTime), N'2016030', CAST(0x0000A83B00982687 AS DateTime), N'2016030')
INSERT [NANO].[TBL_T_KEGIATAN_MEETING] ([PID_K_MEETING], [TGL_PLAN], [TGL_ACT], [SHEARING_PLAN], [SHEARING_ACT], [SHEARING_TOPIC], [NOTULEN_PLAN], [NOTULEN_ACT], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY]) VALUES (N'8f2ff59a-2866-4c40-b1ef-62e9e5af9dc4', CAST(0x0000A86600000000 AS DateTime), CAST(0x0000A8660096DA75 AS DateTime), N'2017038', N'2017038', NULL, N'193078', N'193078', NULL, CAST(0x0000A8660096DA75 AS DateTime), N'193078', CAST(0x0000A8660096DA75 AS DateTime), N'193078')
INSERT [NANO].[TBL_T_KEGIATAN_MEETING] ([PID_K_MEETING], [TGL_PLAN], [TGL_ACT], [SHEARING_PLAN], [SHEARING_ACT], [SHEARING_TOPIC], [NOTULEN_PLAN], [NOTULEN_ACT], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY]) VALUES (N'8f6868ae-4df3-47c9-89e7-81c5bca7a9e3', CAST(0x0000A87400000000 AS DateTime), CAST(0x0000A874008BCEBA AS DateTime), N'193078', N'193078', NULL, N'6107067', N'6113882', NULL, CAST(0x0000A874008BCEBA AS DateTime), N'6113882', CAST(0x0000A874008BCEBA AS DateTime), N'6113882')
INSERT [NANO].[TBL_T_KEGIATAN_MEETING] ([PID_K_MEETING], [TGL_PLAN], [TGL_ACT], [SHEARING_PLAN], [SHEARING_ACT], [SHEARING_TOPIC], [NOTULEN_PLAN], [NOTULEN_ACT], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY]) VALUES (N'998a62fc-5816-4102-bbd4-38c414a856f5', CAST(0x0000A8D600000000 AS DateTime), CAST(0x0000A8D600000000 AS DateTime), N'193078', N'193078', NULL, N'6107067', N'6107067', NULL, CAST(0x0000A8D60092C875 AS DateTime), N'6107067', CAST(0x0000A8D60092C875 AS DateTime), N'6107067')
INSERT [NANO].[TBL_T_KEGIATAN_MEETING] ([PID_K_MEETING], [TGL_PLAN], [TGL_ACT], [SHEARING_PLAN], [SHEARING_ACT], [SHEARING_TOPIC], [NOTULEN_PLAN], [NOTULEN_ACT], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY]) VALUES (N'aa661b0f-589a-4c41-89f4-f52ff0f41df5', CAST(0x0000A8E400000000 AS DateTime), CAST(0x0000A8E4009340DA AS DateTime), N'6107067', N'6107067', NULL, N'2016030', N'2016030', NULL, CAST(0x0000A8E4009340DA AS DateTime), N'2016030', CAST(0x0000A8E4009340DA AS DateTime), N'2016030')
INSERT [NANO].[TBL_T_KEGIATAN_MEETING] ([PID_K_MEETING], [TGL_PLAN], [TGL_ACT], [SHEARING_PLAN], [SHEARING_ACT], [SHEARING_TOPIC], [NOTULEN_PLAN], [NOTULEN_ACT], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY]) VALUES (N'be923ddd-d8fd-4630-9ad1-26da9428aca1', CAST(0x0000A82E00000000 AS DateTime), CAST(0x0000A82E00E34C9C AS DateTime), N'2016030', N'-', N'Diskusi Program TASAKUR (Tantangan Spontanitas Terukur)', N'6196076', N'2017038', NULL, CAST(0x0000A82E00E34C9B AS DateTime), N'2017038', CAST(0x0000A82E00E34C9B AS DateTime), N'2017038')
INSERT [NANO].[TBL_T_KEGIATAN_MEETING] ([PID_K_MEETING], [TGL_PLAN], [TGL_ACT], [SHEARING_PLAN], [SHEARING_ACT], [SHEARING_TOPIC], [NOTULEN_PLAN], [NOTULEN_ACT], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY]) VALUES (N'd9b2b222-8ea2-4810-a2b8-e56658627fb3', CAST(0x0000A84A00000000 AS DateTime), CAST(0x0000A84A0097E132 AS DateTime), N'0001', N'-', N'Menjalankan program TASAKUR ', N'6113882', N'6113882', NULL, CAST(0x0000A84A0097E132 AS DateTime), N'6113882', CAST(0x0000A84A0097E132 AS DateTime), N'6113882')
INSERT [NANO].[TBL_T_KEGIATAN_MEETING] ([PID_K_MEETING], [TGL_PLAN], [TGL_ACT], [SHEARING_PLAN], [SHEARING_ACT], [SHEARING_TOPIC], [NOTULEN_PLAN], [NOTULEN_ACT], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY]) VALUES (N'f1f66e7e-a6d7-4f9a-85ba-678c8aa72cf5', CAST(0x0000A8BA00000000 AS DateTime), CAST(0x0000A8BA0084BDB2 AS DateTime), N'6113882', N'6107067', NULL, N'2017038', N'2017038', NULL, CAST(0x0000A8BA0084BDB2 AS DateTime), N'2017038', CAST(0x0000A8BA0084BDB2 AS DateTime), N'2017038')
INSERT [NANO].[TBL_T_KEGIATAN_MEETING] ([PID_K_MEETING], [TGL_PLAN], [TGL_ACT], [SHEARING_PLAN], [SHEARING_ACT], [SHEARING_TOPIC], [NOTULEN_PLAN], [NOTULEN_ACT], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY]) VALUES (N'ff6f6120-06b3-418d-ad44-94012c5d884d', CAST(0x0000A89000000000 AS DateTime), CAST(0x0000A89000998636 AS DateTime), N'2016030', N'2016030', NULL, N'6196076', N'2017038', NULL, CAST(0x0000A89000998636 AS DateTime), N'2017038', CAST(0x0000A89000998636 AS DateTime), N'2017038')
/****** Object:  View [NANO].[VW_KEGIATAN_MEETING]    Script Date: 06/05/2018 07:42:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [NANO].[VW_KEGIATAN_MEETING]
AS
SELECT     A.PID_K_MEETING, B.TGL_PLAN, A.TGL_ACT, B.UTAMA AS SHEARING_PLAN, B.UTAMA_DESC AS SHEARING_PLAN_NAMA, A.SHEARING_ACT, 
                      NRP1.NAMA AS SHEARING_ACT_NAMA, A.SHEARING_TOPIC, 
                      CASE WHEN A.NOTULEN_PLAN IS NULL THEN B.CADANGAN ELSE A.NOTULEN_PLAN END AS NOTULEN_PLAN, 
                       CASE WHEN A.NOTULEN_PLAN IS NULL THEN B.CADANGAN_DESC ELSE NRP3.NAMA END  AS NOTULEN_PLAN_NAMA,                       
                      A.NOTULEN_ACT,NRP2.NAMA AS NOTULEN_ACT_NAMA, A.KET
FROM         (SELECT     Y.TGL_PLAN, X.UTAMA, X.UTAMA_DESC, X.CADANGAN, X.CADANGAN_DESC
                       FROM          NANO.VW_PLAN_PIC AS X INNER JOIN
                                              NANO.TBL_M_PLAN_K_MEETING AS Y ON X.URUTAN = Y.URUTAN) AS B LEFT OUTER JOIN
                      NANO.TBL_T_KEGIATAN_MEETING AS A LEFT OUTER JOIN
                      NANO.VW_TBL_M_EMPLOYEE_NANO AS NRP2 ON A.NOTULEN_ACT = NRP2.NRP LEFT OUTER JOIN
                      NANO.VW_TBL_M_EMPLOYEE_NANO AS NRP1 ON A.SHEARING_ACT = NRP1.NRP LEFT OUTER JOIN
                      NANO.VW_TBL_M_EMPLOYEE_NANO AS NRP3 ON A.NOTULEN_PLAN = NRP3.NRP 
                      ON --B.CADANGAN = A.NOTULEN_PLAN AND B.UTAMA = A.SHEARING_PLAN AND 
                      B.TGL_PLAN = A.TGL_PLAN
                      and B.UTAMA=A.SHEARING_PLAN
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[47] 4[17] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "A"
            Begin Extent = 
               Top = 5
               Left = 398
               Bottom = 265
               Right = 597
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "NRP2"
            Begin Extent = 
               Top = 214
               Left = 665
               Bottom = 333
               Right = 836
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "NRP1"
            Begin Extent = 
               Top = 205
               Left = 105
               Bottom = 324
               Right = 276
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "B"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 125
               Right = 215
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 14
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 2340
         Alias = 1815
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 135' , @level0type=N'SCHEMA',@level0name=N'NANO', @level1type=N'VIEW',@level1name=N'VW_KEGIATAN_MEETING'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'0
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'NANO', @level1type=N'VIEW',@level1name=N'VW_KEGIATAN_MEETING'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'NANO', @level1type=N'VIEW',@level1name=N'VW_KEGIATAN_MEETING'
GO
/****** Object:  Table [NANO].[TBL_T_GALERY]    Script Date: 06/05/2018 07:42:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [NANO].[TBL_T_GALERY](
	[PID_GALERY] [varchar](50) NOT NULL,
	[FILE_PATH] [varchar](100) NULL,
	[FILE_DESC] [varchar](50) NULL,
	[CREATE_DATE] [datetime] NULL,
	[CREATE_BY] [varchar](10) NULL,
	[MODIFIED_DATE] [datetime] NULL,
	[MODIFIED_BY] [varchar](10) NULL,
 CONSTRAINT [PK_TBL_T_GALERY] PRIMARY KEY CLUSTERED 
(
	[PID_GALERY] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [NANO].[TBL_T_GALERY] ([PID_GALERY], [FILE_PATH], [FILE_DESC], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY]) VALUES (N'0974e97d-9913-4771-98f4-8b6214e8fd53', N'NANO_12012018_10.38.29.665.jpg', N'Challenge 12-01-2018', CAST(0x0000A86600AF5E2D AS DateTime), N'2016030', CAST(0x0000A86600AF5E2D AS DateTime), N'2016030')
INSERT [NANO].[TBL_T_GALERY] ([PID_GALERY], [FILE_PATH], [FILE_DESC], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY]) VALUES (N'1e511a56-e182-4fac-a853-4d9e71b91131', N'NANO_12012018_10.38.29.556.jpeg', N'Challenge 12-01-2018', CAST(0x0000A86600AF5E08 AS DateTime), N'2016030', CAST(0x0000A86600AF5E08 AS DateTime), N'2016030')
INSERT [NANO].[TBL_T_GALERY] ([PID_GALERY], [FILE_PATH], [FILE_DESC], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY]) VALUES (N'2dbca9b4-5de5-4621-b292-d1773782a05c', N'NANO_29012018_8.11.31.787.jpg', N'Challenge 12-01-2018', CAST(0x0000A877008700B9 AS DateTime), N'2016030', CAST(0x0000A877008700B9 AS DateTime), N'2016030')
INSERT [NANO].[TBL_T_GALERY] ([PID_GALERY], [FILE_PATH], [FILE_DESC], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY]) VALUES (N'67e65669-dfab-4e9e-9acc-d29fe8203f7b', N'NANO_29012018_8.11.28.713.jpg', N'Challenge 26-01-2018', CAST(0x0000A8770086FD1B AS DateTime), N'2016030', CAST(0x0000A8770086FD1B AS DateTime), N'2016030')
INSERT [NANO].[TBL_T_GALERY] ([PID_GALERY], [FILE_PATH], [FILE_DESC], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY]) VALUES (N'6a659c6e-b770-470d-a017-1af19f38b274', N'NANO_12012018_10.38.27.918.jpg', N'Challenge 12-01-2018', CAST(0x0000A86600AF5C21 AS DateTime), N'2016030', CAST(0x0000A86600AF5C21 AS DateTime), N'2016030')
INSERT [NANO].[TBL_T_GALERY] ([PID_GALERY], [FILE_PATH], [FILE_DESC], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY]) VALUES (N'72829afa-7d2a-4f2f-83c6-2e9d96c6747b', N'NANO_12012018_10.38.30.196.jpg', N'Challenge 12-01-2018', CAST(0x0000A86600AF5EC8 AS DateTime), N'2016030', CAST(0x0000A86600AF5EC8 AS DateTime), N'2016030')
INSERT [NANO].[TBL_T_GALERY] ([PID_GALERY], [FILE_PATH], [FILE_DESC], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY]) VALUES (N'7bd7e095-12b6-4cf1-b5da-01606e309a2e', N'NANO_14022018_9.18.39.154.jpg', N'Challenge 09-02-2018', CAST(0x0000A88700997047 AS DateTime), N'2016030', CAST(0x0000A88700997047 AS DateTime), N'2016030')
INSERT [NANO].[TBL_T_GALERY] ([PID_GALERY], [FILE_PATH], [FILE_DESC], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY]) VALUES (N'83d07bc3-ccb3-412b-9369-d7e24a0a3c92', N'NANO_12012018_10.38.30.648.jpg', N'Challenge 12-01-2018', CAST(0x0000A86600AF5F4F AS DateTime), N'2016030', CAST(0x0000A86600AF5F4F AS DateTime), N'2016030')
INSERT [NANO].[TBL_T_GALERY] ([PID_GALERY], [FILE_PATH], [FILE_DESC], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY]) VALUES (N'901c512b-fb34-4db0-b80c-dbc8a466de22', N'NANO_12012018_10.38.28.90.jpg', N'Challenge 12-01-2018', CAST(0x0000A86600AF5C50 AS DateTime), N'2016030', CAST(0x0000A86600AF5C50 AS DateTime), N'2016030')
INSERT [NANO].[TBL_T_GALERY] ([PID_GALERY], [FILE_PATH], [FILE_DESC], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY]) VALUES (N'c709f8fc-f39a-48db-87bb-3c680bcae068', N'NANO_29012018_8.09.07.163.jpg', N'Challenge 26-01-2018', CAST(0x0000A87700865756 AS DateTime), N'2016030', CAST(0x0000A87700865756 AS DateTime), N'2016030')
INSERT [NANO].[TBL_T_GALERY] ([PID_GALERY], [FILE_PATH], [FILE_DESC], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY]) VALUES (N'dca584c9-6136-4dd1-a8e3-e0de53f3c02d', N'NANO_14022018_9.20.57.245.jpg', N'Challenge 09-02-2018', CAST(0x0000A887009A1224 AS DateTime), N'2016030', CAST(0x0000A887009A1224 AS DateTime), N'2016030')
/****** Object:  Table [NANO].[TBL_T_CHALLENGE_backup]    Script Date: 06/05/2018 07:42:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [NANO].[TBL_T_CHALLENGE_backup](
	[PID_T_CH] [varchar](50) NOT NULL,
	[TANGGAL] [datetime] NULL,
	[NRP] [varchar](10) NULL,
	[NAMA] [varchar](50) NULL,
	[PID_CH] [varchar](50) NULL,
	[CHALLENGE] [varchar](50) NULL,
	[CREATE_DATE] [datetime] NULL,
	[CREATE_BY] [varchar](10) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [NANO].[TBL_T_CHALLENGE_backup] ([PID_T_CH], [TANGGAL], [NRP], [NAMA], [PID_CH], [CHALLENGE], [CREATE_DATE], [CREATE_BY]) VALUES (N'0412e4a3-4051-42dc-8bd7-0d7781c1006a', CAST(0x0000A84A0090DDAF AS DateTime), N'193078', N'SUKRON', N'521A5E21-64EB-4472-8F97-2120F572B567', N'Memberi Nasehat 5 menit', CAST(0x0000A84A0090DDAF AS DateTime), N'6113882')
INSERT [NANO].[TBL_T_CHALLENGE_backup] ([PID_T_CH], [TANGGAL], [NRP], [NAMA], [PID_CH], [CHALLENGE], [CREATE_DATE], [CREATE_BY]) VALUES (N'0adaf4bd-66b7-4794-add6-fbea9101ed3f', CAST(0x0000A86600940F26 AS DateTime), N'2017038', N'ANNISAA RAHMAYANI NURFAJAR', N'521A5E21-64EB-4472-8F97-2120F572B567', N'Memberi Nasehat 5 menit', CAST(0x0000A86600940F26 AS DateTime), N'193078')
INSERT [NANO].[TBL_T_CHALLENGE_backup] ([PID_T_CH], [TANGGAL], [NRP], [NAMA], [PID_CH], [CHALLENGE], [CREATE_DATE], [CREATE_BY]) VALUES (N'287b83f2-4db7-45ab-b121-1322b4a3ee8d', CAST(0x0000A85C008F96F6 AS DateTime), N'2016030', N'YAQUB EDY SUSILO', N'A17A908F-F5D6-4804-9474-EE3E1CA98140', N'Sharing Pekerjaan 15 menit', CAST(0x0000A85C008F96F6 AS DateTime), N'2017038')
INSERT [NANO].[TBL_T_CHALLENGE_backup] ([PID_T_CH], [TANGGAL], [NRP], [NAMA], [PID_CH], [CHALLENGE], [CREATE_DATE], [CREATE_BY]) VALUES (N'41ad5560-e21d-4feb-a16f-233aa1a9b0dc', CAST(0x0000A84A008AF6FF AS DateTime), N'2016030', N'YAQUB EDY SUSILO', N'A17A908F-F5D6-4804-9474-EE3E1CA98140', N'Sharing Pekerjaan 15 menit', CAST(0x0000A84A008AF6FF AS DateTime), N'6113882')
INSERT [NANO].[TBL_T_CHALLENGE_backup] ([PID_T_CH], [TANGGAL], [NRP], [NAMA], [PID_CH], [CHALLENGE], [CREATE_DATE], [CREATE_BY]) VALUES (N'487b2e15-d513-4f35-8c7b-da1b54758202', CAST(0x0000A86600917F47 AS DateTime), N'6113882', N'ARTDITYO PRIAMBODHO', N'A17A908F-F5D6-4804-9474-EE3E1CA98140', N'Sharing Pekerjaan 15 menit', CAST(0x0000A86600917F47 AS DateTime), N'193078')
INSERT [NANO].[TBL_T_CHALLENGE_backup] ([PID_T_CH], [TANGGAL], [NRP], [NAMA], [PID_CH], [CHALLENGE], [CREATE_DATE], [CREATE_BY]) VALUES (N'663d376c-59e6-4087-83df-076c1807f301', CAST(0x0000A84A008EAAF8 AS DateTime), N'2017038', N'ANNISAA RAHMAYANI NURFAJAR', N'A17A908F-F5D6-4804-9474-EE3E1CA98140', N'Sharing Pekerjaan 15 menit', CAST(0x0000A84A008EAAF8 AS DateTime), N'6113882')
INSERT [NANO].[TBL_T_CHALLENGE_backup] ([PID_T_CH], [TANGGAL], [NRP], [NAMA], [PID_CH], [CHALLENGE], [CREATE_DATE], [CREATE_BY]) VALUES (N'6d0fd633-ced3-4b7b-8afb-d6b3be14dcb0', CAST(0x0000A85C009005D7 AS DateTime), N'193078', N'SUKRON', N'6C7909D2-DA2B-42FA-92A6-6757C730BD07', N'Memimpin gerakan olahraga selama 5 menit', CAST(0x0000A85C009005D7 AS DateTime), N'2017038')
INSERT [NANO].[TBL_T_CHALLENGE_backup] ([PID_T_CH], [TANGGAL], [NRP], [NAMA], [PID_CH], [CHALLENGE], [CREATE_DATE], [CREATE_BY]) VALUES (N'726db632-346c-4d86-b89e-9970fe0c2d5f', CAST(0x0000A86600968A62 AS DateTime), N'2016030', N'YAQUB EDY SUSILO', N'F88399A7-A3DD-4268-A23A-67955A1CB668', N'Sharing Pengalaman 15 menit', CAST(0x0000A86600968A62 AS DateTime), N'193078')
INSERT [NANO].[TBL_T_CHALLENGE_backup] ([PID_T_CH], [TANGGAL], [NRP], [NAMA], [PID_CH], [CHALLENGE], [CREATE_DATE], [CREATE_BY]) VALUES (N'85ff5144-23ad-4d8a-85c3-a2eafe6d5627', CAST(0x0000A84A0091ABAD AS DateTime), N'1708040', N'CASMITA', N'6C7909D2-DA2B-42FA-92A6-6757C730BD07', N'Memimpin gerakan olahraga selama 5 menit', CAST(0x0000A84A0091ABAD AS DateTime), N'6113882')
INSERT [NANO].[TBL_T_CHALLENGE_backup] ([PID_T_CH], [TANGGAL], [NRP], [NAMA], [PID_CH], [CHALLENGE], [CREATE_DATE], [CREATE_BY]) VALUES (N'8c7ebd3b-6349-4ecf-8cd3-12ccc1690c7a', CAST(0x0000A85C008EED62 AS DateTime), N'1708040', N'CASMITA', N'DA0EB649-313E-4AE5-A6B4-810E2473EA7D', N'Menggambar sambil cerita', CAST(0x0000A85C008EED62 AS DateTime), N'2017038')
INSERT [NANO].[TBL_T_CHALLENGE_backup] ([PID_T_CH], [TANGGAL], [NRP], [NAMA], [PID_CH], [CHALLENGE], [CREATE_DATE], [CREATE_BY]) VALUES (N'8cdbb385-146b-4f3c-ab92-acd764ce7050', CAST(0x0000A86600933900 AS DateTime), N'193078', N'SUKRON', N'6C7909D2-DA2B-42FA-92A6-6757C730BD07', N'Memimpin gerakan olahraga selama 5 menit', CAST(0x0000A86600933900 AS DateTime), N'193078')
INSERT [NANO].[TBL_T_CHALLENGE_backup] ([PID_T_CH], [TANGGAL], [NRP], [NAMA], [PID_CH], [CHALLENGE], [CREATE_DATE], [CREATE_BY]) VALUES (N'8d148128-e826-4bde-9809-22a722db5b03', CAST(0x0000A866008FCF85 AS DateTime), N'1708040', N'CASMITA', N'5E9CE4F0-1C57-4CFC-9817-890454DBB111', N'Baca Puisi 1 menit', CAST(0x0000A866008FCF85 AS DateTime), N'193078')
INSERT [NANO].[TBL_T_CHALLENGE_backup] ([PID_T_CH], [TANGGAL], [NRP], [NAMA], [PID_CH], [CHALLENGE], [CREATE_DATE], [CREATE_BY]) VALUES (N'aa96357a-1693-423b-9828-42ebadf50710', CAST(0x0000A85C008B36AA AS DateTime), N'6113882', N'ARTDITYO PRIAMBODHO', N'DA0EB649-313E-4AE5-A6B4-810E2473EA7D', N'Menggambar sambil cerita', CAST(0x0000A85C008B36AA AS DateTime), N'2017038')
INSERT [NANO].[TBL_T_CHALLENGE_backup] ([PID_T_CH], [TANGGAL], [NRP], [NAMA], [PID_CH], [CHALLENGE], [CREATE_DATE], [CREATE_BY]) VALUES (N'c4a69645-83b4-4b1c-b377-2cf1a8485a20', CAST(0x0000A84A008CCB37 AS DateTime), N'6107067', N'AGUS BUDI HARTO', N'521A5E21-64EB-4472-8F97-2120F572B567', N'Memberi Nasehat 5 menit', CAST(0x0000A84A008CCB37 AS DateTime), N'6113882')
INSERT [NANO].[TBL_T_CHALLENGE_backup] ([PID_T_CH], [TANGGAL], [NRP], [NAMA], [PID_CH], [CHALLENGE], [CREATE_DATE], [CREATE_BY]) VALUES (N'd4f339f5-b8a7-4a2c-b86d-7735c6472b65', CAST(0x0000A84A008C0354 AS DateTime), N'6113882', N'ARTDITYO PRIAMBODHO', N'521A5E21-64EB-4472-8F97-2120F572B567', N'Memberi Nasehat 5 menit', CAST(0x0000A84A008C0354 AS DateTime), N'6113882')
INSERT [NANO].[TBL_T_CHALLENGE_backup] ([PID_T_CH], [TANGGAL], [NRP], [NAMA], [PID_CH], [CHALLENGE], [CREATE_DATE], [CREATE_BY]) VALUES (N'd5e6b7c8-7759-402e-9de6-dcf4f46d05f8', CAST(0x0000A85C00896899 AS DateTime), N'6107067', N'AGUS BUDI HARTO', N'BCE45F08-B185-44E5-BE83-32FACD71159A', N'Story Telling non bahasa', CAST(0x0000A85C00896899 AS DateTime), N'2017038')
INSERT [NANO].[TBL_T_CHALLENGE_backup] ([PID_T_CH], [TANGGAL], [NRP], [NAMA], [PID_CH], [CHALLENGE], [CREATE_DATE], [CREATE_BY]) VALUES (N'd9904944-bfeb-4496-be20-4e3e91a52d5b', CAST(0x0000A86600926386 AS DateTime), N'6196076', N'SATARSO AGUS TJAHJONO', N'A17A908F-F5D6-4804-9474-EE3E1CA98140', N'Sharing Pekerjaan 15 menit', CAST(0x0000A86600926386 AS DateTime), N'193078')
INSERT [NANO].[TBL_T_CHALLENGE_backup] ([PID_T_CH], [TANGGAL], [NRP], [NAMA], [PID_CH], [CHALLENGE], [CREATE_DATE], [CREATE_BY]) VALUES (N'ea0a88a7-4335-4a02-ad16-4873fa4ed0ef', CAST(0x0000A8660095949B AS DateTime), N'6107067', N'AGUS BUDI HARTO', N'BCE45F08-B185-44E5-BE83-32FACD71159A', N'Story Telling non bahasa', CAST(0x0000A8660095949B AS DateTime), N'193078')
INSERT [NANO].[TBL_T_CHALLENGE_backup] ([PID_T_CH], [TANGGAL], [NRP], [NAMA], [PID_CH], [CHALLENGE], [CREATE_DATE], [CREATE_BY]) VALUES (N'ef19401a-ade0-4c75-9f3f-5c293052f758', CAST(0x0000A84A008D6F6F AS DateTime), N'6196076', N'SATARSO AGUS TJAHJONO', N'521A5E21-64EB-4472-8F97-2120F572B567', N'Memberi Nasehat 5 menit', CAST(0x0000A84A008D6F6F AS DateTime), N'6113882')
INSERT [NANO].[TBL_T_CHALLENGE_backup] ([PID_T_CH], [TANGGAL], [NRP], [NAMA], [PID_CH], [CHALLENGE], [CREATE_DATE], [CREATE_BY]) VALUES (N'fde9a86f-0d62-4e6a-90db-14ac30e54e03', CAST(0x0000A85C009122B0 AS DateTime), N'2017038', N'ANNISAA RAHMAYANI NURFAJAR', N'BCE45F08-B185-44E5-BE83-32FACD71159A', N'Story Telling non bahasa', CAST(0x0000A85C009122B0 AS DateTime), N'2017038')
/****** Object:  View [NANO].[VW_NOTULEN_2]    Script Date: 06/05/2018 07:42:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [NANO].[VW_NOTULEN_2]
AS
SELECT     B.PID_NOTULEN, A.TGL_PLAN, B.TGL_ACT, B.URAIAN, B.KET
FROM         NANO.TBL_M_PLAN_K_MEETING_2 AS A LEFT OUTER JOIN
                      NANO.TBL_T_NOTULEN_2 AS B ON A.TGL_PLAN = B.TGL_PLAN
 --order by TGL_PLAN desc
GO
/****** Object:  View [NANO].[VW_NOTULEN]    Script Date: 06/05/2018 07:42:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [NANO].[VW_NOTULEN]
AS
SELECT     B.PID_NOTULEN, A.TGL_PLAN, B.TGL_ACT, B.URAIAN, B.KET
FROM         NANO.TBL_M_PLAN_K_MEETING AS A LEFT OUTER JOIN
                      NANO.TBL_T_NOTULEN AS B ON A.TGL_PLAN = B.TGL_PLAN
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "A"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 259
               Right = 237
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "B"
            Begin Extent = 
               Top = 14
               Left = 384
               Bottom = 299
               Right = 555
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'NANO', @level1type=N'VIEW',@level1name=N'VW_NOTULEN'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'NANO', @level1type=N'VIEW',@level1name=N'VW_NOTULEN'
GO
/****** Object:  Table [NANO].[TBL_T_CHALLENGE]    Script Date: 06/05/2018 07:42:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [NANO].[TBL_T_CHALLENGE](
	[PID_T_CH] [varchar](50) NOT NULL,
	[TANGGAL] [datetime] NULL,
	[NRP] [varchar](10) NULL,
	[NAMA] [varchar](50) NULL,
	[PID_CH] [varchar](50) NULL,
	[CHALLENGE] [varchar](50) NULL,
	[CREATE_DATE] [datetime] NULL,
	[CREATE_BY] [varchar](10) NULL,
 CONSTRAINT [PK_TBL_T_CHALLENGE] PRIMARY KEY CLUSTERED 
(
	[PID_T_CH] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [NANO].[TBL_T_CHALLENGE] ([PID_T_CH], [TANGGAL], [NRP], [NAMA], [PID_CH], [CHALLENGE], [CREATE_DATE], [CREATE_BY]) VALUES (N'0412e4a3-4051-42dc-8bd7-0d7781c1006a', CAST(0x0000A84A0090DDAF AS DateTime), N'193078', N'SUKRON', N'521A5E21-64EB-4472-8F97-2120F572B567', N'Memberi Nasehat 5 menit', CAST(0x0000A84A0090DDAF AS DateTime), N'6113882')
INSERT [NANO].[TBL_T_CHALLENGE] ([PID_T_CH], [TANGGAL], [NRP], [NAMA], [PID_CH], [CHALLENGE], [CREATE_DATE], [CREATE_BY]) VALUES (N'077a9f5d-5590-4008-b73b-6ac3b58f5d2b', CAST(0x0000A874008E8B67 AS DateTime), N'2016030', N'YAQUB EDY SUSILO', N'2BD0E70E-4468-4E4F-924E-C875B50EF07E', N'Tip & Trik terkait Kesehatan', CAST(0x0000A874008E8B67 AS DateTime), N'6113882')
INSERT [NANO].[TBL_T_CHALLENGE] ([PID_T_CH], [TANGGAL], [NRP], [NAMA], [PID_CH], [CHALLENGE], [CREATE_DATE], [CREATE_BY]) VALUES (N'0adaf4bd-66b7-4794-add6-fbea9101ed3f', CAST(0x0000A86600940F26 AS DateTime), N'2017038', N'ANNISAA RAHMAYANI NURFAJAR', N'521A5E21-64EB-4472-8F97-2120F572B567', N'Memberi Nasehat 5 menit', CAST(0x0000A86600940F26 AS DateTime), N'193078')
INSERT [NANO].[TBL_T_CHALLENGE] ([PID_T_CH], [TANGGAL], [NRP], [NAMA], [PID_CH], [CHALLENGE], [CREATE_DATE], [CREATE_BY]) VALUES (N'287b83f2-4db7-45ab-b121-1322b4a3ee8d', CAST(0x0000A85C008F96F6 AS DateTime), N'2016030', N'YAQUB EDY SUSILO', N'A17A908F-F5D6-4804-9474-EE3E1CA98140', N'Sharing Pekerjaan 15 menit', CAST(0x0000A85C008F96F6 AS DateTime), N'2017038')
INSERT [NANO].[TBL_T_CHALLENGE] ([PID_T_CH], [TANGGAL], [NRP], [NAMA], [PID_CH], [CHALLENGE], [CREATE_DATE], [CREATE_BY]) VALUES (N'41ad5560-e21d-4feb-a16f-233aa1a9b0dc', CAST(0x0000A84A008AF6FF AS DateTime), N'2016030', N'YAQUB EDY SUSILO', N'A17A908F-F5D6-4804-9474-EE3E1CA98140', N'Sharing Pekerjaan 15 menit', CAST(0x0000A84A008AF6FF AS DateTime), N'6113882')
INSERT [NANO].[TBL_T_CHALLENGE] ([PID_T_CH], [TANGGAL], [NRP], [NAMA], [PID_CH], [CHALLENGE], [CREATE_DATE], [CREATE_BY]) VALUES (N'473067c0-7a8a-481c-839b-a80996fd8d8a', CAST(0x0000A8820090CF83 AS DateTime), N'6107067', N'AGUS BUDI HARTO', N'D8015088-601E-42F8-9671-7D9CAB3F4A88', N'Menceritakan isi buku yang pernah dibaca', CAST(0x0000A8820090CF83 AS DateTime), N'2016030')
INSERT [NANO].[TBL_T_CHALLENGE] ([PID_T_CH], [TANGGAL], [NRP], [NAMA], [PID_CH], [CHALLENGE], [CREATE_DATE], [CREATE_BY]) VALUES (N'487b2e15-d513-4f35-8c7b-da1b54758202', CAST(0x0000A86600917F47 AS DateTime), N'6113882', N'ARTDITYO PRIAMBODHO', N'A17A908F-F5D6-4804-9474-EE3E1CA98140', N'Sharing Pekerjaan 15 menit', CAST(0x0000A86600917F47 AS DateTime), N'193078')
INSERT [NANO].[TBL_T_CHALLENGE] ([PID_T_CH], [TANGGAL], [NRP], [NAMA], [PID_CH], [CHALLENGE], [CREATE_DATE], [CREATE_BY]) VALUES (N'4ff1572d-7636-4d6b-b842-3f93180297a1', CAST(0x0000A88200921683 AS DateTime), N'2017038', N'ANNISAA RAHMAYANI NURFAJAR', N'C8F6E349-F872-49E1-A6B3-7A89D2DF14FE', N'Menceritakan film yang pernah ditonton', CAST(0x0000A88200921683 AS DateTime), N'2016030')
INSERT [NANO].[TBL_T_CHALLENGE] ([PID_T_CH], [TANGGAL], [NRP], [NAMA], [PID_CH], [CHALLENGE], [CREATE_DATE], [CREATE_BY]) VALUES (N'580c2e9f-4808-4e0f-aa60-b98ea9c097c4', CAST(0x0000A88200945EDA AS DateTime), N'1708040', N'CASMITA', N'E8061A13-C28C-4466-A7E9-F6BFF94B8BC1', N'Nyanyi ', CAST(0x0000A88200945EDA AS DateTime), N'2016030')
INSERT [NANO].[TBL_T_CHALLENGE] ([PID_T_CH], [TANGGAL], [NRP], [NAMA], [PID_CH], [CHALLENGE], [CREATE_DATE], [CREATE_BY]) VALUES (N'663d376c-59e6-4087-83df-076c1807f301', CAST(0x0000A84A008EAAF8 AS DateTime), N'2017038', N'ANNISAA RAHMAYANI NURFAJAR', N'A17A908F-F5D6-4804-9474-EE3E1CA98140', N'Sharing Pekerjaan 15 menit', CAST(0x0000A84A008EAAF8 AS DateTime), N'6113882')
INSERT [NANO].[TBL_T_CHALLENGE] ([PID_T_CH], [TANGGAL], [NRP], [NAMA], [PID_CH], [CHALLENGE], [CREATE_DATE], [CREATE_BY]) VALUES (N'685a13f8-390c-4090-913b-bb304936f091', CAST(0x0000A874008DA6A0 AS DateTime), N'6113882', N'ARTDITYO PRIAMBODHO', N'F284EDD6-20C1-42AB-A150-8E3BDF5D0FD0', N'Tip & Trik terkait Pertanian & Peternakan', CAST(0x0000A874008DA6A0 AS DateTime), N'6113882')
INSERT [NANO].[TBL_T_CHALLENGE] ([PID_T_CH], [TANGGAL], [NRP], [NAMA], [PID_CH], [CHALLENGE], [CREATE_DATE], [CREATE_BY]) VALUES (N'6d0fd633-ced3-4b7b-8afb-d6b3be14dcb0', CAST(0x0000A85C009005D7 AS DateTime), N'193078', N'SUKRON', N'6C7909D2-DA2B-42FA-92A6-6757C730BD07', N'Memimpin gerakan olahraga selama 5 menit', CAST(0x0000A85C009005D7 AS DateTime), N'2017038')
INSERT [NANO].[TBL_T_CHALLENGE] ([PID_T_CH], [TANGGAL], [NRP], [NAMA], [PID_CH], [CHALLENGE], [CREATE_DATE], [CREATE_BY]) VALUES (N'777563af-84aa-44a3-9190-9e4481fd4d77', CAST(0x0000A874008F5DE5 AS DateTime), N'2017038', N'ANNISAA RAHMAYANI NURFAJAR', N'6C7909D2-DA2B-42FA-92A6-6757C730BD07', N'Memimpin gerakan olahraga selama 5 menit', CAST(0x0000A874008F5DE5 AS DateTime), N'6113882')
INSERT [NANO].[TBL_T_CHALLENGE] ([PID_T_CH], [TANGGAL], [NRP], [NAMA], [PID_CH], [CHALLENGE], [CREATE_DATE], [CREATE_BY]) VALUES (N'85ff5144-23ad-4d8a-85c3-a2eafe6d5627', CAST(0x0000A84A0091ABAD AS DateTime), N'1708040', N'CASMITA', N'6C7909D2-DA2B-42FA-92A6-6757C730BD07', N'Memimpin gerakan olahraga selama 5 menit', CAST(0x0000A84A0091ABAD AS DateTime), N'6113882')
INSERT [NANO].[TBL_T_CHALLENGE] ([PID_T_CH], [TANGGAL], [NRP], [NAMA], [PID_CH], [CHALLENGE], [CREATE_DATE], [CREATE_BY]) VALUES (N'8c7ebd3b-6349-4ecf-8cd3-12ccc1690c7a', CAST(0x0000A85C008EED62 AS DateTime), N'1708040', N'CASMITA', N'DA0EB649-313E-4AE5-A6B4-810E2473EA7D', N'Menggambar sambil cerita', CAST(0x0000A85C008EED62 AS DateTime), N'2017038')
INSERT [NANO].[TBL_T_CHALLENGE] ([PID_T_CH], [TANGGAL], [NRP], [NAMA], [PID_CH], [CHALLENGE], [CREATE_DATE], [CREATE_BY]) VALUES (N'8cdbb385-146b-4f3c-ab92-acd764ce7050', CAST(0x0000A86600933900 AS DateTime), N'193078', N'SUKRON', N'6C7909D2-DA2B-42FA-92A6-6757C730BD07', N'Memimpin gerakan olahraga selama 5 menit', CAST(0x0000A86600933900 AS DateTime), N'193078')
INSERT [NANO].[TBL_T_CHALLENGE] ([PID_T_CH], [TANGGAL], [NRP], [NAMA], [PID_CH], [CHALLENGE], [CREATE_DATE], [CREATE_BY]) VALUES (N'8d148128-e826-4bde-9809-22a722db5b03', CAST(0x0000A866008FCF85 AS DateTime), N'1708040', N'CASMITA', N'5E9CE4F0-1C57-4CFC-9817-890454DBB111', N'Baca Puisi 1 menit', CAST(0x0000A866008FCF85 AS DateTime), N'193078')
INSERT [NANO].[TBL_T_CHALLENGE] ([PID_T_CH], [TANGGAL], [NRP], [NAMA], [PID_CH], [CHALLENGE], [CREATE_DATE], [CREATE_BY]) VALUES (N'920d40ad-0dad-44db-9d9f-0f0bb0092c55', CAST(0x0000A882009443FF AS DateTime), N'2016030', N'YAQUB EDY SUSILO', N'DA0EB649-313E-4AE5-A6B4-810E2473EA7D', N'Menggambar sambil cerita', CAST(0x0000A882009443FF AS DateTime), N'2016030')
INSERT [NANO].[TBL_T_CHALLENGE] ([PID_T_CH], [TANGGAL], [NRP], [NAMA], [PID_CH], [CHALLENGE], [CREATE_DATE], [CREATE_BY]) VALUES (N'aa96357a-1693-423b-9828-42ebadf50710', CAST(0x0000A85C008B36AA AS DateTime), N'6113882', N'ARTDITYO PRIAMBODHO', N'DA0EB649-313E-4AE5-A6B4-810E2473EA7D', N'Menggambar sambil cerita', CAST(0x0000A85C008B36AA AS DateTime), N'2017038')
INSERT [NANO].[TBL_T_CHALLENGE] ([PID_T_CH], [TANGGAL], [NRP], [NAMA], [PID_CH], [CHALLENGE], [CREATE_DATE], [CREATE_BY]) VALUES (N'c4a69645-83b4-4b1c-b377-2cf1a8485a20', CAST(0x0000A84A008CCB37 AS DateTime), N'6107067', N'AGUS BUDI HARTO', N'521A5E21-64EB-4472-8F97-2120F572B567', N'Memberi Nasehat 5 menit', CAST(0x0000A84A008CCB37 AS DateTime), N'6113882')
INSERT [NANO].[TBL_T_CHALLENGE] ([PID_T_CH], [TANGGAL], [NRP], [NAMA], [PID_CH], [CHALLENGE], [CREATE_DATE], [CREATE_BY]) VALUES (N'd4f339f5-b8a7-4a2c-b86d-7735c6472b65', CAST(0x0000A84A008C0354 AS DateTime), N'6113882', N'ARTDITYO PRIAMBODHO', N'521A5E21-64EB-4472-8F97-2120F572B567', N'Memberi Nasehat 5 menit', CAST(0x0000A84A008C0354 AS DateTime), N'6113882')
INSERT [NANO].[TBL_T_CHALLENGE] ([PID_T_CH], [TANGGAL], [NRP], [NAMA], [PID_CH], [CHALLENGE], [CREATE_DATE], [CREATE_BY]) VALUES (N'd5e6b7c8-7759-402e-9de6-dcf4f46d05f8', CAST(0x0000A85C00896899 AS DateTime), N'6107067', N'AGUS BUDI HARTO', N'BCE45F08-B185-44E5-BE83-32FACD71159A', N'Story Telling non bahasa', CAST(0x0000A85C00896899 AS DateTime), N'2017038')
INSERT [NANO].[TBL_T_CHALLENGE] ([PID_T_CH], [TANGGAL], [NRP], [NAMA], [PID_CH], [CHALLENGE], [CREATE_DATE], [CREATE_BY]) VALUES (N'd9904944-bfeb-4496-be20-4e3e91a52d5b', CAST(0x0000A86600926386 AS DateTime), N'6196076', N'SATARSO AGUS TJAHJONO', N'A17A908F-F5D6-4804-9474-EE3E1CA98140', N'Sharing Pekerjaan 15 menit', CAST(0x0000A86600926386 AS DateTime), N'193078')
INSERT [NANO].[TBL_T_CHALLENGE] ([PID_T_CH], [TANGGAL], [NRP], [NAMA], [PID_CH], [CHALLENGE], [CREATE_DATE], [CREATE_BY]) VALUES (N'ea0a88a7-4335-4a02-ad16-4873fa4ed0ef', CAST(0x0000A8660095949B AS DateTime), N'6107067', N'AGUS BUDI HARTO', N'BCE45F08-B185-44E5-BE83-32FACD71159A', N'Story Telling non bahasa', CAST(0x0000A8660095949B AS DateTime), N'193078')
INSERT [NANO].[TBL_T_CHALLENGE] ([PID_T_CH], [TANGGAL], [NRP], [NAMA], [PID_CH], [CHALLENGE], [CREATE_DATE], [CREATE_BY]) VALUES (N'ef19401a-ade0-4c75-9f3f-5c293052f758', CAST(0x0000A84A008D6F6F AS DateTime), N'6196076', N'SATARSO AGUS TJAHJONO', N'521A5E21-64EB-4472-8F97-2120F572B567', N'Memberi Nasehat 5 menit', CAST(0x0000A84A008D6F6F AS DateTime), N'6113882')
INSERT [NANO].[TBL_T_CHALLENGE] ([PID_T_CH], [TANGGAL], [NRP], [NAMA], [PID_CH], [CHALLENGE], [CREATE_DATE], [CREATE_BY]) VALUES (N'f445a496-a3c4-4b0d-a166-5446ddccd4e3', CAST(0x0000A86600968A62 AS DateTime), N'2016030', N'YAQUB EDY SUSILO', N'F88399A7-A3DD-4268-A23A-67955A1CB668', N'Sharing Pengalaman 15 menit', CAST(0x0000A86600968A62 AS DateTime), N'193078')
INSERT [NANO].[TBL_T_CHALLENGE] ([PID_T_CH], [TANGGAL], [NRP], [NAMA], [PID_CH], [CHALLENGE], [CREATE_DATE], [CREATE_BY]) VALUES (N'f4cbca96-f68e-40b0-b875-0574df630555', CAST(0x0000A8820092376B AS DateTime), N'6113882', N'ARTDITYO PRIAMBODHO', N'5402739E-D13C-4E38-A2BA-717EED784B4B', N'Stand up comedy', CAST(0x0000A8820092376B AS DateTime), N'2016030')
INSERT [NANO].[TBL_T_CHALLENGE] ([PID_T_CH], [TANGGAL], [NRP], [NAMA], [PID_CH], [CHALLENGE], [CREATE_DATE], [CREATE_BY]) VALUES (N'f7f88a0c-e21c-4325-a6f6-81b87abf4a18', CAST(0x0000A87400902652 AS DateTime), N'193078', N'SUKRON', N'E8061A13-C28C-4466-A7E9-F6BFF94B8BC1', N'Nyanyi ', CAST(0x0000A87400902652 AS DateTime), N'6113882')
INSERT [NANO].[TBL_T_CHALLENGE] ([PID_T_CH], [TANGGAL], [NRP], [NAMA], [PID_CH], [CHALLENGE], [CREATE_DATE], [CREATE_BY]) VALUES (N'fde9a86f-0d62-4e6a-90db-14ac30e54e03', CAST(0x0000A85C009122B0 AS DateTime), N'2017038', N'ANNISAA RAHMAYANI NURFAJAR', N'BCE45F08-B185-44E5-BE83-32FACD71159A', N'Story Telling non bahasa', CAST(0x0000A85C009122B0 AS DateTime), N'2017038')
/****** Object:  View [NANO].[VW_DETAIL_PIC]    Script Date: 06/05/2018 07:42:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [NANO].[VW_DETAIL_PIC]
AS
SELECT     TOP (100) PERCENT A.NRP, A.NAMA, B.JML_SH_ACT, C.JML_NOT_ACT, D.JML_VIP_ACT, E.JML_MCRO_SH,F.JML_CHALLENGE,SUM(case when B.JML_SH_ACT is null then 0 else B.JML_SH_ACT end+ case when C.JML_NOT_ACT is null  then 0 else C.JML_NOT_ACT end+ case when D.JML_VIP_ACT is null then 0 else D.JML_VIP_ACT end+case when F.JML_CHALLENGE is null then 0 else F.JML_CHALLENGE end) as JML_PIC
FROM         NANO.TBL_M_EMPLOYEE_NANO AS A LEFT OUTER JOIN
                          (SELECT     SHEARING_ACT, COUNT(1) AS JML_SH_ACT
                            FROM          NANO.VW_KEGIATAN_MEETING
                            GROUP BY SHEARING_ACT) AS B ON A.NRP = B.SHEARING_ACT LEFT OUTER JOIN
                          (SELECT     NOTULEN_ACT, COUNT(1) AS JML_NOT_ACT
                            FROM          NANO.VW_KEGIATAN_MEETING AS VW_KEGIATAN_MEETING_1
                            GROUP BY NOTULEN_ACT) AS C ON A.NRP = C.NOTULEN_ACT LEFT OUTER JOIN
                          (SELECT     ACTUAL, COUNT(1) AS JML_VIP_ACT
                            FROM          NANO.VW_PELAPOR_VIP
                            GROUP BY ACTUAL) AS D ON A.NRP = D.ACTUAL LEFT OUTER JOIN
                          (SELECT     PENULIS, COUNT(1) AS JML_MCRO_SH
                            FROM          NANO.VW_MICRO_SHEARING
                            GROUP BY PENULIS) AS E ON A.NRP = E.PENULIS LEFT OUTER JOIN
                           (SELECT NRP,COUNT(1) AS JML_CHALLENGE
							FROM NANO.TBL_T_CHALLENGE 
							GROUP BY NRP)AS F ON A.NRP=F.NRP
							
		group by A.NRP, A.NAMA, B.JML_SH_ACT, C.JML_NOT_ACT, D.JML_VIP_ACT, E.JML_MCRO_SH,F.JML_CHALLENGE
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "A"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 125
               Right = 209
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "B"
            Begin Extent = 
               Top = 6
               Left = 247
               Bottom = 95
               Right = 413
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "C"
            Begin Extent = 
               Top = 6
               Left = 451
               Bottom = 95
               Right = 612
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "D"
            Begin Extent = 
               Top = 6
               Left = 650
               Bottom = 95
               Right = 810
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "E"
            Begin Extent = 
               Top = 96
               Left = 247
               Bottom = 185
               Right = 409
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'NANO', @level1type=N'VIEW',@level1name=N'VW_DETAIL_PIC'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'NANO', @level1type=N'VIEW',@level1name=N'VW_DETAIL_PIC'
GO
/****** Object:  View [NANO].[VW_R_SCORE]    Script Date: 06/05/2018 07:42:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [NANO].[VW_R_SCORE]
AS
SELECT     ID_SCORE, CONVERT(VARCHAR(2), ID_SCORE) + ' - ' + SCORE_DESC AS SCORE_DESC
FROM         NANO.TBL_R_SCORE
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[41] 4[21] 2[14] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "TBL_R_SCORE (NANO)"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 125
               Right = 198
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'NANO', @level1type=N'VIEW',@level1name=N'VW_R_SCORE'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'NANO', @level1type=N'VIEW',@level1name=N'VW_R_SCORE'
GO
/****** Object:  StoredProcedure [NANO].[cusp_saveUploadMicroShearing]    Script Date: 06/05/2018 07:42:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		yaqub
-- Create date: 20171107
-- Description:	Save from NANO.TBL_M_MICRO_SHEARING_TEMP to NANO.TBL_M_MICRO_SHEARING
-- note : Gak jadi dipakai
-- =============================================
CREATE PROCEDURE [NANO].[cusp_saveUploadMicroShearing] --'49244ea2-2fff-43ca-b829-ff50eb7abb47','123'
	-- Add the parameters for the stored procedure here
	@sSESSION_UPLOAD varchar(50),
	@sStrSnrp varchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;	

    -- Update	
	UPDATE	T
	SET		T.TANGGAL =  F.TANGGAL,
			T.PENULIS =  F.PENULIS,
			T.TEMA =  F.TEMA,					
			T.ISI =  F.ISI,
			
			T.UPDATE_DATE = getdate(),
			T.UPDATE_BY = @sStrSnrp
			
	FROM	NANO.TBL_M_MICRO_SHEARING AS T
				INNER JOIN
			NANO.TBL_M_MICRO_SHEARING_TEMP AS F
					ON T.TANGGAL = F.TANGGAL
					AND T.PENULIS=F.PENULIS
	WHERE	F.SESSION_UPLOAD = @sSESSION_UPLOAD AND F.REMARKS=''
	
	-- Insert
	INSERT	INTO NANO.TBL_M_MICRO_SHEARING
		(
		PID_MICRO_SHEARING
		,TANGGAL
		,PENULIS
		,TEMA
		,ISI
		
		,UPDATE_DATE
		,UPDATE_BY
		)
	SELECT	
	NEWID() 
	,F.TANGGAL
	,F.PENULIS
	,F.TEMA
	,F.ISI

	,getdate()
	,@sStrSnrp	
	FROM	NANO.TBL_M_MICRO_SHEARING_TEMP AS F
				LEFT JOIN
			NANO.TBL_M_MICRO_SHEARING AS T
					ON T.TANGGAL = F.TANGGAL
					AND T.PENULIS=F.PENULIS
	WHERE	T.PID_MICRO_SHEARING IS NULL
			AND F.SESSION_UPLOAD = @sSESSION_UPLOAD AND F.REMARKS=''
			
	
   
   DELETE FROM NANO.TBL_M_MICRO_SHEARING_TEMP
      --WHERE SESSION_UPLOAD=@sSESSION_UPLOAD
END
GO
/****** Object:  View [NANO].[VW_TBL_T_GALERY]    Script Date: 06/05/2018 07:42:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [NANO].[VW_TBL_T_GALERY]
AS
SELECT     TOP (100) PERCENT FILE_PATH, FILE_DESC, CREATE_DATE
FROM         NANO.TBL_T_GALERY
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "TBL_T_GALERY (NANO)"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 201
               Right = 209
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 2820
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'NANO', @level1type=N'VIEW',@level1name=N'VW_TBL_T_GALERY'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'NANO', @level1type=N'VIEW',@level1name=N'VW_TBL_T_GALERY'
GO
/****** Object:  Table [NANO].[TBL_T_KEHADIRAN_MEETING]    Script Date: 06/05/2018 07:42:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [NANO].[TBL_T_KEHADIRAN_MEETING](
	[PID_KEHADIRAN] [varchar](50) NOT NULL,
	[TGL_PLAN] [date] NULL,
	[TGL_ACT] [date] NULL,
	[NRP] [varchar](10) NULL,
	[NAMA] [varchar](100) NULL,
	[KEHADIRAN] [varchar](1) NULL,
	[KEHADIRAN_DESC] [varchar](50) NULL,
	[KET] [varchar](100) NULL,
	[CREATE_DATE] [datetime] NULL,
	[CREATE_BY] [varchar](10) NULL,
	[MODIFIED_DATE] [datetime] NULL,
	[MODIFIED_BY] [varchar](10) NULL,
 CONSTRAINT [PK_TBL_T_KEHADIRAN_MEETING] PRIMARY KEY CLUSTERED 
(
	[PID_KEHADIRAN] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [NANO].[TBL_T_KEHADIRAN_MEETING] ([PID_KEHADIRAN], [TGL_PLAN], [TGL_ACT], [NRP], [NAMA], [KEHADIRAN], [KEHADIRAN_DESC], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY]) VALUES (N'00a164eb-7dc8-4e43-8802-067558f448c0', CAST(0xCF3D0B00 AS Date), CAST(0xCF3D0B00 AS Date), N'193078', N'SUKRON', N'1', N'HADIR', NULL, CAST(0x0000A874008B8B5D AS DateTime), N'6113882', CAST(0x0000A874008B8B5D AS DateTime), N'6113882')
INSERT [NANO].[TBL_T_KEHADIRAN_MEETING] ([PID_KEHADIRAN], [TGL_PLAN], [TGL_ACT], [NRP], [NAMA], [KEHADIRAN], [KEHADIRAN_DESC], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY]) VALUES (N'0318144c-e6f3-4f1e-9e3c-bf8e009c4418', CAST(0x513D0B00 AS Date), CAST(0x513D0B00 AS Date), N'2016030', N'YAQUB EDY SUSILO', N'1', N'HADIR', NULL, CAST(0x0000A81801113BBA AS DateTime), N'2016030', CAST(0x0000A81801113BBA AS DateTime), N'2016030')
INSERT [NANO].[TBL_T_KEHADIRAN_MEETING] ([PID_KEHADIRAN], [TGL_PLAN], [TGL_ACT], [NRP], [NAMA], [KEHADIRAN], [KEHADIRAN_DESC], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY]) VALUES (N'03f61773-1337-4196-a125-457a20ed8abc', CAST(0x0B3D0B00 AS Date), CAST(0x0B3D0B00 AS Date), N'193078', N'SUKRON', N'3', N'MEETING LAIN', NULL, CAST(0x0000A818010FCC44 AS DateTime), N'2016030', CAST(0x0000A818010FCC44 AS DateTime), N'2016030')
INSERT [NANO].[TBL_T_KEHADIRAN_MEETING] ([PID_KEHADIRAN], [TGL_PLAN], [TGL_ACT], [NRP], [NAMA], [KEHADIRAN], [KEHADIRAN_DESC], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY]) VALUES (N'043133d2-6b01-497e-9a91-3ffcf4e6626f', CAST(0x073E0B00 AS Date), CAST(0x0B3E0B00 AS Date), N'1708040', N'CASMITA', N'1', N'HADIR', NULL, CAST(0x0000A8B000E3A6A5 AS DateTime), N'2017038', CAST(0x0000A8B000E3A6A5 AS DateTime), N'2017038')
INSERT [NANO].[TBL_T_KEHADIRAN_MEETING] ([PID_KEHADIRAN], [TGL_PLAN], [TGL_ACT], [NRP], [NAMA], [KEHADIRAN], [KEHADIRAN_DESC], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY]) VALUES (N'06c03a3e-238d-450b-9db8-d006856f7dbd', CAST(0x973D0B00 AS Date), CAST(0x963D0B00 AS Date), N'6113882', N'ARTDITYO PRIAMBODHO', N'1', N'HADIR', NULL, CAST(0x0000A83B0087131F AS DateTime), N'2016030', CAST(0x0000A83B008ABD1E AS DateTime), N'2016030')
INSERT [NANO].[TBL_T_KEHADIRAN_MEETING] ([PID_KEHADIRAN], [TGL_PLAN], [TGL_ACT], [NRP], [NAMA], [KEHADIRAN], [KEHADIRAN_DESC], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY]) VALUES (N'0a222087-d1ca-4e36-9be6-20c95f2d77df', CAST(0x313E0B00 AS Date), CAST(0x313E0B00 AS Date), N'1708040', N'CASMITA', N'1', N'HADIR', NULL, CAST(0x0000A8D6008E4267 AS DateTime), N'6107067', CAST(0x0000A8D60092ED62 AS DateTime), N'6107067')
INSERT [NANO].[TBL_T_KEHADIRAN_MEETING] ([PID_KEHADIRAN], [TGL_PLAN], [TGL_ACT], [NRP], [NAMA], [KEHADIRAN], [KEHADIRAN_DESC], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY]) VALUES (N'0ada64e1-e592-40a8-a801-74ea980b2e22', NULL, CAST(0x7B3D0B00 AS Date), NULL, NULL, NULL, NULL, NULL, CAST(0x0000A820008BE41F AS DateTime), N'2016030', CAST(0x0000A820008BE41F AS DateTime), N'2016030')
INSERT [NANO].[TBL_T_KEHADIRAN_MEETING] ([PID_KEHADIRAN], [TGL_PLAN], [TGL_ACT], [NRP], [NAMA], [KEHADIRAN], [KEHADIRAN_DESC], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY]) VALUES (N'0af82986-ef0b-452e-982f-805c92fcadfe', CAST(0x3F3E0B00 AS Date), CAST(0x3F3E0B00 AS Date), N'2017038', N'ANNISAA RAHMAYANI NURFAJAR', N'1', N'HADIR', NULL, CAST(0x0000A8E4009105EA AS DateTime), N'2016030', CAST(0x0000A8E4009317A1 AS DateTime), N'2016030')
INSERT [NANO].[TBL_T_KEHADIRAN_MEETING] ([PID_KEHADIRAN], [TGL_PLAN], [TGL_ACT], [NRP], [NAMA], [KEHADIRAN], [KEHADIRAN_DESC], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY]) VALUES (N'0b8fca18-95a1-4836-b1ae-6ad0b1dcfb36', CAST(0x433D0B00 AS Date), CAST(0x433D0B00 AS Date), N'6113882', N'ARTDITYO PRIAMBODHO', N'1', N'HADIR', NULL, CAST(0x0000A8180110F6CE AS DateTime), N'2016030', CAST(0x0000A8180110F6CE AS DateTime), N'2016030')
INSERT [NANO].[TBL_T_KEHADIRAN_MEETING] ([PID_KEHADIRAN], [TGL_PLAN], [TGL_ACT], [NRP], [NAMA], [KEHADIRAN], [KEHADIRAN_DESC], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY]) VALUES (N'0c6e1658-4de7-4a1a-9538-b45c74277a85', CAST(0xC13D0B00 AS Date), CAST(0xC13D0B00 AS Date), N'6113882', N'ARTDITYO PRIAMBODHO', N'1', N'HADIR', NULL, CAST(0x0000A866008E398F AS DateTime), N'193078', CAST(0x0000A866008E398F AS DateTime), N'193078')
INSERT [NANO].[TBL_T_KEHADIRAN_MEETING] ([PID_KEHADIRAN], [TGL_PLAN], [TGL_ACT], [NRP], [NAMA], [KEHADIRAN], [KEHADIRAN_DESC], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY]) VALUES (N'0d2dc6cc-a315-47db-8416-58a9b9106c2f', CAST(0x193D0B00 AS Date), CAST(0x193D0B00 AS Date), N'193078', N'SUKRON', N'1', N'HADIR', NULL, CAST(0x0000A81801103A7C AS DateTime), N'2016030', CAST(0x0000A81801103A7C AS DateTime), N'2016030')
INSERT [NANO].[TBL_T_KEHADIRAN_MEETING] ([PID_KEHADIRAN], [TGL_PLAN], [TGL_ACT], [NRP], [NAMA], [KEHADIRAN], [KEHADIRAN_DESC], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY]) VALUES (N'0d3fd8ee-d781-439b-8030-81b43f5d431a', CAST(0x153E0B00 AS Date), CAST(0x153E0B00 AS Date), N'1708040', N'CASMITA', N'1', N'HADIR', NULL, CAST(0x0000A8BA0083B80E AS DateTime), N'2017038', CAST(0x0000A8BA00846BFF AS DateTime), N'2017038')
INSERT [NANO].[TBL_T_KEHADIRAN_MEETING] ([PID_KEHADIRAN], [TGL_PLAN], [TGL_ACT], [NRP], [NAMA], [KEHADIRAN], [KEHADIRAN_DESC], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY]) VALUES (N'0d4b1a35-61ca-45bb-9824-b867c2fe4e24', NULL, CAST(0x7B3D0B00 AS Date), NULL, NULL, NULL, NULL, NULL, CAST(0x0000A820008930CA AS DateTime), N'2016030', CAST(0x0000A820008930CA AS DateTime), N'2016030')
INSERT [NANO].[TBL_T_KEHADIRAN_MEETING] ([PID_KEHADIRAN], [TGL_PLAN], [TGL_ACT], [NRP], [NAMA], [KEHADIRAN], [KEHADIRAN_DESC], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY]) VALUES (N'0e10e5fd-a75b-4577-9581-12852371b2b7', CAST(0x353D0B00 AS Date), CAST(0x353D0B00 AS Date), N'193078', N'SUKRON', N'4', N'DINAS KE SITE', NULL, CAST(0x0000A8180110B059 AS DateTime), N'2016030', CAST(0x0000A8180110B059 AS DateTime), N'2016030')
INSERT [NANO].[TBL_T_KEHADIRAN_MEETING] ([PID_KEHADIRAN], [TGL_PLAN], [TGL_ACT], [NRP], [NAMA], [KEHADIRAN], [KEHADIRAN_DESC], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY]) VALUES (N'0fd7632a-50d5-4587-bace-e34f83c39e86', NULL, CAST(0x7B3D0B00 AS Date), NULL, NULL, NULL, NULL, NULL, CAST(0x0000A820008BFFEF AS DateTime), N'2016030', CAST(0x0000A820008BFFEF AS DateTime), N'2016030')
INSERT [NANO].[TBL_T_KEHADIRAN_MEETING] ([PID_KEHADIRAN], [TGL_PLAN], [TGL_ACT], [NRP], [NAMA], [KEHADIRAN], [KEHADIRAN_DESC], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY]) VALUES (N'10e12279-ad11-4d41-8af5-d00108ba3c51', CAST(0x0B3D0B00 AS Date), CAST(0x0B3D0B00 AS Date), N'2017038', N'ANNISAA RAHMAYANI NURFAJAR', N'1', N'HADIR', NULL, CAST(0x0000A818010FFB29 AS DateTime), N'2016030', CAST(0x0000A818010FFB29 AS DateTime), N'2016030')
INSERT [NANO].[TBL_T_KEHADIRAN_MEETING] ([PID_KEHADIRAN], [TGL_PLAN], [TGL_ACT], [NRP], [NAMA], [KEHADIRAN], [KEHADIRAN_DESC], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY]) VALUES (N'10e9f3fa-94b1-467a-8bef-71046853e6f2', NULL, CAST(0x7B3D0B00 AS Date), NULL, NULL, NULL, NULL, NULL, CAST(0x0000A820008BAF16 AS DateTime), N'2016030', CAST(0x0000A820008BAF16 AS DateTime), N'2016030')
INSERT [NANO].[TBL_T_KEHADIRAN_MEETING] ([PID_KEHADIRAN], [TGL_PLAN], [TGL_ACT], [NRP], [NAMA], [KEHADIRAN], [KEHADIRAN_DESC], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY]) VALUES (N'1187263a-a263-45d3-982d-25868288246b', CAST(0x0B3D0B00 AS Date), CAST(0x0B3D0B00 AS Date), N'2016030', N'YAQUB EDY SUSILO', N'1', N'HADIR', NULL, CAST(0x0000A818010FEB66 AS DateTime), N'2016030', CAST(0x0000A818010FEB66 AS DateTime), N'2016030')
INSERT [NANO].[TBL_T_KEHADIRAN_MEETING] ([PID_KEHADIRAN], [TGL_PLAN], [TGL_ACT], [NRP], [NAMA], [KEHADIRAN], [KEHADIRAN_DESC], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY]) VALUES (N'124124a1-7043-4a57-9ba6-c4a5bd4cbaf0', NULL, CAST(0x7B3D0B00 AS Date), NULL, NULL, NULL, NULL, NULL, CAST(0x0000A820008BFFEE AS DateTime), N'2016030', CAST(0x0000A820008BFFEE AS DateTime), N'2016030')
INSERT [NANO].[TBL_T_KEHADIRAN_MEETING] ([PID_KEHADIRAN], [TGL_PLAN], [TGL_ACT], [NRP], [NAMA], [KEHADIRAN], [KEHADIRAN_DESC], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY]) VALUES (N'12fd5b09-c522-4587-b19d-cce942c46910', NULL, CAST(0x7B3D0B00 AS Date), NULL, NULL, NULL, NULL, NULL, CAST(0x0000A820008CE7E2 AS DateTime), N'2016030', CAST(0x0000A820008CE7E2 AS DateTime), N'2016030')
INSERT [NANO].[TBL_T_KEHADIRAN_MEETING] ([PID_KEHADIRAN], [TGL_PLAN], [TGL_ACT], [NRP], [NAMA], [KEHADIRAN], [KEHADIRAN_DESC], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY]) VALUES (N'13607c81-678a-4bed-a1ad-8fc7a94fa162', CAST(0x233E0B00 AS Date), CAST(0x233E0B00 AS Date), N'6107067', N'AGUS BUDI HARTO', N'1', N'HADIR', NULL, CAST(0x0000A8C80098D222 AS DateTime), N'6107067', CAST(0x0000A8C80098D222 AS DateTime), N'6107067')
INSERT [NANO].[TBL_T_KEHADIRAN_MEETING] ([PID_KEHADIRAN], [TGL_PLAN], [TGL_ACT], [NRP], [NAMA], [KEHADIRAN], [KEHADIRAN_DESC], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY]) VALUES (N'1457cd39-f640-4d2f-9a58-6f4b291e3e9c', NULL, CAST(0x7B3D0B00 AS Date), NULL, NULL, NULL, NULL, NULL, CAST(0x0000A82000886969 AS DateTime), N'2016030', CAST(0x0000A82000886969 AS DateTime), N'2016030')
INSERT [NANO].[TBL_T_KEHADIRAN_MEETING] ([PID_KEHADIRAN], [TGL_PLAN], [TGL_ACT], [NRP], [NAMA], [KEHADIRAN], [KEHADIRAN_DESC], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY]) VALUES (N'167a57c8-dd00-494f-8c68-280375774047', CAST(0x7B3D0B00 AS Date), CAST(0x7B3D0B00 AS Date), N'2016030', N'YAQUB EDY SUSILO', N'1', N'HADIR', NULL, CAST(0x0000A820008DDEF1 AS DateTime), N'2016030', CAST(0x0000A820009028F4 AS DateTime), N'2016030')
INSERT [NANO].[TBL_T_KEHADIRAN_MEETING] ([PID_KEHADIRAN], [TGL_PLAN], [TGL_ACT], [NRP], [NAMA], [KEHADIRAN], [KEHADIRAN_DESC], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY]) VALUES (N'20E548B8-5776-4F9A-9CB7-0F0771E1B878', CAST(0xDD3D0B00 AS Date), CAST(0xDD3D0B00 AS Date), N'1708040', N'CASMITA', N'1', N'HADIR', NULL, CAST(0x0000A88100E29A8E AS DateTime), N'2016030', CAST(0x0000A88200891750 AS DateTime), N'2016030')
INSERT [NANO].[TBL_T_KEHADIRAN_MEETING] ([PID_KEHADIRAN], [TGL_PLAN], [TGL_ACT], [NRP], [NAMA], [KEHADIRAN], [KEHADIRAN_DESC], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY]) VALUES (N'22e7546b-8708-42d5-b30e-b8daeb32e962', NULL, CAST(0x7B3D0B00 AS Date), NULL, NULL, NULL, NULL, NULL, CAST(0x0000A820008BFFEF AS DateTime), N'2016030', CAST(0x0000A820008BFFEF AS DateTime), N'2016030')
INSERT [NANO].[TBL_T_KEHADIRAN_MEETING] ([PID_KEHADIRAN], [TGL_PLAN], [TGL_ACT], [NRP], [NAMA], [KEHADIRAN], [KEHADIRAN_DESC], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY]) VALUES (N'2365ec59-e0c0-4dc2-81a0-44933f584047', CAST(0xC13D0B00 AS Date), CAST(0xC13D0B00 AS Date), N'2017038', N'ANNISAA RAHMAYANI NURFAJAR', N'1', N'HADIR', NULL, CAST(0x0000A866008E3978 AS DateTime), N'193078', CAST(0x0000A866008E3978 AS DateTime), N'193078')
INSERT [NANO].[TBL_T_KEHADIRAN_MEETING] ([PID_KEHADIRAN], [TGL_PLAN], [TGL_ACT], [NRP], [NAMA], [KEHADIRAN], [KEHADIRAN_DESC], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY]) VALUES (N'257116f0-4611-4878-840c-fb5d639df920', CAST(0x273D0B00 AS Date), CAST(0x273D0B00 AS Date), N'193078', N'SUKRON', N'4', N'DINAS KE SITE', NULL, CAST(0x0000A818011096D3 AS DateTime), N'2016030', CAST(0x0000A818011096D3 AS DateTime), N'2016030')
INSERT [NANO].[TBL_T_KEHADIRAN_MEETING] ([PID_KEHADIRAN], [TGL_PLAN], [TGL_ACT], [NRP], [NAMA], [KEHADIRAN], [KEHADIRAN_DESC], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY]) VALUES (N'25ab2d7d-ce6d-4a8c-81b1-c7e07c8ab09c', CAST(0x233E0B00 AS Date), CAST(0x233E0B00 AS Date), N'6113882', N'ARTDITYO PRIAMBODHO', N'5', N'TRAINING', NULL, CAST(0x0000A8C80098D21D AS DateTime), N'6107067', CAST(0x0000A8C80098D21D AS DateTime), N'6107067')
INSERT [NANO].[TBL_T_KEHADIRAN_MEETING] ([PID_KEHADIRAN], [TGL_PLAN], [TGL_ACT], [NRP], [NAMA], [KEHADIRAN], [KEHADIRAN_DESC], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY]) VALUES (N'25ea555d-98ae-4ee0-9e3d-c17aad09c554', CAST(0x6D3D0B00 AS Date), CAST(0x6D3D0B00 AS Date), N'193078', N'SUKRON', N'2', N'TIDAK HADIR', NULL, CAST(0x0000A8180111991B AS DateTime), N'2016030', CAST(0x0000A8190119CB11 AS DateTime), N'2016030')
INSERT [NANO].[TBL_T_KEHADIRAN_MEETING] ([PID_KEHADIRAN], [TGL_PLAN], [TGL_ACT], [NRP], [NAMA], [KEHADIRAN], [KEHADIRAN_DESC], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY]) VALUES (N'25f7300f-5bb8-4508-8c19-41850131188c', CAST(0x313E0B00 AS Date), CAST(0x313E0B00 AS Date), N'2017038', N'ANNISAA RAHMAYANI NURFAJAR', N'1', N'HADIR', NULL, CAST(0x0000A8D6008E4262 AS DateTime), N'6107067', CAST(0x0000A8D60092ED54 AS DateTime), N'6107067')
INSERT [NANO].[TBL_T_KEHADIRAN_MEETING] ([PID_KEHADIRAN], [TGL_PLAN], [TGL_ACT], [NRP], [NAMA], [KEHADIRAN], [KEHADIRAN_DESC], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY]) VALUES (N'2656b97c-f8c9-41ca-8ac3-bfca5ac2e7ff', CAST(0x433D0B00 AS Date), CAST(0x433D0B00 AS Date), N'6107067', N'AGUS BUDI HARTO', N'8', N'CUTI', NULL, CAST(0x0000A81801111BC0 AS DateTime), N'2016030', CAST(0x0000A81801111BC0 AS DateTime), N'2016030')
INSERT [NANO].[TBL_T_KEHADIRAN_MEETING] ([PID_KEHADIRAN], [TGL_PLAN], [TGL_ACT], [NRP], [NAMA], [KEHADIRAN], [KEHADIRAN_DESC], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY]) VALUES (N'2abff031-2069-4ed6-b365-a74cb32d2976', CAST(0x513D0B00 AS Date), CAST(0x513D0B00 AS Date), N'2017038', N'ANNISAA RAHMAYANI NURFAJAR', N'1', N'HADIR', NULL, CAST(0x0000A81801114933 AS DateTime), N'2016030', CAST(0x0000A81801114933 AS DateTime), N'2016030')
INSERT [NANO].[TBL_T_KEHADIRAN_MEETING] ([PID_KEHADIRAN], [TGL_PLAN], [TGL_ACT], [NRP], [NAMA], [KEHADIRAN], [KEHADIRAN_DESC], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY]) VALUES (N'2c8e6c67-5e8c-49e1-95c4-798017c185e7', NULL, CAST(0x7B3D0B00 AS Date), NULL, NULL, NULL, NULL, NULL, CAST(0x0000A820008CE849 AS DateTime), N'2016030', CAST(0x0000A820008CE849 AS DateTime), N'2016030')
INSERT [NANO].[TBL_T_KEHADIRAN_MEETING] ([PID_KEHADIRAN], [TGL_PLAN], [TGL_ACT], [NRP], [NAMA], [KEHADIRAN], [KEHADIRAN_DESC], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY]) VALUES (N'2d2a8aeb-d846-4cac-9e48-e25482d64bc9', CAST(0xB33D0B00 AS Date), CAST(0xB73D0B00 AS Date), N'193078', N'SUKRON', N'1', N'HADIR', NULL, CAST(0x0000A85C00872AFE AS DateTime), N'2017038', CAST(0x0000A85C00872AFE AS DateTime), N'2017038')
INSERT [NANO].[TBL_T_KEHADIRAN_MEETING] ([PID_KEHADIRAN], [TGL_PLAN], [TGL_ACT], [NRP], [NAMA], [KEHADIRAN], [KEHADIRAN_DESC], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY]) VALUES (N'2e2cd864-84ab-4089-9782-ede2c537fb2a', CAST(0x5F3D0B00 AS Date), CAST(0x5F3D0B00 AS Date), N'6196076', N'SATARSO AGUS TJAHJONO', N'1', N'HADIR', NULL, CAST(0x0000A818011170A6 AS DateTime), N'2016030', CAST(0x0000A818011170A6 AS DateTime), N'2016030')
INSERT [NANO].[TBL_T_KEHADIRAN_MEETING] ([PID_KEHADIRAN], [TGL_PLAN], [TGL_ACT], [NRP], [NAMA], [KEHADIRAN], [KEHADIRAN_DESC], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY]) VALUES (N'2ee27405-72bc-4d0a-b3e7-ff8c4a55c2b3', CAST(0x5F3D0B00 AS Date), CAST(0x5F3D0B00 AS Date), N'193078', N'SUKRON', N'4', N'DINAS KE SITE', NULL, CAST(0x0000A81801116462 AS DateTime), N'2016030', CAST(0x0000A81801116462 AS DateTime), N'2016030')
INSERT [NANO].[TBL_T_KEHADIRAN_MEETING] ([PID_KEHADIRAN], [TGL_PLAN], [TGL_ACT], [NRP], [NAMA], [KEHADIRAN], [KEHADIRAN_DESC], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY]) VALUES (N'300e31ad-894b-4045-94ac-152fb30ccadf', CAST(0xA53D0B00 AS Date), CAST(0xA53D0B00 AS Date), N'0001', N'CASMITA', N'1', N'HADIR', NULL, CAST(0x0000A84A0097AD92 AS DateTime), N'6113882', CAST(0x0000A84A0097AD92 AS DateTime), N'6113882')
INSERT [NANO].[TBL_T_KEHADIRAN_MEETING] ([PID_KEHADIRAN], [TGL_PLAN], [TGL_ACT], [NRP], [NAMA], [KEHADIRAN], [KEHADIRAN_DESC], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY]) VALUES (N'3113fa21-f79f-42b5-9475-77c856db9190', CAST(0xEB3D0B00 AS Date), CAST(0xEB3D0B00 AS Date), N'6196076', N'SATARSO AGUS TJAHJONO', N'1', N'HADIR', NULL, CAST(0x0000A890008E8089 AS DateTime), N'2017038', CAST(0x0000A890008F4E45 AS DateTime), N'2017038')
INSERT [NANO].[TBL_T_KEHADIRAN_MEETING] ([PID_KEHADIRAN], [TGL_PLAN], [TGL_ACT], [NRP], [NAMA], [KEHADIRAN], [KEHADIRAN_DESC], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY]) VALUES (N'32b42f20-5165-44fe-93c0-840ee084e07a', CAST(0x193D0B00 AS Date), CAST(0x193D0B00 AS Date), N'2017038', N'ANNISAA RAHMAYANI NURFAJAR', N'1', N'HADIR', NULL, CAST(0x0000A81801103F63 AS DateTime), N'2016030', CAST(0x0000A81801103F63 AS DateTime), N'2016030')
INSERT [NANO].[TBL_T_KEHADIRAN_MEETING] ([PID_KEHADIRAN], [TGL_PLAN], [TGL_ACT], [NRP], [NAMA], [KEHADIRAN], [KEHADIRAN_DESC], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY]) VALUES (N'388f89e8-aaab-4a0f-b5f4-754d1b39bfd1', NULL, CAST(0x7B3D0B00 AS Date), NULL, NULL, NULL, NULL, NULL, CAST(0x0000A820008CE7C6 AS DateTime), N'2016030', CAST(0x0000A820008CE7C6 AS DateTime), N'2016030')
INSERT [NANO].[TBL_T_KEHADIRAN_MEETING] ([PID_KEHADIRAN], [TGL_PLAN], [TGL_ACT], [NRP], [NAMA], [KEHADIRAN], [KEHADIRAN_DESC], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY]) VALUES (N'391aef9d-f2f3-4a22-9149-c0a3e9990d54', CAST(0x973D0B00 AS Date), CAST(0x963D0B00 AS Date), N'6107067', N'AGUS BUDI HARTO', N'1', N'HADIR', NULL, CAST(0x0000A83B00871329 AS DateTime), N'2016030', CAST(0x0000A83B008ABD19 AS DateTime), N'2016030')
INSERT [NANO].[TBL_T_KEHADIRAN_MEETING] ([PID_KEHADIRAN], [TGL_PLAN], [TGL_ACT], [NRP], [NAMA], [KEHADIRAN], [KEHADIRAN_DESC], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY]) VALUES (N'3ac6c582-3977-4460-85ce-54670211768a', NULL, CAST(0x7B3D0B00 AS Date), NULL, NULL, NULL, NULL, NULL, CAST(0x0000A820008CE7A1 AS DateTime), N'2016030', CAST(0x0000A820008CE7A1 AS DateTime), N'2016030')
INSERT [NANO].[TBL_T_KEHADIRAN_MEETING] ([PID_KEHADIRAN], [TGL_PLAN], [TGL_ACT], [NRP], [NAMA], [KEHADIRAN], [KEHADIRAN_DESC], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY]) VALUES (N'3afac354-f2b8-4cd9-83df-05d5c8269732', CAST(0xF93D0B00 AS Date), CAST(0xF93D0B00 AS Date), N'2016030', N'YAQUB EDY SUSILO', N'1', N'HADIR', NULL, CAST(0x0000A89E008A1E2A AS DateTime), N'6107067', CAST(0x0000A89E008A1E2A AS DateTime), N'6107067')
INSERT [NANO].[TBL_T_KEHADIRAN_MEETING] ([PID_KEHADIRAN], [TGL_PLAN], [TGL_ACT], [NRP], [NAMA], [KEHADIRAN], [KEHADIRAN_DESC], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY]) VALUES (N'3b0c5ebf-0e44-4191-8be8-0853d336f898', CAST(0xA53D0B00 AS Date), CAST(0xA53D0B00 AS Date), N'6107067', N'AGUS BUDI HARTO', N'1', N'HADIR', NULL, CAST(0x0000A84A0097AD88 AS DateTime), N'6113882', CAST(0x0000A84D0093728B AS DateTime), N'6113882')
INSERT [NANO].[TBL_T_KEHADIRAN_MEETING] ([PID_KEHADIRAN], [TGL_PLAN], [TGL_ACT], [NRP], [NAMA], [KEHADIRAN], [KEHADIRAN_DESC], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY]) VALUES (N'3b5b4dce-8db1-49e5-80c6-de9b983469a0', NULL, CAST(0x7B3D0B00 AS Date), NULL, NULL, NULL, NULL, NULL, CAST(0x0000A820008BE421 AS DateTime), N'2016030', CAST(0x0000A820008BE421 AS DateTime), N'2016030')
INSERT [NANO].[TBL_T_KEHADIRAN_MEETING] ([PID_KEHADIRAN], [TGL_PLAN], [TGL_ACT], [NRP], [NAMA], [KEHADIRAN], [KEHADIRAN_DESC], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY]) VALUES (N'3c281d16-f4b7-4ca2-8942-2266ecf008e1', CAST(0x193D0B00 AS Date), CAST(0x193D0B00 AS Date), N'6196076', N'SATARSO AGUS TJAHJONO', N'5', N'TRAINING', NULL, CAST(0x0000A8180110280F AS DateTime), N'2016030', CAST(0x0000A8180110280F AS DateTime), N'2016030')
INSERT [NANO].[TBL_T_KEHADIRAN_MEETING] ([PID_KEHADIRAN], [TGL_PLAN], [TGL_ACT], [NRP], [NAMA], [KEHADIRAN], [KEHADIRAN_DESC], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY]) VALUES (N'3d77390c-25df-4959-9552-884f143aa092', CAST(0x193D0B00 AS Date), CAST(0x193D0B00 AS Date), N'6113882', N'ARTDITYO PRIAMBODHO', N'1', N'HADIR', NULL, CAST(0x0000A8180110350A AS DateTime), N'2016030', CAST(0x0000A8180110350A AS DateTime), N'2016030')
INSERT [NANO].[TBL_T_KEHADIRAN_MEETING] ([PID_KEHADIRAN], [TGL_PLAN], [TGL_ACT], [NRP], [NAMA], [KEHADIRAN], [KEHADIRAN_DESC], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY]) VALUES (N'3dcc5182-708f-4117-946b-4d846539d259', CAST(0x7B3D0B00 AS Date), CAST(0x7B3D0B00 AS Date), N'6113882', N'ARTDITYO PRIAMBODHO', N'4', N'DINAS KE SITE', NULL, CAST(0x0000A820008DDF0D AS DateTime), N'2016030', CAST(0x0000A820009028F9 AS DateTime), N'2016030')
INSERT [NANO].[TBL_T_KEHADIRAN_MEETING] ([PID_KEHADIRAN], [TGL_PLAN], [TGL_ACT], [NRP], [NAMA], [KEHADIRAN], [KEHADIRAN_DESC], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY]) VALUES (N'3dda25f1-3570-4783-bb55-39dc54c38f73', CAST(0x313E0B00 AS Date), CAST(0x313E0B00 AS Date), N'6196076', N'SATARSO AGUS TJAHJONO', N'1', N'HADIR', NULL, CAST(0x0000A8D6008E426C AS DateTime), N'6107067', CAST(0x0000A8D60092ED70 AS DateTime), N'6107067')
INSERT [NANO].[TBL_T_KEHADIRAN_MEETING] ([PID_KEHADIRAN], [TGL_PLAN], [TGL_ACT], [NRP], [NAMA], [KEHADIRAN], [KEHADIRAN_DESC], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY]) VALUES (N'4063685c-ad58-4f18-bd91-990bff369d74', CAST(0x7B3D0B00 AS Date), CAST(0x7B3D0B00 AS Date), N'2017038', N'ANNISAA RAHMAYANI NURFAJAR', N'1', N'HADIR', NULL, CAST(0x0000A820008DDF37 AS DateTime), N'2016030', CAST(0x0000A82000902902 AS DateTime), N'2016030')
INSERT [NANO].[TBL_T_KEHADIRAN_MEETING] ([PID_KEHADIRAN], [TGL_PLAN], [TGL_ACT], [NRP], [NAMA], [KEHADIRAN], [KEHADIRAN_DESC], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY]) VALUES (N'41920167-3d95-4ff1-8a83-5485836a341e', CAST(0xF93D0B00 AS Date), CAST(0xF93D0B00 AS Date), N'2017038', N'ANNISAA RAHMAYANI NURFAJAR', N'1', N'HADIR', NULL, CAST(0x0000A89E008A1E13 AS DateTime), N'6107067', CAST(0x0000A89E008A1E13 AS DateTime), N'6107067')
INSERT [NANO].[TBL_T_KEHADIRAN_MEETING] ([PID_KEHADIRAN], [TGL_PLAN], [TGL_ACT], [NRP], [NAMA], [KEHADIRAN], [KEHADIRAN_DESC], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY]) VALUES (N'421ac0ea-4f06-4888-8c36-14043bda80f9', NULL, CAST(0x7B3D0B00 AS Date), NULL, NULL, NULL, NULL, NULL, CAST(0x0000A820008D2068 AS DateTime), N'2016030', CAST(0x0000A820008D207D AS DateTime), N'2016030')
INSERT [NANO].[TBL_T_KEHADIRAN_MEETING] ([PID_KEHADIRAN], [TGL_PLAN], [TGL_ACT], [NRP], [NAMA], [KEHADIRAN], [KEHADIRAN_DESC], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY]) VALUES (N'44c6263b-dd08-4a3f-a7e5-c6cfeba7d324', NULL, CAST(0x7B3D0B00 AS Date), NULL, NULL, NULL, NULL, NULL, CAST(0x0000A820008D1DBC AS DateTime), N'2016030', CAST(0x0000A820008D1DD1 AS DateTime), N'2016030')
INSERT [NANO].[TBL_T_KEHADIRAN_MEETING] ([PID_KEHADIRAN], [TGL_PLAN], [TGL_ACT], [NRP], [NAMA], [KEHADIRAN], [KEHADIRAN_DESC], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY]) VALUES (N'454af3bf-6e12-4341-b641-8764b9392fbd', CAST(0x5F3D0B00 AS Date), CAST(0x5F3D0B00 AS Date), N'6113882', N'ARTDITYO PRIAMBODHO', N'1', N'HADIR', NULL, CAST(0x0000A81801117567 AS DateTime), N'2016030', CAST(0x0000A81801117567 AS DateTime), N'2016030')
INSERT [NANO].[TBL_T_KEHADIRAN_MEETING] ([PID_KEHADIRAN], [TGL_PLAN], [TGL_ACT], [NRP], [NAMA], [KEHADIRAN], [KEHADIRAN_DESC], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY]) VALUES (N'461e01b0-312f-4519-a75a-078f1cc7edb7', CAST(0xF93D0B00 AS Date), CAST(0xF93D0B00 AS Date), N'1708040', N'CASMITA', N'1', N'HADIR', NULL, CAST(0x0000A89E008A1E3D AS DateTime), N'6107067', CAST(0x0000A89E008A1E3D AS DateTime), N'6107067')
INSERT [NANO].[TBL_T_KEHADIRAN_MEETING] ([PID_KEHADIRAN], [TGL_PLAN], [TGL_ACT], [NRP], [NAMA], [KEHADIRAN], [KEHADIRAN_DESC], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY]) VALUES (N'467c4019-1153-4424-8575-75583ff5576f', CAST(0xB33D0B00 AS Date), CAST(0xB73D0B00 AS Date), N'2016030', N'YAQUB EDY SUSILO', N'1', N'HADIR', NULL, CAST(0x0000A85C00872AB8 AS DateTime), N'2017038', CAST(0x0000A85C00872AB8 AS DateTime), N'2017038')
INSERT [NANO].[TBL_T_KEHADIRAN_MEETING] ([PID_KEHADIRAN], [TGL_PLAN], [TGL_ACT], [NRP], [NAMA], [KEHADIRAN], [KEHADIRAN_DESC], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY]) VALUES (N'469c34c1-149e-45ce-9161-7e25305c5c0d', CAST(0xCF3D0B00 AS Date), CAST(0xCF3D0B00 AS Date), N'1708040', N'CASMITA', N'5', N'TRAINING', NULL, CAST(0x0000A874008B8B54 AS DateTime), N'6113882', CAST(0x0000A874008B8B54 AS DateTime), N'6113882')
INSERT [NANO].[TBL_T_KEHADIRAN_MEETING] ([PID_KEHADIRAN], [TGL_PLAN], [TGL_ACT], [NRP], [NAMA], [KEHADIRAN], [KEHADIRAN_DESC], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY]) VALUES (N'46adf240-bf14-4386-82f8-8a6918674466', CAST(0xB33D0B00 AS Date), CAST(0xB73D0B00 AS Date), N'6107067', N'AGUS BUDI HARTO', N'1', N'HADIR', NULL, CAST(0x0000A85C00872AE7 AS DateTime), N'2017038', CAST(0x0000A85C00872AE7 AS DateTime), N'2017038')
INSERT [NANO].[TBL_T_KEHADIRAN_MEETING] ([PID_KEHADIRAN], [TGL_PLAN], [TGL_ACT], [NRP], [NAMA], [KEHADIRAN], [KEHADIRAN_DESC], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY]) VALUES (N'47b48356-bd13-419a-8095-660b1489aa0b', CAST(0x6D3D0B00 AS Date), CAST(0x6D3D0B00 AS Date), N'2016030', N'YAQUB EDY SUSILO', N'1', N'HADIR', NULL, CAST(0x0000A81900929D52 AS DateTime), N'2016030', CAST(0x0000A8190119CB0D AS DateTime), N'2016030')
INSERT [NANO].[TBL_T_KEHADIRAN_MEETING] ([PID_KEHADIRAN], [TGL_PLAN], [TGL_ACT], [NRP], [NAMA], [KEHADIRAN], [KEHADIRAN_DESC], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY]) VALUES (N'4a6a2b94-c7b3-4440-b9d7-df1f03f37e5b', NULL, CAST(0x7B3D0B00 AS Date), NULL, NULL, NULL, NULL, NULL, CAST(0x0000A820008BAF16 AS DateTime), N'2016030', CAST(0x0000A820008BAF16 AS DateTime), N'2016030')
INSERT [NANO].[TBL_T_KEHADIRAN_MEETING] ([PID_KEHADIRAN], [TGL_PLAN], [TGL_ACT], [NRP], [NAMA], [KEHADIRAN], [KEHADIRAN_DESC], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY]) VALUES (N'4a7f38e0-7fb9-46a5-8f3c-7bd2b2f94b12', CAST(0x353D0B00 AS Date), CAST(0x353D0B00 AS Date), N'2017038', N'ANNISAA RAHMAYANI NURFAJAR', N'1', N'HADIR', NULL, CAST(0x0000A8180110D06A AS DateTime), N'2016030', CAST(0x0000A8180110D06A AS DateTime), N'2016030')
INSERT [NANO].[TBL_T_KEHADIRAN_MEETING] ([PID_KEHADIRAN], [TGL_PLAN], [TGL_ACT], [NRP], [NAMA], [KEHADIRAN], [KEHADIRAN_DESC], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY]) VALUES (N'4c7bf6bf-a99f-4d8c-94fe-9b60dbc2a304', CAST(0x3F3E0B00 AS Date), CAST(0x3F3E0B00 AS Date), N'6196076', N'SATARSO AGUS TJAHJONO', N'1', N'HADIR', NULL, CAST(0x0000A8E400910601 AS DateTime), N'2016030', CAST(0x0000A8E4009317AF AS DateTime), N'2016030')
INSERT [NANO].[TBL_T_KEHADIRAN_MEETING] ([PID_KEHADIRAN], [TGL_PLAN], [TGL_ACT], [NRP], [NAMA], [KEHADIRAN], [KEHADIRAN_DESC], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY]) VALUES (N'4d2837bf-e1ad-48c0-a0c4-d7374913bde9', NULL, CAST(0x7B3D0B00 AS Date), NULL, NULL, NULL, NULL, NULL, CAST(0x0000A820008CE80C AS DateTime), N'2016030', CAST(0x0000A820008CE80C AS DateTime), N'2016030')
INSERT [NANO].[TBL_T_KEHADIRAN_MEETING] ([PID_KEHADIRAN], [TGL_PLAN], [TGL_ACT], [NRP], [NAMA], [KEHADIRAN], [KEHADIRAN_DESC], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY]) VALUES (N'4ed6106b-a624-4741-b9e4-6edf597a0ec4', CAST(0xB33D0B00 AS Date), CAST(0xB73D0B00 AS Date), N'6113882', N'ARTDITYO PRIAMBODHO', N'1', N'HADIR', NULL, CAST(0x0000A85C00872AEB AS DateTime), N'2017038', CAST(0x0000A85C00872AEB AS DateTime), N'2017038')
INSERT [NANO].[TBL_T_KEHADIRAN_MEETING] ([PID_KEHADIRAN], [TGL_PLAN], [TGL_ACT], [NRP], [NAMA], [KEHADIRAN], [KEHADIRAN_DESC], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY]) VALUES (N'4fcf681b-a3b6-402f-928b-97c947647c2e', CAST(0x973D0B00 AS Date), CAST(0x963D0B00 AS Date), N'193078', N'SUKRON', N'4', N'DINAS KE SITE', NULL, CAST(0x0000A83B00871332 AS DateTime), N'2016030', CAST(0x0000A83B008ABD27 AS DateTime), N'2016030')
INSERT [NANO].[TBL_T_KEHADIRAN_MEETING] ([PID_KEHADIRAN], [TGL_PLAN], [TGL_ACT], [NRP], [NAMA], [KEHADIRAN], [KEHADIRAN_DESC], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY]) VALUES (N'51dd9755-ffa5-4d22-b7e4-ffd4f456882f', CAST(0xF93D0B00 AS Date), CAST(0xF93D0B00 AS Date), N'6196076', N'SATARSO AGUS TJAHJONO', N'1', N'HADIR', NULL, CAST(0x0000A89E008A1E4B AS DateTime), N'6107067', CAST(0x0000A89E008A1E4B AS DateTime), N'6107067')
INSERT [NANO].[TBL_T_KEHADIRAN_MEETING] ([PID_KEHADIRAN], [TGL_PLAN], [TGL_ACT], [NRP], [NAMA], [KEHADIRAN], [KEHADIRAN_DESC], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY]) VALUES (N'5756734d-2524-479a-b03b-8caa292516dd', CAST(0x0B3D0B00 AS Date), CAST(0x0B3D0B00 AS Date), N'6113882', N'ARTDITYO PRIAMBODHO', N'1', N'HADIR', NULL, CAST(0x0000A818010FF509 AS DateTime), N'2016030', CAST(0x0000A818010FF509 AS DateTime), N'2016030')
INSERT [NANO].[TBL_T_KEHADIRAN_MEETING] ([PID_KEHADIRAN], [TGL_PLAN], [TGL_ACT], [NRP], [NAMA], [KEHADIRAN], [KEHADIRAN_DESC], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY]) VALUES (N'58a8d5e1-9a79-4dba-9c23-8c7f602232c3', NULL, CAST(0x7B3D0B00 AS Date), NULL, NULL, NULL, NULL, NULL, CAST(0x0000A820008ACB93 AS DateTime), N'2016030', CAST(0x0000A820008ACB93 AS DateTime), N'2016030')
INSERT [NANO].[TBL_T_KEHADIRAN_MEETING] ([PID_KEHADIRAN], [TGL_PLAN], [TGL_ACT], [NRP], [NAMA], [KEHADIRAN], [KEHADIRAN_DESC], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY]) VALUES (N'59242723-490b-4c6c-8e2f-9c4f4649b982', CAST(0xEB3D0B00 AS Date), CAST(0xEB3D0B00 AS Date), N'6107067', N'AGUS BUDI HARTO', N'1', N'HADIR', NULL, CAST(0x0000A890008E8080 AS DateTime), N'2017038', CAST(0x0000A890008F4E41 AS DateTime), N'2017038')
INSERT [NANO].[TBL_T_KEHADIRAN_MEETING] ([PID_KEHADIRAN], [TGL_PLAN], [TGL_ACT], [NRP], [NAMA], [KEHADIRAN], [KEHADIRAN_DESC], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY]) VALUES (N'592d120a-488f-4b4e-8af2-71e134bc58d4', CAST(0x233E0B00 AS Date), CAST(0x233E0B00 AS Date), N'2016030', N'YAQUB EDY SUSILO', N'1', N'HADIR', NULL, CAST(0x0000A8C80098D219 AS DateTime), N'6107067', CAST(0x0000A8C80098D219 AS DateTime), N'6107067')
INSERT [NANO].[TBL_T_KEHADIRAN_MEETING] ([PID_KEHADIRAN], [TGL_PLAN], [TGL_ACT], [NRP], [NAMA], [KEHADIRAN], [KEHADIRAN_DESC], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY]) VALUES (N'5d45f478-6e71-44c3-a4f7-875a3fa462bb', CAST(0xEB3D0B00 AS Date), CAST(0xEB3D0B00 AS Date), N'2016030', N'YAQUB EDY SUSILO', N'1', N'HADIR', NULL, CAST(0x0000A890008E807B AS DateTime), N'2017038', CAST(0x0000A890008F4E33 AS DateTime), N'2017038')
INSERT [NANO].[TBL_T_KEHADIRAN_MEETING] ([PID_KEHADIRAN], [TGL_PLAN], [TGL_ACT], [NRP], [NAMA], [KEHADIRAN], [KEHADIRAN_DESC], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY]) VALUES (N'5e157c83-2d5e-45d4-b22e-6a33985df1c4', NULL, CAST(0x7B3D0B00 AS Date), NULL, NULL, NULL, NULL, NULL, CAST(0x0000A820008930CA AS DateTime), N'2016030', CAST(0x0000A820008930CA AS DateTime), N'2016030')
INSERT [NANO].[TBL_T_KEHADIRAN_MEETING] ([PID_KEHADIRAN], [TGL_PLAN], [TGL_ACT], [NRP], [NAMA], [KEHADIRAN], [KEHADIRAN_DESC], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY]) VALUES (N'5ea1937a-57d6-4043-9acc-ca72a5be7a0f', NULL, CAST(0x7B3D0B00 AS Date), NULL, NULL, NULL, NULL, NULL, CAST(0x0000A820008ACB8E AS DateTime), N'2016030', CAST(0x0000A820008ACB8E AS DateTime), N'2016030')
INSERT [NANO].[TBL_T_KEHADIRAN_MEETING] ([PID_KEHADIRAN], [TGL_PLAN], [TGL_ACT], [NRP], [NAMA], [KEHADIRAN], [KEHADIRAN_DESC], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY]) VALUES (N'5f228376-abb2-4ae5-b730-e748288908cc', CAST(0x353D0B00 AS Date), CAST(0x353D0B00 AS Date), N'6196076', N'SATARSO AGUS TJAHJONO', N'1', N'HADIR', NULL, CAST(0x0000A8180110CAD6 AS DateTime), N'2016030', CAST(0x0000A8180110CAD6 AS DateTime), N'2016030')
INSERT [NANO].[TBL_T_KEHADIRAN_MEETING] ([PID_KEHADIRAN], [TGL_PLAN], [TGL_ACT], [NRP], [NAMA], [KEHADIRAN], [KEHADIRAN_DESC], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY]) VALUES (N'6025bb81-7efc-4c20-879b-2cb6abfca0e0', CAST(0x0B3D0B00 AS Date), CAST(0x0B3D0B00 AS Date), N'6196076', N'SATARSO AGUS TJAHJONO', N'1', N'HADIR', NULL, CAST(0x0000A818010FF03F AS DateTime), N'2016030', CAST(0x0000A818010FF03F AS DateTime), N'2016030')
INSERT [NANO].[TBL_T_KEHADIRAN_MEETING] ([PID_KEHADIRAN], [TGL_PLAN], [TGL_ACT], [NRP], [NAMA], [KEHADIRAN], [KEHADIRAN_DESC], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY]) VALUES (N'6079074a-aa51-4074-82f5-3bce443b0903', NULL, CAST(0x7B3D0B00 AS Date), NULL, NULL, NULL, NULL, NULL, CAST(0x0000A820008930CA AS DateTime), N'2016030', CAST(0x0000A820008930CA AS DateTime), N'2016030')
INSERT [NANO].[TBL_T_KEHADIRAN_MEETING] ([PID_KEHADIRAN], [TGL_PLAN], [TGL_ACT], [NRP], [NAMA], [KEHADIRAN], [KEHADIRAN_DESC], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY]) VALUES (N'60df378b-f72c-4f49-9724-5d6eb39eda60', CAST(0x153E0B00 AS Date), CAST(0x153E0B00 AS Date), N'193078', N'SUKRON', N'1', N'HADIR', NULL, CAST(0x0000A8BA0083B81C AS DateTime), N'2017038', CAST(0x0000A8BA00846C17 AS DateTime), N'2017038')
INSERT [NANO].[TBL_T_KEHADIRAN_MEETING] ([PID_KEHADIRAN], [TGL_PLAN], [TGL_ACT], [NRP], [NAMA], [KEHADIRAN], [KEHADIRAN_DESC], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY]) VALUES (N'630a3905-4758-4d4b-a01b-b8ec65154090', CAST(0x5F3D0B00 AS Date), CAST(0x5F3D0B00 AS Date), N'2016030', N'YAQUB EDY SUSILO', N'1', N'HADIR', NULL, CAST(0x0000A81801116C5B AS DateTime), N'2016030', CAST(0x0000A81801116C5B AS DateTime), N'2016030')
INSERT [NANO].[TBL_T_KEHADIRAN_MEETING] ([PID_KEHADIRAN], [TGL_PLAN], [TGL_ACT], [NRP], [NAMA], [KEHADIRAN], [KEHADIRAN_DESC], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY]) VALUES (N'6661b48b-e03c-47a5-ae22-b79b42d8f169', NULL, CAST(0x7B3D0B00 AS Date), NULL, NULL, NULL, NULL, NULL, CAST(0x0000A820008BAF16 AS DateTime), N'2016030', CAST(0x0000A820008BAF16 AS DateTime), N'2016030')
INSERT [NANO].[TBL_T_KEHADIRAN_MEETING] ([PID_KEHADIRAN], [TGL_PLAN], [TGL_ACT], [NRP], [NAMA], [KEHADIRAN], [KEHADIRAN_DESC], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY]) VALUES (N'679aee75-6bee-4486-b105-d676552241f7', NULL, CAST(0x7B3D0B00 AS Date), NULL, NULL, NULL, NULL, NULL, CAST(0x0000A820008BAF11 AS DateTime), N'2016030', CAST(0x0000A820008BAF11 AS DateTime), N'2016030')
INSERT [NANO].[TBL_T_KEHADIRAN_MEETING] ([PID_KEHADIRAN], [TGL_PLAN], [TGL_ACT], [NRP], [NAMA], [KEHADIRAN], [KEHADIRAN_DESC], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY]) VALUES (N'69404bfd-bbba-4614-a376-2a7bfa8b8774', CAST(0x073E0B00 AS Date), CAST(0x0B3E0B00 AS Date), N'6107067', N'AGUS BUDI HARTO', NULL, NULL, NULL, CAST(0x0000A8B000E3A6A9 AS DateTime), N'2017038', CAST(0x0000A8B000E3A6A9 AS DateTime), N'2017038')
INSERT [NANO].[TBL_T_KEHADIRAN_MEETING] ([PID_KEHADIRAN], [TGL_PLAN], [TGL_ACT], [NRP], [NAMA], [KEHADIRAN], [KEHADIRAN_DESC], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY]) VALUES (N'69e42498-f0d6-4ac5-b751-e9bf55e25e5a', NULL, CAST(0x7B3D0B00 AS Date), NULL, NULL, NULL, NULL, NULL, CAST(0x0000A820008BE420 AS DateTime), N'2016030', CAST(0x0000A820008BE420 AS DateTime), N'2016030')
INSERT [NANO].[TBL_T_KEHADIRAN_MEETING] ([PID_KEHADIRAN], [TGL_PLAN], [TGL_ACT], [NRP], [NAMA], [KEHADIRAN], [KEHADIRAN_DESC], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY]) VALUES (N'6a137305-68a8-4ec1-8adf-e956742e1834', CAST(0x433D0B00 AS Date), CAST(0x433D0B00 AS Date), N'2017038', N'ANNISAA RAHMAYANI NURFAJAR', N'1', N'HADIR', NULL, CAST(0x0000A8180110EABD AS DateTime), N'2016030', CAST(0x0000A8180110EABD AS DateTime), N'2016030')
INSERT [NANO].[TBL_T_KEHADIRAN_MEETING] ([PID_KEHADIRAN], [TGL_PLAN], [TGL_ACT], [NRP], [NAMA], [KEHADIRAN], [KEHADIRAN_DESC], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY]) VALUES (N'6b1656f7-3a13-45db-a2ec-9fbf1b1c7424', CAST(0x353D0B00 AS Date), CAST(0x353D0B00 AS Date), N'6113882', N'ARTDITYO PRIAMBODHO', N'8', N'CUTI', NULL, CAST(0x0000A8180110BE1D AS DateTime), N'2016030', CAST(0x0000A8180110BE1D AS DateTime), N'2016030')
INSERT [NANO].[TBL_T_KEHADIRAN_MEETING] ([PID_KEHADIRAN], [TGL_PLAN], [TGL_ACT], [NRP], [NAMA], [KEHADIRAN], [KEHADIRAN_DESC], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY]) VALUES (N'6db9b087-4186-4f36-9986-bdfaa56a4d00', CAST(0x7B3D0B00 AS Date), CAST(0x7B3D0B00 AS Date), N'6107067', N'AGUS BUDI HARTO', N'1', N'HADIR', NULL, CAST(0x0000A820008DDEC6 AS DateTime), N'2016030', CAST(0x0000A820009028EF AS DateTime), N'2016030')
INSERT [NANO].[TBL_T_KEHADIRAN_MEETING] ([PID_KEHADIRAN], [TGL_PLAN], [TGL_ACT], [NRP], [NAMA], [KEHADIRAN], [KEHADIRAN_DESC], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY]) VALUES (N'730bfd07-d341-4d16-8f2b-31cc93c7a36e', CAST(0x273D0B00 AS Date), CAST(0x273D0B00 AS Date), N'6113882', N'ARTDITYO PRIAMBODHO', N'1', N'HADIR', NULL, CAST(0x0000A818011070B5 AS DateTime), N'2016030', CAST(0x0000A818011070B5 AS DateTime), N'2016030')
INSERT [NANO].[TBL_T_KEHADIRAN_MEETING] ([PID_KEHADIRAN], [TGL_PLAN], [TGL_ACT], [NRP], [NAMA], [KEHADIRAN], [KEHADIRAN_DESC], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY]) VALUES (N'7365c4e7-7f97-40e8-aee6-498478eb4066', CAST(0x5F3D0B00 AS Date), CAST(0x5F3D0B00 AS Date), N'2017038', N'ANNISAA RAHMAYANI NURFAJAR', N'1', N'HADIR', NULL, CAST(0x0000A818011179E6 AS DateTime), N'2016030', CAST(0x0000A818011179E6 AS DateTime), N'2016030')
INSERT [NANO].[TBL_T_KEHADIRAN_MEETING] ([PID_KEHADIRAN], [TGL_PLAN], [TGL_ACT], [NRP], [NAMA], [KEHADIRAN], [KEHADIRAN_DESC], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY]) VALUES (N'785b7b06-4fe7-4d6f-aba0-1eb0853c8834', NULL, CAST(0x7B3D0B00 AS Date), NULL, NULL, NULL, NULL, NULL, CAST(0x0000A820008ACB8E AS DateTime), N'2016030', CAST(0x0000A820008ACB8E AS DateTime), N'2016030')
INSERT [NANO].[TBL_T_KEHADIRAN_MEETING] ([PID_KEHADIRAN], [TGL_PLAN], [TGL_ACT], [NRP], [NAMA], [KEHADIRAN], [KEHADIRAN_DESC], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY]) VALUES (N'7875abaf-8f48-46a8-9889-dc670cd5b580', CAST(0x6D3D0B00 AS Date), CAST(0x6D3D0B00 AS Date), N'2017038', N'ANNISAA RAHMAYANI NURFAJAR', N'1', N'HADIR', NULL, CAST(0x0000A8180111AB92 AS DateTime), N'2016030', CAST(0x0000A8190119CB11 AS DateTime), N'2016030')
INSERT [NANO].[TBL_T_KEHADIRAN_MEETING] ([PID_KEHADIRAN], [TGL_PLAN], [TGL_ACT], [NRP], [NAMA], [KEHADIRAN], [KEHADIRAN_DESC], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY]) VALUES (N'7999d818-5549-4663-85c2-931b924de61e', CAST(0x433D0B00 AS Date), CAST(0x433D0B00 AS Date), N'6196076', N'SATARSO AGUS TJAHJONO', N'5', N'TRAINING', NULL, CAST(0x0000A8180111044C AS DateTime), N'2016030', CAST(0x0000A8180111044C AS DateTime), N'2016030')
INSERT [NANO].[TBL_T_KEHADIRAN_MEETING] ([PID_KEHADIRAN], [TGL_PLAN], [TGL_ACT], [NRP], [NAMA], [KEHADIRAN], [KEHADIRAN_DESC], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY]) VALUES (N'7aa07c7d-abb2-4044-b832-3c56b1d75a50', NULL, CAST(0x7B3D0B00 AS Date), NULL, NULL, NULL, NULL, NULL, CAST(0x0000A820008D21D4 AS DateTime), N'2016030', CAST(0x0000A820008D21EA AS DateTime), N'2016030')
INSERT [NANO].[TBL_T_KEHADIRAN_MEETING] ([PID_KEHADIRAN], [TGL_PLAN], [TGL_ACT], [NRP], [NAMA], [KEHADIRAN], [KEHADIRAN_DESC], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY]) VALUES (N'7D5559DE-6722-4940-BAD7-CCD9E4F20076', CAST(0xDD3D0B00 AS Date), CAST(0xDD3D0B00 AS Date), N'6107067', N'AGUS BUDI HARTO', N'1', N'HADIR', NULL, CAST(0x0000A88100E29A8E AS DateTime), N'2016030', CAST(0x0000A8820089174B AS DateTime), N'2016030')
INSERT [NANO].[TBL_T_KEHADIRAN_MEETING] ([PID_KEHADIRAN], [TGL_PLAN], [TGL_ACT], [NRP], [NAMA], [KEHADIRAN], [KEHADIRAN_DESC], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY]) VALUES (N'7df81ac7-4496-4507-8da5-5406194c0ade', NULL, CAST(0x7B3D0B00 AS Date), NULL, NULL, NULL, NULL, NULL, CAST(0x0000A820008BE420 AS DateTime), N'2016030', CAST(0x0000A820008BE420 AS DateTime), N'2016030')
INSERT [NANO].[TBL_T_KEHADIRAN_MEETING] ([PID_KEHADIRAN], [TGL_PLAN], [TGL_ACT], [NRP], [NAMA], [KEHADIRAN], [KEHADIRAN_DESC], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY]) VALUES (N'7e21c8fd-68fa-4a85-8801-fe4e9a4fc7c8', CAST(0x6D3D0B00 AS Date), CAST(0x6D3D0B00 AS Date), N'6113882', N'ARTDITYO PRIAMBODHO', N'1', N'HADIR', NULL, CAST(0x0000A8180111A6BF AS DateTime), N'2016030', CAST(0x0000A8190119CB11 AS DateTime), N'2016030')
INSERT [NANO].[TBL_T_KEHADIRAN_MEETING] ([PID_KEHADIRAN], [TGL_PLAN], [TGL_ACT], [NRP], [NAMA], [KEHADIRAN], [KEHADIRAN_DESC], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY]) VALUES (N'7ecb621b-88cf-4f1b-bdef-8a46ef4e79f9', CAST(0x273D0B00 AS Date), CAST(0x273D0B00 AS Date), N'2016030', N'YAQUB EDY SUSILO', N'7', N'IJIN', NULL, CAST(0x0000A81801107C56 AS DateTime), N'2016030', CAST(0x0000A81801107C56 AS DateTime), N'2016030')
INSERT [NANO].[TBL_T_KEHADIRAN_MEETING] ([PID_KEHADIRAN], [TGL_PLAN], [TGL_ACT], [NRP], [NAMA], [KEHADIRAN], [KEHADIRAN_DESC], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY]) VALUES (N'810167dc-dfce-4e21-81af-c5efb2fa70ea', CAST(0xB33D0B00 AS Date), CAST(0xB73D0B00 AS Date), N'6196076', N'SATARSO AGUS TJAHJONO', N'8', N'CUTI', NULL, CAST(0x0000A85C00872AF9 AS DateTime), N'2017038', CAST(0x0000A85C00872AF9 AS DateTime), N'2017038')
INSERT [NANO].[TBL_T_KEHADIRAN_MEETING] ([PID_KEHADIRAN], [TGL_PLAN], [TGL_ACT], [NRP], [NAMA], [KEHADIRAN], [KEHADIRAN_DESC], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY]) VALUES (N'8222cf18-72f3-4ca5-adcf-46d99bd2629d', CAST(0x233E0B00 AS Date), CAST(0x233E0B00 AS Date), N'193078', N'SUKRON', N'1', N'HADIR', NULL, CAST(0x0000A8C80098D227 AS DateTime), N'6107067', CAST(0x0000A8C80098D227 AS DateTime), N'6107067')
INSERT [NANO].[TBL_T_KEHADIRAN_MEETING] ([PID_KEHADIRAN], [TGL_PLAN], [TGL_ACT], [NRP], [NAMA], [KEHADIRAN], [KEHADIRAN_DESC], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY]) VALUES (N'822356fa-83ec-437f-a28f-ab77594a08fd', CAST(0xC13D0B00 AS Date), CAST(0xC13D0B00 AS Date), N'2016030', N'YAQUB EDY SUSILO', N'1', N'HADIR', NULL, CAST(0x0000A866008E3981 AS DateTime), N'193078', CAST(0x0000A866008E3981 AS DateTime), N'193078')
INSERT [NANO].[TBL_T_KEHADIRAN_MEETING] ([PID_KEHADIRAN], [TGL_PLAN], [TGL_ACT], [NRP], [NAMA], [KEHADIRAN], [KEHADIRAN_DESC], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY]) VALUES (N'8450fae3-c741-4207-9e04-ae4fec57be4d', CAST(0xEB3D0B00 AS Date), CAST(0xEB3D0B00 AS Date), N'193078', N'SUKRON', N'1', N'HADIR', NULL, CAST(0x0000A890008E8089 AS DateTime), N'2017038', CAST(0x0000A890008F4E4A AS DateTime), N'2017038')
INSERT [NANO].[TBL_T_KEHADIRAN_MEETING] ([PID_KEHADIRAN], [TGL_PLAN], [TGL_ACT], [NRP], [NAMA], [KEHADIRAN], [KEHADIRAN_DESC], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY]) VALUES (N'859ed962-218c-40f2-a380-c404bf3c870d', CAST(0x353D0B00 AS Date), CAST(0x353D0B00 AS Date), N'2016030', N'YAQUB EDY SUSILO', N'1', N'HADIR', NULL, CAST(0x0000A8180110C6C3 AS DateTime), N'2016030', CAST(0x0000A8180110C6C3 AS DateTime), N'2016030')
INSERT [NANO].[TBL_T_KEHADIRAN_MEETING] ([PID_KEHADIRAN], [TGL_PLAN], [TGL_ACT], [NRP], [NAMA], [KEHADIRAN], [KEHADIRAN_DESC], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY]) VALUES (N'87a362fa-eaac-4311-92d2-aa0c606c763b', CAST(0x233E0B00 AS Date), CAST(0x233E0B00 AS Date), N'6196076', N'SATARSO AGUS TJAHJONO', N'1', N'HADIR', NULL, CAST(0x0000A8C80098D222 AS DateTime), N'6107067', CAST(0x0000A8C80098D222 AS DateTime), N'6107067')
GO
print 'Processed 100 total records'
INSERT [NANO].[TBL_T_KEHADIRAN_MEETING] ([PID_KEHADIRAN], [TGL_PLAN], [TGL_ACT], [NRP], [NAMA], [KEHADIRAN], [KEHADIRAN_DESC], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY]) VALUES (N'8889ddb1-dfff-4c80-83ae-18d304b75466', CAST(0x3F3E0B00 AS Date), CAST(0x3F3E0B00 AS Date), N'2016030', N'YAQUB EDY SUSILO', N'1', N'HADIR', NULL, CAST(0x0000A8E4009105FC AS DateTime), N'2016030', CAST(0x0000A8E4009317A5 AS DateTime), N'2016030')
INSERT [NANO].[TBL_T_KEHADIRAN_MEETING] ([PID_KEHADIRAN], [TGL_PLAN], [TGL_ACT], [NRP], [NAMA], [KEHADIRAN], [KEHADIRAN_DESC], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY]) VALUES (N'8a1135d6-f949-47c1-a3ef-6d62ec2c2b08', CAST(0x973D0B00 AS Date), CAST(0x963D0B00 AS Date), N'6196076', N'SATARSO AGUS TJAHJONO', N'3', N'MEETING LAIN', NULL, CAST(0x0000A83B0087132D AS DateTime), N'2016030', CAST(0x0000A83B008ABD22 AS DateTime), N'2016030')
INSERT [NANO].[TBL_T_KEHADIRAN_MEETING] ([PID_KEHADIRAN], [TGL_PLAN], [TGL_ACT], [NRP], [NAMA], [KEHADIRAN], [KEHADIRAN_DESC], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY]) VALUES (N'8d6e9c1f-bc34-494b-a6b4-81bd045a2f17', NULL, CAST(0x7B3D0B00 AS Date), NULL, NULL, NULL, NULL, NULL, CAST(0x0000A820008930CA AS DateTime), N'2016030', CAST(0x0000A820008930CA AS DateTime), N'2016030')
INSERT [NANO].[TBL_T_KEHADIRAN_MEETING] ([PID_KEHADIRAN], [TGL_PLAN], [TGL_ACT], [NRP], [NAMA], [KEHADIRAN], [KEHADIRAN_DESC], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY]) VALUES (N'916e357c-f05c-42c0-a28e-d257e2f12f38', CAST(0xB33D0B00 AS Date), CAST(0xB73D0B00 AS Date), N'2017038', N'ANNISAA RAHMAYANI NURFAJAR', N'1', N'HADIR', NULL, CAST(0x0000A85C00872AB3 AS DateTime), N'2017038', CAST(0x0000A85C00872AB3 AS DateTime), N'2017038')
INSERT [NANO].[TBL_T_KEHADIRAN_MEETING] ([PID_KEHADIRAN], [TGL_PLAN], [TGL_ACT], [NRP], [NAMA], [KEHADIRAN], [KEHADIRAN_DESC], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY]) VALUES (N'950912a3-8f44-4f36-a760-de96a013de6b', CAST(0x433D0B00 AS Date), CAST(0x433D0B00 AS Date), N'193078', N'SUKRON', N'4', N'DINAS KE SITE', NULL, CAST(0x0000A81801110FB4 AS DateTime), N'2016030', CAST(0x0000A81801110FB4 AS DateTime), N'2016030')
INSERT [NANO].[TBL_T_KEHADIRAN_MEETING] ([PID_KEHADIRAN], [TGL_PLAN], [TGL_ACT], [NRP], [NAMA], [KEHADIRAN], [KEHADIRAN_DESC], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY]) VALUES (N'951f43f2-1fc8-4b98-af58-956ffd7fb318', CAST(0xCF3D0B00 AS Date), CAST(0xCF3D0B00 AS Date), N'2016030', N'YAQUB EDY SUSILO', N'1', N'HADIR', NULL, CAST(0x0000A874008B8B5D AS DateTime), N'6113882', CAST(0x0000A874008B8B5D AS DateTime), N'6113882')
INSERT [NANO].[TBL_T_KEHADIRAN_MEETING] ([PID_KEHADIRAN], [TGL_PLAN], [TGL_ACT], [NRP], [NAMA], [KEHADIRAN], [KEHADIRAN_DESC], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY]) VALUES (N'95273148-3ee4-431f-88eb-a4367c883d6f', CAST(0x973D0B00 AS Date), CAST(0x963D0B00 AS Date), N'2017038', N'ANNISAA RAHMAYANI NURFAJAR', N'1', N'HADIR', NULL, CAST(0x0000A83B0087130D AS DateTime), N'2016030', CAST(0x0000A83B008ABD06 AS DateTime), N'2016030')
INSERT [NANO].[TBL_T_KEHADIRAN_MEETING] ([PID_KEHADIRAN], [TGL_PLAN], [TGL_ACT], [NRP], [NAMA], [KEHADIRAN], [KEHADIRAN_DESC], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY]) VALUES (N'954febfa-bc30-4540-8a2e-2c98384921a6', CAST(0x153E0B00 AS Date), CAST(0x153E0B00 AS Date), N'6113882', N'ARTDITYO PRIAMBODHO', N'2', N'TIDAK HADIR', NULL, CAST(0x0000A8BA0083B813 AS DateTime), N'2017038', CAST(0x0000A8BA00846C0D AS DateTime), N'2017038')
INSERT [NANO].[TBL_T_KEHADIRAN_MEETING] ([PID_KEHADIRAN], [TGL_PLAN], [TGL_ACT], [NRP], [NAMA], [KEHADIRAN], [KEHADIRAN_DESC], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY]) VALUES (N'958df60f-c65c-4e39-bbc2-99cb3f21b017', NULL, CAST(0x7B3D0B00 AS Date), NULL, NULL, NULL, NULL, NULL, CAST(0x0000A82000886969 AS DateTime), N'2016030', CAST(0x0000A82000886969 AS DateTime), N'2016030')
INSERT [NANO].[TBL_T_KEHADIRAN_MEETING] ([PID_KEHADIRAN], [TGL_PLAN], [TGL_ACT], [NRP], [NAMA], [KEHADIRAN], [KEHADIRAN_DESC], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY]) VALUES (N'9b0fce4b-7203-43fc-8eef-8e7b84e11389', CAST(0x3F3E0B00 AS Date), CAST(0x3F3E0B00 AS Date), N'6107067', N'AGUS BUDI HARTO', N'1', N'HADIR', NULL, CAST(0x0000A8E4009105FC AS DateTime), N'2016030', CAST(0x0000A8E4009317AA AS DateTime), N'2016030')
INSERT [NANO].[TBL_T_KEHADIRAN_MEETING] ([PID_KEHADIRAN], [TGL_PLAN], [TGL_ACT], [NRP], [NAMA], [KEHADIRAN], [KEHADIRAN_DESC], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY]) VALUES (N'9bc2979c-7b96-41d6-8bbe-e6bcfc660fbe', CAST(0xEB3D0B00 AS Date), CAST(0xEB3D0B00 AS Date), N'2017038', N'ANNISAA RAHMAYANI NURFAJAR', N'1', N'HADIR', NULL, CAST(0x0000A890008E8068 AS DateTime), N'2017038', CAST(0x0000A890008F4E25 AS DateTime), N'2017038')
INSERT [NANO].[TBL_T_KEHADIRAN_MEETING] ([PID_KEHADIRAN], [TGL_PLAN], [TGL_ACT], [NRP], [NAMA], [KEHADIRAN], [KEHADIRAN_DESC], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY]) VALUES (N'9f3da963-4a1d-44bf-b9fa-2425b907e44f', CAST(0x313E0B00 AS Date), CAST(0x313E0B00 AS Date), N'6107067', N'AGUS BUDI HARTO', N'1', N'HADIR', NULL, CAST(0x0000A8D6008E4267 AS DateTime), N'6107067', CAST(0x0000A8D60092ED67 AS DateTime), N'6107067')
INSERT [NANO].[TBL_T_KEHADIRAN_MEETING] ([PID_KEHADIRAN], [TGL_PLAN], [TGL_ACT], [NRP], [NAMA], [KEHADIRAN], [KEHADIRAN_DESC], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY]) VALUES (N'9fdfda7a-2917-440a-b96c-1294e0c5b4db', NULL, CAST(0x7B3D0B00 AS Date), NULL, NULL, NULL, NULL, NULL, CAST(0x0000A820008ACB93 AS DateTime), N'2016030', CAST(0x0000A820008ACB93 AS DateTime), N'2016030')
INSERT [NANO].[TBL_T_KEHADIRAN_MEETING] ([PID_KEHADIRAN], [TGL_PLAN], [TGL_ACT], [NRP], [NAMA], [KEHADIRAN], [KEHADIRAN_DESC], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY]) VALUES (N'a1b9216e-e659-4453-847c-3b9303951b22', CAST(0xA53D0B00 AS Date), CAST(0xA53D0B00 AS Date), N'2016030', N'YAQUB EDY SUSILO', N'1', N'HADIR', NULL, CAST(0x0000A84A0097AD88 AS DateTime), N'6113882', CAST(0x0000A84D00937286 AS DateTime), N'6113882')
INSERT [NANO].[TBL_T_KEHADIRAN_MEETING] ([PID_KEHADIRAN], [TGL_PLAN], [TGL_ACT], [NRP], [NAMA], [KEHADIRAN], [KEHADIRAN_DESC], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY]) VALUES (N'a21a9c99-a471-4fc9-856b-da8b39810760', CAST(0x6D3D0B00 AS Date), CAST(0x6D3D0B00 AS Date), N'6196076', N'SATARSO AGUS TJAHJONO', N'1', N'HADIR', NULL, CAST(0x0000A8180111A23F AS DateTime), N'2016030', CAST(0x0000A8190119CB0D AS DateTime), N'2016030')
INSERT [NANO].[TBL_T_KEHADIRAN_MEETING] ([PID_KEHADIRAN], [TGL_PLAN], [TGL_ACT], [NRP], [NAMA], [KEHADIRAN], [KEHADIRAN_DESC], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY]) VALUES (N'a29b727b-b0c8-4cd9-a0bb-1bff7ef148d5', CAST(0xC13D0B00 AS Date), CAST(0xC13D0B00 AS Date), N'6107067', N'AGUS BUDI HARTO', N'1', N'HADIR', NULL, CAST(0x0000A866008E3998 AS DateTime), N'193078', CAST(0x0000A866008E3998 AS DateTime), N'193078')
INSERT [NANO].[TBL_T_KEHADIRAN_MEETING] ([PID_KEHADIRAN], [TGL_PLAN], [TGL_ACT], [NRP], [NAMA], [KEHADIRAN], [KEHADIRAN_DESC], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY]) VALUES (N'a3b03b79-71d4-4e95-9b0e-8b5267c44487', CAST(0x893D0B00 AS Date), CAST(0x893D0B00 AS Date), N'6107067', N'AGUS BUDI HARTO', N'1', N'HADIR', NULL, CAST(0x0000A82E008CFA37 AS DateTime), N'2017038', CAST(0x0000A82E00915C86 AS DateTime), N'2017038')
INSERT [NANO].[TBL_T_KEHADIRAN_MEETING] ([PID_KEHADIRAN], [TGL_PLAN], [TGL_ACT], [NRP], [NAMA], [KEHADIRAN], [KEHADIRAN_DESC], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY]) VALUES (N'a5ee392a-86ac-4a1a-8158-9f4ffe17edfe', CAST(0x3F3E0B00 AS Date), CAST(0x3F3E0B00 AS Date), N'1708040', N'CASMITA', N'1', N'HADIR', NULL, CAST(0x0000A8E4009105F8 AS DateTime), N'2016030', CAST(0x0000A8E4009317A1 AS DateTime), N'2016030')
INSERT [NANO].[TBL_T_KEHADIRAN_MEETING] ([PID_KEHADIRAN], [TGL_PLAN], [TGL_ACT], [NRP], [NAMA], [KEHADIRAN], [KEHADIRAN_DESC], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY]) VALUES (N'a637237a-20e1-4230-bd89-8656fa3a512e', CAST(0x513D0B00 AS Date), CAST(0x513D0B00 AS Date), N'193078', N'SUKRON', N'1', N'HADIR', NULL, CAST(0x0000A81801114516 AS DateTime), N'2016030', CAST(0x0000A81801114516 AS DateTime), N'2016030')
INSERT [NANO].[TBL_T_KEHADIRAN_MEETING] ([PID_KEHADIRAN], [TGL_PLAN], [TGL_ACT], [NRP], [NAMA], [KEHADIRAN], [KEHADIRAN_DESC], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY]) VALUES (N'a65be733-f688-436d-a6d9-e656ed20ca13', CAST(0x313E0B00 AS Date), CAST(0x313E0B00 AS Date), N'6113882', N'ARTDITYO PRIAMBODHO', N'1', N'HADIR', NULL, CAST(0x0000A8D6008E426C AS DateTime), N'6107067', CAST(0x0000A8D60092ED6C AS DateTime), N'6107067')
INSERT [NANO].[TBL_T_KEHADIRAN_MEETING] ([PID_KEHADIRAN], [TGL_PLAN], [TGL_ACT], [NRP], [NAMA], [KEHADIRAN], [KEHADIRAN_DESC], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY]) VALUES (N'a7e0a4e8-e418-487d-952a-1a7180c27684', CAST(0xA53D0B00 AS Date), CAST(0xA53D0B00 AS Date), N'193078', N'SUKRON', N'1', N'HADIR', NULL, CAST(0x0000A84A0097AD8D AS DateTime), N'6113882', CAST(0x0000A84D0093728F AS DateTime), N'6113882')
INSERT [NANO].[TBL_T_KEHADIRAN_MEETING] ([PID_KEHADIRAN], [TGL_PLAN], [TGL_ACT], [NRP], [NAMA], [KEHADIRAN], [KEHADIRAN_DESC], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY]) VALUES (N'a81b5792-4b67-4e4a-9d54-92e70c2d86f5', CAST(0xA53D0B00 AS Date), CAST(0xA53D0B00 AS Date), N'6196076', N'SATARSO AGUS TJAHJONO', N'1', N'HADIR', NULL, CAST(0x0000A84A0097AD8D AS DateTime), N'6113882', CAST(0x0000A84D0093728F AS DateTime), N'6113882')
INSERT [NANO].[TBL_T_KEHADIRAN_MEETING] ([PID_KEHADIRAN], [TGL_PLAN], [TGL_ACT], [NRP], [NAMA], [KEHADIRAN], [KEHADIRAN_DESC], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY]) VALUES (N'A85B9478-3825-44A0-9EE9-E864516F2279', CAST(0xDD3D0B00 AS Date), CAST(0xDD3D0B00 AS Date), N'193078', N'SUKRON', N'4', N'DINAS KE SITE', NULL, CAST(0x0000A88100E29A8E AS DateTime), N'2016030', CAST(0x0000A88200891755 AS DateTime), N'2016030')
INSERT [NANO].[TBL_T_KEHADIRAN_MEETING] ([PID_KEHADIRAN], [TGL_PLAN], [TGL_ACT], [NRP], [NAMA], [KEHADIRAN], [KEHADIRAN_DESC], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY]) VALUES (N'a8de3c52-b4ed-4bdf-abd6-2024be7dc939', CAST(0x893D0B00 AS Date), CAST(0x893D0B00 AS Date), N'6196076', N'SATARSO AGUS TJAHJONO', N'1', N'HADIR', NULL, CAST(0x0000A82E008CFAF2 AS DateTime), N'2017038', CAST(0x0000A82E00915C99 AS DateTime), N'2017038')
INSERT [NANO].[TBL_T_KEHADIRAN_MEETING] ([PID_KEHADIRAN], [TGL_PLAN], [TGL_ACT], [NRP], [NAMA], [KEHADIRAN], [KEHADIRAN_DESC], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY]) VALUES (N'a99613ab-ac21-4f0d-ae47-faaa4e8f82cc', CAST(0x433D0B00 AS Date), CAST(0x433D0B00 AS Date), N'2016030', N'YAQUB EDY SUSILO', N'1', N'HADIR', NULL, CAST(0x0000A8180110F00A AS DateTime), N'2016030', CAST(0x0000A8180110F00A AS DateTime), N'2016030')
INSERT [NANO].[TBL_T_KEHADIRAN_MEETING] ([PID_KEHADIRAN], [TGL_PLAN], [TGL_ACT], [NRP], [NAMA], [KEHADIRAN], [KEHADIRAN_DESC], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY]) VALUES (N'adcf4df5-7cb1-48bf-b93a-369c2c6161f3', NULL, CAST(0x7B3D0B00 AS Date), NULL, NULL, NULL, NULL, NULL, CAST(0x0000A82000886969 AS DateTime), N'2016030', CAST(0x0000A82000886969 AS DateTime), N'2016030')
INSERT [NANO].[TBL_T_KEHADIRAN_MEETING] ([PID_KEHADIRAN], [TGL_PLAN], [TGL_ACT], [NRP], [NAMA], [KEHADIRAN], [KEHADIRAN_DESC], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY]) VALUES (N'aec104aa-9883-4f61-95f0-df7087241056', CAST(0x273D0B00 AS Date), CAST(0x273D0B00 AS Date), N'2017038', N'ANNISAA RAHMAYANI NURFAJAR', N'1', N'HADIR', NULL, CAST(0x0000A81801106A9A AS DateTime), N'2016030', CAST(0x0000A81801106A9A AS DateTime), N'2016030')
INSERT [NANO].[TBL_T_KEHADIRAN_MEETING] ([PID_KEHADIRAN], [TGL_PLAN], [TGL_ACT], [NRP], [NAMA], [KEHADIRAN], [KEHADIRAN_DESC], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY]) VALUES (N'b1cce014-d503-4ec7-b8a3-cc1ca7694a39', CAST(0x273D0B00 AS Date), CAST(0x273D0B00 AS Date), N'6196076', N'SATARSO AGUS TJAHJONO', N'8', N'CUTI', NULL, CAST(0x0000A81801108A28 AS DateTime), N'2016030', CAST(0x0000A81801108A28 AS DateTime), N'2016030')
INSERT [NANO].[TBL_T_KEHADIRAN_MEETING] ([PID_KEHADIRAN], [TGL_PLAN], [TGL_ACT], [NRP], [NAMA], [KEHADIRAN], [KEHADIRAN_DESC], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY]) VALUES (N'b4cc6000-c6ee-4df2-90c5-c0e5dcb1e048', CAST(0x7B3D0B00 AS Date), CAST(0x7B3D0B00 AS Date), N'6196076', N'SATARSO AGUS TJAHJONO', N'1', N'HADIR', NULL, CAST(0x0000A820008DDF03 AS DateTime), N'2016030', CAST(0x0000A820009028F9 AS DateTime), N'2016030')
INSERT [NANO].[TBL_T_KEHADIRAN_MEETING] ([PID_KEHADIRAN], [TGL_PLAN], [TGL_ACT], [NRP], [NAMA], [KEHADIRAN], [KEHADIRAN_DESC], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY]) VALUES (N'b52c89cc-f81c-45a1-ab88-dbb6c5f67297', CAST(0x893D0B00 AS Date), CAST(0x893D0B00 AS Date), N'2017038', N'ANNISAA RAHMAYANI NURFAJAR', N'1', N'HADIR', NULL, CAST(0x0000A82E008CF8C0 AS DateTime), N'2017038', CAST(0x0000A82E00915C65 AS DateTime), N'2017038')
INSERT [NANO].[TBL_T_KEHADIRAN_MEETING] ([PID_KEHADIRAN], [TGL_PLAN], [TGL_ACT], [NRP], [NAMA], [KEHADIRAN], [KEHADIRAN_DESC], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY]) VALUES (N'b6434a5d-f054-4080-bdff-ee5bda720b4e', CAST(0x513D0B00 AS Date), CAST(0x513D0B00 AS Date), N'6107067', N'AGUS BUDI HARTO', N'1', N'HADIR', NULL, CAST(0x0000A81801114DAD AS DateTime), N'2016030', CAST(0x0000A81801114DAD AS DateTime), N'2016030')
INSERT [NANO].[TBL_T_KEHADIRAN_MEETING] ([PID_KEHADIRAN], [TGL_PLAN], [TGL_ACT], [NRP], [NAMA], [KEHADIRAN], [KEHADIRAN_DESC], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY]) VALUES (N'b6d718ab-8148-47f5-a25f-6f380803b28a', CAST(0x313E0B00 AS Date), CAST(0x313E0B00 AS Date), N'2016030', N'YAQUB EDY SUSILO', N'1', N'HADIR', NULL, CAST(0x0000A8D6008E4267 AS DateTime), N'6107067', CAST(0x0000A8D60092ED67 AS DateTime), N'6107067')
INSERT [NANO].[TBL_T_KEHADIRAN_MEETING] ([PID_KEHADIRAN], [TGL_PLAN], [TGL_ACT], [NRP], [NAMA], [KEHADIRAN], [KEHADIRAN_DESC], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY]) VALUES (N'bd4446c9-b52f-413c-822b-ebd2bd22b77c', NULL, CAST(0x7B3D0B00 AS Date), NULL, NULL, NULL, NULL, NULL, CAST(0x0000A820008ACB8E AS DateTime), N'2016030', CAST(0x0000A820008ACB8E AS DateTime), N'2016030')
INSERT [NANO].[TBL_T_KEHADIRAN_MEETING] ([PID_KEHADIRAN], [TGL_PLAN], [TGL_ACT], [NRP], [NAMA], [KEHADIRAN], [KEHADIRAN_DESC], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY]) VALUES (N'c01ae01a-4fec-4509-96c0-f8ecab3c2df5', NULL, CAST(0x7B3D0B00 AS Date), NULL, NULL, NULL, NULL, NULL, CAST(0x0000A820008BFFD5 AS DateTime), N'2016030', CAST(0x0000A820008BFFD5 AS DateTime), N'2016030')
INSERT [NANO].[TBL_T_KEHADIRAN_MEETING] ([PID_KEHADIRAN], [TGL_PLAN], [TGL_ACT], [NRP], [NAMA], [KEHADIRAN], [KEHADIRAN_DESC], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY]) VALUES (N'C2E39535-5FEE-4BFA-B6E5-E14A11546678', CAST(0xDD3D0B00 AS Date), CAST(0xDD3D0B00 AS Date), N'2017038', N'ANNISAA RAHMAYANI NURFAJAR', N'1', N'HADIR', NULL, CAST(0x0000A88100E29A8E AS DateTime), N'2016030', CAST(0x0000A88200891734 AS DateTime), N'2016030')
INSERT [NANO].[TBL_T_KEHADIRAN_MEETING] ([PID_KEHADIRAN], [TGL_PLAN], [TGL_ACT], [NRP], [NAMA], [KEHADIRAN], [KEHADIRAN_DESC], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY]) VALUES (N'c301cfaf-52f8-4b63-9853-61e57b7c5779', CAST(0xCF3D0B00 AS Date), CAST(0xCF3D0B00 AS Date), N'2017038', N'ANNISAA RAHMAYANI NURFAJAR', N'1', N'HADIR', NULL, CAST(0x0000A874008B8B58 AS DateTime), N'6113882', CAST(0x0000A874008B8B58 AS DateTime), N'6113882')
INSERT [NANO].[TBL_T_KEHADIRAN_MEETING] ([PID_KEHADIRAN], [TGL_PLAN], [TGL_ACT], [NRP], [NAMA], [KEHADIRAN], [KEHADIRAN_DESC], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY]) VALUES (N'c3836156-9f7a-4bfa-8703-788a05b8a489', CAST(0x153E0B00 AS Date), CAST(0x153E0B00 AS Date), N'6107067', N'AGUS BUDI HARTO', N'1', N'HADIR', NULL, CAST(0x0000A8BA0083B818 AS DateTime), N'2017038', CAST(0x0000A8BA00846C09 AS DateTime), N'2017038')
INSERT [NANO].[TBL_T_KEHADIRAN_MEETING] ([PID_KEHADIRAN], [TGL_PLAN], [TGL_ACT], [NRP], [NAMA], [KEHADIRAN], [KEHADIRAN_DESC], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY]) VALUES (N'c3cbe447-438b-45dd-a92e-357d3b8fc507', NULL, CAST(0x7B3D0B00 AS Date), NULL, NULL, NULL, NULL, NULL, CAST(0x0000A820008BFFEE AS DateTime), N'2016030', CAST(0x0000A820008BFFEE AS DateTime), N'2016030')
INSERT [NANO].[TBL_T_KEHADIRAN_MEETING] ([PID_KEHADIRAN], [TGL_PLAN], [TGL_ACT], [NRP], [NAMA], [KEHADIRAN], [KEHADIRAN_DESC], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY]) VALUES (N'c3f7efcf-487c-4147-bedf-7cacef47136e', CAST(0xA53D0B00 AS Date), CAST(0xA53D0B00 AS Date), N'2017038', N'ANNISAA RAHMAYANI NURFAJAR', N'1', N'HADIR', NULL, CAST(0x0000A84A0097AD88 AS DateTime), N'6113882', CAST(0x0000A84D0093726A AS DateTime), N'6113882')
INSERT [NANO].[TBL_T_KEHADIRAN_MEETING] ([PID_KEHADIRAN], [TGL_PLAN], [TGL_ACT], [NRP], [NAMA], [KEHADIRAN], [KEHADIRAN_DESC], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY]) VALUES (N'c4696cf4-b1c2-49a0-b485-d3d537b315ff', CAST(0xA53D0B00 AS Date), CAST(0xA83D0B00 AS Date), N'1708040', N'CASMITA', N'1', N'HADIR', NULL, CAST(0x0000A84D00937294 AS DateTime), N'6113882', CAST(0x0000A84D00937294 AS DateTime), N'6113882')
INSERT [NANO].[TBL_T_KEHADIRAN_MEETING] ([PID_KEHADIRAN], [TGL_PLAN], [TGL_ACT], [NRP], [NAMA], [KEHADIRAN], [KEHADIRAN_DESC], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY]) VALUES (N'c4bb9dfe-1ae7-4a69-beb4-9dc76d772e02', CAST(0x6D3D0B00 AS Date), CAST(0x6D3D0B00 AS Date), N'6107067', N'AGUS BUDI HARTO', N'1', N'HADIR', NULL, CAST(0x0000A8180111B08B AS DateTime), N'2016030', CAST(0x0000A8190119CB16 AS DateTime), N'2016030')
INSERT [NANO].[TBL_T_KEHADIRAN_MEETING] ([PID_KEHADIRAN], [TGL_PLAN], [TGL_ACT], [NRP], [NAMA], [KEHADIRAN], [KEHADIRAN_DESC], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY]) VALUES (N'c4e02794-bc4d-4847-a798-6f103c3abc69', CAST(0x073E0B00 AS Date), CAST(0x0B3E0B00 AS Date), N'6196076', N'SATARSO AGUS TJAHJONO', NULL, NULL, NULL, CAST(0x0000A8B000E3A6AE AS DateTime), N'2017038', CAST(0x0000A8B000E3A6AE AS DateTime), N'2017038')
INSERT [NANO].[TBL_T_KEHADIRAN_MEETING] ([PID_KEHADIRAN], [TGL_PLAN], [TGL_ACT], [NRP], [NAMA], [KEHADIRAN], [KEHADIRAN_DESC], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY]) VALUES (N'c5617d65-0f9a-4bdf-aedd-06a279504f1e', CAST(0x073E0B00 AS Date), CAST(0x0B3E0B00 AS Date), N'193078', N'SUKRON', NULL, NULL, NULL, CAST(0x0000A8B000E3A6B3 AS DateTime), N'2017038', CAST(0x0000A8B000E3A6B3 AS DateTime), N'2017038')
INSERT [NANO].[TBL_T_KEHADIRAN_MEETING] ([PID_KEHADIRAN], [TGL_PLAN], [TGL_ACT], [NRP], [NAMA], [KEHADIRAN], [KEHADIRAN_DESC], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY]) VALUES (N'c5e5576a-6d41-451f-9cbc-51809ce08b74', NULL, CAST(0x7B3D0B00 AS Date), NULL, NULL, NULL, NULL, NULL, CAST(0x0000A82000886969 AS DateTime), N'2016030', CAST(0x0000A82000886969 AS DateTime), N'2016030')
INSERT [NANO].[TBL_T_KEHADIRAN_MEETING] ([PID_KEHADIRAN], [TGL_PLAN], [TGL_ACT], [NRP], [NAMA], [KEHADIRAN], [KEHADIRAN_DESC], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY]) VALUES (N'c5eb4f77-337f-4132-963e-c9443dbc6e82', NULL, CAST(0x7B3D0B00 AS Date), NULL, NULL, NULL, NULL, NULL, CAST(0x0000A820008ACB93 AS DateTime), N'2016030', CAST(0x0000A820008ACB93 AS DateTime), N'2016030')
INSERT [NANO].[TBL_T_KEHADIRAN_MEETING] ([PID_KEHADIRAN], [TGL_PLAN], [TGL_ACT], [NRP], [NAMA], [KEHADIRAN], [KEHADIRAN_DESC], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY]) VALUES (N'CC114BC1-EBFB-40DD-B97E-35EFF4858212', CAST(0xDD3D0B00 AS Date), CAST(0xDD3D0B00 AS Date), N'2016030', N'YAQUB EDY SUSILO', N'1', N'HADIR', NULL, CAST(0x0000A88100E29A8E AS DateTime), N'2016030', CAST(0x0000A8820089173D AS DateTime), N'2016030')
INSERT [NANO].[TBL_T_KEHADIRAN_MEETING] ([PID_KEHADIRAN], [TGL_PLAN], [TGL_ACT], [NRP], [NAMA], [KEHADIRAN], [KEHADIRAN_DESC], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY]) VALUES (N'cdc94976-cf89-4218-badb-0bf8148daec8', CAST(0xCF3D0B00 AS Date), CAST(0xCF3D0B00 AS Date), N'6196076', N'SATARSO AGUS TJAHJONO', N'4', N'DINAS KE SITE', NULL, CAST(0x0000A874008B8B5D AS DateTime), N'6113882', CAST(0x0000A874008B8B5D AS DateTime), N'6113882')
INSERT [NANO].[TBL_T_KEHADIRAN_MEETING] ([PID_KEHADIRAN], [TGL_PLAN], [TGL_ACT], [NRP], [NAMA], [KEHADIRAN], [KEHADIRAN_DESC], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY]) VALUES (N'ce0d1dcc-f1ed-40e5-ba0d-a90275b8ec3a', CAST(0x893D0B00 AS Date), CAST(0x893D0B00 AS Date), N'2016030', N'YAQUB EDY SUSILO', N'7', N'IJIN', NULL, CAST(0x0000A82E008CF94D AS DateTime), N'2017038', CAST(0x0000A82E00915C7D AS DateTime), N'2017038')
INSERT [NANO].[TBL_T_KEHADIRAN_MEETING] ([PID_KEHADIRAN], [TGL_PLAN], [TGL_ACT], [NRP], [NAMA], [KEHADIRAN], [KEHADIRAN_DESC], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY]) VALUES (N'ce57b3a3-0ce2-4def-a3cf-6b336aa773ca', CAST(0x273D0B00 AS Date), CAST(0x273D0B00 AS Date), N'6107067', N'AGUS BUDI HARTO', N'1', N'HADIR', NULL, CAST(0x0000A8180110653A AS DateTime), N'2016030', CAST(0x0000A8180110653A AS DateTime), N'2016030')
INSERT [NANO].[TBL_T_KEHADIRAN_MEETING] ([PID_KEHADIRAN], [TGL_PLAN], [TGL_ACT], [NRP], [NAMA], [KEHADIRAN], [KEHADIRAN_DESC], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY]) VALUES (N'ce5c955b-4e50-464a-9a57-4cf2e3a5cf0c', CAST(0x193D0B00 AS Date), CAST(0x193D0B00 AS Date), N'2016030', N'YAQUB EDY SUSILO', N'1', N'HADIR', NULL, CAST(0x0000A8180110308F AS DateTime), N'2016030', CAST(0x0000A8180110308F AS DateTime), N'2016030')
INSERT [NANO].[TBL_T_KEHADIRAN_MEETING] ([PID_KEHADIRAN], [TGL_PLAN], [TGL_ACT], [NRP], [NAMA], [KEHADIRAN], [KEHADIRAN_DESC], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY]) VALUES (N'cf798101-bed4-4afa-aef7-f08b2977da2d', CAST(0x073E0B00 AS Date), CAST(0x0B3E0B00 AS Date), N'2017038', N'ANNISAA RAHMAYANI NURFAJAR', N'1', N'HADIR', NULL, CAST(0x0000A8B000E3A692 AS DateTime), N'2017038', CAST(0x0000A8B000E3A692 AS DateTime), N'2017038')
INSERT [NANO].[TBL_T_KEHADIRAN_MEETING] ([PID_KEHADIRAN], [TGL_PLAN], [TGL_ACT], [NRP], [NAMA], [KEHADIRAN], [KEHADIRAN_DESC], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY]) VALUES (N'd2c72106-078f-4fde-8f7c-867b3203f905', NULL, CAST(0x7B3D0B00 AS Date), NULL, NULL, NULL, NULL, NULL, CAST(0x0000A820008930CA AS DateTime), N'2016030', CAST(0x0000A820008930CA AS DateTime), N'2016030')
INSERT [NANO].[TBL_T_KEHADIRAN_MEETING] ([PID_KEHADIRAN], [TGL_PLAN], [TGL_ACT], [NRP], [NAMA], [KEHADIRAN], [KEHADIRAN_DESC], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY]) VALUES (N'd5d17514-b5eb-4038-bf55-14b72b2e5e03', NULL, CAST(0x7B3D0B00 AS Date), NULL, NULL, NULL, NULL, NULL, CAST(0x0000A82000886964 AS DateTime), N'2016030', CAST(0x0000A82000886964 AS DateTime), N'2016030')
INSERT [NANO].[TBL_T_KEHADIRAN_MEETING] ([PID_KEHADIRAN], [TGL_PLAN], [TGL_ACT], [NRP], [NAMA], [KEHADIRAN], [KEHADIRAN_DESC], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY]) VALUES (N'D5E478AA-86DA-4FDE-9BDF-46A6505FCC22', CAST(0xDD3D0B00 AS Date), CAST(0xDD3D0B00 AS Date), N'6196076', N'SATARSO AGUS TJAHJONO', N'8', N'CUTI', NULL, CAST(0x0000A88100E29A8E AS DateTime), N'2016030', CAST(0x0000A88200891755 AS DateTime), N'2016030')
INSERT [NANO].[TBL_T_KEHADIRAN_MEETING] ([PID_KEHADIRAN], [TGL_PLAN], [TGL_ACT], [NRP], [NAMA], [KEHADIRAN], [KEHADIRAN_DESC], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY]) VALUES (N'd792a035-c72e-4669-b13b-877faffd8e93', NULL, CAST(0x7B3D0B00 AS Date), NULL, NULL, NULL, NULL, NULL, CAST(0x0000A820008D243C AS DateTime), N'2016030', CAST(0x0000A820008D2452 AS DateTime), N'2016030')
INSERT [NANO].[TBL_T_KEHADIRAN_MEETING] ([PID_KEHADIRAN], [TGL_PLAN], [TGL_ACT], [NRP], [NAMA], [KEHADIRAN], [KEHADIRAN_DESC], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY]) VALUES (N'd92571d4-10c0-4976-9a68-639bd83e5421', CAST(0x353D0B00 AS Date), CAST(0x353D0B00 AS Date), N'6107067', N'AGUS BUDI HARTO', N'1', N'HADIR', NULL, CAST(0x0000A8180110D534 AS DateTime), N'2016030', CAST(0x0000A8180110D534 AS DateTime), N'2016030')
INSERT [NANO].[TBL_T_KEHADIRAN_MEETING] ([PID_KEHADIRAN], [TGL_PLAN], [TGL_ACT], [NRP], [NAMA], [KEHADIRAN], [KEHADIRAN_DESC], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY]) VALUES (N'da69c729-bf1a-4a7a-ba6b-ec92ffa68608', CAST(0x513D0B00 AS Date), CAST(0x513D0B00 AS Date), N'6113882', N'ARTDITYO PRIAMBODHO', N'1', N'HADIR', NULL, CAST(0x0000A81801114034 AS DateTime), N'2016030', CAST(0x0000A81801114034 AS DateTime), N'2016030')
INSERT [NANO].[TBL_T_KEHADIRAN_MEETING] ([PID_KEHADIRAN], [TGL_PLAN], [TGL_ACT], [NRP], [NAMA], [KEHADIRAN], [KEHADIRAN_DESC], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY]) VALUES (N'db95eae5-c89d-4e16-b097-072848f806b5', CAST(0xC13D0B00 AS Date), CAST(0xC13D0B00 AS Date), N'193078', N'SUKRON', N'1', N'HADIR', NULL, CAST(0x0000A866008E39FF AS DateTime), N'193078', CAST(0x0000A866008E39FF AS DateTime), N'193078')
INSERT [NANO].[TBL_T_KEHADIRAN_MEETING] ([PID_KEHADIRAN], [TGL_PLAN], [TGL_ACT], [NRP], [NAMA], [KEHADIRAN], [KEHADIRAN_DESC], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY]) VALUES (N'dba26c8d-b8c9-4502-8bae-c06ef33a54b2', NULL, CAST(0x7B3D0B00 AS Date), NULL, NULL, NULL, NULL, NULL, CAST(0x0000A820008CE824 AS DateTime), N'2016030', CAST(0x0000A820008CE824 AS DateTime), N'2016030')
INSERT [NANO].[TBL_T_KEHADIRAN_MEETING] ([PID_KEHADIRAN], [TGL_PLAN], [TGL_ACT], [NRP], [NAMA], [KEHADIRAN], [KEHADIRAN_DESC], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY]) VALUES (N'dd0a121f-c254-4742-aecc-06e9e7e9d4e0', NULL, CAST(0x7B3D0B00 AS Date), NULL, NULL, NULL, NULL, NULL, CAST(0x0000A820008930CA AS DateTime), N'2016030', CAST(0x0000A820008930CA AS DateTime), N'2016030')
INSERT [NANO].[TBL_T_KEHADIRAN_MEETING] ([PID_KEHADIRAN], [TGL_PLAN], [TGL_ACT], [NRP], [NAMA], [KEHADIRAN], [KEHADIRAN_DESC], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY]) VALUES (N'ddabf31d-4e7c-4759-82f3-c3efd49ce914', NULL, CAST(0x7B3D0B00 AS Date), NULL, NULL, NULL, NULL, NULL, CAST(0x0000A820008BE41E AS DateTime), N'2016030', CAST(0x0000A820008BE41E AS DateTime), N'2016030')
INSERT [NANO].[TBL_T_KEHADIRAN_MEETING] ([PID_KEHADIRAN], [TGL_PLAN], [TGL_ACT], [NRP], [NAMA], [KEHADIRAN], [KEHADIRAN_DESC], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY]) VALUES (N'dde501e8-579c-4fa1-aa01-24eea32f3d63', CAST(0x233E0B00 AS Date), CAST(0x233E0B00 AS Date), N'1708040', N'CASMITA', N'1', N'HADIR', NULL, CAST(0x0000A8C80098D219 AS DateTime), N'6107067', CAST(0x0000A8C80098D219 AS DateTime), N'6107067')
INSERT [NANO].[TBL_T_KEHADIRAN_MEETING] ([PID_KEHADIRAN], [TGL_PLAN], [TGL_ACT], [NRP], [NAMA], [KEHADIRAN], [KEHADIRAN_DESC], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY]) VALUES (N'ded7c1ed-4f6d-42c7-856f-43a9b1d5b479', NULL, CAST(0x7B3D0B00 AS Date), NULL, NULL, NULL, NULL, NULL, CAST(0x0000A820008BAF11 AS DateTime), N'2016030', CAST(0x0000A820008BAF11 AS DateTime), N'2016030')
INSERT [NANO].[TBL_T_KEHADIRAN_MEETING] ([PID_KEHADIRAN], [TGL_PLAN], [TGL_ACT], [NRP], [NAMA], [KEHADIRAN], [KEHADIRAN_DESC], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY]) VALUES (N'e019aee3-41d5-42e7-ae44-b8461932c5a6', NULL, CAST(0x7B3D0B00 AS Date), NULL, NULL, NULL, NULL, NULL, CAST(0x0000A820008D2340 AS DateTime), N'2016030', CAST(0x0000A820008D2356 AS DateTime), N'2016030')
INSERT [NANO].[TBL_T_KEHADIRAN_MEETING] ([PID_KEHADIRAN], [TGL_PLAN], [TGL_ACT], [NRP], [NAMA], [KEHADIRAN], [KEHADIRAN_DESC], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY]) VALUES (N'e26470de-749b-4de7-901d-8815c935761a', CAST(0x233E0B00 AS Date), CAST(0x233E0B00 AS Date), N'2017038', N'ANNISAA RAHMAYANI NURFAJAR', N'1', N'HADIR', NULL, CAST(0x0000A8C80098D20F AS DateTime), N'6107067', CAST(0x0000A8C80098D20F AS DateTime), N'6107067')
INSERT [NANO].[TBL_T_KEHADIRAN_MEETING] ([PID_KEHADIRAN], [TGL_PLAN], [TGL_ACT], [NRP], [NAMA], [KEHADIRAN], [KEHADIRAN_DESC], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY]) VALUES (N'e30b8fee-e605-420d-ad66-23698c950e91', CAST(0x073E0B00 AS Date), CAST(0x0B3E0B00 AS Date), N'6113882', N'ARTDITYO PRIAMBODHO', NULL, NULL, NULL, CAST(0x0000A8B000E3A6A0 AS DateTime), N'2017038', CAST(0x0000A8B000E3A6A0 AS DateTime), N'2017038')
INSERT [NANO].[TBL_T_KEHADIRAN_MEETING] ([PID_KEHADIRAN], [TGL_PLAN], [TGL_ACT], [NRP], [NAMA], [KEHADIRAN], [KEHADIRAN_DESC], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY]) VALUES (N'e51f4e1e-36db-4399-b4c8-f057f4f4aab1', NULL, CAST(0x7B3D0B00 AS Date), NULL, NULL, NULL, NULL, NULL, CAST(0x0000A820008BFFED AS DateTime), N'2016030', CAST(0x0000A820008BFFED AS DateTime), N'2016030')
INSERT [NANO].[TBL_T_KEHADIRAN_MEETING] ([PID_KEHADIRAN], [TGL_PLAN], [TGL_ACT], [NRP], [NAMA], [KEHADIRAN], [KEHADIRAN_DESC], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY]) VALUES (N'e599433d-7d67-421f-9077-8b5d3493d4bc', NULL, CAST(0x7B3D0B00 AS Date), NULL, NULL, NULL, NULL, NULL, CAST(0x0000A820008BE421 AS DateTime), N'2016030', CAST(0x0000A820008BE421 AS DateTime), N'2016030')
INSERT [NANO].[TBL_T_KEHADIRAN_MEETING] ([PID_KEHADIRAN], [TGL_PLAN], [TGL_ACT], [NRP], [NAMA], [KEHADIRAN], [KEHADIRAN_DESC], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY]) VALUES (N'e5b09c17-644d-4d18-9f3c-2c0f81253abc', CAST(0x5F3D0B00 AS Date), CAST(0x5F3D0B00 AS Date), N'6107067', N'AGUS BUDI HARTO', N'1', N'HADIR', NULL, CAST(0x0000A81801117E9E AS DateTime), N'2016030', CAST(0x0000A81801117E9E AS DateTime), N'2016030')
INSERT [NANO].[TBL_T_KEHADIRAN_MEETING] ([PID_KEHADIRAN], [TGL_PLAN], [TGL_ACT], [NRP], [NAMA], [KEHADIRAN], [KEHADIRAN_DESC], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY]) VALUES (N'e5e8e038-be0c-4233-94c1-0f836d92add9', CAST(0x073E0B00 AS Date), CAST(0x0B3E0B00 AS Date), N'2016030', N'YAQUB EDY SUSILO', N'1', N'HADIR', NULL, CAST(0x0000A8B000E3A69B AS DateTime), N'2017038', CAST(0x0000A8B000E3A69B AS DateTime), N'2017038')
INSERT [NANO].[TBL_T_KEHADIRAN_MEETING] ([PID_KEHADIRAN], [TGL_PLAN], [TGL_ACT], [NRP], [NAMA], [KEHADIRAN], [KEHADIRAN_DESC], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY]) VALUES (N'e62c46c4-ad6b-4587-9774-2dc76a26e8eb', CAST(0xEB3D0B00 AS Date), CAST(0xEB3D0B00 AS Date), N'6113882', N'ARTDITYO PRIAMBODHO', N'1', N'HADIR', NULL, CAST(0x0000A890008E8080 AS DateTime), N'2017038', CAST(0x0000A890008F4E37 AS DateTime), N'2017038')
INSERT [NANO].[TBL_T_KEHADIRAN_MEETING] ([PID_KEHADIRAN], [TGL_PLAN], [TGL_ACT], [NRP], [NAMA], [KEHADIRAN], [KEHADIRAN_DESC], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY]) VALUES (N'e6a64210-4406-4a9f-8e53-9d23bca0fd22', CAST(0x153E0B00 AS Date), CAST(0x153E0B00 AS Date), N'2016030', N'YAQUB EDY SUSILO', N'5', N'TRAINING', NULL, CAST(0x0000A8BA0083B80A AS DateTime), N'2017038', CAST(0x0000A8BA00846C04 AS DateTime), N'2017038')
INSERT [NANO].[TBL_T_KEHADIRAN_MEETING] ([PID_KEHADIRAN], [TGL_PLAN], [TGL_ACT], [NRP], [NAMA], [KEHADIRAN], [KEHADIRAN_DESC], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY]) VALUES (N'e6c1cf87-7bf6-485f-99c6-9ca7fa708b49', CAST(0x893D0B00 AS Date), CAST(0x893D0B00 AS Date), N'193078', N'SUKRON', N'7', N'IJIN', NULL, CAST(0x0000A82E008CFB91 AS DateTime), N'2017038', CAST(0x0000A82E00915C9D AS DateTime), N'2017038')
INSERT [NANO].[TBL_T_KEHADIRAN_MEETING] ([PID_KEHADIRAN], [TGL_PLAN], [TGL_ACT], [NRP], [NAMA], [KEHADIRAN], [KEHADIRAN_DESC], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY]) VALUES (N'e864492d-061c-4b55-923d-a5508fd920a3', CAST(0x7B3D0B00 AS Date), CAST(0x7B3D0B00 AS Date), N'193078', N'SUKRON', N'6', N'SAKIT', NULL, CAST(0x0000A820008DDF1F AS DateTime), N'2016030', CAST(0x0000A820009028FD AS DateTime), N'2016030')
INSERT [NANO].[TBL_T_KEHADIRAN_MEETING] ([PID_KEHADIRAN], [TGL_PLAN], [TGL_ACT], [NRP], [NAMA], [KEHADIRAN], [KEHADIRAN_DESC], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY]) VALUES (N'e941a87e-fbc0-44ff-a156-6d125134add4', CAST(0x3F3E0B00 AS Date), CAST(0x3F3E0B00 AS Date), N'193078', N'SUKRON', N'1', N'HADIR', NULL, CAST(0x0000A8E400910601 AS DateTime), N'2016030', CAST(0x0000A8E4009317AF AS DateTime), N'2016030')
INSERT [NANO].[TBL_T_KEHADIRAN_MEETING] ([PID_KEHADIRAN], [TGL_PLAN], [TGL_ACT], [NRP], [NAMA], [KEHADIRAN], [KEHADIRAN_DESC], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY]) VALUES (N'ea07c27f-1a5a-4115-aaa0-b2d68088be76', CAST(0x153E0B00 AS Date), CAST(0x153E0B00 AS Date), N'6196076', N'SATARSO AGUS TJAHJONO', N'8', N'CUTI', NULL, CAST(0x0000A8BA0083B818 AS DateTime), N'2017038', CAST(0x0000A8BA00846C12 AS DateTime), N'2017038')
INSERT [NANO].[TBL_T_KEHADIRAN_MEETING] ([PID_KEHADIRAN], [TGL_PLAN], [TGL_ACT], [NRP], [NAMA], [KEHADIRAN], [KEHADIRAN_DESC], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY]) VALUES (N'eb9117e0-92fd-441d-bcda-b4612fe92137', CAST(0x973D0B00 AS Date), CAST(0x963D0B00 AS Date), N'2016030', N'YAQUB EDY SUSILO', N'1', N'HADIR', NULL, CAST(0x0000A83B0087131F AS DateTime), N'2016030', CAST(0x0000A83B008ABD14 AS DateTime), N'2016030')
INSERT [NANO].[TBL_T_KEHADIRAN_MEETING] ([PID_KEHADIRAN], [TGL_PLAN], [TGL_ACT], [NRP], [NAMA], [KEHADIRAN], [KEHADIRAN_DESC], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY]) VALUES (N'EEBE3A09-2999-45D8-8460-A0363AB712B7', CAST(0xDD3D0B00 AS Date), CAST(0xDD3D0B00 AS Date), N'6113882', N'ARTDITYO PRIAMBODHO', N'1', N'HADIR', NULL, CAST(0x0000A88100E29A8E AS DateTime), N'2016030', CAST(0x0000A88200891747 AS DateTime), N'2016030')
INSERT [NANO].[TBL_T_KEHADIRAN_MEETING] ([PID_KEHADIRAN], [TGL_PLAN], [TGL_ACT], [NRP], [NAMA], [KEHADIRAN], [KEHADIRAN_DESC], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY]) VALUES (N'ef1342f4-849e-46c4-9976-d95552f2160f', CAST(0xC13D0B00 AS Date), CAST(0xC13D0B00 AS Date), N'6196076', N'SATARSO AGUS TJAHJONO', N'1', N'HADIR', NULL, CAST(0x0000A866008E39FB AS DateTime), N'193078', CAST(0x0000A866008E39FB AS DateTime), N'193078')
INSERT [NANO].[TBL_T_KEHADIRAN_MEETING] ([PID_KEHADIRAN], [TGL_PLAN], [TGL_ACT], [NRP], [NAMA], [KEHADIRAN], [KEHADIRAN_DESC], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY]) VALUES (N'ef40811c-bc9b-48dc-8536-b553f4b85775', CAST(0x513D0B00 AS Date), CAST(0x513D0B00 AS Date), N'6196076', N'SATARSO AGUS TJAHJONO', N'8', N'CUTI', NULL, CAST(0x0000A818011135E0 AS DateTime), N'2016030', CAST(0x0000A818011135E0 AS DateTime), N'2016030')
INSERT [NANO].[TBL_T_KEHADIRAN_MEETING] ([PID_KEHADIRAN], [TGL_PLAN], [TGL_ACT], [NRP], [NAMA], [KEHADIRAN], [KEHADIRAN_DESC], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY]) VALUES (N'ef6ccc9a-96e8-48ae-8a00-e466b3975598', CAST(0xF93D0B00 AS Date), CAST(0xF93D0B00 AS Date), N'6107067', N'AGUS BUDI HARTO', N'1', N'HADIR', NULL, CAST(0x0000A89E008A1E41 AS DateTime), N'6107067', CAST(0x0000A89E008A1E41 AS DateTime), N'6107067')
INSERT [NANO].[TBL_T_KEHADIRAN_MEETING] ([PID_KEHADIRAN], [TGL_PLAN], [TGL_ACT], [NRP], [NAMA], [KEHADIRAN], [KEHADIRAN_DESC], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY]) VALUES (N'f1a257d7-02d5-4cf4-99c1-065504560f17', CAST(0xEB3D0B00 AS Date), CAST(0xEB3D0B00 AS Date), N'1708040', N'CASMITA', N'1', N'HADIR', NULL, CAST(0x0000A890008E8084 AS DateTime), N'2017038', CAST(0x0000A890008F4E3C AS DateTime), N'2017038')
INSERT [NANO].[TBL_T_KEHADIRAN_MEETING] ([PID_KEHADIRAN], [TGL_PLAN], [TGL_ACT], [NRP], [NAMA], [KEHADIRAN], [KEHADIRAN_DESC], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY]) VALUES (N'f57cdf69-ce32-4c4b-b1cb-1eb8b0bf7e95', CAST(0x153E0B00 AS Date), CAST(0x153E0B00 AS Date), N'2017038', N'ANNISAA RAHMAYANI NURFAJAR', N'1', N'HADIR', NULL, CAST(0x0000A8BA0083B805 AS DateTime), N'2017038', CAST(0x0000A8BA00846BF6 AS DateTime), N'2017038')
INSERT [NANO].[TBL_T_KEHADIRAN_MEETING] ([PID_KEHADIRAN], [TGL_PLAN], [TGL_ACT], [NRP], [NAMA], [KEHADIRAN], [KEHADIRAN_DESC], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY]) VALUES (N'f590b236-d6cd-42ee-b002-e463c9d51169', CAST(0xA53D0B00 AS Date), CAST(0xA53D0B00 AS Date), N'6113882', N'ARTDITYO PRIAMBODHO', N'1', N'HADIR', NULL, CAST(0x0000A84A0097AD8D AS DateTime), N'6113882', CAST(0x0000A84D00937281 AS DateTime), N'6113882')
INSERT [NANO].[TBL_T_KEHADIRAN_MEETING] ([PID_KEHADIRAN], [TGL_PLAN], [TGL_ACT], [NRP], [NAMA], [KEHADIRAN], [KEHADIRAN_DESC], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY]) VALUES (N'f6af786a-6e23-4458-9fb1-83e3be2b0cb9', CAST(0xF93D0B00 AS Date), CAST(0xF93D0B00 AS Date), N'193078', N'SUKRON', N'1', N'HADIR', NULL, CAST(0x0000A89E008A1E54 AS DateTime), N'6107067', CAST(0x0000A89E008A1E54 AS DateTime), N'6107067')
INSERT [NANO].[TBL_T_KEHADIRAN_MEETING] ([PID_KEHADIRAN], [TGL_PLAN], [TGL_ACT], [NRP], [NAMA], [KEHADIRAN], [KEHADIRAN_DESC], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY]) VALUES (N'f764143a-196e-4bda-8f59-8bbebdbdc4b6', NULL, CAST(0x7B3D0B00 AS Date), NULL, NULL, NULL, NULL, NULL, CAST(0x0000A820008D263A AS DateTime), N'2016030', CAST(0x0000A820008D2651 AS DateTime), N'2016030')
INSERT [NANO].[TBL_T_KEHADIRAN_MEETING] ([PID_KEHADIRAN], [TGL_PLAN], [TGL_ACT], [NRP], [NAMA], [KEHADIRAN], [KEHADIRAN_DESC], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY]) VALUES (N'f92a81fd-ff72-4416-8537-08c06dfa0951', CAST(0xCF3D0B00 AS Date), CAST(0xCF3D0B00 AS Date), N'6113882', N'ARTDITYO PRIAMBODHO', N'1', N'HADIR', NULL, CAST(0x0000A874008B8B58 AS DateTime), N'6113882', CAST(0x0000A874008B8B58 AS DateTime), N'6113882')
INSERT [NANO].[TBL_T_KEHADIRAN_MEETING] ([PID_KEHADIRAN], [TGL_PLAN], [TGL_ACT], [NRP], [NAMA], [KEHADIRAN], [KEHADIRAN_DESC], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY]) VALUES (N'f930b809-aa33-4593-831e-bc38e2a2c6f6', CAST(0x313E0B00 AS Date), CAST(0x313E0B00 AS Date), N'193078', N'SUKRON', N'1', N'HADIR', NULL, CAST(0x0000A8D6008E426C AS DateTime), N'6107067', CAST(0x0000A8D60092ED70 AS DateTime), N'6107067')
INSERT [NANO].[TBL_T_KEHADIRAN_MEETING] ([PID_KEHADIRAN], [TGL_PLAN], [TGL_ACT], [NRP], [NAMA], [KEHADIRAN], [KEHADIRAN_DESC], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY]) VALUES (N'f9ee0da7-c873-434d-b1fb-358d027a8900', CAST(0x893D0B00 AS Date), CAST(0x893D0B00 AS Date), N'6113882', N'ARTDITYO PRIAMBODHO', N'1', N'HADIR', NULL, CAST(0x0000A82E008CF9C6 AS DateTime), N'2017038', CAST(0x0000A82E00915C8F AS DateTime), N'2017038')
INSERT [NANO].[TBL_T_KEHADIRAN_MEETING] ([PID_KEHADIRAN], [TGL_PLAN], [TGL_ACT], [NRP], [NAMA], [KEHADIRAN], [KEHADIRAN_DESC], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY]) VALUES (N'fae4fb67-90be-4ad7-a5f9-409aa8577f43', NULL, CAST(0x7B3D0B00 AS Date), NULL, NULL, NULL, NULL, NULL, CAST(0x0000A820008BAF1B AS DateTime), N'2016030', CAST(0x0000A820008BAF1B AS DateTime), N'2016030')
INSERT [NANO].[TBL_T_KEHADIRAN_MEETING] ([PID_KEHADIRAN], [TGL_PLAN], [TGL_ACT], [NRP], [NAMA], [KEHADIRAN], [KEHADIRAN_DESC], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY]) VALUES (N'fbad3634-476e-4f13-8f14-75582168499f', CAST(0xC13D0B00 AS Date), CAST(0xC13D0B00 AS Date), N'1708040', N'CASMITA', N'1', N'HADIR', NULL, CAST(0x0000A866008E3952 AS DateTime), N'193078', CAST(0x0000A866008E3952 AS DateTime), N'193078')
INSERT [NANO].[TBL_T_KEHADIRAN_MEETING] ([PID_KEHADIRAN], [TGL_PLAN], [TGL_ACT], [NRP], [NAMA], [KEHADIRAN], [KEHADIRAN_DESC], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY]) VALUES (N'fbddeb05-5584-4331-a356-e93fb33131a4', CAST(0xF93D0B00 AS Date), CAST(0xF93D0B00 AS Date), N'6113882', N'ARTDITYO PRIAMBODHO', N'1', N'HADIR', NULL, CAST(0x0000A89E008A1E33 AS DateTime), N'6107067', CAST(0x0000A89E008A1E33 AS DateTime), N'6107067')
INSERT [NANO].[TBL_T_KEHADIRAN_MEETING] ([PID_KEHADIRAN], [TGL_PLAN], [TGL_ACT], [NRP], [NAMA], [KEHADIRAN], [KEHADIRAN_DESC], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY]) VALUES (N'fc1f2cc3-36da-47e9-91d3-fa124cc2adc7', CAST(0x3F3E0B00 AS Date), CAST(0x3F3E0B00 AS Date), N'6113882', N'ARTDITYO PRIAMBODHO', N'1', N'HADIR', NULL, CAST(0x0000A8E4009105FC AS DateTime), N'2016030', CAST(0x0000A8E4009317AA AS DateTime), N'2016030')
INSERT [NANO].[TBL_T_KEHADIRAN_MEETING] ([PID_KEHADIRAN], [TGL_PLAN], [TGL_ACT], [NRP], [NAMA], [KEHADIRAN], [KEHADIRAN_DESC], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY]) VALUES (N'fcf0eeb2-e69b-4b44-9f73-a1705be72919', CAST(0xB33D0B00 AS Date), CAST(0xB73D0B00 AS Date), N'1708040', N'CASMITA', N'1', N'HADIR', NULL, CAST(0x0000A85C00872AA5 AS DateTime), N'2017038', CAST(0x0000A85C00872AA5 AS DateTime), N'2017038')
INSERT [NANO].[TBL_T_KEHADIRAN_MEETING] ([PID_KEHADIRAN], [TGL_PLAN], [TGL_ACT], [NRP], [NAMA], [KEHADIRAN], [KEHADIRAN_DESC], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY]) VALUES (N'fd002171-830e-4c27-888a-517f1c7d7180', CAST(0xCF3D0B00 AS Date), CAST(0xCF3D0B00 AS Date), N'6107067', N'AGUS BUDI HARTO', N'4', N'DINAS KE SITE', NULL, CAST(0x0000A874008B8B58 AS DateTime), N'6113882', CAST(0x0000A874008B8B58 AS DateTime), N'6113882')
INSERT [NANO].[TBL_T_KEHADIRAN_MEETING] ([PID_KEHADIRAN], [TGL_PLAN], [TGL_ACT], [NRP], [NAMA], [KEHADIRAN], [KEHADIRAN_DESC], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY]) VALUES (N'fe684038-b72f-4351-9b5e-8e9ce9bfc581', NULL, CAST(0x7B3D0B00 AS Date), NULL, NULL, NULL, NULL, NULL, CAST(0x0000A82000886969 AS DateTime), N'2016030', CAST(0x0000A82000886969 AS DateTime), N'2016030')
INSERT [NANO].[TBL_T_KEHADIRAN_MEETING] ([PID_KEHADIRAN], [TGL_PLAN], [TGL_ACT], [NRP], [NAMA], [KEHADIRAN], [KEHADIRAN_DESC], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY]) VALUES (N'ff0f49d5-039e-46d7-ac32-bd5bb88a69be', CAST(0x0B3D0B00 AS Date), CAST(0x0B3D0B00 AS Date), N'6107067', N'AGUS BUDI HARTO', N'1', N'HADIR', NULL, CAST(0x0000A818010FFFC4 AS DateTime), N'2016030', CAST(0x0000A818010FFFC4 AS DateTime), N'2016030')
INSERT [NANO].[TBL_T_KEHADIRAN_MEETING] ([PID_KEHADIRAN], [TGL_PLAN], [TGL_ACT], [NRP], [NAMA], [KEHADIRAN], [KEHADIRAN_DESC], [KET], [CREATE_DATE], [CREATE_BY], [MODIFIED_DATE], [MODIFIED_BY]) VALUES (N'ff19ec33-6e36-467d-9135-f3aa05d6d257', CAST(0x193D0B00 AS Date), CAST(0x193D0B00 AS Date), N'6107067', N'AGUS BUDI HARTO', N'6', N'SAKIT', NULL, CAST(0x0000A81801101E7B AS DateTime), N'2016030', CAST(0x0000A81801101E7B AS DateTime), N'2016030')
/****** Object:  View [NANO].[VW_KEHADIRAN_MEETING]    Script Date: 06/05/2018 07:42:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [NANO].[VW_KEHADIRAN_MEETING]
AS
SELECT     P.PID_KEHADIRAN, R.TGL_PLAN, P.TGL_ACT, R.NRP, R.NAMA, P.KEHADIRAN, P.KEHADIRAN_DESC, NANO.cufn_PersentaseKehadiran(R.NRP, R.TGL_PLAN) 
                      AS PERSENTASE, NANO.cufn_PersentasePerMeering(R.TGL_PLAN) AS PERSEN_NOW, P.KET, R.STATUS
FROM         NANO.TBL_T_KEHADIRAN_MEETING AS P RIGHT OUTER JOIN
                          (SELECT     A.TGL_PLAN, B.NRP, B.NAMA, CONVERT(VARCHAR(1), B.STATUS) AS STATUS
                            FROM          NANO.TBL_M_EMPLOYEE_NANO AS B CROSS JOIN
                                                   NANO.TBL_M_PLAN_K_MEETING AS A) AS R ON P.TGL_PLAN = R.TGL_PLAN AND P.NRP = R.NRP
WHERE     (R.STATUS = 1)
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[42] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "P"
            Begin Extent = 
               Top = 6
               Left = 400
               Bottom = 267
               Right = 579
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "R"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 125
               Right = 198
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 12
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'NANO', @level1type=N'VIEW',@level1name=N'VW_KEHADIRAN_MEETING'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'NANO', @level1type=N'VIEW',@level1name=N'VW_KEHADIRAN_MEETING'
GO
/****** Object:  View [NANO].[VW_CHOOSE_ME]    Script Date: 06/05/2018 07:42:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [NANO].[VW_CHOOSE_ME]
AS
SELECT     TOP (1) NRP, NAMA
FROM         NANO.TBL_M_EMPLOYEE_NANO
WHERE     (STATUS =1)
and NRP IN (SELECT NRP FROM NANO.TBL_T_KEHADIRAN_MEETING WHERE TGL_ACT=CONVERT(DATE,GETDATE()) AND KEHADIRAN=1)
AND NRP NOT IN(
	SELECT NRP
	FROM [DB_NANO].[NANO].[TBL_T_CHALLENGE]
	where CONVERT(date,TANGGAL)=CONVERT(date,GETDATE())
  )
ORDER BY NEWID()
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "VW_TBL_M_EMPLOYEE_NANO (NANO)"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 125
               Right = 201
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'NANO', @level1type=N'VIEW',@level1name=N'VW_CHOOSE_ME'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'NANO', @level1type=N'VIEW',@level1name=N'VW_CHOOSE_ME'
GO
/****** Object:  UserDefinedFunction [NANO].[cufn_ChallangeDesc]    Script Date: 06/05/2018 07:42:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author		: Yaqub
-- Create date	: 02-01-2018
-- Description	: 
-- =============================================
CREATE FUNCTION [NANO].[cufn_ChallangeDesc]
(
@sTanggal date
) 
	
	RETURNS varchar(5000)
	AS
	BEGIN
	
	DECLARE @Return varchar(5000)=(
	--DECLARE @sTanggal date='2018-01-02'
	Select SUBSTRING(
	(
		SELECT ' ' + A.NAMA +' - '+A.CHALLENGE +CHAR(13) AS 'data()'
			FROM 
			(SELECT '# TASAKUR' AS NAMA,'(Tantangan Spontanitas Terukur)' AS CHALLENGE UNION ALL
			SELECT B.NAMA as NAMA,B.CHALLENGE FROM
			(SELECT distinct
				  TGL_PLAN
				  ,TGL_ACT      
			  FROM [DB_NANO].[NANO].[TBL_T_KEHADIRAN_MEETING]) AS A
			  INNER JOIN
			   NANO.TBL_T_CHALLENGE AS B ON A.TGL_ACT=CONVERT(DATE, B.TANGGAL) WHERE CONVERT(DATE, B.TANGGAL)=@sTanggal		   
	   )AS A
			FOR XML PATH('')
	), 2 , 9999) As CHALLANGE
	
	)

	RETURN @Return
	END
GO
/****** Object:  View [NANO].[VW_TBL_T_CHALLENGE]    Script Date: 06/05/2018 07:42:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [NANO].[VW_TBL_T_CHALLENGE]
AS
SELECT     PID_T_CH, CONVERT(date, TANGGAL) AS TANGGAL, NRP, NAMA, PID_CH, CHALLENGE, CREATE_DATE, CREATE_BY
FROM         NANO.TBL_T_CHALLENGE
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "TBL_T_CHALLENGE (NANO)"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 125
               Right = 198
            End
            DisplayFlags = 280
            TopColumn = 4
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'NANO', @level1type=N'VIEW',@level1name=N'VW_TBL_T_CHALLENGE'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'NANO', @level1type=N'VIEW',@level1name=N'VW_TBL_T_CHALLENGE'
GO
/****** Object:  Table [NANO].[TBL_T_SCORE_CHALLANGE]    Script Date: 06/05/2018 07:42:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [NANO].[TBL_T_SCORE_CHALLANGE](
	[PID_SCORE] [varchar](50) NOT NULL,
	[PID_T_CH] [varchar](50) NOT NULL,
	[SCORE] [int] NULL,
	[CREATE_SCORE] [varchar](10) NULL,
 CONSTRAINT [PK_TBL_T_SCORE_CHALLANGE] PRIMARY KEY CLUSTERED 
(
	[PID_SCORE] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [NANO].[TBL_T_SCORE_CHALLANGE] ([PID_SCORE], [PID_T_CH], [SCORE], [CREATE_SCORE]) VALUES (N'06f1e28c-fcaa-46c2-aab9-f0d0091dda75', N'0adaf4bd-66b7-4794-add6-fbea9101ed3f', 3, N'1708040')
INSERT [NANO].[TBL_T_SCORE_CHALLANGE] ([PID_SCORE], [PID_T_CH], [SCORE], [CREATE_SCORE]) VALUES (N'2406f357-cab6-43bd-bb54-5f7630f95099', N'580c2e9f-4808-4e0f-aa60-b98ea9c097c4', 1, N'2016030')
INSERT [NANO].[TBL_T_SCORE_CHALLANGE] ([PID_SCORE], [PID_T_CH], [SCORE], [CREATE_SCORE]) VALUES (N'37a9326c-cf0c-4fdb-9e59-ffba6770b1b6', N'777563af-84aa-44a3-9190-9e4481fd4d77', 3, N'6113882')
INSERT [NANO].[TBL_T_SCORE_CHALLANGE] ([PID_SCORE], [PID_T_CH], [SCORE], [CREATE_SCORE]) VALUES (N'3a886c41-7704-4e7e-a020-8edaf5a3062d', N'487b2e15-d513-4f35-8c7b-da1b54758202', 3, N'193078')
INSERT [NANO].[TBL_T_SCORE_CHALLANGE] ([PID_SCORE], [PID_T_CH], [SCORE], [CREATE_SCORE]) VALUES (N'4553353c-a0cc-4406-a70a-ba814913129a', N'685a13f8-390c-4090-913b-bb304936f091', 3, N'6113882')
INSERT [NANO].[TBL_T_SCORE_CHALLANGE] ([PID_SCORE], [PID_T_CH], [SCORE], [CREATE_SCORE]) VALUES (N'4a7dc385-f047-4e48-a05a-14358a666a5c', N'473067c0-7a8a-481c-839b-a80996fd8d8a', 3, N'2016030')
INSERT [NANO].[TBL_T_SCORE_CHALLANGE] ([PID_SCORE], [PID_T_CH], [SCORE], [CREATE_SCORE]) VALUES (N'4ef50ec2-b710-4543-ba29-0c32db50e72a', N'920d40ad-0dad-44db-9d9f-0f0bb0092c55', 3, N'2016030')
INSERT [NANO].[TBL_T_SCORE_CHALLANGE] ([PID_SCORE], [PID_T_CH], [SCORE], [CREATE_SCORE]) VALUES (N'4ff97615-787d-4906-acf3-c31f6bad0e7b', N'077a9f5d-5590-4008-b73b-6ac3b58f5d2b', 3, N'6113882')
INSERT [NANO].[TBL_T_SCORE_CHALLANGE] ([PID_SCORE], [PID_T_CH], [SCORE], [CREATE_SCORE]) VALUES (N'6de7c89a-a882-4b5b-a0cc-7188d7b3a06f', N'ea0a88a7-4335-4a02-ad16-4873fa4ed0ef', 3, N'1708040')
INSERT [NANO].[TBL_T_SCORE_CHALLANGE] ([PID_SCORE], [PID_T_CH], [SCORE], [CREATE_SCORE]) VALUES (N'6f04e370-5381-4c1e-a6bd-0d350f95e0b7', N'f7f88a0c-e21c-4325-a6f6-81b87abf4a18', 1, N'6113882')
INSERT [NANO].[TBL_T_SCORE_CHALLANGE] ([PID_SCORE], [PID_T_CH], [SCORE], [CREATE_SCORE]) VALUES (N'7664af93-bb24-40ac-a55e-1bbd0b93a075', N'f445a496-a3c4-4b0d-a166-5446ddccd4e3', 3, N'2016030')
INSERT [NANO].[TBL_T_SCORE_CHALLANGE] ([PID_SCORE], [PID_T_CH], [SCORE], [CREATE_SCORE]) VALUES (N'7ade345f-f1fc-41b1-be62-0ae2b2de2e37', N'8cdbb385-146b-4f3c-ab92-acd764ce7050', 3, N'2017038')
INSERT [NANO].[TBL_T_SCORE_CHALLANGE] ([PID_SCORE], [PID_T_CH], [SCORE], [CREATE_SCORE]) VALUES (N'89e601b2-2d45-478f-a415-6395e18eecd9', N'8d148128-e826-4bde-9809-22a722db5b03', 3, N'6196076')
INSERT [NANO].[TBL_T_SCORE_CHALLANGE] ([PID_SCORE], [PID_T_CH], [SCORE], [CREATE_SCORE]) VALUES (N'8aa4e0b7-20ae-412f-8625-a0ca36d19172', N'd9904944-bfeb-4496-be20-4e3e91a52d5b', 3, N'1708040')
INSERT [NANO].[TBL_T_SCORE_CHALLANGE] ([PID_SCORE], [PID_T_CH], [SCORE], [CREATE_SCORE]) VALUES (N'be893404-9274-4bbb-937f-c3d7c5f0c5f3', N'f4cbca96-f68e-40b0-b875-0574df630555', 1, N'2016030')
INSERT [NANO].[TBL_T_SCORE_CHALLANGE] ([PID_SCORE], [PID_T_CH], [SCORE], [CREATE_SCORE]) VALUES (N'c86265ab-1ac1-4f60-96ff-a9b2ebaed662', N'4ff1572d-7636-4d6b-b842-3f93180297a1', 3, N'2016030')
/****** Object:  View [NANO].[VW_SCORE_CHALLENGE]    Script Date: 06/05/2018 07:42:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [NANO].[VW_SCORE_CHALLENGE]
AS
SELECT     A.PID_SCORE, A.PID_T_CH, CONVERT(date, B.TANGGAL) AS TANGGAL, B.NAMA, B.CHALLENGE, A.SCORE, C.SCORE_DESC, D.NRP, D.NAMA AS CREATE_SCORE
FROM         NANO.TBL_T_CHALLENGE AS B INNER JOIN
                      NANO.TBL_T_SCORE_CHALLANGE AS A ON B.PID_T_CH = A.PID_T_CH INNER JOIN
                          (SELECT     PID_EMPLOYEE, NRP, NAMA, COMP_USER, STATUS, KET, TGL_JOIN, CREATE_DATE, CREATE_BY, MODIFIED_DATE, MODIFIED_BY
                            FROM          NANO.TBL_M_EMPLOYEE_NANO
                            WHERE      (STATUS = 1)) AS D ON A.CREATE_SCORE = D.NRP LEFT OUTER JOIN
                      NANO.VW_R_SCORE AS C ON A.SCORE = C.ID_SCORE
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[48] 4[8] 2[39] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "B"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 185
               Right = 198
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "A"
            Begin Extent = 
               Top = 13
               Left = 293
               Bottom = 141
               Right = 461
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "D"
            Begin Extent = 
               Top = 40
               Left = 703
               Bottom = 238
               Right = 874
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "C"
            Begin Extent = 
               Top = 6
               Left = 499
               Bottom = 95
               Right = 659
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 10
         Width = 284
         Width = 1860
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 915
         Width = 1605
         Width = 990
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End' , @level0type=N'SCHEMA',@level0name=N'NANO', @level1type=N'VIEW',@level1name=N'VW_SCORE_CHALLENGE'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'
End
' , @level0type=N'SCHEMA',@level0name=N'NANO', @level1type=N'VIEW',@level1name=N'VW_SCORE_CHALLENGE'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'NANO', @level1type=N'VIEW',@level1name=N'VW_SCORE_CHALLENGE'
GO
/****** Object:  View [NANO].[VW_CHALLENGE_ME]    Script Date: 06/05/2018 07:42:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [NANO].[VW_CHALLENGE_ME]
AS
SELECT     TOP (1) PERCENT PID_CH, CHALLENGE
FROM         NANO.TBL_M_CHALLENGE
where PID_CH NOT IN (
	SELECT PID_CH
	FROM [DB_NANO].[NANO].[TBL_T_CHALLENGE]
	where CONVERT(date,TANGGAL)=CONVERT(date,GETDATE())
  )
ORDER BY NEWID()
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "TBL_M_CHALLENGE (NANO)"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 95
               Right = 198
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'NANO', @level1type=N'VIEW',@level1name=N'VW_CHALLENGE_ME'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'NANO', @level1type=N'VIEW',@level1name=N'VW_CHALLENGE_ME'
GO
/****** Object:  View [NANO].[VW_CHALLANGE_ALL_2_X]    Script Date: 06/05/2018 07:42:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*ON A.TGL_ACT=CONVERT(DATE, B.TANGGAL)
Select *, SUBSTRING(
(
    SELECT ' ' + A.NAMA +' - '+A.CHALLENGE +CHAR(13) AS 'data()'
        FROM 
        (SELECT '# TASAKUR' AS NAMA,'(Tantangan Spontanitas Terukur)' AS CHALLENGE UNION ALL
        SELECT B.NAMA as NAMA,B.CHALLENGE FROM
		(SELECT distinct
			  TGL_PLAN
			  ,TGL_ACT      
		  FROM [DB_NANO].[NANO].[TBL_T_KEHADIRAN_MEETING]) AS A
		  INNER JOIN
		   NANO.TBL_T_CHALLENGE AS B ON A.TGL_ACT=CONVERT(DATE, B.TANGGAL)
   )AS A
        FOR XML PATH('')
), 2 , 9999) As CHALLANGE
FROM
S(ELECT DISTINCT A.TGL_PLAN,A.TGL_ACT FROM
		(SELECT distinct
			  TGL_PLAN
			  ,TGL_ACT      
		  FROM [DB_NANO].[NANO].[TBL_T_KEHADIRAN_MEETING]) AS A
		  INNER JOIN
		   NANO.TBL_T_CHALLENGE AS B ON A.TGL_ACT=CONVERT(DATE, B.TANGGAL))AS GG*/
CREATE VIEW [NANO].[VW_CHALLANGE_ALL_2_X]
AS
SELECT DISTINCT CONVERT(DATE, TANGGAL) AS TGL_ACT, NANO.cufn_ChallangeDesc(TANGGAL) AS CHALLANGE
FROM         NANO.TBL_T_CHALLENGE AS B
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "B"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 125
               Right = 198
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 3330
         Alias = 3870
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'NANO', @level1type=N'VIEW',@level1name=N'VW_CHALLANGE_ALL_2_X'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'NANO', @level1type=N'VIEW',@level1name=N'VW_CHALLANGE_ALL_2_X'
GO
/****** Object:  View [NANO].[VW_CHALLANGE_ALL]    Script Date: 06/05/2018 07:42:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [NANO].[VW_CHALLANGE_ALL]
AS

SELECT DISTINCT A.TGL_PLAN,A.TGL_ACT , NANO.cufn_ChallangeDesc(A.TGL_ACT ) as CHALLANGE
FROM
		(SELECT distinct
			  TGL_PLAN
			  ,TGL_ACT      
		  FROM [DB_NANO].[NANO].[TBL_T_KEHADIRAN_MEETING]) AS A
		  INNER JOIN
		   NANO.TBL_T_CHALLENGE AS B ON A.TGL_ACT=CONVERT(DATE, B.TANGGAL)
		   

--Select *, SUBSTRING(
--(
--    SELECT ' ' + A.NAMA +' - '+A.CHALLENGE +CHAR(13) AS 'data()'
--        FROM 
--        (SELECT '# TASAKUR' AS NAMA,'(Tantangan Spontanitas Terukur)' AS CHALLENGE UNION ALL
--        SELECT B.NAMA as NAMA,B.CHALLENGE FROM
--		(SELECT distinct
--			  TGL_PLAN
--			  ,TGL_ACT      
--		  FROM [DB_NANO].[NANO].[TBL_T_KEHADIRAN_MEETING]) AS A
--		  INNER JOIN
--		   NANO.TBL_T_CHALLENGE AS B ON A.TGL_ACT=CONVERT(DATE, B.TANGGAL)
--   )AS A
--        FOR XML PATH('')
--), 2 , 9999) As CHALLANGE
--FROM

--(SELECT DISTINCT A.TGL_PLAN,A.TGL_ACT FROM
--		(SELECT distinct
--			  TGL_PLAN
--			  ,TGL_ACT      
--		  FROM [DB_NANO].[NANO].[TBL_T_KEHADIRAN_MEETING]) AS A
--		  INNER JOIN
--		   NANO.TBL_T_CHALLENGE AS B ON A.TGL_ACT=CONVERT(DATE, B.TANGGAL))AS GG
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'NANO', @level1type=N'VIEW',@level1name=N'VW_CHALLANGE_ALL'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'NANO', @level1type=N'VIEW',@level1name=N'VW_CHALLANGE_ALL'
GO
/****** Object:  View [NANO].[VW_DETAIL_VIP_2]    Script Date: 06/05/2018 07:42:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [NANO].[VW_DETAIL_VIP_2]
AS
SELECT DISTINCT 
                      VIP.PID_PELAPOR_VIP, VIP.TANGGAL, VIP.UTAMA, VIP.UTAMA_DESC, VIP.CADANGAN, VIP.CADANGAN_DESC, VIP.ACTUAL, VIP.ACTUAL_DESC, VIP.KET, 
                      HDR.PERSEN_NOW AS KEHADIRAN, MTG.SHEARING_ACT_NAMA AS SHEARING, MTG.SHEARING_TOPIC, NOTE.URAIAN, CHAL.CHALLANGE
FROM         NANO.VW_KEGIATAN_MEETING AS MTG RIGHT OUTER JOIN
                      NANO.VW_PELAPOR_VIP AS VIP LEFT OUTER JOIN
                      NANO.VW_KEHADIRAN_MEETING_2 AS HDR LEFT OUTER JOIN
                      NANO.VW_NOTULEN_2 AS NOTE ON HDR.TGL_ACT = NOTE.TGL_ACT LEFT OUTER JOIN
                      NANO.VW_CHALLANGE_ALL AS CHAL ON HDR.TGL_ACT = CHAL.TGL_ACT ON CONVERT(DATETIME, VIP.TANGGAL) - 5 = HDR.TGL_PLAN ON 
                      MTG.TGL_PLAN = CONVERT(DATETIME, VIP.TANGGAL) - 5
--ORDER BY VIP.TANGGAL DESC
GO
/****** Object:  View [NANO].[VW_DETAIL_VIP]    Script Date: 06/05/2018 07:42:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [NANO].[VW_DETAIL_VIP]
AS
SELECT DISTINCT 
                      VIP.PID_PELAPOR_VIP, VIP.TANGGAL, VIP.UTAMA, VIP.UTAMA_DESC, VIP.CADANGAN, VIP.CADANGAN_DESC, VIP.ACTUAL, VIP.ACTUAL_DESC, VIP.KET, 
                      HDR.PERSEN_NOW AS KEHADIRAN, MTG.SHEARING_ACT_NAMA AS SHEARING, MTG.SHEARING_TOPIC, NOTE.URAIAN, CHAL.CHALLANGE
FROM         NANO.VW_PELAPOR_VIP AS VIP LEFT OUTER JOIN
                      NANO.VW_NOTULEN AS NOTE ON CONVERT(DATETIME, VIP.TANGGAL) - 5 = NOTE.TGL_PLAN LEFT OUTER JOIN
                      NANO.VW_KEGIATAN_MEETING AS MTG ON CONVERT(DATETIME, VIP.TANGGAL) - 5 = MTG.TGL_PLAN LEFT OUTER JOIN
                      NANO.VW_KEHADIRAN_MEETING AS HDR ON CONVERT(DATETIME, VIP.TANGGAL) - 5 = HDR.TGL_PLAN LEFT OUTER JOIN
                      NANO.VW_CHALLANGE_ALL AS CHAL ON VIP.TANGGAL = CONVERT(DATE,CONVERT(DATETIME,CHAL.TGL_PLAN)+5)
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "VIP"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 125
               Right = 217
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "NOTE"
            Begin Extent = 
               Top = 6
               Left = 255
               Bottom = 125
               Right = 415
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "MTG"
            Begin Extent = 
               Top = 6
               Left = 453
               Bottom = 125
               Right = 659
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "HDR"
            Begin Extent = 
               Top = 6
               Left = 697
               Bottom = 125
               Right = 876
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 12
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
 ' , @level0type=N'SCHEMA',@level0name=N'NANO', @level1type=N'VIEW',@level1name=N'VW_DETAIL_VIP'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'        Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'NANO', @level1type=N'VIEW',@level1name=N'VW_DETAIL_VIP'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'NANO', @level1type=N'VIEW',@level1name=N'VW_DETAIL_VIP'
GO
/****** Object:  Default [DF_TBL_M_CHALLENGE_PID_CH]    Script Date: 06/05/2018 07:42:30 ******/
ALTER TABLE [NANO].[TBL_M_CHALLENGE] ADD  CONSTRAINT [DF_TBL_M_CHALLENGE_PID_CH]  DEFAULT (newid()) FOR [PID_CH]
GO
/****** Object:  Default [DF_TBL_M_PLAN_VIP_PID_PLAN_VIP]    Script Date: 06/05/2018 07:42:30 ******/
ALTER TABLE [NANO].[TBL_M_PLAN_VIP] ADD  CONSTRAINT [DF_TBL_M_PLAN_VIP_PID_PLAN_VIP]  DEFAULT (newid()) FOR [PID_PLAN_VIP]
GO
/****** Object:  ForeignKey [FK_TBL_T_CHALLENGE_TBL_M_CHALLENGE]    Script Date: 06/05/2018 07:42:30 ******/
ALTER TABLE [NANO].[TBL_T_CHALLENGE]  WITH CHECK ADD  CONSTRAINT [FK_TBL_T_CHALLENGE_TBL_M_CHALLENGE] FOREIGN KEY([PID_CH])
REFERENCES [NANO].[TBL_M_CHALLENGE] ([PID_CH])
GO
ALTER TABLE [NANO].[TBL_T_CHALLENGE] CHECK CONSTRAINT [FK_TBL_T_CHALLENGE_TBL_M_CHALLENGE]
GO
/****** Object:  ForeignKey [FK_TBL_T_KEHADIRAN_MEETING_TBL_R_KEHADIRAN]    Script Date: 06/05/2018 07:42:30 ******/
ALTER TABLE [NANO].[TBL_T_KEHADIRAN_MEETING]  WITH CHECK ADD  CONSTRAINT [FK_TBL_T_KEHADIRAN_MEETING_TBL_R_KEHADIRAN] FOREIGN KEY([KEHADIRAN])
REFERENCES [NANO].[TBL_R_KEHADIRAN] ([ID_KEHADIRAN])
GO
ALTER TABLE [NANO].[TBL_T_KEHADIRAN_MEETING] CHECK CONSTRAINT [FK_TBL_T_KEHADIRAN_MEETING_TBL_R_KEHADIRAN]
GO
/****** Object:  ForeignKey [FK_TBL_T_SCORE_CHALLANGE_TBL_R_SCORE]    Script Date: 06/05/2018 07:42:30 ******/
ALTER TABLE [NANO].[TBL_T_SCORE_CHALLANGE]  WITH CHECK ADD  CONSTRAINT [FK_TBL_T_SCORE_CHALLANGE_TBL_R_SCORE] FOREIGN KEY([SCORE])
REFERENCES [NANO].[TBL_R_SCORE] ([ID_SCORE])
GO
ALTER TABLE [NANO].[TBL_T_SCORE_CHALLANGE] CHECK CONSTRAINT [FK_TBL_T_SCORE_CHALLANGE_TBL_R_SCORE]
GO
/****** Object:  ForeignKey [FK_TBL_T_SCORE_CHALLANGE_TBL_T_CHALLENGE]    Script Date: 06/05/2018 07:42:30 ******/
ALTER TABLE [NANO].[TBL_T_SCORE_CHALLANGE]  WITH CHECK ADD  CONSTRAINT [FK_TBL_T_SCORE_CHALLANGE_TBL_T_CHALLENGE] FOREIGN KEY([PID_T_CH])
REFERENCES [NANO].[TBL_T_CHALLENGE] ([PID_T_CH])
GO
ALTER TABLE [NANO].[TBL_T_SCORE_CHALLANGE] CHECK CONSTRAINT [FK_TBL_T_SCORE_CHALLANGE_TBL_T_CHALLENGE]
GO
