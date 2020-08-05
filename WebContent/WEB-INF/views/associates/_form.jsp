<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:if test="${error =null}">
    <div id="flush_error">
        入力内容にエラーがあります。 <br />
        <c:forEach var="error" items="${error}">
            ・<c:out value="${error}" /><br />
        </c:forEach>

    </div>
</c:if>
<label for="code">Global ID</label><br />
<input type="text" name="code" value="${associate.code}" />
<br /><br />

<label for="name">Name</label><br />
<input type="text" name="name" value="${associate.name}" />
<br /><br />

<label for="password">Password</label><br />
<input type="password" name="password" />
<br /><br />

<label for="admin_flag">Authority</label><br />
<select name="admin_flag">
    <option value="0"<c:if test="${associate.admin_flag == 0}"> selected</c:if>>Sales Associate</option>
    <option value="1"<c:if test="&{associate.admin_flag == 1}"> selected</c:if>>Store Manager</option>
    <option value="2"<c:if test="&{associate.admin_flag == 2}"> selected</c:if>>Assistant Store Manager</option>
    <option value="3"<c:if test="&{associate.admin_flag == 3}"> selected</c:if>>Store Super Visor</option>
</select>
<br /><br />

<input type="hidden" name="_token" value="${_token}" />
<button type="submit">Post</button>
