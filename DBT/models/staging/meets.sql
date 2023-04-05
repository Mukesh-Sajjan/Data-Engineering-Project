{{ config(materialized='table') }}
 
select
   -- identifiers
    cast(MeetID as integer) as meetid,
    cast(MeetPath as string) as meetpath,
    cast(Federation as string) as  federation,
    cast(date as timestamp) as eventdate,
    
    -- timestamps
    cast(MeetCountry as string) as meetcountry,
    cast(MeetName as string) as meetname
    
from {{ source('staging','meets') }}


