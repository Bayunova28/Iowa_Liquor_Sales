/* create function to map city and pack  */
var mapCityPack = function() {
	emit(this.city, this.pack);
};

/* create function to reduce city and pack */
var reduceCityPack = function(keyCity, valuesPack) {
	return Array.sum(valuesPack);
};

/* create MapReduce */
db.iowa_liquor_sales.mapReduce (
	mapCityPack,
	reduceCityPack,
	{ out: "map_reduce_city_pack" }
)

/* check result */
db.map_reduce_city_pack.find().pretty()
