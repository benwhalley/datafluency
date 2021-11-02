import random
from faker import Faker
import pandas as pd
fake = Faker('en_GB')



fk= [fake.profile() for i in range(2000)]

pd.DataFrame(fk).to_csv('fakes.csv')

def nhs():
    ns= "".join([str(random.randint(0,9)) for i in range(10)])
    if random.uniform(0,1)>.5:
        ns = ns[:3]+" "+ns[4:8] + " " + ns[9:]
    return ns

pd.DataFrame([nhs() for i in range(2000)]).to_csv('fakenhs.csv')


from datetime import datetime, timedelta

pd.DataFrame([(datetime.today() + timedelta(days=random.uniform(-100,-1000))).ctime() for i in range(2000)]).to_clipboard()
