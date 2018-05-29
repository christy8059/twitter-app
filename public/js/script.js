$(function() {
    $('.submit').hide()
    $('.tweetText').hide()
    $('.followerCheck').hide()
    $('.timer').hide()
    $('.directMessage').hide()
    $('select').focusout(function() {
        $('.usrname').show()
        $('.tweetText').hide()
        $('.followerCheck').hide()
        $('.timer').hide()
        $('.directMessage').hide()
        var option = document.getElementById("option").value
        if (option == "tweet") {
            $('.tweetText').show("slow")
            $('.submit').show("slow")
        }
        else if (option == "follower") {
            $('.followerCheck').show("slow")
            $('.submit').show("slow")
        }
        else if (option == "retweetTimer") {
            $('.timer').show("slow")
            $('.submit').show("slow")
        }
        else {
            $('.directMessage').show("slow")
            $('.submit').show("slow")
        }
    });
});
