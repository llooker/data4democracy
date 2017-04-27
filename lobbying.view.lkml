view: lobbying {
  sql_table_name: data4democracy.lobbying ;;

  dimension: category_code {
    type: string
    sql: ${TABLE}.catcode ;;
  }

  dimension: client {
    type: string
    sql: ${TABLE}.client ;;
  }

  dimension: company_key {
    type: number
    sql: ${TABLE}.company_key ;;
  }

  dimension: primary_key {
    hidden: yes
    primary_key: yes
    type: number
    sql: ${TABLE}.int64_field_0 ;;
  }

  dimension: client_short {
    type: string
    sql: ${TABLE}.sub ;;
  }

  dimension: total {
    hidden: yes
    label: "Lobbying Expenditures"
    type: number
    sql: ${TABLE}.total ;;
  }

  dimension: unknown_field {
    label: "Unknown Field"
    type: number
    sql: ${TABLE}.X ;;
  }

  dimension: year {
    type: number
    sql: ${TABLE}.year;;
  }

  measure: count {
    type: count
    drill_fields: []
  }

  measure: total_lobbying_expenditures {
    label: "Lobbying Expenditures"
    type: sum
    sql: ${total} ;;
  }
}
