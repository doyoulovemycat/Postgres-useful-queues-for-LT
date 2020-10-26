SELECT
                cast(total_time / 1000 as numeric(20,4)) as "TOTAL TIME (s)"
                , cast((total_time / (nullif(calls, 0) * 1000)) as numeric(20,4)) as "AVG TIME (s)"
                , cast((max_time / 1000) as numeric(20,4)) as "QUERY MAX TIME (s)"
                , cast((mean_time / 1000) as numeric(20,4)) as "QUERY MEAN TIME (s)"
                , cast((stddev_time / 1000) as numeric(20,4)) as "QUERY STDDEV TIME (s)"
                , calls as "CALLS"
                , cast(100.0 * shared_blks_hit / nullif(shared_blks_hit + shared_blks_read, 0) as numeric(20,4)) AS "CACHE HITS (%)"
                , query as "QUERY"
                , rows as "TOTAL AFFECTED ROWS"
                , cast(rows / nullif(calls, 0) as numeric(20,4)) as "AVG ROWS PER EXEC"
                , cast(blk_read_time / 1000 as numeric(20,4)) as "TOTAL BLK READ TIME (s)"
                , cast(blk_read_time / (nullif(calls, 0) * 1000) as numeric(20,4)) as "AVG BLK READ TIME (s)"
                , cast(blk_write_time / 1000 as numeric(20,4)) as "TOTAL BLK WRITE TIME (s)"
                , cast(blk_write_time / (nullif(calls, 0) * 1000) as numeric(20,4)) as "AVG BLK WRITE TIME (s)"
                , shared_blks_hit
                , shared_blks_read
                , shared_blks_dirtied
                , shared_blks_written
                , local_blks_hit
                , local_blks_read
                , local_blks_dirtied
                , local_blks_written
                , temp_blks_read
                , temp_blks_written 
                , userid
                , dbid
                , queryid
FROM public.pg_stat_statements
WHERE dbid = (select oid from pg_database where datname = 'databasename')
ORDER BY "QUERY MAX TIME (s)" DESC, "AVG TIME (s)" DESC;
