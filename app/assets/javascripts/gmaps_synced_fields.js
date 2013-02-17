/****
 * clase GMapsSyncedFields
 * 
 * Esta clase sincroniza un mapa de Google Maps generado con la
 * gema 'gmaps4rails', con una serie de inputs de formulario
 * que deben tener una clase determinada y algunos atributos data
 * necesarios para reconocerlas.
 * 
 * Las input que esten sincronizadas con el mapa deben tener la 
 * clase 'gmaps-feedback-input'. Además deben tener un atributo
 * 'data-gmapsfield' que indicara que campo de los posibles
 * contiene cada input.
 * Los campos contemplados por el momento son:
 *  - latitude
 *  - longitude
 *  - city
 *  - address
 *  - country
 *  - administrative-unit (para provincias u otros niveles intermedios)
 * 
 * 
 * Descripcion:
 * 
 * Se asegura que al modificar las entradas marcadas con la clase
 * mencionada, el marcador se desplazará adecuadamente, siempre que tenga
 * información suficiente. 
 * Por ejemplo, para que se desplace el marcador sería necesario dar
 * la latitud o longitud o en el caso de dar una dirección, tener la 
 * ciudad y la dirección al menos para tener datos suficientes.
 * 
 * 
 */
function GMapsSyncedFields(){
	this.section = null;	
	this.known_inputs = null;
	this.map = null;
}

GMapsSyncedFields.prototype = {
	
	/***
	 * 
	 * Cambia el valor de los campos de entrada latitud y longitud
	 * a una posicion obtenida de la API de google maps.
	 * Permite sincronizar el marker con estos campos si es que 
	 * cambia el marker
	 * 
	 */
	update_lat_lng_fields: function(position){
		this.section.find('input.gmaps-feedback-input[data-gmapsfield="latitude"]')
			.val(position.lat());
		this.section.find('input.gmaps-feedback-input[data-gmapsfield="longitude"]')
			.val(position.lng());	
	},
	
	/***
	 * Actualiza el marcador cuando cambien las entradas
	 */
	setup_inputs_onchange: function(){
		var self = this;
		this.known_inputs = this.section.find(".gmaps-feedback-input");
		this.known_inputs.filter("input").on(
			"change", 
			function(){
				var field = $(this).attr("data-gmapsfield");
				var value = $(this).val();
				self.update_marker(field, value);
			}
		);
		
		this.known_inputs.filter("select").on(
			"change", 
			function(){
				var field = $(this).attr("data-gmapsfield");
				var value = $(this).children('option:selected').text();
				self.update_marker(field, value);				
			}
		);
	},
	
	/**
	 * Pone a punto todos los manejadores de eventos.
	 * Debe invocarse siempre
	 */
	setup: function(){
		var self = this;
		Gmaps.map.callback = function(){
			self.map = Gmaps.map.serviceObject;
			self.section = $('div.location-section');
			self.marker = self.get_current_marker();
			
			// sincroniza las input con el marcador
			self.setup_inputs_onchange();
			
			// sincroniza marcador con las inputs de latitud y longitud
			self.bind_marker_to_inputs();
		}
	},
	
	/**
	 * Realiza la actualizacion de la posicion del marcador
	 */
	update_marker: function(field /* :String */, value /* :any */){
		if($.inArray(field, ['country', 'administrative-unit','city', 'address']) != -1){
			this.update_marker_from_address();
		} else if (field == 'latitude') {
			this.update_marker_lat(value);
		} else if (field == 'longitude') {
			this.update_marker_lng(value);
		} else {
			throw "Unknown GMaps field in data-gmapsfield (html id="+ $(this).attr('id') +")";
		}
	},
	
	/**
	 * Obtiene el marcador (el primero) que haya en el mapa y si no
	 * hay crea uno (que ademas se puede mover con el raton)
	 */
	get_current_marker: function(){
		if(Gmaps.map.markers.length > 0)
			return Gmaps.map.markers[0].serviceObject;
		else
			return new google.maps.Marker(
				{
					map: this.map, 
					position: new google.maps.LatLng(1, 1, false),
					draggable: true
				}
			);
	},
	
	/**
	 * Modifica la longitud de la posicion del marcador
	 */
	update_marker_lng: function(new_lng){
		var position = this.marker.getPosition();
		var new_position = new google.maps.LatLng(position.lat(), new_lng, false);
		
		this.marker.setPosition(new_position);
		this.map.setCenter(new_position);
	},
	
	/**
	 * Modifica la latitud de la posicion del marcador
	 */
	update_marker_lat: function(new_lat){
		var position = this.marker.getPosition();
		var new_position = new google.maps.LatLng(new_lat, position.lng(), false);
		
		this.marker.setPosition(new_position);
		this.map.setCenter(new_position);
	},
	
	
	/**
	 * Causa que al soltar el marcador tras agarrarlo con el raton
	 * las entradas de latitud y longitud tomen los valores adecuados
	 * a la nueva posicion
	 */
	bind_marker_to_inputs: function(){
		var self = this;
		google.maps.event.addListener(
			this.marker, 
			'dragend', 
			function(pos) {
				self.update_lat_lng_fields(pos.latLng);
			}
		);
	},
	
	/**
	 * Utiliza el servicio de geocodificacion de google maps
	 * para convertir una direccion en una posicion en el mapa
	 */
	update_marker_from_address: function(){
		var self = this;
		var geocoder = new google.maps.Geocoder();
		var address = this.get_full_address();
		if(address == null) return;
		geocoder.geocode(
			{'address':  address}, 
			/** onFinish Callback */
			function(results, status) {
				self.on_finish_geocoding(results, status);
			});
	},
	
	/**
	 * Funcion manejadora que procesa el resultado de la operacion
	 * de geocodificacion
	 */
	on_finish_geocoding: function(results, status) {
		if (status == google.maps.GeocoderStatus.OK) {
			var pos = results[0].geometry.location;
			this.map.setCenter(pos);
			this.marker.setPosition(pos);
			this.map.setZoom(16);
			this.update_lat_lng_fields(pos);
			this.section.find(".gmaps-errors-output")
				.html("");
		} else if (status == 'ZERO_RESULTS'){
			this.section.find(".gmaps-errors-output")
				.html("Unknown address");
		} else {
			this.section.find(".gmaps-errors-output")
				.html("Geocoding failed (status: "+ status +")");
		}		
	},
	
	/**
	 * Construye la direccion completa a partir de las entradas
	 * para enviar al servicio de geocodificacion
	 */
	get_full_address: function(){
		var inputs = $('.gmaps-feedback-input');
		try {
			return this.input_get('address', true) + " " + 
				this.input_get('city', true) + " " +
				this.select_get('administrative-unit', true)
		} catch (error) {
			//ignorar, deben estar todos los campos para que 
			//prosiga el proceso
			return null;
		}
	},
	
	/***
	 * Lee una entrada de tipo input, que en su atributo 
	 * data-gmapsfied tenga un valor igual al parametro
	 * 'field_name'
	 * Si required es cierto, la funcion lanza una excepcion
	 * cuando no haya valores del campo buscado
	 */
	input_get: function(field_name, required) {
		var found = this.known_inputs
			.filter("input[data-gmapsfield='" + field_name + "']");
		if(found.length < 1 && required) throw "not found gmapsfield " + field_name;
		else {
			var val = found.val();
			if(!val && required) throw "not found gmapsfield " + field_name;
			else return val;
		}
	},

	/***
	 * Lee una entrada de tipo select, que en su atributo 
	 * data-gmapsfied tenga un valor igual al parametro
	 * 'field_name'
	 * Si required es cierto, la funcion lanza una excepcion
	 * cuando no haya valores del campo buscado
	 */	
	select_get: function(field_name, required) {
		var found = this.known_inputs
			.filter("select[data-gmapsfield='" + field_name + "']");
		if(found.length < 1 && required) throw "not found gmapsfield " + field_name;
		else {
			var val = found.children('option:selected').text();
			if(!val && required) throw "not found gmapsfield " + field_name;
			else return val;
		}
	}
}