<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ja">
    <head>
        <meta charset="UTF-8">
        <title>Client Management System</title>
        <link rel="stylesheet" href="<c:url value='/css/reset.css' />">
        <link rel="stylesheet" href="<c:url value='/css/style.css' />">
    </head>
    <body>
        <div id="wrapper">
            <div id="header">
                <div id="header_menu">
                    <h1><a href="<c:url value='/' />">Client Management System</a></h1>&nbsp;&nbsp;&nbsp;
                    <c:if test="${sessionScope.login_associate != null}">
                        <c:if test="${sessionScope.login_associate.admin_flag == 1 ||
                                      sessionScope.login_associate.admin_flag == 2 ||
                                      sessionScope.login_associate.admin_flag == 3}">
                            <a href="<c:url value='/associates/index' />">Associate Management</a>&nbsp;
                        </c:if>
                        <a href="<c:url value='/clients/index' />">Client Management</a>&nbsp;
                    </c:if>
                </div>
                <c:if test="${sessionScope.login_associate != null}">
                    <div id="associate_name">
                        <c:out value="${sessionScope.login_associate.name}" />&nbsp;さん&nbsp;&nbsp;&nbsp;
                        <a href="<c:url value='/logout' />">Logout</a>
                    </div>
                </c:if>
            </div>
            <div id="content">
                ${param.content}
            </div>
            <div id="footer">
                by Shogo Hoshino.
            </div>
        </div>
    </body>
</html>