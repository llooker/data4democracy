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

  dimension: total_spending_per_user {
    hidden: yes
    type: number
    sql: ${TABLE}.total_spending_per_user ;;
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

  measure: count {
    type: count
    drill_fields: []
  }

  measure: total_spending {
    type: sum
    sql: ${TABLE}.total_spending ;;
  }

  measure: user_count {
    type: sum
    sql: ${TABLE}.user_count ;;
  }

  measure: unit_count {
    type: sum
    sql: ${TABLE}.unit_count ;;
  }

  measure: claim_count {
    type: sum
    sql: ${TABLE}.claim_count ;;
  }


}
