#!/bin/bash

# Esperar a que SQL Server esté listo
echo "Esperando a que SQL Server esté listo para aceptar conexiones..."
until /opt/mssql-tools/bin/sqlcmd -S localhost -U SA -P 'D0cker2*2*' -Q "SELECT 1" &> /dev/null
do
  echo "Esperando a que SQL Server esté listo..."
  sleep 5
done

echo "SQL Server está listo. Ejecutando script de inicialización..."

# Ejecutar script de inicialización
/opt/mssql-tools/bin/sqlcmd -S localhost -U SA -P 'D0cker2*2*' -i init-db.sql
