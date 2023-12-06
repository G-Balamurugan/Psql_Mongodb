db.createCollection("product_details");
db.getCollection("product_details");

db.getCollection("product_details").insertOne({
    "product_id":"P-ID-0", 
    "product_name":"tab", 
    "price":10000,
    "stock":200,
    "type":"electronics",
    "entry_created_by": "siva",
    "last_updated_by": "bala",
    "entry_created_date": ISODate("2023-10-25T00:00:00Z"),
    "last_updated_date": ISODate("2023-12-01T00:00:00Z")});
//db.getCollection("product_details").find({});

db.getCollection("product_details").insertMany([
{"product_id":"P-ID-1",
 "product_name":"apple",
 "type":"grocery",
 "stock":200,
 "price":10000,
 "entry_created_by": "siva",
 "last_updated_by": "bala",
 "entry_created_date": ISODate("2023-10-25T00:00:00Z"),
 "last_updated_date": ISODate("2023-12-01T00:00:00Z")},
{"product_id":"P-ID-2", 
 "product_name":"iphone",
 "price":19999,
 "stock":100,
 "type":"electronics",
 "specification":"6gb",
 "entry_created_by": "siva",
"last_updated_by": "bala",
"entry_created_date": ISODate("2023-10-25T00:00:00Z"),
"last_updated_date": ISODate("2023-12-01T00:00:00Z")},
{"product_id":"P-ID-3",
 "product_name":"orange" ,
 "price":10,
 "stock":200,
 "type":"grocery",
 "entry_created_by": "siva",
 "last_updated_by": "bala",
 "entry_created_date": ISODate("2023-10-25T00:00:00Z"),
 "last_updated_date": ISODate("2023-12-01T00:00:00Z")},
{"product_id":"P-ID-4" , 
 "product_name":"mackbook" , 
 "type":"electonics",
 "price":200000,
 "stock":300,
 "entry_created_by": "siva",
 "last_updated_by": "bala",
 "entry_created_date": ISODate("2023-10-25T00:00:00Z"),
 "last_updated_date": ISODate("2023-12-01T00:00:00Z")},
{"product_id":"P-ID-5" , 
 "product_name":"charger" , 
 "price":100,
 "stock":1000,
 "type":"electronics",
 "entry_created_by": "siva",
 "last_updated_by": "bala",
 "entry_created_date": ISODate("2023-10-25T00:00:00Z"),
 "last_updated_date": ISODate("2023-12-01T00:00:00Z")},
{"product_id":"P-ID-6",
 "product_name":"dress" , 
 "stock":200,
 "price":999,
 "type":"cloth",
 "color":"green",
 "entry_created_by": "siva",
 "last_updated_by": "bala",
 "entry_created_date": ISODate("2023-10-25T00:00:00Z"),
 "last_updated_date": ISODate("2023-12-01T00:00:00Z")}]
);
db.getCollection("product_details").find({});

db.getCollection("product_details").aggregate([{
    $group: 
    {
        _id : "$type",
        sum_price : { $sum : "$price" },
        avg_price : { $avg : "$price" }
    }
 }
])


db.products_details.find({ stock: { $gte: 250, $lte: 1000 } });

db.getCollection("product_details").aggregate([{
    $group: 
    {
        _id : "$type",
        count: { $sum : 1 }, 
        avg_price : { $avg : "$price" }
    }
 }
])

db.getCollection("product_details").aggregate([
    {
        $sort : { price : 1}
    },
    {
        $count : "Sort performed"
    },
    {
        $limit : 2
    }
])

db.getCollection("product_details").aggregate([
    {
        $sort : { last_update_date : -1}
    },
    {
        $count : "Sort performed by date"
    },
    {
        $limit : 3
    }
])

db.getCollection("product_details").aggregate([
    {
        $match: {
            stock : { $gt : 200 ,
                $lt : 500 }
        }
    }

])

db.getCollection("product_details").aggregate([{
    $group: {
        _id : "$type",
        max_price: {$max : "$price"}
    }
}])
