$(document).ready(function() {

    //Search Bar

    var $search = $("input[name='q']");

    $("span[name='aur']").click(function() {
        var curr = $search.val();
        $search.val("!aur " + curr);
        $search.focus();
    });

    $("span[name='r']").click(function() {
        var curr = $search.val();
        $search.val("!reddits " + curr);
        $search.focus();
    });

    $("span[name='yt']").click(function() {
        var curr = $search.val();
        $search.val("!youtube " + curr);
        $search.focus();
    });

    $("span[name='gp']").click(function() {
        var curr = $search.val();
        $search.val("!googleplay" + curr);
        $search.focus();
    });

    //Tabs

    $(".stripe").mouseenter(function() {
        $(this).stop().animate({
            width: '100vw'
        });
        $(this).find(".content").stop().fadeIn().children().show();
    });

    $(".stripe").mouseleave(function() {
        $(this).stop().animate({
            width: '40px'
        });
        $(this).find(".content").stop().fadeOut();
    });

});
