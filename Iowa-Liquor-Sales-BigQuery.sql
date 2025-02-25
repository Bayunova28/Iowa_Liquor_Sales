-- Display Iowa Liquor Sales Data
select *
from `bigquery-public-data.iowa_liquor_sales.sales`
limit 1000;

-- dim_date Table
select
  order_date,
  year_number,
  month_number,
  day_number,
  month_name,
  day_name,
  month_year,
  etl_date
from (
select
  date as order_date,
  extract(year from date) as year_number,
  extract(month from date) as month_number,
  extract(day from date) as day_number,
  left(format_date('%b', date),3) as month_name,
  left(format_date('%a', date),3) as day_name,
  concat(left(format_date('%b', date),3), ' ', extract(year from date)) as month_year,
  current_datetime() as etl_date,
  row_number() over (partition by date order by date) as rn
from `bigquery-public-data.iowa_liquor_sales.sales`
)
where rn=1
order by order_date;

-- dim_store Table
select
  store_number,
  store_name,
  zip_code,
  address,
  store_location,
  etl_date
from (
select
  store_number,
  store_name,
  case
    when zip_code like '%.%'
    then cast(replace(zip_code,'.','') as int64)
    when zip_code like '%-%'
    then cast(replace(zip_code,'-','') as int64)
    else cast(zip_code as int64)
  end as zip_code,
  address,
  store_location,
  current_datetime() as etl_date,
  row_number() over (partition by store_number order by store_number) as rn
from `bigquery-public-data.iowa_liquor_sales.sales`
)
where rn=1
order by store_number;

-- dim_location Table
select
  county_number,
  county,
  city,
  etl_date
from (
select
  county_number,
  county,
  city,
  current_datetime() as etl_date,
  row_number() over (partition by county_number order by county_number) as rn
from `bigquery-public-data.iowa_liquor_sales.sales`
)
where rn=1
order by county_number;

-- dim_category Table
select
  category_number,
  category_name,
  etl_date
from (
select
  cast(replace(category,'.','') as int64) as category_number,
  category_name,
  current_datetime() as etl_date,
  row_number() over (partition by category order by category) as rn
from `bigquery-public-data.iowa_liquor_sales.sales`
where category is not null
)
where rn=1
order by category_number;

-- dim_vendor Table
select
  vendor_number,
  vendor_name,
  etl_date
from (
select
  cast(replace(vendor_number,'.','') as int64) as vendor_number,
  vendor_name,
  current_datetime() as etl_date,
  row_number() over (partition by vendor_number order by vendor_number) as rn
from `bigquery-public-data.iowa_liquor_sales.sales`
where vendor_number is not null
)
where rn=1
order by vendor_number;

-- dim_item Table
select
  item_number,
  item_description,
  etl_date
from (
select
  item_number,
  item_description,
  current_datetime() as etl_date,
  row_number() over (partition by item_number order by item_number) as rn
from `bigquery-public-data.iowa_liquor_sales.sales`
)
where rn=1
order by item_number;

-- fact_sales Table
select
  invoice_number,
  order_date,
  store_number,
  county_number,
  category_number,
  vendor_number,
  item_number,
  pack,
  bottle_volume_ml,
  state_bottle_cost,
  state_bottle_retail,
  bottles_sold,
  sale_dollars,
  volume_sold_liters,
  volume_sold_gallons,
  etl_date
from (
select
  invoice_number,
  order_date,
  store_number,
  county_number,
  category_number,
  vendor_number,
  item_number,
  pack,
  bottle_volume_ml,
  state_bottle_cost,
  state_bottle_retail,
  bottles_sold,
  sale_dollars,
  volume_sold_liters,
  volume_sold_gallons,
  etl_date,
  row_number() over (partition by order_date order by order_date) as single_date
from (
select
  invoice_and_item_number as invoice_number,
  date as order_date,
  store_number,
  county_number,
  cast(replace(category,'.','') as int64) as category_number,
  cast(replace(vendor_number,'.','') as int64) as vendor_number,
  item_number,
  cast(pack as int64) as pack,
  cast(bottle_volume_ml as int64) as bottle_volume_ml,
  cast(state_bottle_cost as float64) as state_bottle_cost,
  cast(state_bottle_retail as float64) as state_bottle_retail,
  cast(bottles_sold as int64) as bottles_sold,
  cast(sale_dollars as float64) as sale_dollars,
  cast(volume_sold_liters as float64) as volume_sold_liters,
  cast(volume_sold_gallons as float64) as volume_sold_gallons,
  current_datetime() as etl_date,
  row_number() over (partition by invoice_and_item_number order by invoice_and_item_number) as single_item
from `bigquery-public-data.iowa_liquor_sales.sales`
)
where single_item=1
) 
where single_date=1
order by order_date;