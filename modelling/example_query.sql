SELECT table_name 
FROM information_schema.tables 
WHERE table_schema = 'main'
AND table_type = 'VIEW'
AND table_name = 'example_model';