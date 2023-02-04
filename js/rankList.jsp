<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.util.*" %>
<%@ page import="java.util.Map.*" %>
<%@ page import="user.UserDAO" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset="UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
<link rel="stylesheet" href="../../css/custom.css">
<meta name="viewport" content"width=device-width", initial-scale="1">

<script>
var xmlhttp= false;
if (window.XMLHttpRequest) {
	xmlhttp= new XMLHttpRequest();
	xmlhttp.overrideMimeType('text/xml');
	}
function check() {
	var num1 = document.getElementById("num1").value;
	var url=  encodeURI('id_result.jsp?num1='+ num1);
	xmlhttp.open('GET', url, true);
	xmlhttp.onreadystatechange= getResult;
	xmlhttp.send(null);
}

function getResult() {
	if(xmlhttp.readyState== 4 && xmlhttp.status== 200) {
	document.getElementById('result').innerHTML= xmlhttp.responseText
	}else{
	document.getElementById('result').innerHTML= "Error!"
	}
}


</script>



<title>메인 페이지</title>
</head>
<body>
	
      <nav class="navbar navbar-default">
      <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed"
               data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
               aria-expanded="false">
               <span class="icon-bar"></span>
               <span class="icon-bar"></span>
               <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="main.jsp">테트리스 랭킹</a>
      </div>
      <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
         <ul class="nav navbar-nav">
         <li><a href="main.jsp">메인</a></li>
             <li><a href="bbs.jsp">게시판</a></li>
              <li><a href="../index.jsp">테트리스 게임</a></li>
              <li class="active"><a href="rankList.jsp">랭킹 리스트</a></li>
         </ul>
	</div>
	
	
	<%
		String userID = null;
		if (session.getAttribute("userID") != null) 
		{
			userID = (String)session.getAttribute("userID");
		}%>
		<br><p>
	
	
	<table class="table table-striped" style="text-align:center; border:2px solid #dddddd">
                <thead>
                    <tr>
                        <th style="background-color:#eeeeee; text-align:center;">순위</th>
                        <th style="background-color:#eeeeee; text-align:center;">점수</th>
                    </tr>
                </thead>
                <tbody>
                <%
                int num = 1 ;
            	UserDAO userdao = new UserDAO();
            	Map<String, Integer> mapList = userdao.sortRank();
            	
            	// Map.Entry 리스트 작성
            	List<Entry<String, Integer>> list_entries = new ArrayList<Entry<String, Integer>>(mapList.entrySet());


            	// 비교함수 Comparator를 사용하여 내림 차순으로 정렬
            	Collections.sort(list_entries, new Comparator<Entry<String, Integer>>() {
            	// compare로 값을 비교
            	public int compare(Entry<String, Integer> obj1, Entry<String, Integer> obj2){
            	// 내림 차순으로 정렬
            	return obj2.getValue().compareTo(obj1.getValue());
            		}
            	});
                    
            	for(Entry<String, Integer> entry : list_entries){
                %>
                    <tr>
                        <td><%=num+"위. "+entry.getKey()%></td>
                        <td><%=entry.getValue()%></td>
                    </tr>
                <% 
                num++;
                } 
                %>
                </tbody>
            </table>


<form method="get" name="fr" action="id_result.jsp">
	아이디로 내 점수 확인: <input type="text" name="num1" id="num1"><p>
	
	<div id="result"></div><br>

	<input type="submit" type="button" value="확인"/> 
	
</form>


<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
</body>
</html>