set autocreate = true;

insert into sink_cities
select stream ci.id, ci.name, co.name as country
from `db01.src_db01.cities` as ci
inner join `db01.src_db01.countries` as co on ci.country_id = co.id
group by sliding(10, s);
