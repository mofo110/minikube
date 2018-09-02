const http = require('http')
const MongoClient = require('mongodb').MongoClient
const mongoHost = process.env.MONGO_DB_HOST ? process.env.MONGO_DB_HOST : 'localhost'
const mongoPort = process.env.MONGO_DB_PORT ? process.env.MONGO_DB_PORT : '27017'

console.log(`Active: Blue`)

const mongoUri = `mongodb://${mongoHost}:${mongoPort}`
console.log(`We are connecting to: ${mongoUri}`)

const handleRequest = function(request, response) {
  console.log('Received request for URL: ' + request.url)
  
  MongoClient.connect(mongoUri, function (err, client) {
    if(!err) {
      const db = client.db('test')
      const id = parseInt(request.url.replace('/customers/', ''))
      console.log(`id: ${id}`)
      db.collection('customers').findOne({_id:id}, function (findErr, result) {
        if (findErr) throw findErr;
        console.log(`Result: ${result}`)
        response.writeHead(200)
        const greeting = `Hello ${result.first_name} ${result.last_name}!`
        console.log(greeting)
        response.end(greeting)      
        client.close()
      })
    }
  })
}

var www = http.createServer(handleRequest)
www.listen(8080)