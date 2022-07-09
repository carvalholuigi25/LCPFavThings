using SQLite;
using LCPFavThingsLib.Models;
using System.Linq.Expressions;

namespace LCPFavThings.Data.SQLite
{
	public class LocalDBDataService : ILocalDBDataService
    {
        private readonly SQLiteAsyncConnection conn;

        public LocalDBDataService()
        {
            string pthfile = MyExtensions.GetFileDB("sqlite");
            conn = new SQLiteAsyncConnection(pthfile);

            if(!File.Exists(pthfile))
            {
                conn.CreateTableAsync<Games>();
                conn.CreateTableAsync<Movies>();
                conn.CreateTableAsync<TVSeries>();
                conn.CreateTableAsync<Users>();
            }
        }

        public async Task<int> Create<T>(T item)
        {
            return await conn.InsertAsync(item);
        }

        public async Task<List<T>> CreateAndGet<T>(T item) where T : new()
        {
            await conn.InsertAsync(item);
            return await Read<T>();
        }

        public async Task<List<T>> Read<T>() where T : new()
        {
            return await conn.Table<T>().ToListAsync();
        }

        public async Task<List<T>> ReadById<T>(Expression<Func<T, bool>> predicate) where T : new()
        {
            return await conn.Table<T>().Where(predicate).ToListAsync();
        }

        public async Task<int> Update<T>(T item)
        {
            return await conn.UpdateAsync(item);
        }

        public async Task<int> Delete<T>(T item)
        {
            return await conn.DeleteAsync(item);
        }

        public async Task<List<T>> QueryIt<T>(string qry = "SELECT * FROM Movies") where T : new()
        {
            return await conn.QueryAsync<T>(qry);
        }
    }
}
