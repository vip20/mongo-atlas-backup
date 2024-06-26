FROM ubuntu

RUN apt-get update

RUN apt-get install -y wget

RUN apt-get install dpkg

# RUN wget -O mongo-tools.deb https://fastdl.mongodb.org/tools/db/mongodb-database-tools-ubuntu1604-x86_64-100.6.1.deb

RUN wget -O mongo-tools.deb https://fastdl.mongodb.org/tools/db/mongodb-database-tools-debian12-x86_64-100.9.5.deb

# Install dependencies for MongoDB Database Tools
RUN apt-get install -y \
    libk5crypto3 \
    libkrb5support0 \
    libkeyutils1 \
    libgssapi-krb5-2 \
    libkrb5-3

RUN dpkg -i ./mongo-tools.deb

ADD main.sh /main.sh

RUN chmod +x /main.sh

ENTRYPOINT [ "/main.sh" ]
