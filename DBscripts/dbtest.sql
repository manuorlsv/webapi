USE [master]
GO
/****** Object:  Database [dbtest]    Script Date: 13-Feb-23 11:05:42 PM ******/
CREATE DATABASE [dbtest]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'dbtest', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\dbtest.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'dbtest_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\dbtest_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [dbtest] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [dbtest].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [dbtest] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [dbtest] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [dbtest] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [dbtest] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [dbtest] SET ARITHABORT OFF 
GO
ALTER DATABASE [dbtest] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [dbtest] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [dbtest] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [dbtest] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [dbtest] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [dbtest] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [dbtest] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [dbtest] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [dbtest] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [dbtest] SET  ENABLE_BROKER 
GO
ALTER DATABASE [dbtest] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [dbtest] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [dbtest] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [dbtest] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [dbtest] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [dbtest] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [dbtest] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [dbtest] SET RECOVERY FULL 
GO
ALTER DATABASE [dbtest] SET  MULTI_USER 
GO
ALTER DATABASE [dbtest] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [dbtest] SET DB_CHAINING OFF 
GO
ALTER DATABASE [dbtest] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [dbtest] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [dbtest] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'dbtest', N'ON'
GO
ALTER DATABASE [dbtest] SET QUERY_STORE = OFF
GO
USE [dbtest]
GO
/****** Object:  Table [dbo].[uStatus]    Script Date: 13-Feb-23 11:05:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[uStatus](
	[idestatusO] [int] IDENTITY(1,1) NOT NULL,
	[Estado] [varchar](50) NULL,
	[Descripcion] [nvarchar](max) NULL,
	[datecreated] [datetime] NULL,
	[datemodify] [datetime] NULL,
	[createdby] [int] NULL,
	[modifyby] [int] NULL,
	[activo] [int] NULL,
	[icon] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[idestatusO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[usuarios]    Script Date: 13-Feb-23 11:05:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[usuarios](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[usuario] [varchar](50) NOT NULL,
	[pass] [varchar](max) NOT NULL,
	[db] [numeric](18, 0) NOT NULL,
	[dbiduser] [int] NULL,
	[datecreated] [datetime] NULL,
	[datemodify] [datetime] NULL,
	[createdby] [int] NULL,
	[modifyby] [int] NULL,
	[activo] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[usuarios] ON 

INSERT [dbo].[usuarios] ([id], [usuario], [pass], [db], [dbiduser], [datecreated], [datemodify], [createdby], [modifyby], [activo]) VALUES (1, N'mpolio', N'1234', CAST(10000000001 AS Numeric(18, 0)), 1, CAST(N'2023-02-13T22:38:15.803' AS DateTime), CAST(N'2023-02-13T22:38:15.803' AS DateTime), 1, 0, 1)
SET IDENTITY_INSERT [dbo].[usuarios] OFF
ALTER TABLE [dbo].[usuarios] ADD  DEFAULT ((0)) FOR [dbiduser]
GO
ALTER TABLE [dbo].[usuarios] ADD  DEFAULT (getdate()) FOR [datecreated]
GO
ALTER TABLE [dbo].[usuarios] ADD  DEFAULT (getdate()) FOR [datemodify]
GO
ALTER TABLE [dbo].[usuarios] ADD  DEFAULT ((1)) FOR [createdby]
GO
ALTER TABLE [dbo].[usuarios] ADD  DEFAULT ((0)) FOR [modifyby]
GO
ALTER TABLE [dbo].[usuarios] ADD  DEFAULT ((1)) FOR [activo]
GO
/****** Object:  StoredProcedure [dbo].[GetStoredProcedureDefinitionWithParameters]    Script Date: 13-Feb-23 11:05:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		mpolio
-- Create date: 15-12-23
-- Description:	get storo procedure and their definitions
-- =============================================
create PROCEDURE [dbo].[GetStoredProcedureDefinitionWithParameters]
@tenant varchar(50),
@sp_name varchar(500),
@sp_text_out nvarchar(max) OUTPUT

AS
BEGIN
SET NOCOUNT ON;

IF(LEN(ISNULL(@tenant, '')) < 4)
BEGIN
	PRINT 'Verificar Tenant.' 
	RETURN;
END




DECLARE @exec_sql nvarchar(max)
DECLARE @w_tenant_sp_name nvarchar(500)

SET @tenant = UPPER(@tenant);
SET @w_tenant_sp_name = @tenant + '.dbo.' + @sp_name;

/* 1: Verificar si Existe en la cuenta del cliente */
IF(ISNULL(OBJECT_ID(@w_tenant_sp_name, N'P'), 0) <= 0)
BEGIN
	/* 2: check if the account exist */
	SET @tenant = '[db_master]';
	SET @w_tenant_sp_name = @tenant + '.dbo.' + @sp_name; 
END



 
SET @exec_sql = ' ';

DECLARE @exec_sql_sp nvarchar(max);
DECLARE @params_definition nvarchar(max);
 
SET @params_definition = N'@sp_out nvarchar(max) OUT';
SET @exec_sql_sp = N'USE '+ @tenant + CHAR(13) + ' SELECT @sp_out = CAST(OBJECT_DEFINITION(OBJECT_ID('''+ @w_tenant_sp_name +''', N''P'')) as nvarchar(max))';

-- PRINT @exec_sql_sp
EXEC sp_executesql @exec_sql_sp, @params_definition, @sp_out = @sp_text_out OUT; 

SET @exec_sql = @exec_sql + 
' SELECT OrderLevel = 1, [ParameterID] = pa.parameter_id, [ParameterName] = pa.name, [ParameterDataType] = UPPER(t.name) '+
' FROM '+ @tenant +'.sys.parameters AS pa '+
' INNER JOIN '+ @tenant +'.sys.procedures AS p on pa.object_id = p.object_id '+
' INNER JOIN '+ @tenant +'.sys.types AS t on pa.system_type_id = t.system_type_id AND pa.user_type_id = t.user_type_id '+
' WHERE p.name = ''' + @sp_name + '''' + CHAR(13)


PRINT @exec_sql
EXEC (@exec_sql)


END
GO
/****** Object:  StoredProcedure [dbo].[Login]    Script Date: 13-Feb-23 11:05:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		mpolio
-- Create date: 15-07-2022
-- Description:	get user data
-- =============================================
CREATE PROCEDURE [dbo].[Login]
@usuario varchar(50),
@pass varchar(max),
@devicename varchar(100),
@deviceOSVersion varchar(100),
@DeviceOS varchar(100),
@appVersion varchar(100)


AS
BEGIN

	-- variables de salida token
	declare
	@mUserId int = 0,					-- master user id
	@cDB varchar(50),				-- cliente database
	@cUserId int =0,					--client user id
	@UUID varchar(50),		-- unico retornado por la database -- cambia al momento de loguearse si no coincide con el de la base local es porque se ha logueado en otra parte (caso mobiles)
	@expiresOn datetime,			-- momento en el que vence el uuid y requerira loguearse nuevamente 
	@logintime datetime,
	
	--variables de salida no encryptar
	@endpoint varchar(150),		-- dado caso se conecte a otros endpoint 
	@name varchar(200),
	@empleado varchar(50),
	@email varchar(200),
	@urlimagen  varchar(max),
	@clientdb varchar(50)  = 'db_'



	
	select @mUserId = id,@cDB=db,@cUserId=dbiduser from usuarios
	where usuario  = @usuario
	and pass = @pass
	and activo = 1

	if @mUserId <> 0
	begin

	SET @clientdb = CONCAT(@clientdb, @cDB)

	declare @tblusuario table(
	cUserId int ,[name] varchar(500),empleado varchar(250),email varchar(350),urlimagen nvarchar(350),expiresOn datetime)


	insert into @tblusuario
	exec  [dbo].[LoginGetUser] @clientdb,@cUserId


	SELECT TOP (1) 
	@cUserId =cUserId
	,@name = [name]
	,@empleado = empleado
	,@email    = email
	,@urlimagen	 =  urlimagen
	--,@UUID = UUID -- si se encuentra el usuario se actualiza la variable y el campo en la bd
	,@expiresOn =expiresOn
	FROM @tblusuario

	end

	if @cUserId <> 0
	begin

	set @logintime = GETDATE()
	set @expiresOn = GETDATE()+2
	set @UUID = NEWID()
			--aqui el update del usuario y el insert del loglogin


			exec  [dbo].[LoginUpdateUser] @clientdb,@cUserId,@UUID,@logintime,@devicename,@deviceOSVersion,@DeviceOS,@appVersion



	end

	  select 
	mUserId= @mUserId,					
	ObjectId = @cDB ,				
	cUserId= @cUserId,
	devicename=@devicename,
	cDeviceOS= @DeviceOS,		
	cDeviceOSVersion= @deviceOSVersion,
	appVersion=@appVersion,
	UUID= @UUID,		
	currentTime= isnull(getdate(),@logintime),		
	expiresOn = isnull(getdate(),@expiresOn),			
	logintime = @logintime ,
	--variables de salida no encryptar
	[endpoint]= @endpoint,		
	[name] = @name ,
	empleado = @empleado ,
	email = @email ,
	urlimagen =@urlimagen  

	



END
GO
/****** Object:  StoredProcedure [dbo].[LoginGetUser]    Script Date: 13-Feb-23 11:05:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		mpolio
-- Create date: 14-08-2022
-- Description:	obtiene los datos del usuario segun su base de cliente
-- =============================================
CREATE PROCEDURE [dbo].[LoginGetUser]
@clientdb varchar(50),
@cUserId int 

AS
BEGIN

	 
		DECLARE @exec_sql nvarchar(max)	  
		SET @exec_sql = 'SELECT TOP (1)  ';


		SET @exec_sql = @exec_sql + 
		'cUserId =[id]
		,name = CONCAT(uName,'' '',[uSurName])
		,empleado = nEmpleado
		,email    = Email
		,urlimagen	 =  photo 
		,expiresOn =[expiresOn]'+
		' FROM '+ @clientdb +'.[dbo].[usuarios] '+
		'  where id =  '+ CONVERT(varchar(50),@cUserId) +
		' and activo= 1 '


PRINT @exec_sql
EXEC (@exec_sql)



END
GO
/****** Object:  StoredProcedure [dbo].[LoginUpdateUser]    Script Date: 13-Feb-23 11:05:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		mpolio
-- Create date: 14-08-2022
-- Description:	obtiene los datos del usuario segun su base de cliente
-- =============================================
CREATE PROCEDURE [dbo].[LoginUpdateUser]
@clientdb varchar(50),
@cUserId int,
@UUID varchar(50),
@logintime datetime,
@devicename varchar(100),
@deviceOSVersion varchar(100),
@DeviceOS varchar(100),
@appVersion varchar(100)


AS
BEGIN
	declare @expiresOn datetime
	set @logintime = GETDATE()
	set @expiresOn = GETDATE()+2


	DECLARE @exec_sql nvarchar(max)	  
	DECLARE @exec_sql2 nvarchar(max)	  
	SET @exec_sql = 'update  '+ @clientdb +'.[dbo].[usuarios] 
					set UUID = '''+@UUID+''',expiresOn = '''+CONVERT(varchar(50),@logintime) +'''
					where  [id]='+ CONVERT(varchar(50),@cUserId) 
	--para usuarios de moviles tienen que loguearse almenos una vez cada dos dias
	PRINT @exec_sql
	EXEC (@exec_sql)
	


		SET @exec_sql2 = 'insert into '+ @clientdb +'.[dbo].[log_login] 
		(iduser, cDeviceName, cDeviceOS, deviceOSVersion, appVersion, LoginTime)
		values
		('+CONVERT(varchar(50),@cUserId) +','''+@devicename+''','''+@DeviceOS+''','''+@deviceOSVersion+''','+@appVersion+','''+ CONVERT(varchar(50),@logintime)+''')'

PRINT @exec_sql2
EXEC (@exec_sql2)



END
GO
/****** Object:  StoredProcedure [dbo].[sp_execute_tsql]    Script Date: 13-Feb-23 11:05:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		mpolio
-- Create date: 15-02-2023
-- Description:	run store pocedure in this database or another
-- =============================================
CREATE   PROCEDURE [dbo].[sp_execute_tsql] 
@tenantId varchar(50),
@sp_name varchar(250), 
@parameters nvarchar(max)


AS
BEGIN 
SET NOCOUNT ON;
DECLARE @w_tenantId varchar(50);
DECLARE @w_sp_name nvarchar(250);
DECLARE @w_Parameters nvarchar(max);

DECLARE @w_Tenant nvarchar(50);
DECLARE @NewLineChar AS CHAR(2) = CHAR(13) + CHAR(10)


SET @w_tenantId = @tenantId;
SET @w_sp_name = @sp_name;
SET @w_Parameters = @parameters;

--SET @w_Tenant = 'db_' + CAST(@w_TenantId AS VARCHAR(50));

SET @w_Tenant = 'db_' +@w_TenantId;

DECLARE @w_ExistsTenant INT

SELECT @w_ExistsTenant = COUNT(*) 
FROM [sys].[databases] d 
WHERE UPPER(d.name) = UPPER(@w_Tenant)

IF(ISNULL(@w_ExistsTenant, 0) <= 0)
BEGIN
	RAISERROR(N'Tenant does not exist.', 11, 1);
	RETURN;
END

-- ========================================================================================================
-- 
-- ========================================================================================================

DECLARE @sp_text VARCHAR(MAX);
DECLARE @tParameters TABLE(OrderLevel INT, ParameterID INT, ParameterName VARCHAR(250), ParameterDataType VARCHAR(250))

INSERT INTO @tParameters
EXECUTE [dbo].[GetStoredProcedureDefinitionWithParameters]
@tenant = @w_Tenant,
@sp_name = @w_sp_name,
@sp_text_out = @sp_text OUT;

DECLARE @text_replace NVARCHAR(MAX)
DECLARE @text_replace_end INT 

DECLARE @Add_use_tenant VARCHAR(2500)
DECLARE @text_create_procedure VARCHAR(2500)
DECLARE @add_param_values NVARCHAR(MAX)

/* Doble CHAR(39)+CHAR(39) cuando un objeto es dinamico y se ejecuta por medio de EXEC sp_executesql @sqlStr  */
DECLARE @doubleChar CHAR(4) = CHAR(39) + CHAR(39);


IF((SELECT COUNT(*) FROM @tParameters p) > 0 )
BEGIN
SET @Add_use_tenant = 'USE ' + @w_Tenant + ' ' + @NewLineChar + @NewLineChar;
SET @Add_use_tenant = @Add_use_tenant + 'DECLARE ';

SELECT @add_param_values = p.ParameterName FROM @tParameters p WHERE p.ParameterID = 1
SET @text_replace_end = CHARINDEX(@add_param_values, @sp_text, 0);  
SET @text_replace = SUBSTRING(@sp_text, 0, @text_replace_end)
SET @sp_text = REPLACE(@sp_text, @text_replace, @Add_use_tenant)

--SELECT DISTINCT CONCAT('SET ',a.ParameterName,' = ',a.ParameterValues,';',@NewLineChar,'  ') 
 set  @add_param_values = ''

--SELECT @add_param_values = ' '+ STRING_AGG('SET ' + a.ParameterName +' = '+ a.ParameterValues + ';' + @NewLineChar, '  ')
select  @add_param_values =   CONCAT(@add_param_values,' SET ',a.ParameterName,' = ',a.ParameterValues,';',@NewLineChar,'  ')
FROM
(
	SELECT	TOP (1000000000) P.[ParameterName],  
			[ParameterValues] = '''' + pv.ParametersValue + ''''
	FROM @tParameters p
	JOIN 
	(
		SELECT	ParameterName = p.ParameterName, 
				ParametersValue = p.ParametersValue
		FROM OPENJSON(@w_Parameters) 
		WITH 
		(
			ParameterName nvarchar(max) '$.ParameterName',
			ParametersValue nvarchar(max) '$.ParameterValue'
		) AS p
	) pv ON UPPER(pv.ParameterName) = UPPER(REPLACE(p.ParameterName, '@', ''))
	ORDER BY P.[ParameterID] ASC
) a
print @add_param_values
print '2'

-- =================================================================================================================
-- Encontrar el ultimo parametro y reemplazar el AS 
-- =================================================================================================================
DECLARE @LastParameter varchar(500), @LastParameterType varchar(500)
SELECT @LastParameter = p.ParameterName, @LastParameterType = p.ParameterDataType
FROM @tParameters p
WHERE p.ParameterID = (SELECT MAX(mp.ParameterID) FROM @tParameters mp)


SET @text_replace_end = (CHARINDEX(@LastParameter, @sp_text, 0) )  + LEN(@LastParameter);
SET @text_replace_end = CHARINDEX(@LastParameterType, @sp_text, (@text_replace_end));
SET @text_replace = SUBSTRING(@sp_text, (@text_replace_end + LEN(@LastParameterType)), 10)

-- =================================================================================================================
SET @text_replace_end = CHARINDEX('AS', @sp_text, (@text_replace_end + LEN(@LastParameterType)));
SET @text_replace = SUBSTRING(@sp_text, @text_replace_end, 2)
SET @sp_text = STUFF(@sp_text, @text_replace_end, 2, @add_param_values) 


END
ELSE 
BEGIN 

	SET @Add_use_tenant = 'USE ' + @w_Tenant + ' ' + @NewLineChar + @NewLineChar;

	SET @text_replace = SUBSTRING(@sp_text, (CHARINDEX('AS', @sp_text, 0) + 2), LEN(@sp_text))

	SET @sp_text = @Add_use_tenant + @text_replace

END


PRINT @sp_text
EXEC (@sp_text)



END
GO
USE [master]
GO
ALTER DATABASE [dbtest] SET  READ_WRITE 
GO
