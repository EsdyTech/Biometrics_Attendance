USE [master]
GO
/****** Object:  Database [empdatabase]    Script Date: 6/20/2019 3:07:05 AM ******/
CREATE DATABASE [empdatabase]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'empdatabase', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\empdatabase.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'empdatabase_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\empdatabase_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [empdatabase] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [empdatabase].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [empdatabase] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [empdatabase] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [empdatabase] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [empdatabase] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [empdatabase] SET ARITHABORT OFF 
GO
ALTER DATABASE [empdatabase] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [empdatabase] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [empdatabase] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [empdatabase] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [empdatabase] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [empdatabase] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [empdatabase] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [empdatabase] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [empdatabase] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [empdatabase] SET  DISABLE_BROKER 
GO
ALTER DATABASE [empdatabase] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [empdatabase] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [empdatabase] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [empdatabase] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [empdatabase] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [empdatabase] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [empdatabase] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [empdatabase] SET RECOVERY FULL 
GO
ALTER DATABASE [empdatabase] SET  MULTI_USER 
GO
ALTER DATABASE [empdatabase] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [empdatabase] SET DB_CHAINING OFF 
GO
ALTER DATABASE [empdatabase] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [empdatabase] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [empdatabase] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'empdatabase', N'ON'
GO
USE [empdatabase]
GO
/****** Object:  Table [dbo].[tbl_attendance]    Script Date: 6/20/2019 3:07:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_attendance](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[empid] [int] NULL,
	[val] [int] NULL CONSTRAINT [DF_tbl_attendance_val]  DEFAULT ((0)),
	[today_date] [varchar](100) NULL,
	[month] [varchar](100) NULL,
	[year] [varchar](100) NULL,
 CONSTRAINT [PK_tbl_attendance] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_emp]    Script Date: 6/20/2019 3:07:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_emp](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[emp_name] [varchar](200) NULL,
	[emp_age] [varchar](200) NULL,
	[emp_cell] [varchar](200) NULL,
	[emp_desig] [varchar](200) NULL,
	[emp_salary] [varchar](200) NULL,
	[emp_finger] [varbinary](max) NOT NULL,
	[on_vacc] [int] NULL CONSTRAINT [DF_tbl_emp_on_vacc]  DEFAULT ((0)),
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_attendance] ON 

INSERT [dbo].[tbl_attendance] ([Id], [empid], [val], [today_date], [month], [year]) VALUES (1, 1, 1, N'1/1/0001', N'1', N'1')
INSERT [dbo].[tbl_attendance] ([Id], [empid], [val], [today_date], [month], [year]) VALUES (2, 1, 1, N'6/15/2019', N'6', N'2019')
INSERT [dbo].[tbl_attendance] ([Id], [empid], [val], [today_date], [month], [year]) VALUES (3, 2, 1, N'6/15/2019', N'6', N'2019')
INSERT [dbo].[tbl_attendance] ([Id], [empid], [val], [today_date], [month], [year]) VALUES (4, 1, 1, N'6/17/2019', N'6', N'2019')
INSERT [dbo].[tbl_attendance] ([Id], [empid], [val], [today_date], [month], [year]) VALUES (6, 3, 1, N'6/20/2019', N'6', N'2019')
INSERT [dbo].[tbl_attendance] ([Id], [empid], [val], [today_date], [month], [year]) VALUES (7, 4, 1, N'6/20/2019', N'6', N'2019')
SET IDENTITY_INSERT [dbo].[tbl_attendance] OFF
SET IDENTITY_INSERT [dbo].[tbl_emp] ON 

INSERT [dbo].[tbl_emp] ([Id], [emp_name], [emp_age], [emp_cell], [emp_desig], [emp_salary], [emp_finger], [on_vacc]) VALUES (1, N'dsfsdf', N'sdfsdfs', N'sfsdfsdf', N'sfsfsdf', N'w24234', 0x00F88001C82AE3735CC0413709AB71B0A3145592690581A6804CF4583CEF30FE371F82F1269F8797BB887DD8F470D5669A6F1339B355B82FC49A1154CB9579CEDF85A46A048E669ABD539DAE78646E86528C59BCF5F5FBA79678381E1CC89F1B9DEE3994199C378A2DF2D8982A52DFD99BD96B5F03047528CD95EEA127F29960DAEE6871BB39F83075CE841DAC3723C35E5269A27FA750D7B9544A6B835628F5BE3A624406F47E6CD154F38F7BC3167F3060AC9430BF4B2CA9034361A27EB28AB5C7199CE8227F78EC3294A1A41DE025A8D131E9634FC19A32877AB45404EF8BE6B38C8FE04B7CED9554712817A2877F732B926E179C9AFD91703368F66E9E8C0335C84991B79F8599B01C019CD7210EB98376FFD930B5391AED81BFB83F1F098E423E044DD65968F8F57C2DEDB911FF1DE261C79F4CEF873455DE3A5CDD9C0751F33A2AE3BDC8BE454A43EEB33BEA28DA48749F848E33E35D4C3D546DF43463EBB011B889C3F9D17E13A5D6935FB44E712160023460FDD15B106044CDC451B5FC1280436F00F88001C82AE3735CC0413709AB7130B91455920581F67FB0F3B7BF9D79C3DBB715E8A6DA12A2A157288025E024CF83EAB89150361274F386961006497E90DC0FBCDBFC2AB92B6B480E707E65F051B4331025313130B33436BB2B7D4807E98F209973169D356E82DA16079807A8595DCE4E25251CA6467D03FC7C69E1E75AF2D26B72C946B2D28228CE96FFC4781502AEB80CABD57804B4FAA6EAFD50AA3DAD1F05B5BA4ACFD6F212B02296C9165D7A1129654D68697F562D3D74EC8AC1FF4FE742244A962E2AE20E63B156D44F49258C28D13DF87484632F9A668DF6F19E4CAFDFC34F054595E4FED6D927EE366E9014E5064421BC6E195849C197C91C150753363FD4A0BD9611DBD0856CF5EB8817CAE9A11B4E776966BA8BC9F3DFBFF604ED1FD4FEB92636F8A32ED7191CC2227926A358A47D1187E435665A19762F1761CD0E994AB2F4B1D7EA5336A2AD542DFA95B3852B9CBB8EE230930E435B44EC29C2F01D46DA16632F4FA52ACAD825A45203453E9140AAE93A298CEE9960FEB120066D9C996F00F88101C82AE3735CC0413709AB7130A51455925A6838F03C429387819C5487885A967640838FDAEC0FA4C350D7799D2DDBF31226400746E98908E2AEF0FEC53C91AF4A13C030E4CDB98EF11A6ECBE569503BF6F0ED2FE244180AFC49AA79177B00963058D4FA266C47FE36F08F287EEB03443ABFE769295FFDEFB17A72854BA83B2FF94B9D6632CDF1BC9C7B32652CF11926D3E92F9BA93F8D42F21327B6F48E86AE966E8FC16D3DDDA2DECB4E481EE241E88FFAFEAE706BCB9B51F37EDE36E38B261DF071F489C998224004158485C61C25CEFBC7F3A965DDB6208834F4C9501A5FA6A508B7596141AF89BF8545AAA35A52A780C504995234748753F142337A93F968CF1E88F4D5C40DAFF50E3582431573D34F4CFB4EFF0AD328D5EA197C9D87302DBE33580DEB6BE2F2DE2F9C81B5A5B476839059313D6F81EAA6E9461E916D352C0D9794F0AF093D0522D68526669ADA564DC3A0C9CB29C8E038FF708B826457A2DF3A3AA3BE76D198148471F4EB666891EB93E17F167A20444C493C7F440459805B6F00E88001C82AE3735CC0413709AB71F0B81455927B6247519F0B85C730EE45D4A2D91D7D76591D7EF5D8D3D7D1B7C47DF33F44391A68E9FF0D720D231EFE1A3852240FBE538F95D68F02214D21EF7E24DF7E56BE8853678E3D304B16FD8591260A023DAFF7EDBE2F1DCBFD505C9AAD167908F5A41A3D38F6454E2926CB0B73DEE81B208D501227E1C14C6F4DE1F16ADC22C8FB942CF96F1C6252FB60F19C72F7CCA12CEABAE0E59A62191F6F26F5B8547F4F943921DA9AD9248AC62ADB1B761AEAF8B282531F9ABC940000123653419863081C509822B595703B182B2130C0321D52655EE4A7F6F5E710268FC283FBE6422F35363BC241335E9B8FD156B2E645824AA402B25B69DC8E77F31F9B8FA98988F29FB3FA42447FCAEE02F9A5909EC996F3783D92D0056E3AC538AEAB1BB57CFA9D73A9719FBB8911A5B9B9D230285B827D664FFF541DFAC264038EF5AD44DB08451D518F4242CCB52A1373D48A1A1A150CA59220B2AB354CFB939625545084987260A679263F76A02899A9B8A7AA8CEAFF244F6F93CE628493CE629493CE629493CE62A493CE62A493CE62B493CE62B493CE62C093CE62C093CE62D093CE62D093CE62DC93CE62DC93CE62EC93CE62EC93CE62F893CE62F893CE620494CE62, NULL)
INSERT [dbo].[tbl_emp] ([Id], [emp_name], [emp_age], [emp_cell], [emp_desig], [emp_salary], [emp_finger], [on_vacc]) VALUES (2, N'ali', N'25', N'03224379402', N'ABC', N'20000', 0x00F88001C82AE3735CC0413709AB7170BF145592C06063BDC619636A4B4290F4D8F200930B06D8B0D6D6079376776E3AB9C86D9BBDAEDB9648A3DE00E7EE028246A5DC918ADEEC1AA8CC2292CE27A412C520E4C39F5BA8A190BDB4C0BB33BB945DE65693532208055AFDB7571685341534CEF54BA908C72E5394C1066C64C7A3579A87A23B55E035D76B86C16B21FE84F168BDD819C0F299633D05E774BE69A99F74BF86E1D68F1BF2FE42D6B3449B9E1181585261F7A169819F722B0545480120166B759E6E6A7A624D956EA200A2437F9BEC07F95672A7036315A793FE7715FD4A46A30B7443508A8BCC6514F34616B0103D9CB07FCB534C2A97F6337722024578DD043396BC7296513F6D324124FC8B1B1AF3F41B0C0CCDA84BB1200D8B5D00ABD19C96928F015D0871A54752A10054358EE2493E1A94C0F9CFA7AE923D4B1D23E8B472A94A1C818AA8CE8E171350D506E72D29CC68474C367B68678A98E155949641232B3C69F0A9F45B076F617BA0E2443315A614A70A46EC7266F7176C86CACED66F00F88001C82AE3735CC0413709AB7130981455929028D258A5AA3795460F9B575588B605AB464669794511EA2825AF680376E94F4C2A1E6899612C516F1335CC0E3D2169A1026161A1989B3B293BF9512D718DAAA02A79FD59990D281FC9437DEB161DC6E81FB12AC45B2254CBE55A40E0446848C977F83BE52ED8E6C0ED6E1961227C0AF35BD40D7ADC953CFB3C80550C4A52F0706A00D3B0A05E4491C6EB3A575B17C9A47038289C18B2C762C4B2558140855DA98A36858813BB71F48053BDD0D8E1C6A71CFAAA2A4EBD82BC2E76C0E432F1D46EA218CAD48A1ED1B031DC96063D5E54472D88E64529FE9A9948EE1CA71F931280FB3CCF96AD27DE4F49AD58C4DC44E1B18B114D232789243ABA798F284198B0FE033EE8CD2A0B581A0D278F4CA893031E4E82F57552288FC1632430D259E6244716036C1A8B2B861C7F21431D192AC20394D5C58054AF83FDECF854BDB595F346E5F2793F45E637145A9972BA14663BDC398BEEA62D0A0A0CCA31C1A5781D12100B1D5BDCB4CD50CD8AF0DBAE5E75DC6F00F88101C82AE3735CC0413709AB7130A2145592C74DBE58E7F46866D21CEC8CF3B7EFD773A25B72433DB3AAC301B5246D7ECB0F1A7DC3D31375B350A59563254781B9706C237DBA407CBAA87671312F2183CC5C1A9AD95384D59CEB4F8F76D6328EAF9CE2E04357BB95FC0253DEAEBF5ED92F29F169FC3B7AE51485DFB9A83420E95210D012EECA34BEBBB719E58365C80985732A9968ECB2F55F53D75F527D7440FF9C7133FBE13F81542CD41FC3266223D16EDAC3893949402D10E3F9559437DF6922A87E774CFEFFC57B9850DCBE7387203B96BABF4B3F1FD6FEC66A1C8AFE0C175F954A8EB17CDACDD5BD82EB646CE3DF25C3F9AEF4DB488FBC19DE9B9C3152E5F4F48D1FF9BA592703BC4E432C14112BC443AB094A0B4D393778AB5068CFF7585436ECAEA4297B27FA59500B447C80BA2A0A2E8060BD5B4156D668B8C5A3204AB5393F184F8497EF413D78DAAC7DFCF2C93E4EA28EFEF46BEF3C97A4386302234367011CFEB08E8BB490013A02D86719E6B7B5CC92262488EE7F8782785474B747FF6F00E87E01C82AE3735CC0413709AB7170BC145592DAF3D8F77B706D95C9B0AAAA21638E9471D4045D853C87F2F1246279A0C85D52E7A4A824445EA5F11A7DDD1FEC845820370F8F877020B26DD0AB7F3F0A640B70DD045EB92003BD4FB50F32EC7337D4EB6AD4AB79FEE71F67C59BA281C240398825AA5C67FBFFF4185B7910D6D4CD957BB42802F61A46CEB8A11F4CD60B99433275233880712D4593E208298A780FB8AE7BA88DF61E230DE676382DC0EB9025041B68151D55AC7C554D398C059FA89EABD4A093BEF1B5BA64FEB7BBDCEA94A4F6B94ED6C4AFE16158997867827CD19A0A17311A5B2C247035D081375414699B76238ED1C9F97659A0F808FF735DC48FB6E332933FA5273E967900DE2AFEE7B79A761142644282F2C8EF0B936A43956165D3504298AA2F9891A5742BA07C5EF1258225332F1E141BDB8CB2964A6C80C661A72D94ADC229CDE7E16A6D8901CB2C2F09F2B79CA41F5ABC26B48124CE9BE6393523731B04A19CA1172ECFB75F3597EEAF05EC7396E266A7F51DA52C545C6F002000630061007000740075007200650064002E000D000A005400680065002000660069006E006700650072007000720069006E00740020006600650061007400750072006500200073006500, 1)
INSERT [dbo].[tbl_emp] ([Id], [emp_name], [emp_age], [emp_cell], [emp_desig], [emp_salary], [emp_finger], [on_vacc]) VALUES (3, N'mirza ali', N'24', N'03224379402', N'Android developer', N'00', 0x00F87E01C82AE3735CC0413709AB71B0B814559227F14CDCC72DAA603D0E9EC23DB16CFD452C6B3ACE7F8C267C5DD55A34281016A72A73FF98A66697E64E2C1E4478AB65E1D798F50E19793E2BC95303BC4DC863A4A42128C904F7A854ADA11139891D5926567AB1D01E56CFBFB5B13B155965F56B3C5D77C3B7E818ECCC14BD32047F421FFB1A9C74B72D66C58970916428194D9A8C1941F399AE239CB83FF7F4BA40C6943180F127C99D88D166B3008E56C453AA34061825BA3A60E5B6C63A3D049B069BDA4B103B92D6DA8BCD664777D287549592089BB421838A0D7C575CC62F370DE97ACEC471CA7B3B7F9B87814C9408A6A3B8918A4C014E941B8D1B5FC9960DF4DF04B893C01D2987F19BF545F6437E3DC3D5F3A055CE690ACEE2B9DDD382F14B6A4231A3F67B58FE42D18098FD1390469F740657BD2280226BEA9F6966D2C1BF43D9CB9C0BC565E7035B9526DA008CC0EDD6DFDA8C9AAAE15B6C31A467149A9C1C0F4B6EC4FF66E2C4E1760D1F3B6304ABF30BB151666A73CB98B99AF0AC6F00F88101C82AE3735CC0413709AB7130B41455924E0C6407D01F05C5ED45530151F6F83F8BF035822C76058730AA6800CDA817B8C3C0DDF1EA030505BAFFAD7575EDABAD5AEEAD327C219A9223E0D5B0B74656B9AEBAA4A7EFC7DEA93A432D67EBE9D8DADCAEE1D90E73A66136274007043B1EE927FF0292CE5FA776D244FF5E92BD05E2E49295A36A0AA5AE27FF2A577181F81DD38DC13BC4BB2BF48FC565E1BF5C073F624DB0999F59CA60623F52D24780230B5C2AFF3B15FF2BBB03D344811CDA43BC3AF950C413FB8D2187185FA285F3A53E6C54BA4A57EDAAA30774C8EEAFF9E04980FDC45E74E3E9B5486021D7D73B86301AF1850DECD044A4CA09E27907E6978B231DDCDAD26FF75A92ECB9F130DDAF84DD9A5AED77A7DA3132048FFD70444758A3ACE37749DE10C4246CC6A9908D2ACEF28C6B9FE8B2C835BBD7553D4BF4874F38BB9F420685ECA783378D6F7193D218890E24FB922B8A14FE7BD350CB4232E2C48119F8AAF0D89CC38BBFAAF2D40404F03D1A829BDA266A1F4545EEDBDE858BB46F00F87F01C82AE3735CC0413709AB71B0BE145592154F08F89E765B30407E59FAABEBDCEA7594567827E384A48076997CC1FF2041D25579EE964B560D741D8BB62A9CFE3824FCFAF3BD674E73CFD8DFE75D4F8D9EA45CB6E577AC82F56C1917D91D85BCCF26BBE7B42DEC905E3F4FFD786D32E6F3BFC3FEC07999638BA58ECAE7457E80D38F9DDED446E189CE269A02E32D38C74ED8AC45A0132282CDE104D826FE51F0C264C1E69172F2D5BC041447459CA48195BBD715E66F43B027BC5219B980F384A39B70EE3CEAC64878AD9E95E32644FD524CC102663637D66C5FA6B79953908942DAC35CE0826F56756DD8E797E5AB8E0556F5C44597B02DA63C25EB157F599E713AB1E634AFC8FE63E8D99EFDAF3CAADD27D8281D88C9E1969BAF49CA84FEB5201A3DA25DFF77576BBC051092BBA82B9221625B8B9A7E829D4A4501E9F6863AA182729B2742297ADAA5359BC9ECDA975513F50AB467A4963312D5453E4C7444D2244F48A2088B6F807393F52C47B1A70E8E02069A4526D891E4B0B0E004FF9A6F00E87F01C82AE3735CC0413709AB7130BE145592329A41B6F803C279FDCEAFD512A8ECEC3B3C790301B1A97B1A9CA84291442E45BE6FAEBCF1D47A8A4160B7814BA3B5B27CBF1CA43B33DB7C38A2D61D065F99159C6353E4B959DABC5C384FB4740FCADD0B62A1EB0E2AA29776B9AE4C94A2C6BE60F732CA47EA876B76A6846CD412EE36BCED55BE3A5515B890A84008D64061EE31CA56CA65C1030D97501ADBD4455EB9F4BFC2682D8F246AC6CADE6E286F9455FF704A8E96F008950D90011F64D6D26564CFCDA85A08173EBA1BC2C4B2A0D8E4DDB0F990D20F8817B272CFFFA3DAC9899426A0453363B01F73B73707F976B619D1B749701D22178688497474A9F5C2152EF584A32BA77C8D310871948EA91E97FC77D39F8B50E782AE2F85A921FE8D5E15833A428B669244DB15CEA3BD9C91BEA42CDA2803C16D0C2F460108453F95298B1D3B0805F70B9746ED920D49E899C24EC5BE7152BDA68AB0477DCDEB11E62F7294246F8A04B48EFFD96BF9613D5941AB042E72515AF7C6E2BFBD2AEB26536F935F6284935F6284935F6294935F6294935F62A4935F62A4935F62B4935F62B4935F62C0935F62C0935F62D0935F62D0935F62DC935F62DC935F62EC935F62EC935F62F8935F62F8935F6204945F62, 0)
INSERT [dbo].[tbl_emp] ([Id], [emp_name], [emp_age], [emp_cell], [emp_desig], [emp_salary], [emp_finger], [on_vacc]) VALUES (4, N'abc', N'20', N'23232323', N'sdfsdfsdf', N'23232', 0x00F87E01C82AE3735CC0413709AB7130F514559270CE605807992A5E9EE46C4FDA300448D8AEE94E255981D4E13CE3BBC90A246FB165EE1F659418DAA2882B5EC96345437127F08C30953A63E3342D959AD4CDBC74BDFBEFBB6B9FD1307AB2D918E7AC3A6E1C99BD8A967F3D5D17E7C03CE181E974A2BCC35FF80512D7ACEF7A19D4D697966135075D1ADBBF1B7D96597AFCCFE1811A51C0FD1E9227782E4DB7D5E2E60DE2B6508667487EE569058D0D373AF0EB2749A90C5154F0B994222929D0B71FCCAB7DE2D1A83EC6FC1CE35BA25A1FB7AA6E7678E89E9EF3730325C3A375498DCF70DD2000BE7AFC5C9FC2D594BAE1A3ECC8E75E3705D23D005D12B50BAEF72912FDD8012775130D6E46C1BAC22A2A597449022039AD5FE16763C7CF5316D8F20D6EAC7F706552F4AE83D66F80D4140BF6BE54E17BF48AC6D922BAAD2D1589DBA88E11F4A43CB752057403A243290F905D5BB2424D093F85CB36576CA72E7B617143C9443D2757BAF15DE994324DD875DAD0DE767BCAE54126D823BBC9EB596F00F87F01C82AE3735CC0413709AB71B0F81455925F14874AF275E20AAE06D0EB64FB604A59FF3C19291D5DE596A88FE209C736FD58F16D1C5215D9C1D74FEAAB6C02D2B1E4F6E1BA971B1711AB162E5A284CC080EDB38AFDC52DE4C836EF98E4483EED0EDBC60827CA287FFFD83B860EE7FDAD83CFE9AE1B432513CEECF5D2AE37016C347D2D4D74B3C90116AB3DDFC3DBB828F0ADCDA4A77F034FC47BC7B281132E14FB0FD57D497505CCC9492C2586AE840F0DD1975321AE4D9E7E5F2546221D464D2545611982DEDC7FE12DFA09B27F5CE6F137440EEA744C24967A77A33FA6A914629C8616966F0D330CE9D949B75A95B6F37EE6ABABD4A14B1728C03BF5F1E3344C428CE7D9A8DE78E233CF13E95605432833F167BBE6817253C20DDEC76DA0C9BFAEE687E2EF20DB27E9FA02B6990A8E10DA676333EE0E4C635C12DF9A7B44D77B374355F598B3239404A3FA895A99BCD57CBBD969C43E8C9F49ED036C02E225800A0D76FB996B794BA3FF6A9032C4A5BD48FE46EF08EF0AADB830BD296DC8B06F00F87F01C82AE3735CC0413709AB71B08D145592B8CCDA90001B0A08DA21010B93C3876D1550A93A2C1AA2CF94A151D48B952AB97C430DF75407CDFF72E3930145798DE38CD876CF78FC0C6DD1440804CD3400E04A40EBF44211050E5A1A5077E67556D66D960477845757406B76E1E5951BB1F2AB09943D42D7FA1C59F45B81722464ADFB226A4118AE4806221BB3B963FAD6E1F7B44B170A540523D97EEE4BCBE6887267B762D4D6B9F5E1F0DACA671BD61D7FCEC7BD213A74A43A44D8C51405790A31FC26770086F44E193EB9D4C2F45B193365ACE7FD059D9CC95000FC6362BC7F43E24222C6A6A149EFAAA41B4E9FC34D1526D971A357283EFD0D2D0C6DE2EE012DD758A44C08464D29ABDD509C01E60847FA5D9C1760DE9E6E573DC0026B41A1E7EAC684AA563A6B1B3F2EFDBD58D53819CF7A17771D02BF154A06B65AEE18163E76190ECCF1FF7B75D89FBF047313FB7727855ED616A427F9FD14653C84F44793E33E1C5301D91DA9A9E60B80B877D4944F4A9D85D30F3DFB3716EA477226FF6F00E88101C82AE3735CC0413709AB71B0E6145592A579EDB2508765A69BAF4013B8803556B69B0524398E4598A5BB394693A9929B9FC7F8A2EFDC3E221C56AA03B49371C89F94300435424B2C8703C241E879A5CF9981B656038200F3A9F21CF15A75DF0C967F3F46650A19CF79F07792E2D60E9D61F1BF561D5C0E1F736DFB5C054CD4D1B331335053C8987D907C504D9800FB789FA0CE8377211902E475CC8C873AEE5F4DFBBF67647123D8B141CB9E0630777319C12D426245A24FEE7F9AADC2B12EC2B389D449448D7D3D95D8B430A04AA81AFA75042D4AF96293F9224B4AA2C1BF27EFC5761A27E96368C5F65D40EF22BC1626298F7AC689C8D1AFC285B295B529552D75A56BB56EA3BDEAA6D9CC819A7E7FEB11CC7F2D21BE5057803D2D4184F3D3E72BFC86437B83283246C77A7CC41F1EC826EFD98829D3DB765A6AF8972B4004457B0354F7F510BCD5A242B2ABE0815ED67AF038E6ED102F80AC38AF9A77585E649DDFF4568886CE0A46044F6608A6EF7D94C1894E9EAA50838DFE5A768839F4766F935F6284935F6284935F6294935F6294935F62A4935F62A4935F62B4935F62B4935F62C0935F62C0935F62D0935F62D0935F62DC935F62DC935F62EC935F62EC935F62F8935F62F8935F6204945F62, 0)
SET IDENTITY_INSERT [dbo].[tbl_emp] OFF
USE [master]
GO
ALTER DATABASE [empdatabase] SET  READ_WRITE 
GO
