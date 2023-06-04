SELECT 
  date, 
  store_name, 
  city, 
  county, 
  category_name, 
  pack, 
  bottle_volume_ml, 
  state_bottle_cost, 
  state_bottle_retail, 
  bottles_sold, 
  sale_dollars, 
  volume_sold_liters, 
  volume_sold_gallons 
FROM 
  bigquery - public - data.iowa_liquor_sales.sales 
LIMIT 
  1000
