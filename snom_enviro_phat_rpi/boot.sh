#!/bin/bash

IP=$(ip r | awk '/default/{print $3}')

sed -i "s/HOST, PORT =.*/HOST, PORT = '${IP}\', ${PORT}/g" snom_xmlserver.py

sed -i "s,http://10.0.1.153:8888,http://${IP}:${PORT},g" snom_xmlserver.py

python /home/snom/snom_xmlserver.py 

/bin/bash

