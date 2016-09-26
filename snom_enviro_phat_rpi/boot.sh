#!/bin/bash

sed -i "s/HOST, PORT =.*/HOST, PORT = '', ${PORT}/g" snom_xmlserver.py

sed -i "s,http://10.0.1.153:8888,http://${IP}:${PORT},g" snom_xmlserver.py

sudo python /home/snom/snom_xmlserver.py

