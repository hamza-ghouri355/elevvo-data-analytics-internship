-- q1: which countries bring in the most revenue?
select c.country as country, round(sum(i.total), 2) as total_rev
from customer c
inner join invoice i
on c.customerid = i.customerid
group by c.country
order by total_rev desc;


-- q2: which tracks sold the most? (many tracks tie at 2 sales)
select t.name as name, sum(l.quantity) as sold
from track t
inner join invoiceline l
on t.trackid = l.trackid
group by t.trackid, t.name
order by sold desc, t.name
limit 10;


-- q3: how does revenue change month to month?
select strftime('%y-%m', invoicedate) as month, round(sum(total), 2) as monthly_rev
from invoice
group by month
order by month asc;


-- q4: which genres earn the most?
select g.name as name, round(sum(l.quantity * l.unitprice), 2) as total_rev
from invoiceline l
inner join track t
on t.trackid = l.trackid
inner join genre g
on g.genreid = t.genreid
group by g.name
order by total_rev desc
limit 5;


-- q5: which artists earn the most?
select a.name as name, round(sum(il.quantity * il.unitprice), 2) as total_rev
from artist a
inner join album b on a.artistid = b.artistid
inner join track t on t.albumid = b.albumid
inner join invoiceline il on il.trackid = t.trackid
group by a.artistid, a.name
order by total_rev desc
limit 5;


-- q6: which album earns the most revenue for each artist?
select name, title, album_rev
from (
    select artistid, name, title, album_rev,
           row_number() over (
               partition by artistid
               order by album_rev desc
           ) as rn
    from (
        select a.artistid,
               a.name as name,
               b.title as title,
               round(sum(il.quantity * il.unitprice), 2) as album_rev
        from artist a
        inner join album b on a.artistid = b.artistid
        inner join track t on b.albumid = t.albumid
        inner join invoiceline il on t.trackid = il.trackid
        group by a.artistid, a.name, b.albumid, b.title
    )
)
where rn = 1
order by album_rev desc;