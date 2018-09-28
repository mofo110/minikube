#!/bin/bash
mongoimport --db test --collection customers --file customers.json --type json --jsonArray
