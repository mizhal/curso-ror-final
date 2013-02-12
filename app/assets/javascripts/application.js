// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require twitter/bootstrap
//= require_tree .

function render_template(template_div /* :NodoJQuery */, 
	variables /* :Dict{String -> String} */)
{
	var text = template_div.html();
	for(var key in variables){
		text = text.replace(new RegExp("{{"+ key +"}}", "igm"), variables[key]);
	}
	return text
}

$(document).ready(function(){

	//fieldsets replegables
	$("legend.foldable").on("click", function(){
		var siblings = $(this).siblings()
		siblings.toggle();
		var dots = $(this).find("span.dots");
		if (dots.length < 1){ 
			$(this).append('<span class="dots">...</span>');
			dots = $(this).find("span.dots");
			dots.hide();
		}
		if (!siblings.is(":visible"))
			dots.show();
		else
			dots.hide();
	});

	// funcionalidad de instanciar una plantilla de subformulario
	$("div.nested-room-section a.add-nested-room-type-form").on("click", function(){
		var section = $(this).closest("div.nested-room-section")
		var template = section.find("div.nested-template").first();
		
		var list = section.find("div.room-types")
		list.append(
			render_template(template, {pos: list.find("div.room-type").length})
		);
		
		return false;
	});
	
});