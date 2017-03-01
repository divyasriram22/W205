
-- Best Hospitals

SET hive.cli.print.header=true;

        SELECT AVG (var_score) FROM
                (SELECT provider_id, variance(score) as var_score
                FROM effective_care_table_t GROUP BY provider_id) a;



	SELECT avg(num_procedures) FROM
                (SELECT provider_id, COUNT (*) as num_procedures
                FROM effective_care_table_t GROUP BY provider_id);



SELECT x.* FROM (SELECT hospital_name, sum(score) as agg_score,  variance(score) as var_score, avg(score) as avg_score,
        COUNT (measure_id) as num_procedures FROM effective_care_table_t WHERE score IS NOT NULL GROUP BY hospital_name) x
        WHERE x.num_procedures > 22 and x.var_score < 5400 ORDER BY x.avg_score DESC LIMIT 10;
