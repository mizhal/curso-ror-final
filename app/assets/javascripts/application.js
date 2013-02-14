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

/***
 * 
 */
function render_template(template_div /* :NodoJQuery */, 
	variables /* :Dict{String -> String} */)
{
	var text = template_div.html();
	for(var key in variables){
		text = text.replace(new RegExp("{{"+ key +"}}", "igm"), variables[key]);
	}
	return text
}

/***
 * 
 */
function get_full_address(section){
	return section.find('input[name="accommodation[city]"]').val() + " " +
		section.find('input[name="accommodation[address]"]').val();
}

/***
 * 
 * Cambia el valor de los campos de entrada latitud y longitud
 * a una posicion obtenida de la API de google maps.
 * Permite sincronizar el marker con estos campos si es que 
 * cambia el marker
 * 
 */
function update_lat_lng_fields(section, position){
	section.find('input[name="accommodation[latitude]"]')
		.val(position.lat());
	section.find('input[name="accommodation[longitude]"]')
		.val(position.lng());	
}

/****
 * 
 * Descripcion:
 * 
 * Cuando el usuario mueve el marcador a mano, se recalculan
 * los campos "latitude" y "longitude" y se establecen a los
 * valores correctos, consistentes con la posicion del marcador
 * 
 * Cuando cambian los campos "city" o "address" el marker se ubica
 * de nuevo en el lugar apropiado
 * 
 * Cuando cambian los campos "latitude" y "longitude" también el
 * marker se reubica
 * 
 */
function setup_gmaps_inputs_feedback(){
	
	/* es necesario esperar a que carge el mapa, tiempo despues de cargada
	 la pagina */
	Gmaps.map.callback = function(){
		
		var section = $('div.location-section');
		var map = Gmaps.map.serviceObject;
		var marker = null;
		if(Gmaps.map.markers.length > 0)
			var marker = Gmaps.map.markers[0].serviceObject;
		else
			var marker = new google.maps.Marker({map: map});
		
		// sincroniza el marker con las entradas
		google.maps.event.addListener(
			marker, 
			'dragend', 
			function(pos) {
				update_lat_lng_fields(section, pos.latLng);
			}
		);
		
		// sincroniza las entradas con el marker
		section.find('input[name="accommodation[longitude]"]')
			.on("change",function(){
				var position = marker.getPosition();
				var new_position = new google.maps.LatLng(position.lat(), $(this).val(), false);
				
				marker.setPosition(new_position);
			});
		section.find('input[name="accommodation[latitude]"]')
			.on("change",function(){
				var position = marker.getPosition();
				var new_position = new google.maps.LatLng($(this).val(), position.lng(), false);
				marker.setPosition(new_position);
			});
		section.find('input[name="accommodation[address]"]')
			.on("change",function(){
				var geocoder = new google.maps.Geocoder();
				geocoder.geocode(
					{'address': get_full_address(section) }, 
					/** onFinish Callback */
					function(results, status) {
	      				if (status == google.maps.GeocoderStatus.OK) {
	      					var pos = results[0].geometry.location;
	        				map.setCenter(pos);
	        				marker.setPosition(pos);
	        				map.setZoom(16);
	        				update_lat_lng_fields(section, pos);
	      				} else {
	        				alert("Geocode was not successful for the following reason: " + status);
	      				}
	      			}
	      		);
			});			
	}
}

/***
 * 
 */
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
	
	//// para room-types
	$("div.nested-rooms-section a.add-nested-room-type-form").on("click", function(){
		var section = $(this).closest("div.nested-rooms-section")
		var template = section.find("div.nested-template").first();
		
		var list = section.find("div.room-types")
		list.append(
			render_template(template, {pos: list.find("div.room-type").length})
		);
		
		return false;
	});
	
	//// para photos
	$("div.nested-photos-section a.add-nested-photo-form").on("click", function(){
		var section = $(this).closest("div.nested-photos-section")
		var template = section.find("div.nested-template").first();
		
		var list = section.find("div.photos")
		list.append(
			render_template(template, {pos: list.find("div.photo").length})
		);
		
		return false;
	});
	
	// funcionalidad de gmaps
	
	//// feedback de latitud, longitud y direccion en el formulario de Accommodation
	if($('div.gmaps-location-form-feedback').length > 0) { //test: existe el div asociado a la funcionalidad
		setup_gmaps_inputs_feedback();
	}
});
