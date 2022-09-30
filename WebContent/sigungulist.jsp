<%@ page language="java" contentType="application/json; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
{
"sigunguList" : [
			<c:forEach varStatus="i" var="sigungu" items="${sigunguList}">
				{
				"area_code" : "${sigungu.areaCode}",
				"sigungu_code" : "${sigungu.sigunguCode}",
				"sigungu_name" : "${sigungu.sigunguName}"
				}
				<c:if test="${i.index != sigunguList.size() - 1}">,</c:if>
			</c:forEach>
			]
}