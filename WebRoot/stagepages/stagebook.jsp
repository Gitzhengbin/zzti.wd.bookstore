<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<title>书籍前台</title>
<link type="text/css" rel="stylesheet" href="<c:url value='/css/reset.css'/>" />
<link type="text/css" rel="stylesheet" href="<c:url value='/css/1024_768.css'/>" />
<link type="text/css" rel="stylesheet" media="screen and (min-width:861px) and (max-width:960px)" href="<c:url value='/css/pad_heng.css'/>" />
<link type="text/css" rel="stylesheet" media="screen and (min-width:601px) and (max-width:860px)" href="<c:url value='/css/pad.css'/>" />
<link type="text/css" rel="stylesheet" media="screen and (min-width:481px) and (max-width:600px)" href="<c:url value='/css/tel_heng.css'/>" />
<link type="text/css" rel="stylesheet" media="screen and (max-width:480px)" href="<c:url value='/css/tel.css'/>" />
<link rel="icon" type="image/x-icon" href="<c:url value='/logo/wd.ico'/>" media="screen"/>
</head>

<body>
<div class="w_100_l top_title">
	<div class="main">
    	<p><a href="">卓越131班——郑斌</a>&nbsp;&nbsp;&nbsp;</p>
    </div>
</div>


<div class="w_100_l">
	<div class="main">
      <div class="top_banner">
            <div class="top_logo"><img src="<c:url value='/logo/logo.png'/>" alt="A BOOK APART LOGO" /></div>
            <div class="top_menu">
            	<ul>
                	<li class="sel"><a href="#">主页</a></li>
                	<li><a href="#">更多</a></li>
                	<li><a href="#">帮助</a></li>
                </ul>
            </div>
            <div class="top_shop_cur"><a href="#"><img src="<c:url value='stageimages/top_shop_cur.jpg'/>" alt="shopping car" /></a></div>
        </div>
        <!-- <span class="index_img"><img src="Images/banner_img.jpg" alt="Dan Cederholm" border="0" usemap="#Map" /> -->
        <map name="Map" id="Map">
          <area shape="rect" coords="857,230,930,269" href="#" alt="buy now" />
        </map>
        </span>
        <p class="index_hr"></p>
      <div class="content">
            <h1 class="h1_book_title">图书商城</h1>
        	<ul>
        	<c:forEach var="b" items="${list}">
            	<li>
                	<dl>
                    	<dd><a href="#"><img src="<c:url value='/upload/${b.cover}'/>" alt="book" /></a></dd>
                        <dt>
                        	<p class="book_title"><a href="#" target="_blank">${b.name}</a></p>
                        	<p class="book_inline">${b.author}</p>
                            <p class="book_inline">￥${b.price}</p>
                            <button type="button" class="btn btn-primary" data-toggle="modal" data-target=".bs-example-modal-lg">BUY</button>
                        </dt>
                    </dl>
                </li>
             </c:forEach>
            </ul>
      </div>
        <p class="index_hr"></p>
        <!-- <div class="content_press">
        	<div class="press_porsen_01">
                <h1>Press Room</h1>
            	<dl>
                	<dd><img src="Images/img_men.jpg" alt="person" /></dd>
                    <dt>
                    	<p class="date">Apr 03, 2014</p>
                        <p class="book_title"><a href="#" target="_blank">Design Is a Job audiobook</a></p>
                        <p class="book_intro">
                        Weâre pleased to announce that <a href="#">Design Is a Job</a> by Mike Monteiro is now available in audiobook format, through <a href="#">Audible.com</a> and <a href="#">Amazon.com</a>. Narrated by the raconteur himself, experience the guidance, real-talk, and humor of our seminal book on design as a job.
                        </p>
                    </dt>
                </dl>
            </div>
            <div class="press_porsen_02">
                <h1><span class="span_2"><a href="#"> More Articles â</a></span><span class="span_1"><a href="#">Press Room RSS</a></span></h1>
            	<dl>
                	<dd><img src="Images/img_lives.jpg" alt="book img" /></dd>
                    <dt>
                    	<p class="date">Mar 31, 2014</p>
                        <p class="book_title"><a href="#" target="_blank">A Few of Our Faves: March 31st</a></p>
                        <p class="book_intro">
                        As the madness of March comes to a close, we gathered up a few things that caught our attention during the last half of the month. <a href="#">Read on for more.</a>                        </p>
                    </dt>
                </dl>
            </div>
        </div> -->
        <!-- <p class="index_hr"></p> -->
        <h1 class="news_title">网上书城基础支持系统</h1>
        <p class="news_title_1">
        	<img alt="" src=""><span class="span_1"><a href="https://github.com/Gitzhengbin/zzti.wd.bookstore">GitHub</a></span><span class="span_2" style="margin-bottom: 20px;">© 2016 Bin Zheng</span></p>
        <p class="index_hr" style="margin-top:20px;"></p>
        <!-- <div class="footer">
           <span class="span_1">&copy; Copyright 2014, A Book Apart, LLC</span>&nbsp;&nbsp;
            <a href="#">Help & Contact us</a>
            <a class="a1" href="#">Press Room RSS feed</a>
            <a class="a2" href="#">abookapart on Twitter</a>
            <span class="span_2"><b>Published by</b><img src="Images/icon_hg.jpg" align="absmiddle" /></span>
        </div> -->
    </div>
</div>
<!-- <div style="display:none"><script src='http://v7.cnzz.com/stat.php?id=155540&web_id=155540' language='JavaScript' charset='gb2312'></script></div> -->
</body>
</html>