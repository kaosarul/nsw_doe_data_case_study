DECLARE @columns NVARCHAR(MAX) = '';
DECLARE @sql NVARCHAR(MAX) = '';

-- Get all column names except for the first two (School Code and School Name)
SELECT @columns += ',' + QUOTENAME(COLUMN_NAME, '"')
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'multi_age_composite_dataset' 
AND COLUMN_NAME NOT IN ('School code', 'School Name');

-- Remove leading comma
SET @columns = RIGHT(@columns, LEN(@columns) - 1)

-- Construct the dynamic SQL string
SET @sql = '
WITH cte_UNPIVOT AS (
    SELECT 
        "School code",
        "School Name",
        CASE 
            WHEN column_name LIKE ''COMPOSITE_CLASS_COUNT_%'' THEN ''COMPOSITE_CLASS_COUNT''
            WHEN column_name LIKE ''COMPOSITE_CLASS_STUDENTS_%'' THEN ''COMPOSITE_CLASS_STUDENTS''
            WHEN column_name LIKE ''PCT_COMPOSITE_CLASSES_%'' THEN ''PCT_COMPOSITE_CLASSES''
            WHEN column_name LIKE ''PCT_COMPOSITE_CLASS_STUDENTS_%'' THEN ''PCT_COMPOSITE_CLASS_STUDENTS''
        END AS Measure,
        ''20'' + RIGHT(column_name, 2) AS Year,
        value
    FROM 
        (SELECT "School code", "School Name", ' + @columns + ' 
         FROM multi_age_composite_dataset) AS src
    UNPIVOT
        (value FOR column_name IN (' + @columns + ')) AS unp
)

-- Create the new table
SELECT * INTO unpivoted_dataset
FROM cte_UNPIVOT
ORDER BY "School code", Measure, Year;
';

-- Execute the dynamic SQL
EXEC sp_executesql @sql;
