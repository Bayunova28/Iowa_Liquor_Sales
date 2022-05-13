/* create function to map city and pack  */
var cityPack = function() {
	emit(this.city, this.pack);
};

/* create function to reduce city and pack */
var reduceCityPark = function(keyCity, valuesPack) {
	return Array.sum(valuesPack);
};

/* create MapReduce */
db.iowa_liquor_sales.mapReduce (
	cityPack,
	reduceCityPark,
	{ out: "map_reduce_city_park" }
)

/* check result */
db.map_reduce_city_park.find().pretty()

	
	