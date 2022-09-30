<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
{ 
"areaList" : [

<c:forEach varStatus="i" var="area" items="${areaList}">
                {
                "area_code" : "${area.areaCode}",
                "area_name" : "${area.areaName}"
                }
                <c:if test="${i.index != areaList.size() - 1}">,</c:if>
</c:forEach>
], 
"sigunguList" : [

<c:forEach varStatus="i" var="sigungu" items="${sigunguList}">
                {
                "area_code" : "${sigungu.areaCode}",
                "sigungu_code" : "${sigungu.sigunguCode}",
                "sigungu_name" : "${sigungu.sigunguName}"
                }
                <c:if test="${i.index != sigunguList.size() - 1}">,</c:if>
</c:forEach>
], 
"contentTypeList" : [

<c:forEach varStatus="i" var="contentType" items="${contentTypeList}">
                {
                "content_type_id" : "${contentType.contentTypeId}",
                "content_type_name" : "${contentType.contentTypeName}"
                }
                <c:if test="${i.index != contentTypeList.size() - 1}">,</c:if>
</c:forEach>
] , "mateList" : [

<c:forEach varStatus="i" var="mate" items="${mateList}">
                {
                "board_id" : "${mate.board_id}",
                "board_title" : "${mate.board_title}",
                "content" : "${mate.content}"
                }
                <c:if test="${i.index != mateList.size() - 1}">,</c:if>
</c:forEach>
], "reviewList" : [

<c:forEach varStatus="i" var="review" items="${reviewList}">
                {
                "board_id" : "${review.board_id}",
                "board_title" : "${review.board_title}",
                "regist_time" : "${review.regist_time}",
                "user_id" : "${review.user_id}",
                "score"	: "${review.score}"		
                }
                <c:if test="${i.index != reviewList.size() - 1}">,</c:if>
</c:forEach>
]
}