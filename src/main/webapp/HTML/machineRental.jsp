<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>농기계 임대 장소 지도</title>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="css/container.css" type="text/css" />
    <link rel="stylesheet" href="css/side.css" type="text/css" />
    <link rel="stylesheet" href="css/board.css" type="text/css" />
    <title>공지사항내용2</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&family=Nanum+Myeongjo&display=swap" rel="stylesheet">
    <style>*{font-family: 'Nanum Gothic', sans-serif;}</style>
</head>
<body>

<%
    String userID = null;

    if (session.getAttribute("userID") != null) {
        userID = (String) session.getAttribute("userID");
    }

    int pageNumber = 1; //기본 페이지 1로 설정

    if (request.getParameter("pageNumber") != null) {
        pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
    }

%>
<header>
    <%
        String userid = (String)session.getAttribute("userID");
        if(userid == null){
    %>
    <div class="login-bar">
        <a href="../HTML(동빈)/html/login.html">로그인 / 회원가입</a>

    </div>
    <%
    }else{
    %>
    <div class="login-bar">
        <a><span style="color: black"><%= userid%>님</span></a><br>
        <a href="../../logoutAction.jsp">로그아웃</a>
    </div>
    <%
        }
    %>  <div class="logo">
    <a href="../HTML(동빈)/html/index.jsp">
        <img src="images/logo.png" alt="logo"><h1>꿀농</h1></a>
</div>
    <div class="rightHeader">
        <div class="search-bar">
            <form>
                <input type="text" class="input-search" placeholder="검색어를 입력하세요." />
                <input type="submit" class="input-search-submit" value="" />
            </form>
        </div>
    </div>
    <nav>
        <div class="nav-fir">
            <!------------네비 삼단버튼-------------->

            <div class="nav-sidebar-box">
                <input type="checkbox" id="menuicon">
                <label for="menuicon">
                    <span></span>
                    <span></span>
                    <span></span>
                </label>
                <div class="sidebar">
                    <ul class="sidebar-ul">
                        <li><a href="alamBoard.jsp">알림/소식</a>
                            <ul class="sidebar-li">
                                <li><a href="alamBoard.jsp">공지사항</a></li>
                                <li><a href="noteBoard.jsp">게시판</a></li>
                            </ul>
                        </li>
                        <li><a href="machineRental.jsp">농기구</a>
                            <ul class="sidebar-li">
                                <li><a href="machineRental.jsp">기구 대여</a></li>
                            </ul>
                        </li>
                        <li><a href="Crop.jsp">작물·재배법</a>
                            <ul class="sidebar-li">
                                <li class="desc"><a href="Crop.jsp">-농작물 관련</a></li>
                                <li class="desc"><a href="#1">-반려 작물 관련</a></li>
                                <li><a href="#2">밭 관리법</a></li>
                                <li class="desc"><a href="#1">-텃밭 관련</a></li>
                                <li class="desc"><a href="#1">-화분 관련</a></li>
                            </ul>
                        </li>
                        <li><a href="html/useExBoard.html">이용안내</a>
                            <ul class="sidebar-li">
                                <li><a href="html/privacyBoard.html">개인정보처리방침</a></li>
                                <li><a href="html/useExBoard.html">사이트 이용안내</a></li>
                            </ul>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
        <!------------네비 메뉴나열-------------->

        <div class="nav-left">
            <ul class="nav-menu">
                <li><a href="alamBoard.jsp">알림/소식</a>
                    <ul class="submenu">
                        <li><a href="alamBoard.jsp">공지사항</a></li>
                        <li><a href="noteBoard.jsp">게시판</a></li>
                    </ul>
                </li>
                <li><a href="machineRental.jsp">농기구</a>
                    <ul class="submenu">
                        <li><a href="machineRental.jsp">기구 대여</a></li>
                    </ul>
                </li>
                <li><a href="Crop.jsp">작물·재배법</a>
                    <ul class="submenu">
                        <li><a href="Crop.jsp">작물 재배법</a></li>
                        <li><a href="#2">밭 관리법</a></li>
                    </ul>
                </li>
                <li><a href="html/useExBoard.html">이용안내</a>
                    <ul class="submenu">
                        <li><a href="html/privacyBoard.html">개인정보처리방침</a></li>
                        <li><a href="html/useExBoard.html">사이트 이용안내</a></li>
                    </ul>
                </li>
            </ul>
        </div>
    </nav>
</header><!--헤더 end-->

<p style="margin-top:50px">
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <b>현재 지도가 완벽 지원하지 않습니다 참고해주세요.</b><br>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <b>지도 축소 했을 시 간략적인 위치 표시 해놨습니다.</b>
</p>
<div id="map" style="top:50%;left:5%;width:90%;height:550px;"></div>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=6a2fb893550d1572a10c00fb049a3ea0"></script>
<script>
    var mapContainer = document.getElementById('map'), // 지도를 표시할 div
        mapOption = {
            center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
            level: 5 // 지도의 확대 레벨
        };

    var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

    // HTML5의 geolocation으로 사용할 수 있는지 확인합니다
    if (navigator.geolocation) {

        // GeoLocation을 이용해서 접속 위치를 얻어옵니다
        navigator.geolocation.getCurrentPosition(function(position) {

            var lat = position.coords.latitude, // 위도
                lon = position.coords.longitude; // 경도

            var locPosition = new kakao.maps.LatLng(lat, lon), // 마커가 표시될 위치를 geolocation으로 얻어온 좌표로 생성합니다
                message = '<div style="padding:1px;">현재 위치</div>'; // 인포윈도우에 표시될 내용입니다

            // 마커와 인포윈도우를 표시합니다
            displayMarker(locPosition, message);

        });

    } else { // HTML5의 GeoLocation을 사용할 수 없을때 마커 표시 위치와 인포윈도우 내용을 설정합니다

        var locPosition = new kakao.maps.LatLng(33.450701, 126.570667),
            message = 'geolocation을 사용할수 없어요..'

        displayMarker(locPosition, message);
    }

    var locationArr =[[38.05881329,128.1659613], [37.94554815,128.3122705], [36.7452333,127.2247618],
        [36.89851218,127.2083234], [35.03744961,128.0673333], [35.11533461,128.4616011], [35.35289845,128.664357],
        [35.11399909,128.7543128], [37.0468328,127.9303298], [36.97762275,127.8062796], [36.9456828,127.8835892],
    ]

    // 지도에 마커와 인포윈도우를 표시하는 함수입니다
    function displayMarker(locPosition, message) {
        // 마커를 생성합니다
        var marker = new kakao.maps.Marker({
            map: map,
            position: locPosition
        });

        var iwContent = message, // 인포윈도우에 표시할 내용
            iwRemoveable = true;
        // 인포윈도우를 생성합니다
        var infowindow = new kakao.maps.InfoWindow({
            content : iwContent,
            removable : iwRemoveable
        });
        // 인포윈도우를 마커위에 표시합니다
        infowindow.open(map, marker);
        // 지도 중심좌표를 접속위치로 변경합니다
        map.setCenter(locPosition);
    }

    var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

    // 마커를 표시할 위치와 title 객체 배열입니다
    var positions = [

        <%
            /*for(int i = 0; i < 300; i++)  {
                for(int j = 0; j <= 1; j++)  {

                   latlng: new kakao.maps.LatLng(locationArr[i][j], locationArr[i][j+1])
                }
                System.out.println("\n");
            } */
        %>


        {
            latlng: new kakao.maps.LatLng(locationArr[0][0], locationArr[0][1])

        },
        {
            latlng: new kakao.maps.LatLng(locationArr[1][0], locationArr[1][1])
        },
        {
            latlng: new kakao.maps.LatLng(locationArr[2][0], locationArr[2][1])
        },
        {
            latlng: new kakao.maps.LatLng(35.03744961,128.0673333)
        },
        {
            latlng: new kakao.maps.LatLng(35.11533461,128.4616011)
        },
        {
            latlng: new kakao.maps.LatLng(35.35289845,128.7543128)
        },
        {
            latlng: new kakao.maps.LatLng(35.11399909,128.7543128)
        },
        {
            latlng: new kakao.maps.LatLng(37.0468328,127.9303298)
        },
        {
            latlng: new kakao.maps.LatLng(36.97762275,127.8062796)
        },
        {
            latlng: new kakao.maps.LatLng(36.9456828,127.8835892)
        },
        {
            latlng: new kakao.maps.LatLng(37.0862831,127.7995434)
        },
        {
            latlng: new kakao.maps.LatLng(36.93457205,129.240293)
        },
        {
            latlng: new kakao.maps.LatLng(35.7095182,126.6592985)
        },
        {
            latlng: new kakao.maps.LatLng(35.961757,129.4138238)
        },
        {
            latlng: new kakao.maps.LatLng(36.11357755,129.3049275)
        },
        {
            latlng: new kakao.maps.LatLng(36.8348597,126.270938)
        },
        {
            latlng: new kakao.maps.LatLng(35.23963396,127.4437551)
        },
        {
            latlng: new kakao.maps.LatLng(34.86111813,126.2992816)
        },
        {
            latlng: new kakao.maps.LatLng(35.06837214,126.2127367)
        },
        {
            latlng: new kakao.maps.LatLng(35.0846543,126.1098586)
        },
        {
            latlng: new kakao.maps.LatLng(37.84332265,126.9980277)
        },
        {
            latlng: new kakao.maps.LatLng(37.64977718,126.8700851)
        },
        {
            latlng: new kakao.maps.LatLng(37.17591657,127.4402069)
        },
        {
            latlng: new kakao.maps.LatLng(37.12032373,127.6112318)
        },
        {
            latlng: new kakao.maps.LatLng(37.93534778,126.8655254)
        },
        {
            latlng: new kakao.maps.LatLng(37.49630501,128.8536074)
        },
        {
            latlng: new kakao.maps.LatLng(35.213225,128.9867234)
        },
        {
            latlng: new kakao.maps.LatLng(37.17229221,127.2992797)
        },
        {
            latlng: new kakao.maps.LatLng(35.25230124,126.9055414)
        },
        {
            latlng: new kakao.maps.LatLng(35.083142,126.809141)
        },
        {
            latlng: new kakao.maps.LatLng(37.43194566,127.2343488)
        },
        {
            latlng: new kakao.maps.LatLng(33.4592643,126.4036806)
        },
        {
            latlng: new kakao.maps.LatLng(33.28797192,126.6077967)
        },
        {
            latlng: new kakao.maps.LatLng(33.51094222,126.8426837)
        },
        {
            latlng: new kakao.maps.LatLng(33.35346624,126.2476976)
        }
    ];

    // 지도에 마커와 인포윈도우를 표시하는 함수입니다
    function displayMarker(locPosition, message) {
        // 마커를 생성합니다
        var marker = new kakao.maps.Marker({
            map: map,
            position: locPosition
        });

        var iwContent = message, // 인포윈도우에 표시할 내용
            iwRemoveable = true;
        // 인포윈도우를 생성합니다
        var infowindow = new kakao.maps.InfoWindow({
            content : iwContent,
            removable : iwRemoveable
        });
        // 인포윈도우를 마커위에 표시합니다
        infowindow.open(map, marker);
        // 지도 중심좌표를 접속위치로 변경합니다
        map.setCenter(locPosition);
    }
    // 마커 적용 예시 2222
    var map = new kakao.maps.Map(mapContainer, mapOption);

    // 마커가 표시될 위치입니다
    var markerPosition  = new kakao.maps.LatLng(locationArr[1][0],locationArr[1][1]);

    // 마커를 생성합니다
    var marker = new kakao.maps.Marker({
        position: markerPosition
    });

    // 마커가 지도 위에 표시되도록 설정합니다
    marker.setMap(map);

    var iwContent = '<div style="padding:5px;">Hello World! <br> ' +
            '<a href="https://map.kakao.com/link/to/Hello World!,${locationArr[1][0]}, ${locationArr[1][1]}" style="color:blue" target="_blank">길찾기</a></div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
        iwPosition = new kakao.maps.LatLng(locationArr[1][0],locationArr[1][1]); //인포윈도우 표시 위치입니다

    // 인포윈도우를 생성합니다
    var infowindow = new kakao.maps.InfoWindow({
        position : iwPosition,
        content : iwContent
    });

    // 마커 위에 인포윈도우를 표시합니다. 두번째 파라미터인 marker를 넣어주지 않으면 지도 위에 표시됩니다
    infowindow.open(map, marker);

    // 마커 이미지의 이미지 주소입니다
    var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png";

    for (var i = 0; i < positions.length; i ++) {

        // 마커 이미지의 이미지 크기 입니다
        var imageSize = new kakao.maps.Size(24, 35);

        // 마커 이미지를 생성합니다
        var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize);

        // 마커를 생성합니다
        var marker = new kakao.maps.Marker({
            map: map, // 마커를 표시할 지도
            position: positions[i].latlng, // 마커를 표시할 위치
            title : positions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
            image : markerImage // 마커 이미지
        });
    }

</script>
</body>
</html>