SELECT event_id,
    DENSE_RANK() OVER (PARTITION BY event_id
    ORDER BY total_score DESC) AS ranking,
        first_name,
        last_name,
        total_score
    FROM 
    (
    SELECT 
        t2.event_id,
        p.first_name,
        p.last_name,
        t2.total_score,
        p.country
        FROM (
        SELECT event_id,
            player_id,
            SUM(score) AS total_score
            FROM 
            (
            SELECT event_id,
                white_id AS player_id,
                (
                CASE
                    WHEN game_result = '1/2_1/2' THEN 0.5
                    WHEN game_result = '1_0' THEN 1
                    WHEN game_result = '0_1' THEN 0
                END) AS score
                FROM chess.games
                                                                                    	
            UNION ALL
            SELECT event_id,
                black_id AS player_id,
                (
                CASE
                    WHEN game_result = '1/2_1/2' THEN 0.5
                    WHEN game_result = '1_0' THEN 1
                    WHEN game_result = '0_1' THEN 0
                END) AS score
                FROM chess.games) AS t1
            GROUP BY event_id,
                player_id) AS t2
        INNER JOIN chess.players AS p 
        ON p.fide_id = t2.player_id) AS t3
    LEFT OUTER JOIN chess.countries AS c ON t3.country = c.country_name
    ORDER BY total_score DESC;



