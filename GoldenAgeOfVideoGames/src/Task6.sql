select year, round(avg(user_score),2) as avg_user_score,count(g.game) as num_games from VideoGamesSalesData.game_sales as g
inner join VideoGamesSalesData.reviews as r
on g.game=r.game
group by year
having count(g.game)>4
order by avg_user_score desc
limit 10