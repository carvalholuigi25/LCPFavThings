using System;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace LCPFavThingsWApi.Migrations.SqlLiteMigrations
{
    public partial class InitialSQLite : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.CreateTable(
                name: "Games",
                columns: table => new
                {
                    GameID = table.Column<int>(type: "INTEGER", nullable: false)
                        .Annotation("Sqlite:Autoincrement", true),
                    Title = table.Column<string>(type: "TEXT", unicode: false, maxLength: 100, nullable: false),
                    DescT = table.Column<string>(type: "TEXT", unicode: false, maxLength: 1024, nullable: false),
                    Genre = table.Column<string>(type: "TEXT", unicode: false, maxLength: 20, nullable: false),
                    Category = table.Column<string>(type: "TEXT", unicode: false, maxLength: 255, nullable: false),
                    Cover = table.Column<string>(type: "TEXT", unicode: false, maxLength: 100, nullable: false),
                    Company = table.Column<string>(type: "TEXT", unicode: false, maxLength: 255, nullable: false),
                    Publisher = table.Column<string>(type: "TEXT", unicode: false, maxLength: 255, nullable: false),
                    LangT = table.Column<string>(type: "TEXT", unicode: false, maxLength: 20, nullable: false),
                    DateRelease = table.Column<string>(type: "TEXT", unicode: false, maxLength: 255, nullable: false),
                    Rating = table.Column<decimal>(type: "decimal(2, 1)", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Games", x => x.GameID);
                });

            migrationBuilder.CreateTable(
                name: "Movies",
                columns: table => new
                {
                    MovieID = table.Column<int>(type: "INTEGER", nullable: false)
                        .Annotation("Sqlite:Autoincrement", true),
                    Title = table.Column<string>(type: "TEXT", unicode: false, maxLength: 100, nullable: false),
                    DescT = table.Column<string>(type: "TEXT", unicode: false, maxLength: 1024, nullable: false),
                    Genre = table.Column<string>(type: "TEXT", unicode: false, maxLength: 20, nullable: false),
                    Category = table.Column<string>(type: "TEXT", unicode: false, maxLength: 255, nullable: false),
                    Cover = table.Column<string>(type: "TEXT", unicode: false, maxLength: 100, nullable: false),
                    Company = table.Column<string>(type: "TEXT", unicode: false, maxLength: 255, nullable: false),
                    LangT = table.Column<string>(type: "TEXT", unicode: false, maxLength: 20, nullable: false),
                    Duration = table.Column<int>(type: "int", nullable: false),
                    Rating = table.Column<decimal>(type: "decimal(2, 1)", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Movies", x => x.MovieID);
                });

            migrationBuilder.CreateTable(
                name: "TVSeries",
                columns: table => new
                {
                    TVSerieID = table.Column<int>(type: "INTEGER", nullable: false)
                        .Annotation("Sqlite:Autoincrement", true),
                    Title = table.Column<string>(type: "TEXT", unicode: false, maxLength: 100, nullable: false),
                    DescT = table.Column<string>(type: "TEXT", unicode: false, maxLength: 1024, nullable: false),
                    Genre = table.Column<string>(type: "TEXT", unicode: false, maxLength: 20, nullable: false),
                    Category = table.Column<string>(type: "TEXT", unicode: false, maxLength: 255, nullable: false),
                    Cover = table.Column<string>(type: "TEXT", unicode: false, maxLength: 100, nullable: false),
                    Company = table.Column<string>(type: "TEXT", unicode: false, maxLength: 255, nullable: false),
                    LangT = table.Column<string>(type: "TEXT", unicode: false, maxLength: 20, nullable: false),
                    TotalSeasons = table.Column<int>(type: "int", nullable: false),
                    Duration = table.Column<int>(type: "int", nullable: false),
                    Rating = table.Column<decimal>(type: "decimal(2, 1)", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_TVSeries", x => x.TVSerieID);
                });

            migrationBuilder.CreateTable(
                name: "Users",
                columns: table => new
                {
                    UserID = table.Column<int>(type: "INTEGER", nullable: false)
                        .Annotation("Sqlite:Autoincrement", true),
                    Username = table.Column<string>(type: "TEXT", unicode: false, maxLength: 255, nullable: false),
                    PasswordT = table.Column<string>(type: "TEXT", unicode: false, maxLength: 255, nullable: false),
                    Email = table.Column<string>(type: "TEXT", unicode: false, maxLength: 255, nullable: true),
                    Pin = table.Column<int>(type: "int", nullable: true),
                    FirstName = table.Column<string>(type: "TEXT", unicode: false, maxLength: 255, nullable: true),
                    LastName = table.Column<string>(type: "TEXT", unicode: false, maxLength: 255, nullable: true),
                    DateBirthday = table.Column<DateTime>(type: "datetime", nullable: true),
                    Avatar = table.Column<string>(type: "TEXT", unicode: false, maxLength: 255, nullable: true),
                    Cover = table.Column<string>(type: "TEXT", unicode: false, maxLength: 255, nullable: true),
                    About = table.Column<string>(type: "TEXT", unicode: false, maxLength: 255, nullable: true),
                    DateAccountCreated = table.Column<DateTime>(type: "datetime", nullable: true),
                    RoleT = table.Column<int>(type: "INTEGER", unicode: false, maxLength: 255, nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Users", x => x.UserID);
                });
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "Games");

            migrationBuilder.DropTable(
                name: "Movies");

            migrationBuilder.DropTable(
                name: "TVSeries");

            migrationBuilder.DropTable(
                name: "Users");
        }
    }
}
