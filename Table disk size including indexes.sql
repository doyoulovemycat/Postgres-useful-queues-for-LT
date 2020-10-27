SELECT nspname || '.' || relname AS "relation",pg_size_pretty(pg_relation_size(C.oid)) AS "size"
FROM pg_class C
LEFT JOIN pg_namespace N ON (N.oid = C.relnamespace)
ORDER BY pg_relation_size(C.oid) DESC
