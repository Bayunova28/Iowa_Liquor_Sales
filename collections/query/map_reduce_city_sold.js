/* create function to map city and bottles sold  */
var mapCitySold = function() {
	emit(this.city, this.bottles_sold);
};

/* create function to reduce city and bottles sold */
var reduceCitySold = function(keyCity, valuesBottlesSold) {
	return Array.sum(valuesBottlesSold);
};

/* create MapReduce */
db.iowa_liquor_sales.mapReduce (
	mapCitySold,
	reduceCitySold,
	{ out: "map_reduce_city_sold" }
)

/* check result */
db.map_reduce_city_sold.find().pretty()