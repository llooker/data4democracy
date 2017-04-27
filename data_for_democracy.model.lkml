connection: "lookerdata_publicdata_standard_sql"

# include all the views
include: "*.view"

# include all the dashboards
include: "*.dashboard"

# NOTE: please see https://looker.com/docs/r/sql/bigquery?version=4.12
# NOTE: for BigQuery specific considerations

# explore: spending {}

explore: spending{

  join: lobbying {
    type: left_outer
    sql_on: ${spending.primary_key} = ${lobbying.primary_key} ;;
    relationship: one_to_one
  }
  join: manufacturers_drugs {
    type: left_outer
    sql_on: ${lobbying.primary_key} = ${manufacturers_drugs.primary_key};;
    relationship: one_to_one
  }

}
