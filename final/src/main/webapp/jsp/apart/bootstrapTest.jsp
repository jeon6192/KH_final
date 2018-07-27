<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Insert title here</title>
		
		<script src="http://code.jquery.com/jquery-latest.js"></script>
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
		<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
		<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
	</head>
	<body>
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
  <a class="navbar-brand" href="#">Navbar</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
        <a class="nav-link" href="#">Home <span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#">Link</a>
      </li>
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          Dropdown
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
          <a class="dropdown-item" href="#">Action</a>
          <a class="dropdown-item" href="#">Another action</a>
          <div class="dropdown-divider"></div>
          <a class="dropdown-item" href="#">Something else here</a>
        </div>
      </li>
      <li class="nav-item">
        <a class="nav-link disabled" href="#">Disabled</a>
      </li>
    </ul>
    <form class="form-inline my-2 my-lg-0">
      <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
      <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
    </form>
  </div>
</nav>


<style>
	html, body {
  padding: 0;
  margin: 0;
  background-color: #555;
  font-family: sans-serif;
}

ul {
  list-style: none;
}

.nav > ul > li {
  float: left;
  width: 120px;
  height: 50px;
  line-height: 50px;
  position: relative;
  font-size: 14px;
  cursor: pointer;
}

ul.drop-menu {
    position: absolute;
    z-index: 1;
    width: 100px;
    padding: 0;
    left: 80px;
    top: 0;
    background-color: #343c49;
}
ul.drop-menu li {
  background: #318bba;
}
ul.drop-menu li:hover {
  background: #459fce;
}
ul.drop-menu li:first-child {
  border-radius: 2px 2px 0 0;
}
ul.drop-menu li:last-child {
  border-radius: 0 0 5px 5px;
}

ul.drop-menu li {
  display: none;
}

li:hover > ul.drop-menu li {
  display: block;
}

li:hover > ul.drop-menu.menu-2 {
  perspective: 1000px;
}
li:hover > ul.drop-menu.menu-2 li {
  transform-origin: top center;
  opacity: 0;
}
li:hover > ul.drop-menu.menu-2 li:nth-child(1) {
  animation-name: menu-2;
  animation-duration: 300ms;
  animation-delay: -150ms;
  animation-fill-mode: forwards;
  animation-timing-function: ease-in-out;
}
li:hover > ul.drop-menu.menu-2 li:nth-child(2) {
  animation-name: menu-2;
  animation-duration: 300ms;
  animation-delay: 0ms;
  animation-fill-mode: forwards;
  animation-timing-function: ease-in-out;
}
li:hover > ul.drop-menu.menu-2 li:nth-child(3) {
  animation-name: menu-2;
  animation-duration: 300ms;
  animation-delay: 150ms;
  animation-fill-mode: forwards;
  animation-timing-function: ease-in-out;
}
li:hover > ul.drop-menu.menu-2 li:nth-child(4) {
  animation-name: menu-2;
  animation-duration: 300ms;
  animation-delay: 300ms;
  animation-fill-mode: forwards;
  animation-timing-function: ease-in-out;
}
li:hover > ul.drop-menu.menu-2 li:nth-child(5) {
  animation-name: menu-2;
  animation-duration: 300ms;
  animation-delay: 450ms;
  animation-fill-mode: forwards;
  animation-timing-function: ease-in-out;
}
li:hover > ul.drop-menu.menu-2 li:nth-child(6) {
  animation-name: menu-2;
  animation-duration: 300ms;
  animation-delay: 600ms;
  animation-fill-mode: forwards;
  animation-timing-function: ease-in-out;
}
@keyframes menu-2 {
  0% {
    opacity: 0;
    transform: rotateX(-90deg);
  }
  50% {
    transform: rotateX(20deg);
  }
  100% {
    opacity: 1;
    transform: rotateX(0deg);
  }
}
</style>

		<div class="container">
		  <div class="nav">
		    <ul>
		      
		      <li><a>STYLE 2</a> 
		        <ul class="drop-menu menu-2">
		          <li>ONE</li>
		          <li>TWO</li>
		          <li>THREE</li>
		          <li>FOUR</li>
		          <li>FIVE</li>
		          <li>SIX</li>
		        </ul>
		      </li>
		      
		    </ul>
		  </div>
		</div>
	</body>
</html>