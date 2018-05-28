$(function() {
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
        }
        else if (option == "follower") {
            $('.followerCheck').show("slow")
        }
        else if (option == "retweetTimer") {
            $('.timer').show("slow")
        }
        else {
            $('.directMessage').show("slow")
        }
    });
});
