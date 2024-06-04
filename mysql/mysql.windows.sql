with t1(fusion_id, ship_name, start_time, code_value, end_time)
         AS (SELECT fusion_id,
                    ship_name,
                    cap_time as start_time,
                    code_value,
                    CASE
                        WHEN is_entry = 0 and
                             LEAD(is_entry, 1, NULL) over (PARTITION by fusion_id ORDER BY cap_time) = 1
                            THEN LEAD(cap_time, 1, NULL) over (PARTITION by fusion_id ORDER BY cap_time)
                        END  as end_time
             FROM entry_exit_port_record ep
             where fusion_id is not null
             ORDER BY fusion_id, cap_time)
SELECT fusion_id,
       any_value(ship_name)                                                 as ship_name,
       any_value(code_value)                                                as code_value,
       round(AVG(unix_timestamp(end_time) - unix_timestamp(start_time)), 0) as avg_time,
       max(unix_timestamp(end_time) - unix_timestamp(start_time))           as max_time
FROM t1
WHERE end_time is NOT NULL
GROUP BY fusion_id
order by avg_time desc;
