from mod_python import apache
import urlparse
import sqlite3
import json
from datetime import datetime

def hidden_services():

    # Connect to the SQLite database (or create it if it doesn't exist)
    connection = sqlite3.connect('/workspaces/ctf-treasury/.devcontainer/cc.db')

    # Create a cursor object
    cursor = connection.cursor()

    # Write the SQL command to select all records from the Students table
    select_query = "SELECT * FROM HiddenServices;"

    # Execute the SQL command
    cursor.execute(select_query)

    # Fetch all records
    hidden_services = cursor.fetchall()

    connection.close()

    return hidden_services

def ddl():
    # Connect to the SQLite database (or create it if it doesn't exist)
    connection = sqlite3.connect('/workspaces/ctf-treasury/.devcontainer/cc.db')

    cursor = connection.cursor()

    # Write the SQL command to create the Students table
    create_table_query = '''
    CREATE TABLE IF NOT EXISTS HiddenServices (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        team TEXT NOT NULL,
        host TEXT NOT NULL,
        count INTEGER DEFAULT 0
    );
    '''

    # Execute the SQL command
    cursor.execute(create_table_query)

    # Commit the changes
    connection.commit()

def handler(req):

    ddl()

    args = urlparse.parse_qs(req.read())

    if "team" not in args and "hs" not in args:
        req.content_type = "application/json; charset=UTF-8"
        req.write(json.dumps({
            "_" : datetime.today().strftime('%Y-%m-%d %H:%M:%S'),
            "hidden_services": hidden_services()
        }))
        return apache.OK
    
    if "hs" in args and "count" in args:
        hs = args["hs"][0]
        count = args["count"][0]
        # Connect to the SQLite database (or create it if it doesn't exist)
        connection = sqlite3.connect('/workspaces/ctf-treasury/.devcontainer/cc.db')

        cursor = connection.cursor()
        insert_query = '''
        UPDATE HiddenServices SET count = ? WHERE host = ?;
        '''
        hs_data = (count, hs)

        cursor.execute(insert_query, hs_data)

        # Commit the changes automatically
        connection.commit()
        req.content_type = "application/json; charset=UTF-8"
        req.write(json.dumps({
            "_" : datetime.today().strftime('%Y-%m-%d %H:%M:%S')
        }))
        return apache.OK

    team = args["team"][0]
    if team is None:
        req.content_type = "text/plain"
        req.write('team invalido')
        return apache.BAD_REQUEST

    hs = args["hs"][0]
    if hs is None:
        req.content_type = "text/plain"
        req.write('hs invalido')
        return apache.BAD_REQUEST
    

    # Connect to the SQLite database (or create it if it doesn't exist)
    connection = sqlite3.connect('/workspaces/ctf-treasury/.devcontainer/cc.db')

    cursor = connection.cursor()

    insert_query = '''
    INSERT INTO HiddenServices (team, host) 
    VALUES (?, ?);
    '''
    hs_data = (team, hs)

    cursor.execute(insert_query, hs_data)

    # Commit the changes automatically
    connection.commit()

    req.content_type = "text/plain"
    req.write('TEAM {} registrato con successo!'.format(team))

    connection.close()

    return apache.OK
