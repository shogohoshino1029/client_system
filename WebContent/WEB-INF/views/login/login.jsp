<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="/WEB-INF/views/layout/app.jsp">
    <c:param name="content">
        <c:if test="${hasError}">
            <div id="flush_errror">
                Your password is incorrect.
            </div>
        </c:if>
        <c:if test="${flush != null}">
            <div id="flush_success">
                <c:out value="${flush}"></c:out>
            </div>
        </c:if>
        <h2>Login</h2>
        <form method="POST" action="<c:url value='/login' />">
            <label for="code">Global ID</label><br />
            <input type="text" name="code" value="${code}" />
            <br /><br />

            <label for="password">Password</label><br />
            <input type="password" name="password" />
            <br /><br />

            <input type="hidden" name="_token" value="${_token}" />
            <button type="submit">Login</button>
        </form>
    </c:param>
</c:import>
