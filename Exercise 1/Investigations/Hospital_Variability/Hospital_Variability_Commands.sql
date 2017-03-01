-- Hospital_Variability

	SET hive.cli.print.header=true;

        SELECT x.measure_id, variance(x.score) as var_measure, COUNT(*) as measure_count
        FROM effective_care_table_t x
        GROUP by x.measure_id
        ORDER BY var_measure DESC
        LIMIT 10;
