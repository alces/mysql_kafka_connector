set autocreate = true;

insert into sink_hotels
with hotelsWithChains as (
  select stream h.id, h.name, h.rating, h.city_id, c.name as chain
  from `db01.src_db01.hotels` as h
  inner join `db01.src_db01.hotel_chains` as c on c.id = h.chain_id
  group by sliding(10, s)
)
select stream h.id, h.name, h.rating, h.chain, ci.name as city, ci.country
from hotelsWithChains as h
inner join sink_cities as ci on ci.id = h.city_id
group by sliding(10, s);
