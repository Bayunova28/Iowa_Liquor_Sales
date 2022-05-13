# Iowa Liquor Sales
* Instructor :  <b>Iwan Prasetiawan S.KOM., M.M..</b>
* Place : <b>Multimedia Nusantara University</b>
* Course : <b>Big Data Analytics I</b>

## Table of Contents
* [Background](#background)
* [Requirement](#requirement)
* [Schema](#schema)
* [Inspiration](#inspiration)

## Background
<img src="https://github.com/Bayunova28/Iowa_Liquor_Sales/blob/master/iowa_liquor_cover.png" height="300" width="1000">
<p align="justify">Since the repeal of prohibition in 1933, Iowa is one of 18 states that directly controls the sale and distribution of alcoholic beverages. 
The Alcoholic Beverages Division (ABD) governs state and federal laws and regulations related to the sale and use of alcohol and tobacco products. On March 8, 1934, 
Iowa was established as a "control state," assuming direct control over the wholesaling of all alcoholic liquor and wine. Currently, ABD wholesales alcoholic liquor 
only. ABD also regulates and licenses establishments that sell alcoholic beverages in Iowa. The Agency, in partnership with the Iowa Alcoholic Beverages Commission, 
acts as a policy-making body. The Commission is comprised of members appointed to five-year terms by the Governor, subject to confirmation by the Iowa Senate. Besides
that, Iowa have a mission to serve Iowans through responsible and efficient licensing, regulation, and distribution of alcohol and provides clarity, consistency along 
with equity to all stakeholders within the beverage industry.<p>

## Requirement
### Google BigQuery Access
* Open chrome and login your google account for access [Google BigQuery](https://accounts.google.com/ServiceLogin/signinchooser?service=cloudconsole&passive=1209600&osid=1&continue=https%3A%2F%2Fconsole.cloud.google.com%2Fbigquery%3Fproject%3Dcharming-script-322807%26authuser%3D3&followup=https%3A%2F%2Fconsole.cloud.google.com%2Fbigquery%3Fproject%3Dcharming-script-322807%26authuser%3D3&flowName=GlifWebSignIn&flowEntry=ServiceLogin)
* Create your project name e.g. IS655-A
* Explore dataset and search `iowa liquor sales` and choose sales
* Build query for show several features such as  date, store_name, city, county, category_name, pack, bottle_volume_ml, state_bottle_cost, state_bottle_retail, 
bottles_sold, sale_dollars, volume_sold_liters and volume_sold_gallons limit on 1000 rows
  ```sql
  SELECT date, 
         store_name, 
         city, county, 
         category_name, 
         pack, bottle_volume_ml, 
         state_bottle_cost, 
         state_bottle_retail, 
         bottles_sold, 
         sale_dollars, 
         volume_sold_liters,
         volume_sold_gallons 
  FROM bigquery-public-data.iowa_liquor_sales.sales LIMIT 1000
  ```
* Save the result to CSV (local file)

### Installation MongoDB Community Edition
* Download the binaries from [MongoDB Download Center](https://www.mongodb.com/try/download/community?tck=docs_server) and choose `.msi` package
* Run the MongoDB installer
* Follow the MongoDB Community Edition installation wizard
* Install MongoDB Compass
* When ready, click Install
  
### Start MongoDB Community Edition as a Windows Service
* Open command prompt
* Create database directory `cd C:\md "\data\db"`
* Install package your MongoDB database `"C:\Program Files\MongoDB\Server\5.0\bin\mongod.exe" --dbpath="c:\data\db"`
* Open directory of MongoDB service `cd C:\Program Files\MongoDB\Server\5.0\bin`
* Start MongoDB service `C:\Program Files\MongoDB\Server\5.0\bin>mongo`
* Show your database `>show dbs`
* Create your database `>use iowa_liquor_sales`
* Open MongoDB Compass and connect your localhost
* Finally, import `.csv` file from your local computer  

## Schema
* <b>Date</b> : date of order 
* <b>Store name</b> : name of store who ordered the liquor, 
* <b>City</b> : city where the store who ordered the liquor is located 
* <b>County</b> : county where the store who ordered the liquor is located 
* <b>Category name</b> : category of the liquor ordered 
* <b>Pack</b> : the number of bottles in a case for the liquor ordered 
* <b>Bottle Volume (ml)</b> : volume of each liquor bottle ordered in milliliters 
* <b>State bottle cost</b> : the amount that Alcoholic Beverages Division paid for each bottle of liquor ordered 
* <b>State bottle retail</b> : the amount the store paid for each bottle of liquor ordered 
* <b>Bottles sold</b> : the number of bottles of liquor ordered by the store 
* <b>Sale dollars</b> : total cost of liquor order (number of bottles multiplied by the state bottle retail) 
* <b>Volume sold liters</b> : total volume of liquor ordered in liters. (i.e. (Bottle Volume (ml) x Bottles Sold)/1,000)
* <b>Volume sold gallons</b> : total volume of liquor ordered in gallons. (i.e. (Bottle Volume (ml) x Bottles Sold)/3785.411784) 

## Inspiration
* How much the selling price of liquor at Des Moines?
* How much the selling price category of coffee liqueurs?  
* How much the selling price of liquor at Nevada and Washington?
* How much the selling price of liquor at Oakland and Washington?
* How much the selling price category of Triple Sec?
* How much the selling price of liquor at Washington? 
