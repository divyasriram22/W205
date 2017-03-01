-- Hospitals_and_Patients


	SELECT hospital_name, score, x.base_score as base_score, x.consistency_score as cons_score
        FROM survey_responses_table_t x
        INNER JOIN effective_care_table_t y
        ON y.provider_id = x.provider_id
        WHERE x.consistency_score IS NOT NULL and x.base_score IS NOT NULL and y.score IS NOT NULL
        GROUP BY x.hospital_name, y.provider_id, x.consistency_score, x.base_score, y.score
        ORDER BY y.score DESC
        LIMIT 25;
