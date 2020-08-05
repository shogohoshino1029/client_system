<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="../layout/app.jsp">
    <c:param name="content">
        <c:if test="${flush != null}">
            <div id="flush_success">
                <c:out value="${flush}"><</c:out>
            </div>
        </c:if>
        <h2>Associate List</h2>
        <table id="associate_list">
            <tbody>
                <tr>
                    <th>Global ID</th>
                    <th>Name</th>
                    <th>Operation</th>
                </tr>
                <c:forEach var="associate" items="${associates}" varStatus="status">
                    <tr class="row${status.count % 2}">
                    <td><c:out value="${associate.code}" /></td>
                    <td><c:out value="${associate.name}" /></td>
                    <td>
                        <c:choose>
                            <c:when test="${associate.delete_flag == 1}">
                                 (Deleted)
                            </c:when>
                            <c:otherwise>
                                <a href="<c:url value='/associates/show?id=${associate.id}' />">Details</a>
                            </c:otherwise>
                        </c:choose>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>

    <div id="pagination">
         (All ${associates_count} )<br />
        <c:forEach var="i" begin="1" end="${((associates_count - 1) / 15) + 1}" step="1">
            <c:choose>
                <c:when test="${i == page}">
                    <c:out value="${i}" />&nbsp;
                </c:when>
                <c:otherwise>
                    <a href="<c:url value='/associates/index?page=${i}' />"><c:out value="${i}" /></a>&nbsp;
                </c:otherwise>
            </c:choose>
        </c:forEach>
    </div>
    <p><a href="<c:url value='/associates/new' />">New Associate Register</a></p>

    </c:param>
</c:import>