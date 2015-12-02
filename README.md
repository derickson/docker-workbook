# Docker Workbook
Trying to create a simple way to share a simple demo

## TODO's
* Automate data load on docker environment start

## Instructions:

1. ```docker-compose build```
2. ```docker-compose up```
3. Verify ES is working by going to ```http://<docker-machine-ip>:9200/_cat/indices```
4. Verify Kibana is working by going to ```http://<docker-machine-ip>:5601/```
5. cd into the dataLoad directory and run the ./load.sh script.  You will need to modify this to work with your local laptops logstash binary location / version (TODO: docker-ize this)
6. Go to kibana and create an index pattern for ```accident*```
7. Inside Kibana load the exported dashboard json file in ```dashboards/export.json```
8. Explore the data in the saved Dashboard
9. navigate to the workbook ```http://<docker-machine-ip>:9200/_plugin/elastic-workbook/```