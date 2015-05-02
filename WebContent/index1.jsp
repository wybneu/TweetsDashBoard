<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="ISO-8859-1"%>
<%@page import="org.json.JSONObject"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Tweets DashBoard</title>
<link rel="stylesheet"
    href="http://code.jquery.com/mobile/1.3.0/jquery.mobile-1.3.0.min.css" />
<link rel="stylesheet" href="js/mycss.css"/>
<script src="http://code.jquery.com/jquery-1.8.2.min.js"></script>
<script
    src="http://code.jquery.com/mobile/1.3.0/jquery.mobile-1.3.0.min.js"></script>
    <script src="js/raphael.2.1.0.min.js"></script>
    <script src="js/justgage.1.0.1.min.js"></script>
    <script src="js/myJustGage.js"></script>
    
    <style>
      
      #g1, #g2, #g3, #g4, #g5, #g6, #g7, #g8 {
        width:200px; height:160px;
        display: inline-block;
        margin: 1em;
      }
      
    </style>
    
    <script language="javascript" type="text/javascript">
      var g1max, g2max, g3max,g4max;
      var g1, g2, g3, g4;
      var g5max, g6max, g7max,g8max;
      var g5, g6, g7, g8;
      var limitmax=100;
      var limitsentiment=1;
      window.onload = function(){
        
        g1max=1000; 
        g2max=1000;
        g3max=1000;
        g4max=1000;
        g5min=-4; 
        g6min=-4;
        g7min=-4;
        g8min=-4;
        g5max=4; 
        g6max=4;
        g7max=4;
        g8max=4;
        
        g1 = new JustGage({
          id: "g1", 
          value: 0, 
          min: 0,
          max: g1max,
          title: "tweets per munite",
          valueFontColor: "#999999",
          label: ""
        });
        
        g2 = new JustGage({
          id: "g2", 
          value: 0, 
          min: 0,
          max: g2max,
          title: "tweets per hour",
          valueFontColor: "#999999",
          label: ""
        });
        
        g3 = new JustGage({
          id: "g3", 
          value: 0, 
          min: 0,
          max: g3max,
          title: "tweets per day",
          valueFontColor: "#999999",
          label: ""
        });
        
        g4 = new JustGage({
          id: "g4", 
          value: 0, 
          min: 0,
          max: g4max,
          title: "tweets per month",
          valueFontColor: "#999999",
          label: ""
        });
        
        g5 = new JustGage({
            id: "g5", 
            value: 0, 
            min: g5min,
            max: g5max,
            levelColors: percentColorsSentiment,
            valueFontColor: "#999999",
            title: "tweets minute score",
            label: ""
          });
          
          g6 = new JustGage({
            id: "g6", 
            value: 0, 
            min: g6min,
            max: g6max,
            levelColors: percentColorsSentiment,
            title: "tweets hour score",
            valueFontColor: "#999999",
            label: ""
          });
          
          g7 = new JustGage({
            id: "g7", 
            value: 0, 
            min: g7min,
            max: g7max,
            levelColors: percentColorsSentiment,
            title: "tweets day score",
            valueFontColor: "#999999",
            label: ""
          });
          
          g8 = new JustGage({
            id: "g8", 
            value: 0, 
            min: g8min,
            max: g8max,
            levelColors: percentColorsSentiment,
            title: "tweets month score",
            valueFontColor: "#999999",
            label: ""
          });
      };
   
      function setPic(){
          if(minute<0) minute=0;
          if(hour<0) hour=0;
          if(day<0) day=0;
          if(month<0) month=0;
          if(minute>(g1max/6*5)){
              g1max=g1max*2;
              g1.refreshMax(g1max);
          }
          if(minute<g1max/6&&g1max>limitmax){
              g1max=(g1max/2<limitmax)?limitmax:g1max/2;
              g1.refreshMax(g1max);
          }
          g1.refresh(minute);
          if(hour>(g2max/6*5)){
              g2max=g2max*2;
              g2.refreshMax(g2max);
          }
          if(hour<g2max/6&&g2max>limitmax){
              g2max=(g2max/2<limitmax)?limitmax:g2max/2;
              g2.refreshMax(g2max);
          }
          g2.refresh(hour); 
          if(day>(g3max/6*5)){
              g3max=g3max*2;
              g3.refreshMax(g3max);
          }
          if(day<g3max/6&&g3max>limitmax){
              g3max=(g3max/2<limitmax)?limitmax:g3max/2;
              g3.refreshMax(g3max);
          }
          g3.refresh(day);
          if(month>(g4max/6*5)){
              g4max=g4max*2;
              g4.refreshMax(g4max);
          }
          if(month<g4max/6&&g4max>limitmax){
              g4max=(g4max/2<limitmax)?limitmax:g4max/2;
              g4.refreshMax(g4max);
          }
          g4.refresh(month);
          if(Math.abs(minutescore)>(g5max/6*5)){
              g5max=g5max*2;
              g5min=-g5max;
              g5.refreshMax(g5max);
              g5.refreshMin(g5min);
          }
          if(Math.abs(minutescore)<(g5max/4)&&g5max>limitsentiment){
              g5max=(g5max/2<limitsentiment)?limitsentiment:g5max/2;
              g5min=-g5max;
              g5.refreshMax(g5max);
              g5.refreshMin(g5min);
          }
          g5.refresh(Math.round(minutescore*100)/100);
          if(Math.abs(hourscore)>(g6max/6*5)){
              g6max=g6max*2;
              g6min=-g6max;
              g6.refreshMax(g6max);
              g6.refreshMin(g6min);
          }
          if(Math.abs(hourscore)<(g6max/4)&&g6max>limitsentiment){
              g6max=(g6max/2<limitsentiment)?limitsentiment:g6max/2;
              g6min=-g6max;
              g6.refreshMax(g6max);
              g6.refreshMin(g6min);
          }
          g6.refresh(Math.round(hourscore*100)/100);
          if(Math.abs(dayscore)>(g7max/6*5)){
              g7max=g7max*2;
              g7min=-g7max;
              g7.refreshMax(g6max);
              g7.refreshMin(g6min);
          }
          if(Math.abs(dayscore)<(g7max/4)&&g7max>limitsentiment){
              g7max=(g7max/2<limitsentiment)?limitsentiment:g7max/2;
              g7min=-g7max;
              g7.refreshMax(g7max);
              g7.refreshMin(g7min);
          }
          g7.refresh(Math.round(dayscore*100)/100);
          if(Math.abs(monthscore)>(g8max/6*5)){
              g8max=g8max*2;
              g8min=-g8max;
              g8.refreshMax(g8max);
              g8.refreshMin(g8min);
          }
          if(Math.abs(monthscore)<(g8max/4)&&g8max>limitsentiment){
              g8max=(g8max/2<limitsentiment)?limitsentiment:g8max/2;
              g8min=-g8max;
              g8.refreshMax(g8max);
              g8.refreshMin(g8min);
          }
          g8.refresh(Math.round(monthscore*100)/100);
          
      }
      
    var interval = 1000;
    var day = 0;
    var hour = 0;
    var minute = 0;
    var month = 0;
    var strJSON = "";
    var obj = null;
    var url = "GetTweetsServlet?request=speed";
    var version = "";
    var message="";
    var messagedetail=new Array();
    var messagescore=new Array();
    var messagecount=new Array();
    var messagetime=new Array();
    var negmessage="";
    var negmessagedetail=new Array();
    var negmessagescore=new Array();
    var negmessagecount=new Array();
    var negmessagetime=new Array();
    var usermessage="";
    var userdetail=new Array();
    var usercount=new Array();
    var userid=new Array();
    var refresh=0;
    var strSpeed="";
    var monthscore;
    var dayscore;
    var minutescore;
    var hourscore;    
    var usercount1=0;
    var cc;
    var i;
    var div;
    
    function drawSpeed(divname){
        div = document.getElementById(divname);
        div.innerHTML = strSpeed;
    }
    function getJson() {
        $.ajax({
            url : "GetTweetsServlet?request=speed",
            type : "POST",
            dataType : "json",
            contentType : "application/json; charset=utf-8",
            data : "{}",
            success : function(json) {
                month = json.month;
                if (month<0){
                    month=0;
                }
                day = json.day;
                if (day<0){
                    day=0;
                }
                minute = json.minute;
                if (minute<0){
                    minute=0;
                }
                hour = json.hour;
                if (hour<0){
                    hour=0;
                }
                monthscore=json.monthSentiment;
                dayscore=json.daySentiment;
                minutescore=json.minuteSentiment;
                hourscore=json.hourSentiment;

            },
            error : function(x, e) {
                month = 0;
                day = 0;
                minute = 0;
                hour = 0;
                monthscore=0;
                dayscore=0;
                minutescore=0;
                hourscore=0;
            },
            complete : function(x) {
            }
        });
    }
    function getTweets() {
        $.ajax({
            url : "GetTweetsServlet?request=version",
            type : "POST",
            dataType : "json",
            contentType : "application/json; charset=utf-8",
            data : "{}",
            success : function(json) {
                version = json.version;
            },
            error : function(x, e) {
            },
            complete : function(x) {
            }
        });
    }
    function getTop10() {
        $.ajax({
            url : "GetTweetsServlet?request=posdetails",
            type : "POST",
            dataType : "json",
            contentType : "application/json; charset=utf-8",
            data : "",
            success : function(json) {
            	for(i=0;i<10;i++){
            	    messagedetail[i]=json.postweets[i].message;
            	    messagescore[i]=json.postweets[i].score;
            	    messagetime[i]=json.postweets[i].time;
            	    messagecount[i]=json.postweets[i].retweet_count;
            	}
            },
            error : function(x, e) {
            },
            complete : function(x) {
            }
        });
    }
    function getNegTop10() {
        $.ajax({
            url : "GetTweetsServlet?request=negdetails",
            type : "POST",
            dataType : "json",
            contentType : "application/json; charset=utf-8",
            data : "",
            success : function(json) {
            	for(i=0;i<10;i++){
            		negmessagedetail[i]=json.negtweets[i].message;
                    negmessagescore[i]=json.negtweets[i].score;
                    negmessagetime[i]=json.negtweets[i].time;
                    negmessagecount[i]=json.negtweets[i].retweet_count;
            	}
            },
            error : function(x, e) {
            },
            complete : function(x) {
            }
        });
    }
    function getUser(i) {
        $.ajax({
            url : "GetTweetsServlet?request=hotUserdetails&id="+i,
            type : "POST",
            dataType : "json",
            contentType : "application/json; charset=utf-8",
            data : "",
            success : function(json) {
                usermessage=json.user;
                userdetail[i]=usermessage;
                usermessage=json.id;
                userid[i]=usermessage;
                usercount1=json.count;
                usercount[i]=usercount1;
            },
            error : function(x, e) {
            },
            complete : function(x) {
            }
        });
    }
    
    function ShowCount(divname) {
        cc = document.getElementById(divname);
        if (divname == 'Minute') {
            cc.innerHTML = minute + " per " + divname;
        } else if (divname == 'Hour') {
            cc.innerHTML = hour + " per " + divname;
        } else if (divname == 'Day') {
            cc.innerHTML = day + " per " + divname;
        } else if (divname == 'Month') {
            cc.innerHTML = month + " per " + divname;
        }
    }
    function ShowTop10(divname,i) {      
        cc = document.getElementById(divname+i);     
        cc.innerHTML=messagedetail[i]; 
        cc= document.getElementById(divname+"count"+i);
        cc.innerHTML=messagecount[i];
        cc= document.getElementById(divname+"time"+i);
        cc.innerHTML=messagetime[i];
        cc= document.getElementById(divname+"score"+i);
        cc.innerHTML=messagescore[i];
    }
    function ShowVersion(divname){
    	cc=document.getElementById(divname);
    	cc.innerHTML=version;
    }
    function ShowNegTop10(divname,i){
        cc = document.getElementById(divname+i);
            cc.innerHTML=negmessagedetail[i];
        cc= document.getElementById(divname+"count"+i);
            cc.innerHTML=negmessagecount[i];
       cc= document.getElementById(divname+"time"+i);
            cc.innerHTML=negmessagetime[i];
       cc= document.getElementById(divname+"score"+i);
            cc.innerHTML=negmessagescore[i];
    }
    function showUser(divname,i) {
        cc = document.getElementById(divname);        
            cc.innerHTML=userdetail[i];
    }
    function showUserId(divname,i){
    	cc = document.getElementById(divname);        
        cc.innerHTML=userid[i];
    }
    function showUserCount(divname,i){
    	 cc = document.getElementById(divname);        
         cc.innerHTML=usercount[i];
    }

    window.setInterval(function() {
        display();
    }, interval);
</script>
<meta name="viewport"
    content="width=device-width,inital-scale=1, user-scalable=no">
</head>
<body>
<% boolean slider=true;
boolean graph=true;
boolean listlayout=true;
    if (request.getParameter("slider")!=null){
    if(request.getParameter("slider").equals("off"))
        slider=false;
        }
    if (request.getParameter("graph")!=null){
        if(request.getParameter("graph").equals("off"))
            graph=false;
            }
    if (request.getParameter("listlayout")!=null){
        if(request.getParameter("listlayout").equals("off"))
            listlayout=false;
            }
    if (!slider){ %>
 <script type="text/javascript">
 function display() {
     getJson();
     getTweets();
     getTop10();
     getNegTop10();
     for(i=0;i<10;i++){
         ShowTop10("news",i);
         ShowNegTop10("negnews",i);
         getUser(i);
         showUser("user"+i,i);
         showUserId("userid"+i,i);
         showUserCount("usercount"+i,i);
     }
     ShowVersion('version');
     setPic();
 }</script>
 <%}else{ %>
 <script type="text/javascript">
 function display() {
     getJson();
     getTweets();
     getTop10();
     getNegTop10();
     for(i=0;i<10;i++){
         ShowTop10("news",i);
         ShowNegTop10("negnews",i);
         getUser(i);
         showUser("user"+i,i);
         showUserId("userid"+i,i);
         showUserCount("usercount"+i,i);
     }
     ShowCount('Minute');
     ShowCount('Month');
     ShowCount('Day');
     ShowCount('Hour');
     ShowVersion('version');
     setPic();
 }</script>
 <%} %>
    <div data-role="page" data-theme="a">
        <div data-role="header" data-position="fixed">
            <h1>Tweets DashBoard</h1>
            <a href="#page2" data-icon="gear" data-rel="dialog"
            data-transition="pop">settings</a>
        </div>
        <div data-role="content">
        <%if(graph){ %>
            <section class="ui-grid-d" data-divider-theme="b">
            <div class="ui-block-a" align="center"  >
                 <div id="g4"></div>
                 <% if(slider){%>
                <div id="Month">loading...</div>
                <%}%>
            </div>
            <div class="ui-block-b" align="center">
                 <div id="g3"></div>
                 <% if(slider){%>
                <div id="Day">loading...</div>
                <%}%>
            </div>
            <div class="ui-block-c" align="center">
                 <div id="g2"></div>
                 <% if(slider){%>
                 <div id="Hour">loading...</div>
                 <%}%>
            </div>
            <div class="ui-block-d" align="center">
                 <div id="g1"></div>
                 <% if(slider){%>
                 <div id="Minute">loading...</div>
                 <%}%>
            </div>
            <div class="ui-block-a" align="center"  >
                 <div id="g8"></div>
                 <% if(slider){%>
                <div id="MonthScore">Month Sentiment</div>
                <%}%>
            </div>
            <div class="ui-block-b" align="center">
                 <div id="g7"></div>
                 <% if(slider){%>
                <div id="DaySocre">Day Sentiment</div>
                <%}%>
            </div>
            <div class="ui-block-c" align="center">
                 <div id="g6"></div>
                 <% if(slider){%>
                 <div id="HourSocre">Hour Sentiment</div>
                 <%}%>
            </div>
            <div class="ui-block-d" align="center">
                 <div id="g5"></div>
                 <% if(slider){%>
                 <div id="MinuteSocre">Minute Sentiment</div>
                 <%}%>
            </div>
            </section>
            <%}else{%>
            <section class="ui-grid-a" data-divider-theme="b">
            <div class="ui-block-a" align="center"  >
                 <div id="g4"></div>
                 <% if(slider){%>
                <div id="Month">loading...</div>
                <%}%>
            </div>
            <div class="ui-block-b" align="center"  >
                 <div id="g8"></div>
                 <% if(slider){%>
                <div id="MonthScore">Month Sentiment</div>
                <%}%>
            </div>
            <div class="ui-block-a" align="center">
                 <div id="g3"></div>
                 <% if(slider){%>
                <div id="Day">loading...</div>
                <%}%>
            </div>
            <div class="ui-block-b" align="center">
                 <div id="g7"></div>
                 <% if(slider){%>
                <div id="DaySocre">Day Sentiment</div>
                <%}%>
            </div>
            <div class="ui-block-a" align="center">
                 <div id="g2"></div>
                 <% if(slider){%>
                 <div id="Hour">loading...</div>
                 <%}%>
            </div>
            <div class="ui-block-b" align="center">
                 <div id="g6"></div>
                 <% if(slider){%>
                 <div id="HourSocre">Hour Sentiment</div>
                 <%}%>
            </div>
            <div class="ui-block-a" align="center">
                 <div id="g1"></div>
                 <% if(slider){%>
                 <div id="Minute">loading...</div>
                 <%}%>
            </div>
            
            
            
            <div class="ui-block-b" align="center">
                 <div id="g5"></div>
                 <% if(slider){%>
                 <div id="MinuteSocre">Minute Sentiment</div>
                 <%}%>
            </div>
            </section>
            
            <%}
                if(listlayout){%>
                <hr/>
            <section class="ui-grid-a" data-divider-theme="b">
            <div class="ui-block-a" align="center"  >
           <table data-role="table" id="table-column-toggle4" data-mode="columntoggle" class="ui-responsive table-stroke">
              <thead>
                <tr>
                  <th data-priority="1">Top Positive 10 Tweets</th>
                  <th data-priority="4"  class="ui-table-cell-hidden">Rank</th>
                  <th data-priority="3">Created time</th>
                  <th data-priority="2"><abbr title="Sentiment Rating">Score</abbr></th>
                  <th data-priority="5">Retweeted time</th>
                </tr>
              </thead>              
              <tbody>     
               <%
                    for (int i = 0; i < 10; i++) {
                %>       
                <tr>
                   
                  <td class="title"><a href="GetTweetsServlet?request=tweets&id=<%=i%>" style="max-width:85%">
                       <div id=news<%=i%> >loading</div></a></td>
                  <td  class="ui-table-cell-hidden"><%=i+1 %></td>
                  <td><div id=newstime<%=i%> >loading</div></td>
                  <td><div id=newsscore<%=i%> >loading</div></td>
                  <td><div id=newscount<%=i%> >loading</div></td>
                </tr>
                 <%
                    }
                %>
              </tbody>
            </table>
            </div>
            <div class="ui-block-b" align="center" >
            <table data-role="table" id="table-column-toggle" data-mode="columntoggle" class="ui-responsive table-stroke" >
              <thead>
                <tr>
                  <th data-priority="1">Top Negative 10 Tweets</th>
                  <th data-priority="4" class="ui-table-cell-hidden">Rank</th>
                  <th data-priority="3">Created time</th>
                  <th data-priority="2"><abbr title="Sentiment Rating">Score</abbr></th>
                  <th data-priority="5">Retweeted time</th>
                </tr>
              </thead>              
              <tbody>     
               <%
                    for (int i = 0; i < 10; i++) {
                %>       
                <tr>
                   
                  <td class="title"><a href="GetTweetsServlet?request=negtweets&id=<%=i%>" style="max-width:85%">
                        <div id=negnews<%=i%>>loading</div></a></td>
                  <td  class="ui-table-cell-hidden"><%=i+1 %></td>
                  <td><div id=negnewstime<%=i%> >loading</div></td>
                  <td><div id=negnewsscore<%=i%> >loading</div></td>
                  <td><div id=negnewscount<%=i%> >loading</div></td>
                </tr>
                 <%
                    }
                %>
              </tbody>
            </table>
            </div>
            </section>
            <%}else{%>
            <hr/>
            <div align="center"  >
           <table data-role="table" id="table-column-toggle3" data-mode="columntoggle" class="ui-responsive table-stroke">
              <thead>
                <tr>
                  
                  <th data-priority="1">Top Positive 10 Tweets</th>
                  <th data-priority="4" class="ui-table-cell-hidden">Rank</th>
                  <th data-priority="3">Created time</th>
                  <th data-priority="2"><abbr title="Sentiment Rating">Score</abbr></th>
                  <th data-priority="5">Retweeted time</th>
                </tr>
              </thead>              
              <tbody>     
               <%
                    for (int i = 0; i < 10; i++) {
                %>       
                <tr>
                  
                  <td class="title"><a href="GetTweetsServlet?request=tweets&id=<%=i%>" style="max-width:85%">
                       <div id=news<%=i%> >loading</div></a></td>
                  <td  class="ui-table-cell-hidden"><%=i+1 %></td>
                  <td><div id=newstime<%=i%> >loading</div></td>
                  <td><div id=newsscore<%=i%> >loading</div></td>
                  <td><div id=newscount<%=i%> >loading</div></td>
                </tr>
                 <%
                    }
                %>
              </tbody>
            </table>
            </div>
            <hr/>
            <div align="center" >
            <table data-role="table" id="table-column-toggle1" data-mode="columntoggle" class="ui-responsive table-stroke" >
              <thead>
                <tr>
                  
                  <th data-priority="1">Top Negative 10 Tweets</th>
                   <th data-priority="4" class="ui-table-cell-hidden">Rank</th>
                  <th data-priority="3">Created time</th>
                  <th data-priority="2"><abbr title="Sentiment Rating">Score</abbr></th>
                  <th data-priority="5">Retweeted time</th>
                </tr>
              </thead>              
              <tbody>     
               <%
                    for (int i = 0; i < 10; i++) {
                %>       
                <tr>
                  
                  <td class="title"><a href="GetTweetsServlet?request=negtweets&id=<%=i%>" style="max-width:85%">
                        <div id=negnews<%=i%>>loading</div></a></td>
                   <td  class="ui-table-cell-hidden"><%=i+1 %></td>
                  <td><div id=negnewstime<%=i%> >loading</div></td>
                  <td><div id=negnewsscore<%=i%> >loading</div></td>
                  <td><div id=negnewscount<%=i%> >loading</div></td>
                </tr>
                 <%
                    }
                %>
              </tbody>
            </table>
            </div>
            <%}%>
            <hr/>
            <table data-role="table" id="table-column-toggle2" data-mode="columntoggle" class="ui-responsive table-stroke" >
              <thead>
                <tr>
                   <th data-priority="3">Rank</th>
                  <th data-priority="1">Hostest Users</th>
                  
                  <th data-priority="4"><abbr title="User ID">ID</abbr></th>
                  <th data-priority="2">follower number</th>
                </tr>
              </thead>              
              <tbody>     
               <%
                    for (int i = 0; i < 10; i++) {
                %>       
                <tr>
                    <th><%=i+1 %></th>
                    <td class="title"><a href="GetTweetsServlet?request=user&id=<%=i%>">
                    <div id=user<%=i%>>loading</div></a></td>
                  
                  <td> <div id=userid<%=i%>>loading</div></td>
                  <td><div id=usercount<%=i%>>loading</div></td>
                </tr>
                 <%
                    }
                %>
              </tbody>
            </table>
            
            
           <hr/>
        <center>Current Data Version : <span id=version>Loading..</span></center>
        </div>
        
        <div data-role="footer" data-position="fixed">
            <h1>
                <a href="index.jsp"  data-ajax="false">Click here to DashBoard For Phone</a>
            </h1>
        </div>
    </div>
    <div data-role="page" id="page2" data-theme="a" data-add-back-btn="true">
    <div data-role="header">
    <h1>Settings</h1>
    </div>
    <div data-role="content">
        <div class="content-primary">
            <form action="index1.jsp" method="get" data-ajax="false">
                <ul data-role="listview">
                    <li data-role="fieldcontain">
                        <fieldset data-role="controlgroup" data-type="horizontal">
                            <legend>Graph Layout:</legend>
                            <input type="radio" name="graph" id="radio-choice-c" value="on" checked="checked" />
                            <label for="radio-choice-c">Grid 4*2</label>
                            <input type="radio" name="graph" id="radio-choice-d" value="off" />
                            <label for="radio-choice-d">List 2*4 </label>
                        </fieldset>
                    </li>
                    <li data-role="fieldcontain">
                        <fieldset data-role="controlgroup" data-type="horizontal">
                            <legend>List Layout:</legend>
                            <input type="radio" name="listlayout" id="radio-choice-e" value="on" checked="checked" />
                            <label for="radio-choice-e">vertical</label>
                            <input type="radio" name="listlayout" id="radio-choice-f" value="off" />
                            <label for="radio-choice-f">Horizontal</label>
                        </fieldset>
                    </li>
                    <li data-role="fieldcontain">
                        <label for="slider2">Graph Words:</label>
                            <select name="slider" id="slider2" data-role="slider">
                                <option value="off">Off</option>  
                                <option value="on" selected="selected">On</option>                                 
                        </select>
                    </li>
                    <li data-role="fieldcontain">
                        <fieldset class="ui-grid-a">
                            <div class="ui-block-a"><button type="reset" data-theme="a">Reset</button></div>
                            <div class="ui-block-b"><button type="submit" data-theme="a">Submit</button></div>
                        </fieldset>
                    </li>
                </ul>
            </form>
        </div>
    </div></div>

</body>
</html>