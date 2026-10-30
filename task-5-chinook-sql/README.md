For this task I used the Chinook database, which is a sample music store, and wrote six SQL queries to answer business questions about it. The queries are in chinook_queries.sql, each with a comment saying what it answers. I used SQLite and DBeaver.

The USA brings in the most revenue at 523.06, about 22% of the store's 2328.60 total, and with Canada that goes up to about 35%. Seven countries sit at exactly 37.62, which means they only have one customer each. By genre, rock earns 826.65, around 35% of everything, and rock, latin and metal together are about 63%. Iron Maiden is the top artist with 138.60, followed by U2 and Metallica. For albums, I used a window function (row_number with partition by artist) to find the highest earning album for every artist. The best one overall is Battlestar Galactica (Classic), Season 1 at 35.82.

Two things surprised me. No track sold more than twice, and a lot of them tied, so the top tracks list is just the first ten of the tied ones and I wouldn't read much into it. Monthly revenue is also almost perfectly flat at about 37.62 for five years, with a few bumps, so there's no growth trend. I think that means the data is generated sample data and not real sales.

I checked every query by adding the results back up and comparing them to the total (2328.60), and they matched each time. That caught a mistake early on where I was summing invoice ids instead of quantity, because my top track had sold more copies than the whole store.

The database file isn't in this repo. I got it from Kaggle (Chinook Database).