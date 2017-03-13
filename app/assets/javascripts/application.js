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
//= require_tree .
//= require bootstrap.min
//= require filterrific/filterrific-jquery
//= require rails-jquery-tokeninput

// $(function() {
//  $("#post_tags").tokenInput("/posts/tags.json", {
//     prePopulate:       $("#post_tags").data("pre"),
//     preventDuplicates: true,
//     noResultsText:     "No results, needs to be created.",
//     animateDropdown:   false
//  });
// });
$(document).ready(function(){
   //$(".replace_destroy").text("Delete");
   //$(".replace_destroy").prepend('<span class="glyphicon glyphicon-remove" style="top:1px"></span>&nbsp;');
   $(".readmore-allpost").text("Read More");
   
   $(".comments-reply-container form.new_comment").hide();
   $(".get-reply-option-btn").click(function(){
      
      if($(this).parents(".comments-reply-container").find("form.new_comment").css('display') == 'none'){
          $(this).parents(".comments-reply-container").find("form.new_comment").show(10);
      }
      else{
          $(this).parents(".comments-reply-container").find("form.new_comment").hide(10);
      }
     
   });
   
   if($(window).width() > 786){
      
      $(".single_postliker").css("height",$(".single-description-para").height() + 5);
      if($(".single-description-para").height() <= 90){
         $(".single_postliker").css("height",90);
      }
   }
   
});