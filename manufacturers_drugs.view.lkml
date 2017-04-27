view: manufacturers_drugs {
  sql_table_name: data4democracy.manufacturers_drugs ;;

  dimension: primary_key {
    hidden: yes
    primary_key: yes
    type: number
    sql: ${TABLE}.int64_field_0 ;;
  }


  dimension_group: asofdate {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    sql: ${TABLE}.ASOFDATE ;;
  }

  dimension: billunits {
    type: number
    sql: ${TABLE}.BILLUNITS ;;
  }

  dimension: billunitspkg {
    type: number
    sql: ${TABLE}.BILLUNITSPKG ;;
  }

  dimension: dosagenum {
    type: number
    sql: cast(${TABLE}.DOSAGENUM as FLOAT64) ;;
  }

  dimension: dosageunits {
    type: string
    sql: ${TABLE}.DOSAGEUNITS ;;
  }

  dimension: drug_name {
    type: string
    sql: ${TABLE}.DRUG_NAME ;;
  }

  dimension: hcpcs_code {
    type: string
    sql: ${TABLE}.HCPCS_CODE ;;
  }

  dimension: hcpcs_dosage {
    type: string
    sql: ${TABLE}.HCPCS_DOSAGE ;;
  }

  dimension: labeler_name {
    type: string
    sql: ${TABLE}.LABELER_NAME ;;
  }

  dimension: ndc {
    type: string
    sql: ${TABLE}.NDC ;;
  }

  dimension: pkg_qty {
    hidden: yes
    type: number
    sql: ${TABLE}.PKG_QTY ;;
  }

  dimension: pkg_size {
    hidden: yes
    type: number
    sql: ${TABLE}.PKG_SIZE ;;
  }

  dimension: short_description {
    type: string
    sql: ${TABLE}.SHORT_DESCRIPTION ;;
  }

  measure: count {
    type: count
    drill_fields: [labeler_name, drug_name]
  }

  measure: total_pkg_qty {
    type: sum
    sql: ${pkg_qty} ;;
  }

  measure: total_pkg_size {
    type: sum
    sql: ${pkg_size} ;;
  }

  measure: total_bill_units {
    type: sum
    sql: ${billunits} ;;
  }
}
