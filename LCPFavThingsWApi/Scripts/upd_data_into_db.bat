@echo off
setlocal enableextensions
set "projpth=C:\\Users\\Luis\\Documents\\Visual Studio 2022\\Projects\\LCPFTMain\\LCPFavThingsWApi"

cls
cd "%projpth%"

call "%projpth%\\Scripts\\clear_cache.bat"

cls

if exist "%projpth%\\Data\\SQLite" (
	rmdir /s /q "%projpth%\\Data\\SQLite"
)

if exist "%projpth%\\Data\\SQL" (
	rmdir /s /q "%projpth%\\Data\\SQL"
)

if exist "%projpth%\\Data\\MySQL" (
	rmdir /s /q "%projpth%\\Data\\MySQL"
)

if not exist "%projpth%\\Data\\SQLite" (
	mkdir "%projpth%\\Data\\SQLite"
)

if not exist "%projpth%\\Data\\SQL" (
	mkdir "%projpth%\\Data\\SQL"
)

if not exist "%projpth%\\Data\\MySQL" (
	mkdir "%projpth%\\Data\\MySQL"
)

if exist "%projpth%\\Migrations" (
	rmdir /s /q "%projpth%\\Migrations"
)

if not exist "%projpth%\\Migrations" (
	mkdir "%projpth%\\Migrations"
)

REM if not exist "%projpth%\\Migrations\\APISecMigrations" (
	REM mkdir "%projpth%\\Migrations\\APISecMigrations"
REM )

if not exist "%projpth%\\Migrations\\SqliteMigrations" (
	mkdir "%projpth%\\Migrations\\SqliteMigrations"
)

if not exist "%projpth%\\Migrations\\SqlServerMigrations" (
	mkdir "%projpth%\\Migrations\\SqlServerMigrations"
)

if not exist "%projpth%\\Migrations\\MySqlMigrations" (
	mkdir "%projpth%\\Migrations\\MySqlMigrations"
)

REM dotnet ef database drop --force --context ApiSecurityDBCtx --project="%projpth%"
REM dotnet ef migrations remove --force --context ApiSecurityDBCtx --project="%projpth%"
REM dotnet ef migrations add InitialAPISec --context ApiSecurityDBCtx --output-dir Migrations/APISecMigrations --project="%projpth%"
REM dotnet ef database update --context ApiSecurityDBCtx --project="%projpth%"

set SGBDServiceMode=mysql
dotnet ef database drop --force --context DBMySQLContext --project="%projpth%"
dotnet ef migrations remove --force --context DBMySQLContext --project="%projpth%"
dotnet ef migrations add InitialMySQL --context DBMySQLContext --output-dir Migrations/MySqlMigrations --project="%projpth%"
dotnet ef database update --context DBMySQLContext --project="%projpth%"

set ASPNETCORE_ENVIRONMENT=Development
set SGBDServiceMode=sqlite
dotnet ef database drop --force --context DBLiteContext --project="%projpth%"
dotnet ef migrations remove --force --context DBLiteContext --project="%projpth%"
dotnet ef migrations add InitialSQLite --context DBLiteContext --output-dir Migrations/SqlLiteMigrations --project="%projpth%"
dotnet ef database update --context DBLiteContext --project="%projpth%"

set ASPNETCORE_ENVIRONMENT=Production
set SGBDServiceMode=sqlserver
dotnet ef database drop --force --context DBContext --project="%projpth%"
dotnet ef migrations remove --force --context DBContext --project="%projpth%"
dotnet ef migrations add InitialSQLServer --context DBContext --output-dir Migrations/SqlServerMigrations --project="%projpth%"
dotnet ef database update --context DBContext --project="%projpth%"

if exist "%projpth%\Data\qry_mysql_gen_data_lcpftdb.sql" (
	"C:\Program Files\MySQL\MySQL Server 8.0\bin\mysql.exe" -u root -p1234 lcpfavthingsdbmysql < "%projpth%\Data\qry_mysql_gen_data_lcpftdb.sql"
)

if exist "%projpth%\Data\qry_sqlite_gen_data_lcpftdb.sql" (
	REM cat "%projpth%\Data\qry_sqlite_gen_data_lcpftdb.sql" | sqlite3 "%projpth%\Data\SQLite\lcpfavthingsdb.db"
	"C:\sqlite\sqlite3.exe" "%projpth%\Data\SQLite\lcpfavthingsdb.db" ".read %projpth%\Data\qry_sqlite_gen_data_lcpftdb.sql"
)

if exist "%projpth%\Data\qry_lcpftdb_gen_data.sql" (
	"C:\Program Files\Microsoft SQL Server\Client SDK\ODBC\170\Tools\Binn\SQLCMD.EXE" -S "(localdb)\MSSQLLocalDB" -d "LCPFavThingsDB" -i "%projpth%\Data\qry_lcpftdb_gen_data.sql" -a 32767
)

REM if "%errorlevel%" EQU "0" (
	REM if exist "C:\\Users\\Luis\\LCPFavThingsDB.mdf" (
		REM COPY "C:\\Users\\Luis\\LCPFavThingsDB.mdf" "%pthproj%\\Data\\SQL\\LCPFavThingsDB.mdf"
	REM )

	REM if exist "C:\\Users\\Luis\\LCPFavThingsDB.ldf" (
		REM COPY "C:\\Users\\Luis\\LCPFavThingsDB.ldf" "%pthproj%\\Data\\SQL\\LCPFavThingsDB.ldf"
	REM )

	REM if exist "C:\\programdata\\MySQL\\MySQL Server 8.0\\Data\\lcpfavthingsdbmysql" (
		REM if not exist "%pthproj%\\Data\\MySQL\\lcpfavthingsdbmysql" (
			REM mkdir "%pthproj%\\Data\\MySQL\\lcpfavthingsdbmysql"
		REM )

		REM COPY "C:\\programdata\\MySQL\\MySQL Server 8.0\\Data\\lcpfavthingsdbmysql\\*.*" "%pthproj%\\Data\\MySQL\\lcpfavthingsdbmysql\\"
	REM )
REM )

pause
exit /b %errorlevel%
endlocal