<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="/WEB-INF/views/layout/app.jsp">
    <c:param name="content">
        <c:choose>
            <c:when test="${client != null}">
                <h2>Client　Edit Page</h2>
                <form method="POST" action="<c:url value='/clients/update' />">
                    <c:import url="_form.jsp" />
                </form>
            </c:when>
            <c:otherwise>
                <h2>Not Found</h2>
            </c:otherwise>
        </c:choose>

        <p><a href="<c:url value='/clients/index' />">Back</a></p>
    </c:param>
</c:import>