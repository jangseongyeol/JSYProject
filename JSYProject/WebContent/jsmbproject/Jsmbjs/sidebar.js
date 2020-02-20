        jQuery(document).ready(function($) {
            // hide the menu when the page load
            $("#navigation-list1").hide();
            $("#navigation-list2").hide();
            $("#navigation-list3").hide();
            
            $("#navigation-list4").hide();
            $("#navigation-list5").hide();
            // when .menuBtn is clicked, do this
          
            $("#menuBtn1").click(function() {
                // open the menu with slide effect
                
                $("#navigation-list1").slideToggle(300);
            });
            $("#menuBtn2").click(function() {
                    // open the menu with slide effect
                    $("#navigation-list2").slideToggle(300);
                });
            $("#menuBtn3").click(function() {
                    // open the menu with slide effect
                    $("#navigation-list3").slideToggle(300);
                });
            $("#menuBtn4").click(function() {
                    // open the menu with slide effect
                    $("#navigation-list4").slideToggle(300);
                });
            $("#menuBtn5").click(function() {
                // open the menu with slide effect
                $("#navigation-list5").slideToggle(300);
            });
        });