<%@ page language="java" contentType="application/json; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
{ 
"themeTripList" : [
<c:forEach varStatus="i" var="themeTrip" items="${themeTripList}">
				{
				"content_id" : "${themeTrip.contentId}",
				"title" : "${themeTrip.title}",
				"firstImage" : "${themeTrip.firstImage}",
				"firstImage2" : "${themeTrip.firstImage2}",
				"readCount" : "${themeTrip.readCount}",
				"overView" : "${themeTrip.overView}"
				}
				<c:if test="${i.index != themeTripList.size() - 1}">,</c:if>
</c:forEach>
]
}
