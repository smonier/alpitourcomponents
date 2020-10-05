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
<c:set var="galleryImgs" value="${currentNode.properties['imgGallery']}"/>
<jcr:nodeProperty node="${currentNode}" name="mappa" var="mappa"/>
<jcr:nodeProperty node="${currentNode}" name="recensioni" var="recensioni"/>
<jcr:nodeProperty node="${currentNode}" name="perVoi" var="perVoi"/>
<jcr:nodeProperty node="${currentNode}" name="camere" var="camere"/>
<jcr:nodeProperty node="${currentNode}" name="covid" var="covid"/>


<script language="JavaScript">
    $().ready(function () {
        $('[rel="tooltip"]').tooltip();

    });

    function rotateCard(btn) {
        var $card = $(btn).closest('.rotatingCard-container');
        console.log($card);
        if ($card.hasClass('hover')) {
            $card.removeClass('hover');
        } else {
            $card.addClass('hover');
        }
    }
</script>


<c:set var="rotationClass" value=""/>
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

<div class=" mb-4">
    <h2 class="text-primary text-left" style="text-transform:Capitalize;">${tripTitle.string}</h2>

    <ul class="nav nav-tabs nav-fill" id="myTab" role="tablist">
        <li class="nav-item">
            <a class="nav-link active" id="Info-tab" data-toggle="tab" href="#Info" role="tab" aria-controls="Info"
               aria-selected="true">Info</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" id="Gallery-tab" data-toggle="tab" href="#Gallery" role="tab" aria-controls="Gallery"
               aria-selected="false">Gallery</a>
        </li>

        <li class="nav-item">
            <a class="nav-link" id="Recensioni-tab" data-toggle="tab" href="#Recensioni" role="tab"
               aria-controls="Recensioni" aria-selected="false">Recensioni</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" id="PerVoi-tab" data-toggle="tab" href="#PerVoi" role="tab" aria-controls="PerVoi"
               aria-selected="false">Per Voi</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" id="Camere-tab" data-toggle="tab" href="#Camere" role="tab" aria-controls="Camere"
               aria-selected="false">Camere</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" id="Covid-19-tab" data-toggle="tab" href="#Covid-19" role="tab" aria-controls="Covid-19"
               aria-selected="false">Covid-19</a>
        </li>
    </ul>
    <div class="tab-content" id="myTabContent">
        <div class="tab-pane fade show active" id="Info" role="tabpanel" aria-labelledby="Info-tab">
            <div class="px-2">
                <div class="main">

                    <p class="text-left">${description.string}</p>
                </div>

            </div>
        </div>
        <div class="tab-pane fade" id="Gallery" role="tabpanel" aria-labelledby="Gallery-tab">
            <!-- Carousel start -->
            <div class="col-md-12">
                <div id="carousel-thumb" class="carousel slide carousel-fade carousel-thumbnails" data-ride="carousel">
                    <!--Slides-->
                    <div class="carousel-inner" role="listbox">
                        <c:forEach items="${galleryImgs}" var="galImage" varStatus="status">
                            <div class="carousel-item ${status.first?' active':''}">

                                <img class="card-img d-block w-100" src="${galImage.node.url}"
                                     alt="${galImage.node.name}">

                            </div>
                        </c:forEach>
                    </div>
                    <!--/.Slides-->
                    <!--Controls-->
                    <a class="carousel-control-prev" href="#carousel-thumb" role="button" data-slide="prev">
                        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                        <span class="sr-only">Previous</span>
                    </a>
                    <a class="carousel-control-next" href="#carousel-thumb" role="button" data-slide="next">
                        <span class="carousel-control-next-icon" aria-hidden="true"></span>
                        <span class="sr-only">Next</span>
                    </a>
                    <!--/.Controls-->
                    <ol class="carousel-indicators">
                        <c:forEach items="${galleryImgs}" var="galImage" varStatus="status">
                            <li data-target="#carousel-thumb" data-slide-to="${status}"
                                class="${status.first?' active':''}">
                                <img class="img-fluid d-block w-100" src="${galImage.node.url}"
                                     alt="${galImage.node.name}">
                            </li>
                        </c:forEach>
                    </ol>
                </div>
                <!-- End of carousel -->
            </div>
        </div>

        <div class="tab-pane fade" id="Recensioni" role="tabpanel" aria-labelledby="Recensioni-tab"><p
                class="text-left">${recensioni.string}</p></div>
        <div class="tab-pane fade" id="PerVoi" role="tabpanel" aria-labelledby="PerVoi-tab"><p
                class="text-left">${perVoi.string}</p></div>
        <div class="tab-pane fade" id="Camere" role="tabpanel" aria-labelledby="Camere-tab"><p
                class="text-left">${camere.string}</p></div>
        <div class="tab-pane fade" id="Covid-19" role="tabpanel" aria-labelledby="Covid-19-tab"><p
                class="text-left">${covid.string}</p></div>
    </div>
</div>


