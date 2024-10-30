--- On merge tous les datasets publicitaires au sein d'un document unique

SELECT *
FROM {{ ref('stg_raw__adword') }}

UNION ALL

SELECT *
FROM {{ ref('stg_raw__bing') }}

UNION ALL

SELECT *
FROM {{ ref('stg_raw__criteo') }}

UNION ALL

SELECT *
FROM {{ ref('stg_raw__facebook') }}