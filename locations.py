import pandas as pd
import requests
import time


def search(search_text):
    response = requests.get(
        f"https://developers.onemap.sg/commonapi/search?searchVal={search_text}&returnGeom=Y&getAddrDetails=Y&pageNum=1").json()
    if response['found'] == 0:
        return ('-1', '-1')
    else:
        return (response['results'][0]['LATITUDE'],
                response['results'][0]['LONGITUDE'])


df = pd.read_csv("data/prices_all.csv")
address = df['address'].drop_duplicates().tolist()

output = []
for i in range(len(address)):
    lat, lon = search(address[i])
    output.append(f"{address[i]},{lat},{lon}")

    # save results every 60 lines
    if i % 60 == 0:
        print(f"Completed {i+1} items. Saving.")
        with open('data/locations.csv', 'a') as savefile:
            savefile.write("\n"+"\n".join(output))
        output = []

        # API allows maximum 250 calls per minute
        time.sleep(15)
print("Completed all items. Saving.")
with open('data/locations.csv', 'a') as savefile:
    savefile.write("\n"+"\n".join(output))
