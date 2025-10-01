view: order_items {
  sql_table_name: demo_db.order_items ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }
  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
    html: |
    {% if value == 'Cancelled' %}
    <div style="background-color: #FFCCCC; color: #8B0000;">{{ value }}</div>
    {% elsif value == 'Completed' %}
    <div style="background-color: #CCFFCC; color: #006400;">{{ value }}</div>
    {% elsif value == 'Pending' %}
    <div style="background-color: #FFFFCC; color: #CC9900;">{{ value }}</div>
    {% else %}
    {{ value }}
    {% endif %}
    ;;
  }
  dimension: inventory_item_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.inventory_item_id ;;
  }
  dimension: order_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.order_id ;;
  }
  dimension: phone {
    type: string
    sql: ${TABLE}.phone ;;
  }
  dimension: phones {
    type: string
    sql: ${TABLE}.phones ;;
  }
  dimension_group: returned {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.returned_at ;;
  }
  dimension: sale_price {
    type: number
    sql: ${TABLE}.sale_price ;;
  }
  measure: total_revenue  {
    type: sum
    value_format: "$0.00"
    drill_fields: [product.brand,users.gender,inventory_items.product_id]
    link: {
      label: "SHARAN"
      url: "https://gcpl256.cloud.looker.com/"
    }
    sql: ${sale_price} ;;
  }
  measure: count {
    type: count
    drill_fields: [id, orders.id, inventory_items.id]
  }}
