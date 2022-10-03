<%@ page language="java" contentType="application/json; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
{ 
"themeTripList" : [
<c:forEach varStatus="i" var="themeTrip" items="${themeTripList}">
				{
				"content_id" : "${themeTrip.idx}",
				"title" : "${themeTrip.title}",
				"firstImage" : "${themeTrip.img1}",
				"firstImage2" : "${themeTrip.img2}",
				"readCount" : "${themeTrip.readcount}"
				}
				<c:if test="${i.index != themeTripList.size() - 1}">,</c:if>
</c:forEach>
]
}
