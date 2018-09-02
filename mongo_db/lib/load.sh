#!/bin/bash
mongoimport -d test -c customers --type csv --file data.csv --headerline 
