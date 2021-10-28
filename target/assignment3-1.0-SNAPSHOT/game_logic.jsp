<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<html>

<!doctype html>
<html>
<head>
    <meta charset="utf-8">
    <title>Game</title>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"
            integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
    <link
            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css"
            rel="stylesheet"
    />
    <link
            href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap"
            rel="stylesheet"
    />
    <link
            href="${pageContext.request.contextPath}/css/mdb.min.css"
            rel="stylesheet"
    />
    <link
            href="${pageContext.request.contextPath}/css/main.css"
            rel="stylesheet"
    />
</head>
<body>
<script>
    $(document).ready(function () {
        $("html, body").animate({
            scrollTop: $(
                'html, body').get(0).scrollHeight
        }, 1000);
    });

    var firstCardSelected = false;
    var leftAttempts = 4;
    var score = 0;
    var card1Pos = null;
    var card1Val = null;
    var card2Pos = null;
    var card2Val = null;
    var game_id = "${game.id}";
    var block_click = false;
    var getUrl = window.location;
    var baseUrl = getUrl.protocol + "//" + getUrl.host + "/" + getUrl.pathname.split('/')[1];

    function checkCard(cardPos) {
        if (!block_click) {
            if (!firstCardSelected) {

                $.ajax({
                    url: baseUrl + "/getCardPosition?gameId=" + game_id + "&cardNumber=" + cardPos,
                    type: "GET",
                    contentType: "application/json",
                    success: function (result) {
                        console.log("result: " + result.cardValue);
                        firstCardSelected = true;
                        card1Val = result.cardValue;
                        card1Pos = cardPos;
                        changePicture(cardPos, card1Val);
                    },
                    error: function (result) {
                        console.log("Error");
                        console.log(result.cardValue);
                    }
                });
            } else {
                $.ajax({
                    url: baseUrl + "/getCardPosition?gameId=" + game_id + "&cardNumber=" + cardPos,
                    type: "GET",
                    contentType: "application/json",
                    success: function (result) {
                        console.log("result: " + result.cardValue);
                        card2Val = result.cardValue;
                        card2Pos = cardPos;
                        changePicture(cardPos, card2Val);
                        firstCardSelected = false;
                        if (card1Val == card2Val) {
                            score = score + (2 * card1Val);
                            document.getElementById("score").innerHTML = score;
                            leftAttempts--;
                            document.getElementById("leftAttempts").innerHTML = leftAttempts;
                            card1Pos = null;
                            card1Val = null;
                            card2Pos = null;
                            card2Val = null;
                            if (leftAttempts == 0) {
                                endGame();
                            }
                        } else {
                            score--;
                            document.getElementById("score").innerHTML = score;
                            block_click = true;
                            setTimeout(function () {
                                resetPicture(card2Pos);
                                resetPicture(card1Pos);
                                leftAttempts--;
                                document.getElementById("leftAttempts").innerHTML = leftAttempts;
                                card1Pos = null;
                                card1Val = null;
                                card2Pos = null;
                                card2Val = null;
                                if (leftAttempts == 0) {
                                    endGame();
                                }
                                block_click = false;
                            }, 2000);
                        }
                    },
                    error: function () {
                        console.log("Error");
                    }
                });
            }
        }
    }

    function endGame() {
        $.ajax({
            url: baseUrl + "/updateGameScore?gameId=" + game_id + "&score=" + score,
            type: "POST",
            success: function (result) {
                console.log(result);
                $("#gameOverModal").modal({backdrop: 'static', keyboard: false});

                setTimeout(function () {
                    window.location.replace(baseUrl + "/home");
                }, 3000);
            },
            error: function (error) {
                console.log("Error")
                console.log(error);
            }
        });
    }

    function resetPicture(cardPos) {
        console.log("Resetting card " + cardPos);
        document.getElementById("card" + cardPos).innerHTML = "<img class=\"container-sm game-card-img\" style=\"padding:0px;\"" +
            " src=\"img/playing-card.png\" alt=\"card" + cardPos + "\"> <a href=\"#!\" onclick=\"checkCard(" + cardPos +
            ")\"> <div class=\"mask\" style=\"background-color: rgba(251, 251, 251, 0.4)\"></div></a>";
    }

    function changePicture(cardPos, number) {
        document.getElementById("card" + cardPos).innerHTML = "<img " +
            "class=\"container-sm game-card-img\" style=\"padding:0px;\" src=\"img/" + number + ".png\">";
    }
</script>
<script
        type="text/javascript"
        src="${pageContext.request.contextPath}/js/mdb.min.js"
></script>
</body>