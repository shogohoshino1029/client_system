<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:import url="/WEB-INF/views/layout/app.jsp">
    <c:param name="content">
        <c:choose>
            <c:when test="${associate != null}">
                <h2>id : ${associate.id} Associate Information Details Page</h2>

                <table>
                    <tbody>
                        <tr>
                            <th>Global ID</th>
                            <td><c:out value="${associate.code}" /></td>
                        </tr>
                        <tr>
                            <th>Name</th>
                            <td><c:out value="${associate.name}" /></td>
                        </tr>
                        <tr>
                            <th>Authority</th>
                            <td>
                                <c:choose>
                                    <c:when test="${associate.admin_flag == 1}">Store Manager</c:when>
                                    <c:when test="${associate.admin_flag == 2}">Assistant Store Manager</c:when>
                                    <c:when test="${associate.admin_flag == 3}">Store Super Visor</c:when>
                                    <c:when test="${associate.admin_flag == 4}">Guest</c:when>

                                    <c:otherwise>Sales Associate</c:otherwise>
                                </c:choose>
                            </td>
                        </tr>
                        <tr>
                            <th>Registered Date</th>
                            <td>
                                <fmt:formatDate value="${associate.created_at}" pattern="yyyy-MM-dd HH:mm:ss" />
                            </td>
                        </tr>
                        <tr>
                            <th>Update Date</th>
                            <td>
                                <fmt:formatDate value="${associate.updated_at}" pattern="yyyy-MM-dd HH:mm:ss" />
                            </td>
                        </tr>
                    </tbody>
                </table>

                <p><a href="<c:url value='/associates/edit?id=${associate.id}' />">Edit</a></p>
            </c:when>
            <c:otherwise>
                <h2>Not Found</h2>
            </c:otherwise>
        </c:choose>

        <p><a href="<c:url value='/associates/index' />">Back</a></p>
     </c:param>
 </c:import>