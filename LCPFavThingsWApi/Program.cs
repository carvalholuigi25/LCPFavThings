using LCPFavThingsWApi.Context;
using LCPFavThingsWApi.Hubs;
using Microsoft.AspNetCore.ResponseCompression;
using Microsoft.Extensions.FileProviders;

var builder = WebApplication.CreateBuilder(args);
//var sgbdsrv = builder.Environment.IsProduction() ? "sqlserver" : "sqlite";
var sgbdsrv = builder.Configuration.GetSection("SGBDServiceMode").Value.ToString();

if (sgbdsrv == "sqlserver")
{
    builder.Services.AddDbContext<DBContext>();
} 
else if(sgbdsrv == "mysql")
{
    builder.Services.AddDbContext<DBContext, DBMySQLContext>();
}
else
{
    builder.Services.AddDbContext<DBContext, DBLiteContext>();
}

builder.Services.AddControllers();
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();
builder.Services.AddSignalR();
builder.Services.AddResponseCompression(opts =>
{
    opts.MimeTypes = ResponseCompressionDefaults.MimeTypes.Concat(new[] { "application/octet-stream" });
});

builder.Services.AddCors(p => p.AddPolicy("lcpcorsapp", builder =>
{
    builder.WithOrigins("*").AllowAnyMethod().AllowAnyHeader();
}));

var app = builder.Build();

if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI();
}

app.UseCors("lcpcorsapp");
app.UseHttpsRedirection();
app.UseStaticFiles();
app.UseRouting();
app.UseAuthorization();
app.UseEndpoints(endpoints =>
{
    endpoints.MapControllers();
    endpoints.MapHub<BroadcastHub>("/broadcastHub");
});

var FileProviderPath = app.Environment.ContentRootPath + "/Assets";

if (!Directory.Exists(FileProviderPath))
{
    Directory.CreateDirectory(FileProviderPath);
}

app.UseFileServer(new FileServerOptions
{
    FileProvider = new PhysicalFileProvider(FileProviderPath),
    RequestPath = "/Assets",
    EnableDirectoryBrowsing = true
});

await app.RunAsync();