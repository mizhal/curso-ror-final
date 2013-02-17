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
 * Evitar que se envie el un formulario al pulsar enter
 * en una entrada
 */
function avoid_enter_key_in_forms(){
	$('form input').keydown(function(event){
		if(event.keyCode == 13) {
	    	event.preventDefault();
	    	$(this).change();
	    	return false;
		}
	});
}

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
function get_full_address(section /* :jQueryNode*/){
	return section.find('.input-gmaps-feedback-address').val() + " " + 
		section.find('.input-gmaps-feedback-city').val() + " " +
		section.find('.combo-gmaps-feedback-administrative-unit').children('option:selected').text() + " " +
		section.find('.combo-gmaps-feedback-country').children('option:selected').text()
}

/***
 * 
 */
function GMapsSyncedFields(){
	this.section = null;	
}

GMapsSyncedFields.prototype = {
	
	update_lat_lng_fields: function(position){
		this.section.find('.input-gmaps-feedback-latitude')
			.val(position.lat());
		this.section.find('.input-gmaps-feedback-longitude')
			.val(position.lng());	
		
	},
	
	setup: function(){
		this.section = $('div.location-section');
		this.marker = this.get_current_marker();
		
		// sincroniza marcador con las inputs de latitud y longitud
		this.bind_marker_to_inputs();
		
		var self = this;
		// sincroniza la input de longitud con el marcador
		this.section.
			find('.input-gmaps-feedback-longitude').
			on("change",function(){
				self.update_marker_lng($(this).val());	
			});
		// sincroniza la input de latitud con el marcador
		this.section.
			find('.input-gmaps-feedback-latitude').
			on("change",function(){
				self.update_marker_lat($(this).val());	
			});
	},
	
	get_current_marker: function(){
		if(Gmaps.map.markers.length > 0)
			return Gmaps.map.markers[0].serviceObject;
		else
			return new google.maps.Marker({map: map});
	},
	
	update_marker_lng: function(new_lng){
		var position = this.marker.getPosition();
		var new_position = new google.maps.LatLng(position.lat(), new_lng, false);
		
		marker.setPosition(new_position);
		map.setCenter(new_position);
	},
	
	update_marker_lat: function(new_lat){
		var position = this.marker.getPosition();
		var new_position = new google.maps.LatLng(new_lat, position.lng(), false);
		
		marker.setPosition(new_position);
		map.setCenter(new_position);
	},
	
	bind_marker_to_inputs: function(){
		// sincroniza el marker con las entradas
		var self = this;
		google.maps.event.addListener(
			this.marker, 
			'dragend', 
			function(pos) {
				self.update_lat_lng_fields(pos.latLng);
			}
		);
	},
	
	geocode: function(){
		var self = this;
		var geocoder = new google.maps.Geocoder();
		geocoder.geocode(
			{'address': this.get_full_address() }, 
			/** onFinish Callback */
			function(results, status) {
				if (status == google.maps.GeocoderStatus.OK) {
					var pos = results[0].geometry.location;
					map.setCenter(pos);
					marker.setPosition(pos);
					map.setZoom(16);
					self.update_lat_lng_fields(section, pos);
				} else {
					self.section.find("gmaps-errors-output")
						.html("Geocoding failed (status: "+ status +")");
				}
			});
	},
	
	get_full_address: function(){
		return this.section.find('.input-gmaps-feedback-address').val() + ", " + 
			this.section.find('.input-gmaps-feedback-city').val() + ", " +
			this.section.find('.combo-gmaps-feedback-administrative-unit').children('option:selected').text() + " region=es"
	}
}

/***
 * 
 * Cambia el valor de los campos de entrada latitud y longitud
 * a una posicion obtenida de la API de google maps.
 * Permite sincronizar el marker con estos campos si es que 
 * cambia el marker
 * 
 */
function update_lat_lng_fields(section /* :jQueryNode */, position /* :google.maps.LatLng */){
	section.find('.input-gmaps-feedback-latitude')
		.val(position.lat());
	section.find('.input-gmaps-feedback-longitude')
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
			marker = Gmaps.map.markers[0].serviceObject;
		else
			marker = new google.maps.Marker({map: map});
		
		// sincroniza el marker con las entradas
		google.maps.event.addListener(
			marker, 
			'dragend', 
			function(pos) {
				update_lat_lng_fields(section, pos.latLng);
			}
		);
		
		// sincroniza las entradas con el marker
		section.find('.input-gmaps-feedback-longitude')
			.on("change",function(){
				var position = marker.getPosition();
				var new_position = new google.maps.LatLng(position.lat(), $(this).val(), false);
				
				marker.setPosition(new_position);
				map.setCenter(new_position);
			});
		section.find('.input-gmaps-feedback-latitude')
			.on("change",function(){
				var position = marker.getPosition();
				var new_position = new google.maps.LatLng($(this).val(), position.lng(), false);
				marker.setPosition(new_position);
				map.setCenter(new_position);
			});
		section.find('.input-gmaps-feedback-address')
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
	        				section.find("gmaps-errors-output")
	        					.html("Geocoding failed (status: "+ status +")");
	      				}
	      			}
	      		);
			});			
	}
}


/**
 * Clase BoundCombos
 * 
 * Permite vincular dos combos y una llamada AJAX de tal manera
 * que al cambiar el valor del primer combo las opciones del segundo
 * se modifican con el resultado de la llamada AJAX parametrizada por
 * el valor del primer combo.
 * 
 * Se espera como resultado de la llamada AJAX un array de objetos de
 * tipo "{id:?, name:?}" formateado en JSON.
 * 
 * 
 * Estructuras de datos de parametros:
 *  options: BoundComboDict:
 * 		- parent :String
 * 			Selector del combo padre, del que se toma el valor de referencia
 * 		- param_name :String
 * 			Nombre del parametro con el que se le envia el valor de referencia 
 * 				al servidor mediante AJAX
 * 		- child :String
 * 			Selector del combo hijo
 * 		- server_action: String
 * 			Path de la accion del servidor que se llamara mediante ajax (siempre GET)
 * 
 */
function BoundCombos(options /* :BoundComboDict */){
	this.options = options	
}

BoundCombos.prototype = {
	setup: function(){
		var self = this;
		$(this.options.parent).on(
			"change", 
			function(){	
				self.update($(this).val());
			}
		);
		/* se invoca por primera vez debido a que los navegadores
		 * conservan los valores de los campos al recargar, por lo que
		 * no es esperable que se quede en el primer valor del combo
		 * padre.
		 * Pero solo en el caso de que el combo hijo no tenga valor.
		 */
		if(! $(this.options.child).val())
			$(this.options.parent).change();
	},
	update: function(reference_value /* :String U Integer U Float */){
		var self = this;
		
		data = {}
		data[this.options.param_name] = reference_value
		
		var request_params = {
			url: this.options.server_action,
			type: 'GET',
			data: data			
		}
		
		$.ajax(request_params).
			done(function(response){
				var child_combo = $(self.options.child);
				child_combo.html("");
				for(var i = 0; i < response.length; i++){
					child_combo.append(
						'<option value="'+ response[i].id + '">' + response[i].name + "</option>"
					);
				}
			}).
			fail(function(){
				alert("Error requesting sub-combo data");
			});
	}
}


/***
 * Fieldsets replegables
 */
function setup_foldable_fieldsets(){
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
}


/******
 * 
 */
function setup_add_more_nested_fields(
		section_selector /* :String */, 
		button_selector /* :String */, 
		template_selector /* :String */,
		nested_forms_list_selector /* :String */,
		nested_form_unit_selector /* :String */
	){
	$( section_selector + " " + button_selector).on("click", function(){
		var section = $(this).closest(section_selector)
		var template = section.find(template_selector).first();
		
		var list = section.find(nested_forms_list_selector);
		list.append(
			render_template(template, {pos: list.find(nested_form_unit_selector).length})
		);
		
		return false;
	});
}

/***
 * 
 */
$(document).ready(function(){
	avoid_enter_key_in_forms();

	//fieldsets replegables
	setup_foldable_fieldsets();

	// funcionalidad de instanciar una plantilla de subformulario
	
	//// para room-types (en accommodations/_form)
	setup_add_more_nested_fields(
		"div.nested-rooms-section",
		"a.add-nested-room-type-form",
		"div.nested-template",
		"div.room-types",
		"div.room-type"
	);
	
	//// para photos (en accommodations/_form y en room_types/_form)
	setup_add_more_nested_fields(
		"div.nested-photos-section",
		"a.add-nested-photo-form",
		"div.nested-template",
		"div.photos",
		"div.photo"
	);
	
	// funcionalidad de gmaps
	
	//// feedback de latitud, longitud y direccion en el formulario de Accommodation
	if($('div.location-section div.location-map').length > 0) { //test: existe el div asociado a la funcionalidad
		setup_gmaps_inputs_feedback();
	}
	
	// combo de categorias
	if($("div.name-section select#toplevel-categories").length > 0){
		var bound_combos_categories = new BoundCombos({
			parent: "div.name-section select#toplevel-categories",
			child: 'div.name-section select[name="accommodation[category_id]"]',
			param_name: "parent_id",
			server_action: "/categories/subcategories"
		});
		bound_combos_categories.setup();
	}
	
	// combo de provincias
	if($("div.location-section select#country-combo").length > 0){
		var bound_combos_provinces = new BoundCombos({
			parent: "div.location-section select#country-combo",
			child: 'div.location-section select[name="accommodation[province_id]"]',
			param_name: "country_id",
			server_action: "/accommodations/provinces"
		});
		bound_combos_provinces.setup();
	}
});
