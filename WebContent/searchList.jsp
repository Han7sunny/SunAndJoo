<%@ page language="java" contentType="application/json; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
{ 
"areaTripList" : [
<c:forEach varStatus="i" var="areaTripData" items="${areaTripList}">
				{
				"title" : "${areaTripData.title}",
				"content_type_id" : "${areaTripData.contentTypeId}",
				"addr" : "${areaTripData.addr}",
				"tel" : "${areaTripData.tel}",
				"mapX" : "${areaTripData.mapX}",
				"mapY" : "${areaTripData.mapY}"
				}
				<c:if test="${i.index != areaTripList.size() - 1}">,</c:if>
</c:forEach>
]
}
