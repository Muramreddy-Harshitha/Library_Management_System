from db import get_connection

try:
    conn = get_connection()
    cursor = conn.cursor()

    cursor.execute("SHOW TABLES")

    tables = cursor.fetchall()

    print("Database connected successfully!")
    print("\nAvailable Tables:")

    for table in tables:
        print(table[0])

    cursor.close()
    conn.close()

except Exception as e:
    print("Error:", e)