FROM mcr.microsoft.com/mssql/server:2022-latest

ENV ACCEPT_EULA=Y \
    MSSQL_SA_PASSWORD=D0cker2*2*

WORKDIR /init
COPY init-db.* ./

USER root
# Cambiar permisos del directorio de datos de SQL Server
RUN chown -R mssql /var/opt/mssql

# Instalar las herramientas de línea de comandos de SQL Server
RUN apt-get update && \
    apt-get install -y curl apt-transport-https gnupg && \
    curl https://packages.microsoft.com/keys/microsoft.asc | apt-key add - && \
    curl https://packages.microsoft.com/config/ubuntu/20.04/prod.list > /etc/apt/sources.list.d/mssql-release.list && \
    apt-get update && \
    apt-get remove -y libodbc2 libodbcinst2 unixodbc-common && \
    ACCEPT_EULA=Y apt-get install -y msodbcsql17 unixodbc-dev && \
    ACCEPT_EULA=Y apt-get install -y mssql-tools

# Añadir las herramientas de línea de comandos al PATH
ENV PATH="$PATH:/opt/mssql-tools/bin"

RUN chmod +x ./init-db.sh

# Cambiar a usuario mssql antes de iniciar SQL Server
USER mssql

# Ejecutar SQL Server y el script de inicialización
CMD /bin/bash -c "/opt/mssql/bin/sqlservr & /init/init-db.sh; wait"
