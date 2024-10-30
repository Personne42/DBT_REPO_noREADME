--- On merge tous les datasets publicitaires au sein d'un document unique

-- SELECT *
-- FROM {{ ref('stg_raw__adword') }}

-- UNION ALL

-- SELECT *
-- FROM {{ ref('stg_raw__bing') }}

-- UNION ALL

-- SELECT *
-- FROM {{ ref('stg_raw__criteo') }}

-- UNION ALL

-- SELECT *
-- FROM {{ ref('stg_raw__facebook') }}

{{ dbt_utils.union_relations(
    relations=[ref('stg_raw__adword'),
    ref('stg_raw__facebook'),
    ref('stg_raw__bing'),
    ref('stg_raw__criteo')]
) }}
