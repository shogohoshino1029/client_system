<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="/WEB-INF/views/layout/app.jsp">
    <c:param name="content">
        <c:choose>
            <c:when test="${associate != null}">
                <h2>id : ${associate.id} Edit</h2>
                <p>(Please enter the password only when changing it.) </p>
                <form method="POST" action="<c:url value='/associates/update' />">
                    <c:import url="_form.jsp" />
                </form>

                <p><a href="#" onclick="confirmDestroy();">Remove this Associate information</a></p>
                <form method="POST" action="<c:url value='/associates/destroy' />">
                    <input type="hidden" name="_token" value="${_token}" />
                </form>
                <script>
                    function confirmDestroy() {
                        if(confirm("Are you sure you want to delete it?")) {
                            document.forms[1].submit();
                        }
                    }

                </script>
            </c:when>
            <c:otherwise>
                <h2>Not Found</h2>
            </c:otherwise>
        </c:choose>

        <p><a href="<c:url value='/associates/index' />">Back</a></p>
    </c:param>
</c:import>