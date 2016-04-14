// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks

//= require bootstrap-sprockets

var ready = function () {
    var counter_pounter = 0;

    $("#clicker").on("click", function () {
        $(".target").first().toggleClass("fancy-spancy");
        console.log("Boink!")
    });

    $("h1").on("click", function () {
        counter_pounter ++;
        console.log("There have been " + counter_pounter + " pokes.")
    });

    console.log("It loaded brah")
};

$(document).ready(ready);
$(document).on("page:load", ready);

//= require_tree .
