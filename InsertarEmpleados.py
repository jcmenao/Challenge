import psycopg2

conn = psycopg2.connect("host=localhost dbname=postgres user=postgres")

cur = conn.cursor()
with open('Empleados.csv', 'r') as f:
    next(f) # Saltar la primera fila.
    cur.copy_from(f, 'Empleados', sep=',')

conn.commit()