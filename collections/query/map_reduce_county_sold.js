/* create function to map county and bottles sold  */
var mapCountySold = function() {
	emit(this.county, this.bottles_sold);
};

/* create function to reduce county and bottles sold */
var reduceCountySold = function(keyCity, valuesBottlesSold) {
	return Array.sum(valuesBottlesSold);
};

/* create MapReduce */
db.iowa_liquor_sales.mapReduce (
	mapCountySold,
	reduceCountySold,
	{ out: "map_reduce_county_sold" }
)

/* check result */
db.map_reduce_county_sold.find().pretty()