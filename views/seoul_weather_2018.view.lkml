view: seoul_weather_2018 {
  sql_table_name: looker_demo.seoul_weather_2018 ;;

  dimension: date {
    type: string
    sql: ${TABLE}.date ;;
  }

  dimension: dong {
    type: string
    sql: ${TABLE}.dong ;;
  }

  dimension: gungu {
    type: string
    sql: ${TABLE}.gungu ;;
  }

  dimension: hour {
    type: string
    sql: ${TABLE}.hour ;;
  }

  dimension: rainfall {
    type: number
    sql: ${TABLE}.rainfall ;;
  }

  dimension: sido {
    type: string
    sql: ${TABLE}.sido ;;
  }

  dimension: temperature {
    type: number
    sql: ${TABLE}.temperature ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
