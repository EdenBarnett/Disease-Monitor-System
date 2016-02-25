A quick list of files\folders submitted for this project – 
1.	TwitterStream folder 
2.	TwitterCountStream folder 
3.	ChartSample folder 
4.	ProcessEngine.py 
5.	Data.7z 
6.	Disease-Monitor-System.doc 
7.	Sample run of application folder.
You can refer to the sections 4 and 5 of ‘DiseaseMonitorSystem.doc’ for the guidelines on installation and project setup. For convenience, those sections are copied here too.
4. Software Installation requirements and guidelines 

The Operating System

This project was created and run on Windows 8.1. In order to replicate it on other OS will require further PoC, which is out of scope of this project.

The Software

1.	Microsoft Visual Studio 2012 Express for Windows Desktop and Web. Windows Desktop version is required for using StreamInsight. The Web version is needed for the visualization.
a.	http://www.microsoft.com/en-us/download/details.aspx?id=34673
b.	https://www.microsoft.com/en-us/download/details.aspx?id=30669
2.	Microsoft SQL Server Stream Insight 2.0. When running the .msi, on step 2 select ‘install instance’ and on step 3 name the instance as ‘localhost’.
a.	http://www.microsoft.com/en-us/download/details.aspx?id=29070
3.	SQL Server CE 3.5 SP2 (Cumulative Update 4)
a.	https://support.microsoft.com/en-us/kb/2516828
4.	Install Tweetinvi
a.	https://tweetinvi.codeplex.com/
5.	Install MongoDB Driver for C# (Use Nuget in Visual Studio)
 

6.	Install MongoDB 3.0
a.	https://www.mongodb.org/downloads#production
7.	Install Python 3.4.2 for Windows 
a.	 https://www.python.org/downloads/release/python-342/
8.	Install PyMongo, the Python driver for MongoDB
a.	https://pypi.python.org/pypi/pymongo/

5. Steps to Run\ Replicate the Application

This is done is three parts – 
•	The part A is the App registration on Twitter API to get Twitter API keys, 
•	The part B is the setup of StreamInsight project to collect the live tweets from Twitter and save it to MongoDB,
•	The part C is the visualization using Text Mining, Geographic Mining, and Temporal analysis of Twitter data.

 PART A – App registration on Twitter API to get Twitter API keys
In order to access Twitter API to get live tweets, we need 4 elements – API Key (Consumer Key), API Secret (Consumer Secret), Access Token, and Access Token Secret. Below are the steps to obtain the same –
1.	Create a twitter account if you do not already have one.
2.	Go to https://apps.twitter.com/ and log in with your twitter credentials.
3.	Click "Create New App"
4.	Fill out the form, agree to the terms, and click "Create your Twitter application"
5.	In the next page, click on "API keys" tab, and copy your "API key" and "API secret".
6.	Scroll down and click "Create my access token", and copy your "Access token" and "Access token secret".

Part B - StreamInsight project to collect the live tweets from Twitter and save it to   MongoDB

1.	Start the MongoDB Server. 
a.	Start windows command prompt (Go to Run, type cmd, and enter)
b.	In command prompt change to MondoDB bin directory (cd C:\Program Files\MongoDB\Server\3.0\bin)
c.	Type mongod and enter
d.	Leave this MongoDB server running at all times.
2.	Open MongoDB in command prompt and create database DiseaseMonitor
a.	Start windows command prompt (Go to Run, type cmd, and enter)
b.	In command prompt change to MondoDB bin directory (cd C:\Program Files\MongoDB\Server\3.0\bin)
c.	Type ‘mongo’ and press enter
d.	Type ‘use DiseaseMonitor’ and press enter (This will create and switch to a database called DiseaseMonitor in MongoDB).
3.	Download and Extract the file ‘TwitterStream.zip’ from the archive folder. After extracting, launch TwitterStream.sln in Visual Studio 2012 Window Desktop version. 
4.	In the Visual Studio, open the file InputStreams.cs. Go to the method ProductEvent() and provide the Twitter API credentials (that was created in Part A) in Auth.SetUserCredentials(string consumerKey, string consumerSecret, string userAccessToken, string userAccessSecret). Save the changes. For convenience, one set of credentials are provided in the file, but the app will be deleted after the completion of the project.
5.	From Visual Studio, run the application by clicking on green start arrow on the toolbar. This will start the StreamInsight and you should be able to see the stream of user id of the incoming tweets being displayed. Leave this application running at all times so the incoming tweets will be stored in the database.
 

6.	In order to confirm that documents are stored in ‘Tweets’ collection, run this command in mongo shell – 
db.tweets.find().pretty()
  
This screen shows an example of a document in tweets collection. A document would hold the User ID, Followers Count, Location, Text (holds the tweet), User Name, Location, etc.
NOTE:  An additional column “HashTag” was introduced to hold the category of the tweet example “cancer”, “flu” etc. This is done in order to query the database based on these categories. 
7.	Import additional data into ‘tweets’ collection into MongoDB – we have been collecting live data for days now. This step is needed only to see full visualization potential, else the visualization will have very few data to display the streaming live data. Download and extract tweets.json file prior to running this command from bin folder. Provide the path to the tweets.json file.
mongoimport --db DiseaseMonitor --collection tweets --type json --file c:\..\tweets.json


Part C - Visualization using Text Mining, Geographic Mining, and Temporal analysis of Twitter data
1.	Create an index on ‘Text’ in the collection ‘Tweets’ in ‘DiseaseMonitor’ database
a.	Open Mongo shell.
b.	Type ‘use DiseaseMonitor’ and press enter.
c.	Run the command  db.tweets.createIndex({Text:'text'})
2.	Download ‘ProcessEngine.py’ and DMChart.zip from the archive folder. Extract DMChart.zip.
3.	Run ProcessEngine.py file - a one-time task  to fetch counts of individual FluSymptoms and CancerTypes. It also talks to google API to fetch locations of users that tweeted for Flu and Cancer and stores in FluLocationCount and CancerLocationCount collections.  
a.	Open command prompt and change directory to where Python program bin folder is. For example ‘CD C:\Python34’. 
b.	Make sure you have MongoDB open in a separate command prompt window and you have it set on the same database used previously by typing ‘use DiseaseMonitor’.
c.	Type ‘python.exe C:\Python34\Priyanka\ProcessEngine.py’ use the path to your local copy of ProcessEngine.py.
d.	This should create additional collections in ‘DiseaseMonitor’ database namely ‘cancerCount’, ‘FluSymptoms’, ‘FluLocationCount’, and ‘CancerLocationCount’. You can check this by running ‘show collections’ in MongoDB.
e.	This will print and store the sum of cancer type count, and flu symptom counts. It will also fetch the location of users who have tweeted on Flu and cancer for the data that is already in the collection ‘tweets’. All these are stored back to the above collections respectively, and will be used to create visualizations.
4.	Open TweetCountStream folder after extracting and run the solution file using TweetCountStream.sln in Visual Studio 2012 Window Desktop version. Start the application and leave it running as a background process. Wait for 10 mins for the first time before running the visualization for better graphic displays.
 
5.	Open DMChart.sln from DMChart folder using Visual Studio Express for Web. Right click on ‘FLU-HomePage.aspx’ and set it as the start page. Start the project by clicking on the green arrow on the toolbar. This will open the visualization in a web browser. 
6.	Visualization Results – These are the three visualizations that open up in a web browser on the ‘Flu-HomePage.aspx’. There is, however, a navigation button on the page which take to the Cancer visualization page (refer to section 7 for more information on this). You can click on the button ‘Go to Cancer page’ for the visualizations on cancer.

