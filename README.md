# TweetsDashBoard
This is a tweets anaysis server for mobiles and pad to read the most best and worst tweets from tweets stream

## Synopsis
###### Motivation
In recent year, twitter has been a popular way to communicate and spread information. Real time tweets dashboard presented on mobile browser is an efficient and useful tool for others to know recent event. This dashboard would present the current tweets on the internet by a efficient way by providing the tweeted speed per second, per hour, per day and year. It also will cost the most positive and negative tweets and list the top 10 tweets for them. Customer could easily understanding the current most popular tweets and what's people opinion about them as a data-mining method.
###### Orignal
This is a project I made in Melbourne Unviersity. Thanks for my mentor: *Dr Aaron Harwood* and appreciate with my teammate: *Lumina*
###### Functional features
- The browser could present **real-time update** tweets speed.
- The browser could update **real-time top ten positive and negative tweets** and the hottest users
- The website could suit **any kind of browser** and could change all elements of the website automati-cally.
- The user could **choose the best layout** for the website to get the best performance.
- The user could see the **details of the each elements** present on the website.
###### Unfunctional features
- The dashboard would run at **different platform and different browsers**.
- The system could handle **many accesses** at same times.
- The system needs to **reduce the requests size** to reduce the data traffic.

## Implementation
###### Platfrom
The server would run in the Tomcat 7.0.2 and above.
JQuery technology would be used for build the web page to make it more suitable for mobile users
JustGage: Code by JavaScript which is used for generating the gage.
###### Lanugae
Java (J2EE)
JavaScript (JQuery,JQuery mobile, AJAX, JustGage.js)
###### API & Library
[JustGage](justGage.com)
[JQuery Moblie](https://jquerymobile.com/)
###### Code
###### Examples

## Installation
1. copy wrap/tweetsDashBoard.war into the tomcat/webapps
2. start tomcat
3. start the server (support stanard input)
```
   java tomcat_folder/webapps/TweetsDashBoard/WEB-INF/classes/Processing [-help|-version|-offline|-online|-file filefullpath]
```
in the unix system, using
```
   cat inputstream > java tomcat/webapps/TweetsDashBoard/WEB-INF/classes/Processing [-online|-offline]
```
then open the browserand  type:
```
	http://localhost:8080/TweetsDashBoard/ 
```
**tips**: The browser should open after the server started, if the server down, the tomcat need to restart to reset the webserver and You can also load the project by using your eclispe by using the loding project function.

## Tests
We use JMeter to a standard anaysis about the project. the average response time is only 22 milliseconds. It is really fast response time that showed on the graph, and the system could handle at least 1000 connection at the same time efficiently.
The Throughput is growing almost as linearity. After 1minute, the Throughput would keep at the lev-el of 22,032 per minute. It is a really great throughput.


## Contributors
- Dr Aaron Harwood 
- Lumina (Danping Lei)

## License
This is a project based on learning and studying. Not for any kind of commecial using. This is a project built within a research group in Melbourne University. Please **do not** copy and using it as both commercial and **academic** using directly.  
######Other API license
- [Apache License 2.0](http://www.apache.org/licenses/LICENSE-2.0.txt)
- [Java Binary Code License Agreement](http://www.oracle.com/technetwork/java/javase/terms/license/index.html)
- [ASP.NET AJAX Control Toolkit](http://ajaxcontroltoolkit.codeplex.com/license)
- [The JSON License](http://www.json.org/license.html)
- [Sun Java System Application Server Enterprise Edition 8.2](http://www.oracle.com/technetwork/java/javaee/as8-149814.txt)
- [jquery mobile license](https://jquery.org/license/)
- [JMeter License](http://jmeter.apache.org/)
- [JustGage|MIT License](http://opensource.org/licenses/mit-license.php)


