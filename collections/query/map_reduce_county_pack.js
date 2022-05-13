/* create function to map county and pack  */
var mapCountyPack = function() {
	emit(this.county, this.pack);
};

/* create function to reduce county and pack */
var reduceCountyPack = function(keyCounty, valuesPack) {
	return Array.sum(valuesPack);
};

/* create MapReduce */
db.iowa_liquor_sales.mapReduce (
	mapCountyPack,
	reduceCountyPack,
	{ out: "map_reduce_county_pack" }
)

/* check result */
db.map_reduce_county_pack.find().pretty()