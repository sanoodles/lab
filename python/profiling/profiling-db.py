import psycopg2

import credentials

def light_query():
    st = """
        SELECT *
        FROM table1, table2
    """
    cur.execute(st)
    for row in cur:
        pass

def heavy_query():
    st = """
        SELECT *
        FROM table1, table2
        ORDER BY table1.field1
    """
    cur.execute(st)
    for row in cur:
        pass

def mid_tier():
    light_query()
    heavy_query()

def top_tier():
    mid_tier()

conn = psycopg2.connect(
        database=credentials.DB_NAME, 
        user=credentials.DB_USER,
        host=credentials.DB_HOST,
        password=credentials.DB_PASS
)

cur = conn.cursor()

top_tier()

