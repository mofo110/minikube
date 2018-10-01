
const express = require("express")
const app = express()

const customersDao = require('./customersDao')

console.log(`Active: Blue`)

app.get("/customers/:id?", (req, res) => {
  if (req.params.id) {
    const id = parseInt(req.params.id)
    customersDao.findOne(id, function (customer) {
      res.send(customer)
    })
  }
  else {
    customersDao.find(function (customers) {
      res.send(customers)
    })    
  }
})

const port = process.env.PORT || 8080

let server = app.listen(port, () => {
  console.log(`server listening on ${port}`)
})