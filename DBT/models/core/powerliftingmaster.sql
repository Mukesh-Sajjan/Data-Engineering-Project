{{ config(materialized='table') }}

with meets_data as (
    select * from {{ ref('meets') }}
)
,
powerlifting_data as (
    select * from {{ ref('openpowerlifting') }}
    
)
select 
    powerlifting_data.meetid,
    powerlifting_data.name,
    powerlifting_data.sex,
    powerlifting_data.equipment,
    powerlifting_data.age,
    powerlifting_data.division,
    powerlifting_data.bodyweight,
    powerlifting_data.weightclass,
    powerlifting_data.squat4kg,
    powerlifting_data.bestsquatkg,
    powerlifting_data.bench4kg,
    powerlifting_data.bestbenchkg,
    powerlifting_data.deadlift4kg,
    powerlifting_data.bestdeadliftkg,
    powerlifting_data.totaltkg,
    powerlifting_data.place,
    powerlifting_data.wilks,
    meets_data.meetpath,
    meets_data.federation,
    meets_data.eventdate,
    meets_data.meetcountry,
    meets_data.meetname

    
from powerlifting_data
inner join meets_data
on powerlifting_data.meetid = meets_data.meetid
