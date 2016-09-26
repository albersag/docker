#!/usr/bin/env python

import socket
import time

from envirophat import weather, leds , light

HOST, PORT = '', 8888

listen_socket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
listen_socket.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR, 1)
listen_socket.bind((HOST, PORT))
listen_socket.listen(1)
print 'Serving HTTP on port %s ...' % PORT

while True:
	temperature = weather.temperature()	
	pressure = weather.pressure()
	lightvalue = light.light()
    	client_connection, client_address = listen_socket.accept()
    	request = client_connection.recv(2048)
    	first_line = request.split('\r\n')
	path = first_line[0].split(' ')	
	path_clean = path[1].split('?')
	print request
	
	if path_clean[0] == "/pressure":

	        humidi = "Pressure: %.2f hPa" % pressure
                http_response = \
                "HTTP/1.1 200 OK\n"\
                "Content-Type: text/xml\n\n"\
                "<?xml version='1.0' encoding='UTF-8'?>"\
                "<SnomIPPhoneText track='no'>"\
                "\t<Title>Alicante</Title>"\
                "\t<LocationX>55</LocationX>"\
                "\t<LocationY>32</LocationY>"\
                "\t<Text>"\
                +humidi+\
                "<br/>"\
                "\t</Text>"\
                "\t<Image>"\
                "\t\t<LocationX>2</LocationX>"\
                "\t\t<LocationY>23</LocationY>"\
                "\t\t<Url>http://www.omkarsupra.com/images/icons/high-pressure.png</Url>"\
                "\t</Image>"\
                "\t<SoftKeyItem>"\
                "\t\t<Name>F1</Name>"\
                "\t\t<Label>Reload</Label>"\
                "\t\t<URL>http://10.0.1.153:8888/pressure</URL>"\
                "\t</SoftKeyItem>"\
                "\t<SoftKeyItem>"\
                "\t\t<Name>F2</Name>"\
                "\t\t<Label>Temperature</Label>"\
                "\t\t<URL>http://10.0.1.153:8888/temperature</URL>"\
                "\t</SoftKeyItem>"\
                "\t<SoftKeyItem>"\
                "\t\t<Name>F3</Name>"\
                "\t\t<Label>Light</Label>"\
                "\t\t<URL>http://10.0.1.153:8888/light</URL>"\
                "\t</SoftKeyItem>"\
                "</SnomIPPhoneText>"
                                                                                                                                                                                                                                                                                                                                                                                                                                                                
                                                                                                                                                                                                                                                                                                                                                                                                                                                                  
        elif path_clean[0] == "/temperature":
        	
                temp = "Temperature: %.2f C" % temperature   	
                http_response = \
                "HTTP/1.1 200 OK\n"\
                "Content-Type: text/xml\n\n"\
                "<?xml version='1.0' encoding='UTF-8'?>"\
                "<SnomIPPhoneText track='no'>"\
                "\t<Title>Alicante</Title>"\
                "\t<LocationX>55</LocationX>"\
                "\t<LocationY>32</LocationY>"\
                "\t<Text>"\
                +temp+\
                "<br/>"\
                "\t</Text>"\
                "\t<Image>"\
                "\t\t<LocationX>2</LocationX>"\
                "\t\t<LocationY>23</LocationY>"\
                "\t\t<Url>http://www.tommytape.com/wp-content/assets/icons/red-icon-temp.png</Url>"\
                "\t</Image>"\
                "\t<SoftKeyItem>"\
                "\t\t<Name>F1</Name>"\
                "\t\t<Label>Reload</Label>"\
                "\t\t<URL>http://10.0.1.153:8888/temperature</URL>"\
                "\t</SoftKeyItem>"\
                "\t<SoftKeyItem>"\
                "\t\t<Name>F2</Name>"\
                "\t\t<Label>Pressure</Label>"\
                "\t\t<URL>http://10.0.1.153:8888/pressure</URL>"\
                "\t</SoftKeyItem>"\
                "\t<SoftKeyItem>"\
                "\t\t<Name>F3</Name>"\
                "\t\t<Label>Light</Label>"\
                "\t\t<URL>http://10.0.1.153:8888/light</URL>"\
                "\t</SoftKeyItem>"\
                "</SnomIPPhoneText>"
                


        elif path_clean[0] == "/light":

                lightnum = "Light: %.2f " % lightvalue
                http_response = \
                "HTTP/1.1 200 OK\n"\
                "Content-Type: text/xml\n\n"\
                "<?xml version='1.0' encoding='UTF-8'?>"\
                "<SnomIPPhoneText track='no'>"\
                "\t<Title>Alicante</Title>"\
                "\t<LocationX>55</LocationX>"\
                "\t<LocationY>32</LocationY>"\
                "\t<Text>"\
                +lightnum+\
                "<br/>"\
                "\t</Text>"\
                "\t<Image>"\
                "\t\t<LocationX>2</LocationX>"\
                "\t\t<LocationY>23</LocationY>"\
                "\t\t<Url>https://ae01.alicdn.com/kf/HTB1Sv9UJFXXXXXPXVXXq6xXFXXXn/14W-Light-sensor-energy-saving-lamp-dusk-to-dawn-CFL-ESL.jpg_50x50.jpg</Url>"\
                "\t</Image>"\
                "\t<SoftKeyItem>"\
                "\t\t<Name>F1</Name>"\
                "\t\t<Label>Reload</Label>"\
                "\t\t<URL>http://10.0.1.153:8888/light</URL>"\
                "\t</SoftKeyItem>"\
                "\t<SoftKeyItem>"\
                "\t\t<Name>F2</Name>"\
                "\t\t<Label>Pressure</Label>"\
                "\t\t<URL>http://10.0.1.153:8888/pressure</URL>"\
                "\t</SoftKeyItem>"\
                "\t<SoftKeyItem>"\
                "\t\t<Name>F3</Name>"\
                "\t\t<Label>Temperature</Label>"\
                "\t\t<URL>http://10.0.1.153:8888/temperature</URL>"\
                "\t</SoftKeyItem>"\
                                                                


                "</SnomIPPhoneText>"                                                                                                                                                                	


	else :
        
                http_response = \
                "HTTP/1.1 200 OK\n"\
                "Content-Type: text/xml\n\n"\
                                                
            
        client_connection.sendall(http_response)
        client_connection.close()
