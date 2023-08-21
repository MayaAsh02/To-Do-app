# To-Do-List

To-Do-List is mini-project made with Flask and MongoDB.
Docker images, eks, helm and a lot more is coming this summer:))
Stay tuned!

## Built using :
```sh
	Flask : Python Based mini-Webframework
	MongoDB : Database Server
	Pymongo : Database Connector ( For creating connectiong between MongoDB and Flask )
	HTML5 (jinja2) : For Form and Table
```

##Set up environment for using this repo:

Install Python (If you don't have it already):
```sh
	$ sudo apt-get install python
```

Install MongoDB (Make sure you install it properly):
```sh
	$ sudo apt install -y mongodb
```

Install Dependencies of the application (Flask, Pymongo, Jinja2):
```sh
$ pip install -r requirements.txt
```


#Run the Database:
Start MongoDB
```sh
$ sudo service mongod start
```

##Run the Flask file (app.py):
```sh
$ FLASK_ENV=development python3 app.py
```

Go to http://localhost:5000 with any of your browsers and DONE !!
