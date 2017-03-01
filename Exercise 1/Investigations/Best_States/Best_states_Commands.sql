-- Best States

SET hive.cli.print.header=true;

        SELECT AVG (var_score) FROM
                (SELECT state, variance(score) as var_score
                FROM effective_care_table_t GROUP BY state) a;

        Looks like the average variance in scores is about 8065.82



	SELECT avg(num_procedures) FROM
                (SELECT state, COUNT (*) as num_procedures
                FROM effective_care_table_t GROUP BY state) a;




	SELECT x.* FROM (SELECT state, sum(score) as agg_score,  variance(score) as var_score, avg(score) as avg_score,
        COUNT (measure_id) as num_procedures FROM effective_care_table_t WHERE score IS NOT NULL GROUP BY state) x
        WHERE x.num_procedures > 1888.46 and x.var_score < 8065.82 ORDER BY x.avg_score DESC LIMIT 10;



 	-- redo of query because previous one only pulled up top 5

	SELECT x.* FROM (SELECT state, sum(score) as agg_score,  variance(score) as var_score, avg(score) as avg_score,
        COUNT (measure_id) as num_procedures FROM effective_care_table_t WHERE score IS NOT NULL GROUP BY state) x
        WHERE x.var_score < 8065.82 ORDER BY x.avg_score DESC, x.num_procedures DESC LIMIT 10;
