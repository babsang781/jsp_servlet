<%@ page import="file.FileDAO"%>
<%@ page import="java.io.File"%>
<%@ page import="com.oreilly.servlet.multiport.DefaoltFileRenamePolicy"%>
<%@ page import="com.oreilly.servlet.multiportRequest"%>
<
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>lostAniReport</title>

<!-- Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<!-- Google Font -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Dancing+Script:wght@600&display=swap"
	rel="stylesheet">

<!-- jQuery (부트스트랩의 자바스크립트 플러그인을 위해 필요합니다) -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>

<!-- 아이콘 -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://bootsnipp.com/dist/bootsnipp.min.css"
	crossorigin="anonymouse">
<link rel="stylesheet"
	href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css"
	integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p"
	crossorigin="anonymous" />

<!-- Custom styles for this template -->
<link href="narrow-jumbotron.css" rel="stylesheet">

<style>
.btn {
	background-color: #25aa90;
	color: #fff;
	margin-right: 5px;
	width: 70px;
}

.back {
	font-size: 25px;
	margin-left: 5px;
	width: 70px;
}

.container-head {
	display: flex;
	justify-content: space-between;
	align-items: center;
}

.container-section1 {
	display: flex;
	flex-wrap: wrap;
	align-items: flex-start;
	align-content: flex-start;
}

.item1 {
	flex: 1 1 40%;
	margin: 5px;
	max-width: 50%;
}

.container-section2 {
	display: flex;
	flex-direction: column;
	align-items: flex-start;
	align-content: flex-start;
}

.item2 {
	flex: 1 1 80%;
	width: 98%;
	margin: 5px;
}

.report-container {
	width: 100%;
	padding-left: 15px;
	padding-right: 15px;
	padding-bottom: 15px;;
	padding-top: 15px;
	margin: auto;
	display: block;
	max-width: 430px;
	min-width: 385px;
	padding-right: 15px;
	padding-bottom: 15px;
}

@media ( min-width : 800px) {
	/* 바깥 컨테이너 설정 */
	.report-container {
		width: 100%;
		max-width: 750px;
		margin: auto;
		display: auto;
	}
}

.remove {
	font-size: 2px;
	position: absolute;
}

.b {
	border: solid 1px violet;
}
</style>
</head>

<body>


	<%
	String directory = application.getRealPath("/assets/img/");
	int maxSize = 1024 * 1024 * 10;
	String encoding = "UTF-8";

	MultipartRquest multipartRequest = new MultipartRquest(request, directory, maxSize, encoding,
			newDefaultFileRenamePolicy());

	String fileName = multipartRequest.getOriginalFileName("file");
	String fileRealPath = multipartRequest.getFilesystemName("file");

	new FileDAO().upload(fileName, fileRealPath);
	out.write("파일명: " + fileName + "<br>");
	out.write("실제 파일명: " + fileRealPath + "<br>");
	%>
	
	<div class="report-container b">
		<form action="lostAniCreateCon.do" method="post">
			<!-- header 박스 -->
			<header class="container-head b">
				<div class="item back b">
					<i class="bi bi-chevron-left"></i>
				</div>
				<div class="item pageName b">유실/유기동물 제보</div>
				<div class="item submit b">
					<button type="submit" class="btn">완료</button>
				</div>
			</header>

			<!-- section1 박스: 게시글 등록유형~ 성별까지 다단 나눈 8개, 4줄 -->
			<section class="container-section1 b">
				<select id="laType" class="form-select item1" name="laType">
					<option value="" selected>게시글 등록 유형</option>
					<option value="find">목격</option>
					<option value="lost">실종</option>
					<option value="null">보호중null</option>
					<option value="null">완료null</option>
				</select> <input type="text" name="aniName" id="input_aniName"
					class="form-control item1" placeholder="반려동물 이름"> <select
					id="laUpkind" class="form-select item1" name="upkind">
					<option value="" selected>반려동물 대분류</option>
					<option value="개">개</option>
					<option value="고양이">고양이</option>
					<option value="기타">다른 동물</option>
				</select> <input type="text" name="kind" id="input_kind"
					class="form-control item1" placeholder="반려동물 소분류"> <input
					type="text" name="color" id="input_color"
					class="form-control item1" name="color" placeholder="동물 털색">
				<select id="laSize" class="form-select item1" name="laSize">
					<option value="" selected>동물 사이즈</option>
					<option>대형</option>
					<option>중형</option>
					<option>소형</option>
				</select> <select id="isTag" class="form-select item1" name="isTag">
					<option value="" selected>인식표 여부</option>
					<option>인식표 있음</option>
					<option>인식표 없음</option>
				</select> <select id="sex" class="form-select item1" name="sex">
					<option value="" selected>성별</option>
					<option>수컷</option>
					<option>암컷</option>
				</select>
				<div class="item1"></div>
			</section>

			<!-- section2 박스: 게시글 내용, 장소 자동 채워지는 place, 2개 2줄-->
			<section class="container-section2 b">
				<div class="item2">
					<textarea class="form-control item2"
						id="exampleFormControlTextarea1" rows="5" placeholder="특징 및 내용 "></textarea>
				</div>
				<input type="text" name="place" id="input_place"
					class="form-control item2" placeholder="제보위치">
			</section>

			<!-- 사진 등록 버튼 : 3개까지 한 줄..-->
			<div class='row'>
				<div class='col-4 g-4'>
					<button class='remove' onclick=''>
						<i class="bi bi-file-minus"></i>
					</button>
					<img class="img-fluid"
						src='data:image/jpeg;base64,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'>
				</div>

				<div class='col-4 g-4'>
					<button class='remove' onclick=''>
						<i class="bi bi-file-minus"></i>
					</button>
					<img class="img-fluid"
						src='data:image/jpeg;base64,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'>
				</div>

				<div class='col-4 g-4 mb-3'>
					<label for="formFileMultiple" class="form-label">사진 추가</label> <input
						class="form-control" type="file" id="formFileMultiple" multiple>
				</div>
		</form>
	</div>


	<!-- Optional JavaScript; choose one of the two! -->

	<!-- Option 1: Bootstrap Bundle with Popper -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"></script>

	<!-- Option 2: Separate Popper and Bootstrap JS -->

	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js"
		integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js"
		integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13"
		crossorigin="anonymous"></script>
</body>
</html>