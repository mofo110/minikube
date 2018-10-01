const MongoClient = require('mongodb').MongoClient
const mongoHost = process.env.MONGO_DB_HOST || 'localhost'
const mongoPort = process.env.MONGO_DB_PORT || '27017'

const mongoUri = `mongodb://${mongoHost}:${mongoPort}`

module.exports = {
    find: function (done) {
        console.log(`We are connecting to: ${mongoUri}`)
        MongoClient.connect(mongoUri, function (err, client) {
            if (!err) {
                const db = client.db('test')
                db.collection('customers').find({}).toArray(function (findErr, result) {
                    if (findErr) throw findErr;
                    console.log(result)
                    client.close()
                    done(result)
                })
            }
        })
    },

    findOne: function (id, done) {
        console.log(`We are connecting to: ${mongoUri}`)
        MongoClient.connect(mongoUri, function (err, client) {
            if (!err) {
                const db = client.db('test')
                console.log(`_id: ${id}`)
                db.collection('customers').findOne({ _id: id }, function (findErr, result) {
                    if (findErr) throw findErr;
                    console.log(result)
                    client.close()
                    done(result)
                })
            }
        })
    }
}
