# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version - 2.5.3
* rails version 5.2.3

### Initial commands
```
rake db:create
rake db:migrate
rake db:seed
rails s
redis-server
foreman-start
```

### Description of the project as below:
After installing this project on your system, some requirements need to be there and as follows:
1-Make sure you have started the rails server.
2-Make sure Redis server is running, if it is not installed then please install it in your system.
3-Make sure you have started the forman server because resque and resque-scheduler are running in the background with the help of foreman.

### Understanding of the project as follows:
1-This project is built in such a way that you can add any prices that aws offers like AmazonS3, AmazonRedshift, AmazonCloudFront etc.
2-By default, a cronjob is running at every midnight, to fetch the latest prices from aws AmazonCloudFront offer code.
3-You can run this task manually by rake aws_data  this will fetch the AmazonCloudFront price or you can pass custom parameters to fetch the other offer code with a specific region rake aws_data['us-east-1','AmazonS3']
4-To get the list of saving prices you can call the following url
```http://localhost:3000//service/AmazonCloudFront/region/us-east-1```
###### 
`You will get the response with each date like {
        "updated_on": "2019-09-12",
        "price": [
            {
                "id": 1,
                "description": "$0.0120 per 10,000 Proxy HTTPS Requests (India)",
                "beginRange": "0",
                "endRange": "Inf",
                "unit": "Requests",
                "currency": "USD",
                "pricePerUnit": "0.0000012000",
                "effectiveDate": "2017-09-01T00:00:00.000Z"
            }}
`
5- If you want to get another offercode details of diffrent region you can simple call url as below
```https://pricing.us-east-1.amazonaws.com/offers/v1.0/aws/AmazonRedshift/current/index.json```