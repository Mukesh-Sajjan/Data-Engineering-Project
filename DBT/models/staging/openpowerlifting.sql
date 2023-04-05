{{ config(materialized='table') }}
 
select
   -- identifiers
    cast(MeetID as integer) as meetid,
    cast(Name as string) as name,
    cast(Sex as string) as  sex,
    cast(Equipment as string) as equipment,
    cast(Age as numeric) as age,
    cast(Division as string) as  division,
    cast(BodyweightKg as numeric) as bodyweight,
    cast(WeightClassKg as string) as weightclass,
    cast(Squat4Kg as numeric) as squat4kg,
    cast(BestSquatKg as numeric) as bestsquatkg,
    cast(Bench4Kg as numeric) as bench4kg,
    cast(BestBenchKg as numeric) as bestbenchkg,
    cast(Deadlift4Kg as numeric) as deadlift4kg,
    cast(BestDeadliftKg as numeric) as bestdeadliftkg,
    cast(TotalKg as numeric) as totaltkg,
    cast(Place as string) as place,
    cast(Wilks as numeric) as wilks
    
from {{ source('staging','openpowerlifting') }}



