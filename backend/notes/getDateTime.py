def giveMeDateTime(date_time):
    split_date = date_time.split("T")

    return (split_date[0] + " " + split_date[1].split(":")[0] + ":" + split_date[1].split(":")[1])