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
//= require_tree .
//= require bootstrap-sprockets

function remove_fields(link) {  
    // $(link).previous("input[type=hidden]").value = "1";  
    // $(link).up(".fields").hide();  
	// 1
	$(link).prevAll("input[type=hidden]").first().val("1");

	// 2
	$(link).closest(".fields").hide();
	// Or: $(link).parents(".fields").first().hide();
	// Or: $(link).parent().closest(".fields").first().hide();

}