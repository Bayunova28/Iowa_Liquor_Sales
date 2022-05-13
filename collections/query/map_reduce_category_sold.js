/* create function to map category and bottles sold  */
var mapCategorySold = function() {
	emit(this.category_name, this.bottles_sold);
};

/* create function to reduce category and bottles sold */
var reduceCategorySold = function(keyCategoryName, valuesBottlesSold) {
	return Array.sum(valuesBottlesSold);
};

/* create MapReduce */
db.iowa_liquor_sales.mapReduce (
	mapCategorySold,
	reduceCategorySold,
	{ out: "map_reduce_category_sold" }
)

/* check result */
db.map_reduce_category_sold.find().pretty()
