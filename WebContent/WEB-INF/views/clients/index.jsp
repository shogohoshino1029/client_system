<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:import url="/WEB-INF/views/layout/app.jsp">
    <c:param name="content">
        <c:if test="${flush != null}">
            <div id="flush_success">
                <c:out value="${flush}"></c:out>
            </div>
        </c:if>
        <h2>Client List</h2>
        <table id="client_list">
            <tbody>
                <tr>
                    <th class="client_name">Assignment</th>
                    <th class="client_date">RegisterDate</th>
                    <th class="client_title">Client Name</th>
                    <th class="client_action">Operation</th>
                </tr>
                <c:forEach var="client" items="${clients}" varStatus="status">
                    <tr class="row${status.count % 2}">
                        <td class="client_name"><c:out value="${client.associate.name}" /></td>
                        <td class="client_date"><fmt:formatDate value='${client.client_date}' pattern='yyyy-MM-dd' /></td>
                        <td class="client_title">${client.title}</td>
                        <td class="client_action"><a href="<c:url value='/clients/show?id=${client.id}' />">Details</a></td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>

        <div id="pagination">
             (All ${clients_count} )<br />
            <c:forEach var="i" begin="1" end="${((clients_count - 1) / 15) +1}" step="1">
                <c:choose>
                    <c:when test="${i == page}">
                        <c:out value="${i}" />&nbsp;
                    </c:when>
                    <c:otherwise>
                        <a href="<c:url value='/clients/index?page=${i}' />"><c:out value="${i}" /></a>&nbsp;
                    </c:otherwise>
                </c:choose>
            </c:forEach>
        </div>
        <p><a href="<c:url value='/clients/new' />">Register New Client</a></p>

    </c:param>
</c:import>
