<%@ page language="java" contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="template" uri="http://www.jahia.org/tags/templateLib" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="jcr" uri="http://www.jahia.org/tags/jcr" %>
<%@ taglib prefix="ui" uri="http://www.jahia.org/tags/uiComponentsLib" %>
<%@ taglib prefix="functions" uri="http://www.jahia.org/tags/functions" %>
<%@ taglib prefix="query" uri="http://www.jahia.org/tags/queryLib" %>
<%@ taglib prefix="utility" uri="http://www.jahia.org/tags/utilityLib" %>
<%@ taglib prefix="s" uri="http://www.jahia.org/tags/search" %>
<%--@elvariable id="currentNode" type="org.jahia.services.content.JCRNodeWrapper"--%>
<%--@elvariable id="out" type="java.io.PrintWriter"--%>
<%--@elvariable id="script" type="org.jahia.services.render.scripting.Script"--%>
<%--@elvariable id="scriptInfo" type="java.lang.String"--%>
<%--@elvariable id="workspace" type="java.lang.String"--%>
<%--@elvariable id="renderContext" type="org.jahia.services.render.RenderContext"--%>
<%--@elvariable id="currentResource" type="org.jahia.services.render.Resource"--%>
<%--@elvariable id="url" type="org.jahia.services.render.URLGenerator"--%>

<template:addResources type="css" resources="tripCard.css"/>

<jcr:nodeProperty node="${currentNode}" name="tripTitle" var="tripTitle"/>
<jcr:nodeProperty node="${currentNode}" name="description" var="description"/>
<jcr:nodeProperty node="${currentNode}" name="provider" var="provider"/>
<jcr:nodeProperty node="${currentNode}" name="hotel" var="hotel"/>
<jcr:nodeProperty node="${currentNode}" name="departure" var="departure"/>
<jcr:nodeProperty node="${currentNode}" name="priceDescription" var="priceDescription"/>
<jcr:nodeProperty node="${currentNode}" name="price" var="price"/>
<jcr:nodeProperty node="${currentNode}" name="image" var="image"/>
<jcr:nodeProperty node="${currentNode}" name="lastMinute" var="lastMinute"/>

<c:choose>
    <c:when test="${provider eq 'Alpitour'}">
        <c:set var="providerLogo" value="/images/logo-alpitour.webp"/>
    </c:when>
    <c:when test="${provider eq 'Francorosso'}">
        <c:set var="providerLogo" value="/images/logo_francorosso_new.webp"/>
    </c:when>
    <c:when test="${provider eq 'Viaggidea'}">
        <c:set var="providerLogo" value="/images/logo-viaggidea-2017.webp"/>
    </c:when>
    <c:when test="${provider eq 'Turisanda'}">
        <c:set var="providerLogo" value="/images/logo-turisanda-footer.webp"/>
    </c:when>
    <c:when test="${provider eq 'BravoClub'}">
        <c:set var="providerLogo" value="/images/logo-villaggibravo.webp"/>
    </c:when>
    <c:when test="${provider eq 'Karambola'}">
        <c:set var="providerLogo" value="/images/logo-karambola.webp"/>
    </c:when>
    <c:when test="${provider eq 'Swantour'}">
        <c:set var="providerLogo" value="/images/Logo-footer-SwanTour.webp"/>
    </c:when>
    <c:when test="${provider eq 'Presstour'}">
        <c:set var="providerLogo" value="/images/logo-presstours_new.webp"/>
    </c:when>
</c:choose>

<div class="card mb-4">

    <div class="view overlay">
        <img class="card-img-top" style="max-height:200px"
             src="${image.node.url}" alt="${image.node.name}"/>
        <a>
            <div class="mask rgba-white-slight"></div>
        </a>
    </div>

    <div class="px-2">
        <div class="main">
            <div class="row">
                <div class="columnLeft">
                    <img src="<c:url value='${url.currentModule}${providerLogo}'/>"/>
                </div>
                <div class="columnRight">
                    <img src="<c:url value='${url.currentModule}/images/euro-sign.png'/>"/>
                    <c:if test="${lastMinute.boolean}">
                        <img src="<c:url value='${url.currentModule}/images/lastMinute.png'/>"/>
                    </c:if>
                </div>
            </div>
            <p class="text-left">${hotel.string}</p>
          <h5 class="text-primary text-left"><a href="<c:url value='${url.base}${currentNode.path}.html'/>">${tripTitle.string}</a></h5>
            <p class="text-left"><i class="fas fa-plane-departure"></i>${departure.string}</p>
        </div>
        <div class="footer">
            <div class="row">
                <div class="columnLeft">
                    <p class="name">${priceDescription.string}</p>
                </div>
                <c:if test="${lastMinute.boolean}">
                <div class="columnRight">
                    <h5 class="name text-primary">${price.string}</h5>
                    </c:if>
                </div>
            </div>
        </div>
    </div> <!-- end front panel -->
</div>


