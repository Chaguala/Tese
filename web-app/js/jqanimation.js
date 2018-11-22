$(document).ready(function () {
    //	#animation-1
    $("#animation-1 li a").hover(
        function () {
            $(this).animate({ textIndent: "20px" }, 10);

        }, function () {
            $(this).animate({ textIndent: "10px" }, 10);
        });
    //#navegation
    $("#navegation li a").hover(
        function () {
            $(this).animate({ textIndent: "20px" }, 10);

        }, function () {
            $(this).animate({ textIndent: "10px" }, 10);
        });
    //#navegation 2
    $("#navegation li ul li ul li a").hover(
        function () {
            $(this).animate({ textIndent: "20px" }, 10);

        }, function () {
            $(this).animate({ textIndent: "10px" }, 10);
        });
});