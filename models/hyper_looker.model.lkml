connection: "hyper_looker"

# include all the views
include: "/views/**/*.view"

datagroup: hyper_looker_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: hyper_looker_default_datagroup

explore: call_delivery {
  join: seoul_weather {
    type: inner
    sql_on: ${call_delivery.addr_sido} = ${seoul_weather.sido}
              AND ${call_delivery.addr_sigungu} = ${seoul_weather.gungu}
              AND left(${call_delivery.addr_dong}, 2) = ${seoul_weather.dong}
              AND ${call_delivery.date} = ${seoul_weather.date}
              AND ${call_delivery.time_tier} = ${seoul_weather.hour};;
    relationship: one_to_one
  }
}

explore: seoul_population {}

explore: seoul_weather {}

explore: seoul_weather_2018 {}
