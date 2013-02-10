# encoding: utf-8
class AddDefaultProvinces < ActiveRecord::Migration
  def up
    spain = Country.find_by_name "España"
    """Álava
Barcelona
Cuenca
León
Navarra
Santa Cruz de Tenerife
Toledo
Albacete
Burgos
Gerona
Lérida
Orense
Cantabria
Valencia
Alicante
Cáceres
Granada
La Rioja
Asturias
Valladolid
Almería
Cádiz
Guadalajara
Segovia
Vizcaya
Ávila
Castellón
Guipúzcoa
Lugo
Palencia
Sevilla
Zamora
Badajoz
Ciudad Real
Huelva
Madrid
Las Palmas
Soria
Zaragoza
Islas Baleares
Córdoba
Huesca
Málaga
Pontevedra
Tarragona
Ceuta
La Coruña
Jaén
Murcia
Salamanca
Teruel
Melilla""".split(/\n+/).each{|province_name|
      Province.create! :name => province_name, :country_id => spain.id
    }
  end

  def down
    
  end
end
