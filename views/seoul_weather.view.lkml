view: seoul_weather {
  sql_table_name: looker_demo.seoul_weather ;;

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

  dimension: rainfall_range {
    case: {
      when: {
        sql: ${TABLE}.rainfall <= 0.0 ;;
        label: "날씨맑음"
      }
      when: {
        sql: ${TABLE}.rainfall < 1.0 ;;
        label: "추적추적 내림"
      }
      when: {
        sql: ${TABLE}.rainfall >= 1.0 AND ${TABLE}.rainfall < 2.0;;
        label: "많이 내림"
      }
      when: {
        sql: ${TABLE}.rainfall >= 2.0 AND ${TABLE}.rainfall < 3.0;;
        label: "억수로 내림"
      }
      when: {
        sql: ${TABLE}.rainfall >= 3.0 AND ${TABLE}.rainfall < 5.0;;
        label: "물통을 뒤집은 것처럼 내림"
      }
      when: {
        sql: ${TABLE}.rainfall >= 5.0 AND ${TABLE}.rainfall < 8.0;;
        label: "폭포와 같이 내림"
      }
      else: "공포"
    }
  }

  dimension: temperature_tier {
    type: tier
    tiers: [-20, -10, 0, 10, 20, 30, 40]
    style:  integer
    sql: ${TABLE}.temperature ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
  measure: temperature_avg {
    type: average
    sql: ${TABLE}.temperature ;;
    drill_fields: [sido, gungu, sido, date, hour]
  }

  measure: rainfall_avg {
    type: average
    sql: ${TABLE}.rainfall ;;
    drill_fields: [sido, gungu, sido, date, hour]
  }
}
