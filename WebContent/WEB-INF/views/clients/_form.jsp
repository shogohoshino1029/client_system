<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:if test="${errors != null}">
    <div id="flush_error">
        Error <br />
        <c:forEach var="error" items="${errors}">
            ・<c:out value="${error}" /><br />
        </c:forEach>

    </div>
</c:if>
<label for="client_date">Date</label><br />
<input type="date" name="report_date" value="<fmt:formatDate value='${client.client_date}' pattern='yyyy-MM-dd' />" />
<br /><br />

<label for="name">Assignment</label><br />
<c:out value="${sessionScope.login_associate.name}" />
<br /><br />

<label for="title">Client Name</label><br />
<input type="text" name="title" value="${client.title}" />
<br /><br />

<label for="content">Content</label><br />
<textarea name="content" rows="10" cols="50">${client.content}</textarea>
<br /><br />

<input type="hidden" name="_token" value="${_token}"/>
<button type="submit">Post</button>