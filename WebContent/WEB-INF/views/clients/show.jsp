<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:import url="/WEB-INF/views/layout/app.jsp">
    <c:param name="content">
        <c:choose>
            <c:when test="${client != null}">
                <h2>Client Details Page</h2>

                <table>
                    <tbody>
                        <tr>
                            <th>Name</th>
                            <td><c:out value="${client.associate.name}" /></td>
                        </tr>
                        <tr>
                            <th>Date</th>
                            <td><fmt:formatDate value="${client.client_date}" pattern="yyyy-MM-dd" /></td>
                        </tr>
                        <tr>
                            <th>Content</th>
                            <td>
                                <pre><c:out value="${client.content}" /></pre>
                            </td>
                        </tr>
                        <tr>
                            <th>Registered Date</th>
                            <td>
                                <fmt:formatDate value="${client.created_at}" pattern="yyyy-MM-dd HH:mm:ss" />
                            </td>
                        </tr>
                        <tr>
                            <th>Update Date</th>
                            <td>
                                <fmt:formatDate value="${client.updated_at}" pattern="yyyy-MM-dd HH:mm:ss" />
                            </td>
                        </tr>
                    </tbody>
                </table>

                <c:if test="${sessionScope.login_associate.id == client.associate.id}">
                    <p><a href="<c:url value="/clients/edit?id=${client.id}" />">Edit</a></p>
                </c:if>
            </c:when>
            <c:otherwise>
                <h2>Not Found</h2>
            </c:otherwise>
        </c:choose>

        <p><a href="<c:url value="/clients/index" />">Back</a></p>
    </c:param>
</c:import>