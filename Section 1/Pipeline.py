import pandas as pd
import numpy as np
from datetime import datetime


def process():
    ## Read in data as a dataframe
    data = pd.read_csv('../dataset2.csv')

    ## Drop Nas to remove empty names
    ## Note: Names were found in the price column instead of the name column, 
    ## I assume that these are the rows that need to be removed
    data = data.dropna()

    ## Processing the names
    ## Assumption: First names come first, anything after that is considered part of the last name
    splitName = data["name"].apply(lambda x:x.split(" "))
    data["first_name"] = splitName.apply(lambda x: x[0])
    data["last_name"] = splitName.apply(lambda x: " ".join(x[1:]))

    ## Converting price to float type to remove prepended zeros
    data["price"] = data["price"].astype(np.float64)

    ## Adding additional above_100 column
    data["above_100"] = data["price"] > 100

    ## Write as a csv
    curr_timestamp = str(datetime.now().date())
    data[["first_name","last_name","price","above_100"]].to_csv(f"dataset_processed_{curr_timestamp}.csv", index = False)

process()