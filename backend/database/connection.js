const mongodb = require('mongodb')

//initializing connection
const MongoClient = mongodb.MongoClient

//define the connection url connecting to
const connectionURL = 'mongodb://127.0.0.1:27017'
const database_name = 'AKIRADb'

//connecting to the server
MongoClient.connect(connectionURL, { useUnifiedTopology: true}, (error, client) => {
  if (error) {
    return console.log("Sorry..Unable to connect to database!")
  } else {

    const db = client.db(database_name)
    console.log('Connection done Successfully!')
  }
});
