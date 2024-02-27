select year,sum(games_sold)as total_games_sold from VideoGamesSalesData.game_sales
where year in (
with critic as(
select year,count(g.game) as num_games,round(avg(critic_score),2)as avg_critic_score from VideoGamesSalesData.reviews as r
inner join VideoGamesSalesData.game_sales as g
on g.game=r.game
group by year
having count(g.game)>4
order by avg_critic_score desc
limit 10),
user_score as
(select year,count(g.game) as num_games, round(avg(user_score),2) as avg_user_score from VideoGamesSalesData.game_sales as g
inner join VideoGamesSalesData.reviews as r
on g.game=r.game
group by year
having count(year)>4
order by avg_user_score desc
limit 10
)
select year from critic
intersect Distinct
select year from user_score
order by year 
)
group by year
order by 2 desc