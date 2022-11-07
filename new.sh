#Create db name
use validationDB

#Create colletion 

db.createCollection("api_token", {
   validator: {
      $jsonSchema: {
         bsonType: "object",
         title: "api_token Object Validation",
         required: [ "team_id", "user_id", "remaining_balance" , "last_request_usage" , "initial_balance" , "purchase_date" , "expiry_date" , "rate_limit" , "status" ],
         properties: {
            team_id: {
               bsonType: "string",
               description: ""
            },
            user_id: {
               bsonType: [ "string" ],
               description: "" 
            },
            remaining_balance: {
               bsonType: [ "double" ],
               description: ""
            },
            last_request_usage: {
               bsonType: [ "double" ],
               description: ""
            },
            initial_balance: {
               bsonType: [ "double" ],
               description: ""
            },
            purchase_date: {
               bsonType: [ "date" ],
               description: ""
            },
            expiry_date: {
               bsonType: [ "date" ],
               description: ""
            },
            rate_limit: {
               bsonType: [ "string" ],
               description: "request / sec or concurrent request limit"
            },
            status: {
               bsonType: [ "string" ],
               description: "acitive/inactive/revoked"
            },
         }
      }
   }
} )



#insert data

db.api_token.insertOne( {
   team_id: "1",
   user_id: "111",
   remaining_balance: 20.100,
   last_request_usage: 200.1,
   initial_balance: 200.1,
   purchase_date: new Date("2021-10-28"),
   expiry_date: new Date("2021-10-28"),
   rate_limit: "concurrent request limit",
   status: "active",
} )

#find data

db.api_token.find().pretty()