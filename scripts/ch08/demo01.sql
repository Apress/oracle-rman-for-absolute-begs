-- View what schema-level objects can be filtered, run this query:

SELECT
 object_path
FROM schema_export_objects
WHERE object_path NOT LIKE '%/%';
