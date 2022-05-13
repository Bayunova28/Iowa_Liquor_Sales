/* create function to map category and pack  */
var mapCategoryPack = function() {
	emit(this.category, this.pack);
};

/* create function to reduce category and pack */
var reduceCategoryPack = function(keyCategoryName, valuesPack) {
	return Array.sum(valuesPack);
};

/* create MapReduce */
db.iowa_liquor_sales.mapReduce (
	mapCategoryPack,
	reduceCategoryPack,
	{ out: "map_reduce_category_pack" }
)

/* check result */
db.map_reduce_category_pack.find().pretty()
