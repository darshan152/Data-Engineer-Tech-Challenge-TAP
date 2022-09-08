## Explanation of pipeline setup.

We will be using cron to set up the scheduling of the python script to process data.

The script will run at 1am everyday.

The python script will transform the data according to the requirements below:

* Split the name field into first_name, and last_name
    * First name will be the first word in the string
    * Last name will be the remaining words in the string
* Remove any zeros prepended to the price field
* Delete any rows which do not have a name
* Create a new field named above_100, which is true if the price is strictly greater than 100

The script will then generate the processed dataset with the date appended.

The crontab file specifies the configuration for the cron job. 
Please change the directory of the Python installation to suit your installation and change the directory of the python script appropriately as well.