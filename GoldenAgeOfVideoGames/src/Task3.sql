select year,round(avg(critic_score),2)as avg_critic_score from VideoGamesSalesData.reviews as r
inner join VideoGamesSalesData.game_sales as g
on g.game=r.game
group by year
order by avg_critic_score desc
limit 10