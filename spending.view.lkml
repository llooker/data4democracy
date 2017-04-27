view: spending {
  sql_table_name: `data4democracy.spending_*` ;;

  dimension: year {
    type: string
    sql: REGEXP_EXTRACT(_TABLE_SUFFIX,r'\d\d\d\d') ;;
  }

  dimension: drugname_brand {
    type: string
    sql: ${TABLE}.drugname_brand ;;
  }

  dimension: drugname_generic {
    type: string
    sql: ${TABLE}.drugname_generic ;;
  }

  dimension: primary_key {
    hidden: yes
    primary_key: yes
    type: number
    sql: ${TABLE}.int64_field_0 ;;
  }

  dimension: out_of_pocket_avg_lowincome {
    hidden: yes
    type: number
    sql: ${TABLE}.out_of_pocket_avg_lowincome ;;
  }

  dimension: out_of_pocket_avg_non_lowincome {
    hidden: yes
    type: number
    sql: ${TABLE}.out_of_pocket_avg_non_lowincome ;;
  }

  dimension: unit_cost_wavg {
    hidden: yes
    type: number
    sql: ${TABLE}.unit_cost_wavg ;;
  }

  dimension: user_count_lowincome {
    hidden: yes
    type: number
    sql: ${TABLE}.user_count_lowincome ;;
  }

  dimension: user_count_non_lowincome {
    hidden: yes
    type: number
    sql: ${TABLE}.user_count_non_lowincome ;;
  }

  measure: total_spending {
    type: sum
    sql: ${TABLE}.total_spending ;;
    value_format_name: usd_0
  }

  measure: total_spending_per_user {
    type: number
    sql: ${total_spending} / nullif(${user_count},0) ;;
    value_format_name: usd_0
  }

  measure: user_count {
    type: sum
    sql: ${TABLE}.user_count ;;
    value_format_name: decimal_0
  }

  measure: unit_count {
    type: sum
    sql: ${TABLE}.unit_count ;;
    value_format_name: decimal_0
  }

  measure: claim_count {
    type: sum
    sql: ${TABLE}.claim_count ;;
    value_format_name: decimal_0
  }
}
