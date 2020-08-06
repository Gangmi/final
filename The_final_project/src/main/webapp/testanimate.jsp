<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
#loader {
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    pointer-events: none;
}

#loader>div {
    width: 100%;
    height: 12.5%;
    background: olive;
    transition: transform 500ms;
}

#loader>div:nth-child(1) {
    transition-delay: 100ms;
}

#loader>div:nth-child(2) {
    transition-delay: 200ms;
}

#loader>div:nth-child(3) {
    transition-delay: 300ms;
}

#loader>div:nth-child(4) {
    transition-delay: 400ms;
}

#loader>div:nth-child(5) {
    transition-delay: 500ms;
}

#loader>div:nth-child(6) {
    transition-delay: 600ms;
}

#loader>div:nth-child(7) {
    transition-delay: 700ms;
}

#loader>div:nth-child(8) {
    transition-delay: 800ms;
}

body:not(.hidden).reveal #loader>div {
    transform: translateX(-100%);
}

</style>
<script type="text/javascript">
setTimeout(() => {
    document.body.classList.add("reveal")
}, 1000),
document.addEventListener("click", () => {
    document.body.classList.toggle("reveal")
});



</script>


<title>Insert title here</title>
</head>
<body>
<jsp:include page="/WEB-INF/views/header.jsp"></jsp:include>



<jsp:include page="/WEB-INF/views/footer.jsp"></jsp:include>



<div id="loader">
    <a href="testanimate.do">durl</a>
</div>



</body>
</html>