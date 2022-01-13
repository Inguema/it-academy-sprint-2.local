//CONSULTAS RESTAURANTE
//01
db.restaurant.find();

//02
db.restaurant.find({},{'restaurant_id':1,'name':1,'borough':1,'cuisine':1});

//03
db.restaurant.find({},{'_id':0,'restaurant_id':1,'name':1,'borough':1,'cuisine':1});

//04
db.restaurant.find({},{'_id':0, 'restaurant_id':1,'name':1,'borough':1,'address':{'zipcode':1}});

//05
db.restaurant.find({'borough':'Bronx'});

//06
db.restaurant.find({'borough':'Bronx'}).limit(5);

//07
db.restaurant.find({'borough':'Bronx'}).skip(5).limit(5);

//08
db.restaurant.find({'grades.score':{$gt:90}});

//09
db.restaurant.find({'grades.score':{$gt:80, $lt:100}});

//10
db.restaurant.find({'address.coord':{$lt:-95.754168}});

//11
db.restaurant.find({$and:[{'address.coord':{$lt:-65.754168},'grades.score':{$gt:70},'cuisine':{$ne:'American '}}]});

//12
db.restaurant.find({'address.coord':{$lt:-65.754168},'grades.score':{$gt:70},'cuisine':{$not: {$regex:'American '}}});

//13
db.restaurant.find({'cuisine':{$ne:'American '},'grades.grade':'A','borough':{$ne:'Brooklyn'}}).sort({'cuisine':-1});

//14
db.restaurant.find({'name':/^Wil/},{'restaurant_id':1,'name':1,'borough':1,'cuisine':1});

//15
db.restaurant.find({'name':/ces$/},{'restaurant_id':1,'name':1,'borough':1,'cuisine':1});

//16
db.restaurant.find({'name':/Reg/},{'restaurant_id':1,'name':1,'borough':1,'cuisine':1});

//17
db.restaurant.find({'borough':'Bronx',$or:[{'cuisine':'American'},{'cuisine':'Chinese'}]});

//18
db.restaurant.find({'borough':{$in:['Staten Island','Bronx','Queens','Brooklyn']}},{'restaurant_id':1,'name':1,'borough':1,'cuisine':1});

//19
db.restaurant.find({'borough':{$nin:['Staten Island','Bronx','Queens','Brooklyn']}},{'restaurant_id':1,'name':1,'borough':1,'cuisine':1});

//20
db.restaurant.find({'grades.score':{$lt:10}},{'restaurant_id':1,'name':1,'borough':1,'cuisine':1});

//21
db.restaurant.find({$or:[{'name':'/^Wil/'},{'cuisine':{$nin:['American ', 'Chinese']}}]},{'restaurant_id':1,'name':1,'borough':1,'cuisine':1});

//21BIS
db.restaurant.find({$or:[{'name':'/^Wil/'},{$and:[{'cuisine': {$ne:'American '}},{'cuisine': {$ne:'Chinese'}}]}]},{'restaurant_id':1,'name':1,'borough':1,'cuisine':1});

//22
db.restaurant.find({'grades.date':ISODate('2014-08-11T00:00:00Z'),'grades.grade':'A','grades.score':11},{'restaurant_id':1,'name':1,'grades':1});

//23
db.restaurant.find({'grades.1.date':ISODate('2014-08-11T00:00:00Z'),'grades.1.grade':'A','grades.1.score':9},{'restaurant_id':1,'name':1,'grades':1});

//24
db.restaurant.find({'address.coord.1':{$gt:42, $lt:52}},{'restaurant_id':1,'name':1,'address':1});

//25
db.restaurant.find().sort({'name':1});

//26
db.restaurant.find().sort({'name':-1});

//27
db.restaurant.find().sort({'cuisine':1},{'borough':-1});

//28
db.restaurant.find({'address.street':{$exists:true}},{'address':1,'street':1});

//29
db.restaurant.find({'address.coord':{$type:1}});

//30
db.restaurant.find({'grades.score':{$mod:[7,0]}},{'restaurant_id':1,'name':1,'grades':1,'score':1});

//31
db.restaurant.find({'name':/mon/},{'name':1,'borough':1,'address.coord':1,'cuisine':1});

//32
db.restaurant.find({'name':{$regex:/mon/i}},{'name':1,'borough':1,'address.coord':1,'cuisine':1})






