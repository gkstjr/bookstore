<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="memberId" value="${login}"></c:set>
<c:set var="isLogin" value="${memberId != null}"></c:set>
<c:set var="isAdmin" value="${auth == '관리자'}"></c:set>
<c:set var="root" value="${pageContext.request.contextPath}"></c:set>

<!DOCTYPE html>
<html lang="zxx">

<head>
    <meta charset="UTF-8">
    <meta name="description" content="Ogani Template">
    <meta name="keywords" content="Ogani, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">

    <title>BookStore</title>

    <link rel="stylesheet"  href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css" />

    <!-- Css Styles -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/nice-select.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/jquery-ui.min.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/slicknav.min.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" type="text/css">
        <style>

    </style>
    <script>
   /*
      프론트엔드 암호화에 대한 계획
      - 암호화 알고리즘은 상황에 맞게 선택
      - input[type=password] 형태의 컬럼을 찾아서 전송 전에 암호화한 값으로 교체
   */
   $(function(){
      $("form").submit(function(){
         //this == form
         $(this).find("input[type=password]").each(function(){
            //this == 입력창
            var rawData = $(this).val();
            //var encData = 암호화(rawData);
            var hash = CryptoJS.SHA1(rawData);//암호화
            var encData = CryptoJS.enc.Hex.stringify(hash);//문자열화
            $(this).val(encData);
         });
      });
   });
</script>
</head>

<body>
    <!-- Page Preloder -->
    <div id="preloder">
        <div class="loader"></div>
    </div>

 <!-- Humberger Begin -->
    <div class="humberger__menu__overlay"></div>
    <div class="humberger__menu__wrapper">
        <div class="humberger__menu__logo">
            <a href="${root}/"><img src="${pageContext.request.contextPath}/image/logo.png" alt=""></a>
        </div>
        <div class="humberger__menu__cart">
            <ul>
                <li><a href="${root}/"><i class="fa fa-heart"></i> <span>1</span></a></li>
                <li><a href="${root}/"><i class="fa fa-shopping-bag"></i> <span>3</span></a></li>
            </ul>
            <div class="header__cart__price">item: <span>$150.00</span></div>
        </div>
        <div class="humberger__menu__widget">
            <div class="header__top__right__language">
            <a href="${root}/member/join">회원가입</a>
            </div>
            <div class="header__top__right__auth">
                <a href="${root}/member/login"><i class="fa fa-user"></i> 로그인</a>
            </div>
        </div>
        <nav class="humberger__menu__nav mobile-menu">
            <ul>
                <li class="active"><a href="./index.html">Home</a></li>
                <li><a href="./shop-grid.html">Shop</a></li>
                <li><a href="${root}/">Pages</a>
                    <ul class="header__menu__dropdown">
                        <li><a href="./shop-details.html">Shop Details</a></li>
                        <li><a href="./shoping-cart.html">Shoping Cart</a></li>
                        <li><a href="./checkout.html">Check Out</a></li>
                        <li><a href="./blog-details.html">Blog Details</a></li>
                    </ul>
                </li>
                <li><a href="./blog.html">Blog</a></li>
                <li><a href="./contact.html">Contact</a></li>
            </ul>
        </nav>
        <div id="mobile-menu-wrap"></div>
        <div class="header__top__right__social">
            <a href="${root}/"><i class="fa fa-facebook"></i></a>
            <a href="${root}/"><i class="fa fa-twitter"></i></a>
            <a href="${root}/"><i class="fa fa-linkedin"></i></a>
            <a href="${root}/"><i class="fa fa-pinterest-p"></i></a>
        </div>
        <div class="humberger__menu__contact">
            <ul>
                <li><i class="fa fa-envelope"></i> hello@world.com</li>
                <li>3만원 이상 주문시 무료 배송</li>
            </ul>
        </div>
    </div>
    <!-- Humberger End -->

    <!-- Header Section Begin -->
    <header class="header">
        <div class="header__top">
            <div class="container">
                <div class="row">
                    <div class="col-lg-6 col-md-6">
                        <div class="header__top__left">
                            <ul>
                                <li><i class="fa fa-envelope"></i> hello@world.com</li>
                                <li>3만원 이상 주문시 무료 배송</li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-lg-6 col-md-6">
                        <div class="header__top__right">
                            <div class="header__top__right__social">
                                <a href="${root}/"><i class="fa fa-facebook"></i></a>
                                <a href="${root}/"><i class="fa fa-twitter"></i></a>
                                <a href="${root}/"><i class="fa fa-linkedin"></i></a>
                                <a href="${root}/"><i class="fa fa-pinterest-p"></i></a>
                            </div>
          <c:choose>
         <c:when test="${isLogin}">
        <div class="humberger__menu__widget">
            <div class="header__top__right__language">
            <a href="${root}/member/mypage">마이페이지</a>
            </div>
            <div class="header__top__right__auth">
                <a href="${root}/member/logout"><i class="fa fa-user"></i> 로그아웃</a>
            </div>
             </c:when>
           <c:otherwise>
           <div class="header__top__right__language">
            <a href="${root}/member/join">회원가입</a>
            </div>
            <div class="header__top__right__auth">
                <a href="${root}/member/login"><i class="fa fa-user"></i> 로그인</a>
            </div>
            </c:otherwise>
         </c:choose>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="container">
            <div class="row">
                <div class="col-lg-3">
                    <div class="header__logo">
                        <a href="${root}/"><img src="${pageContext.request.contextPath}/image/logo.png"alt=""></a>
                    </div>
                </div>
                <div class="col-lg-6">
                    <nav class="header__menu">
                        <ul>
                            <li class="active"><a href="${root}/board/list">공지게시판</a></li>
                            <li><a href="./shop-grid.html">도서관</a></li>
                            <li><a href="${root }/book/list">북스토어</a></li>
                            <li><a href="./blog.html">중고 거래</a>
                             <ul class="header__menu__dropdown">
                                    <li><a href="${root}/">중고 판매신청</a></li>
                                   
                                </ul>
                            </li>
                            <li><a href="./contact.html">감상평</a></li>
                        </ul>
                    </nav>
                </div>
                <div class="col-lg-3">
                    <div class="header__cart">
                        <ul>
                            <li><a href="${root}/"><i class="fa fa-heart"></i> <span>1</span></a></li>
                            <li><a href="${root}/"><i class="fa fa-shopping-bag"></i> <span>3</span></a></li>
                        </ul>
                </div>
            </div>
            <div class="humberger__open">
                <i class="fa fa-bars"></i>
            </div>
        </div>
    </header>
    <!-- Header Section End -->
                
    <!-- Hero Section Begin -->
    <section class="hero hero-normal">
        <div class="container">
            <div class="row">
                <div class="col-lg-3 text-center">
					<button class="site-btn m-1" onclick="location.href='book'">도서 관리</button><br>
					<button class="site-btn m-1" onclick="location.href='lib'">도서관 관리</button><br>
					<button class="site-btn m-1" onclick="location.href='member'">회원 관리</button><br>
                </div>
                <div class="col-lg-9">
                    <div class="container-fluid">