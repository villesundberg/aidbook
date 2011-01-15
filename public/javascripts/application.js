// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

    $(document).ready(function () {
        //hide the all of the element with class msg_body
        $(".msg_body").hide();
        //toggle the componenet with class msg_body
        $(".msg_head").click(function () {
            $(this).next(".msg_body").slideToggle(600);
        });
    });
