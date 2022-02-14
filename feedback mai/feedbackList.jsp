<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
 <link rel="stylesheet" href="styleFeed.css">
</head>
<body>

    <div class="topnav">
  <div class="topnav-left">
    <a id="left" class="active" href="#home">Home</a>
    <a id="left" href="listFeedController">List</a>
  </div>
</div><br>

	<h3>Review</h3>
	  <button style="float: center;"onclick="window.location.href ='addFeedback.jsp';">Review here </button>
	
	<div class="tableList">
			<table>	
			<thead>	
	  <tr>
	    <th>Review</th>
	      <th>Actions</th>
	  </tr>
	  </thead>
	    <c:forEach items="${feed}" var="f" varStatus="feed">
	  <tbody>
	  <tr>
	    <td><c:out value="${f.feedbackRating}"/><br>
	    <c:out value="${f.feedbackComment}"/></td>
	    <td><button class="btn-block" id="<c:out value="${f.feedbackId}"/>" onclick="confirmation(this.feedbackId)">Delete</button></td>
	  </tr>
	  </tbody>
	  </c:forEach>
	  </table>
	  </div>
<script>
		    function confirmation(feedbackId){
			console.log(feedbackId);
			var r = confirm("Are you sure want to delete?");
			if(r == true){
				location.href = 'deleteFeed?feedbackId=' + feedbackId;
				alert("successfully deleted");
			} else{
				return false;
			}
		}
		</script>
</body>
</html>