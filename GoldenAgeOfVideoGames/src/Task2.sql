SELECT COUNT(g.game)as MissingReviews
FROM VideoGamesSalesData.game_sales g
left JOIN VideoGamesSalesData.reviews r
ON g.game = r.game
WHERE critic_score IS NULL AND user_score IS NULL;