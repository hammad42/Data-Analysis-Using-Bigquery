SELECT game,year,
games_sold,
rank() over(partition by year order by games_sold desc)

 FROM `playground-s-11-8f4cb28f.VideoGamesSalesData.game_sales` 