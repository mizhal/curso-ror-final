require 'test_helper'

class ProvinceTest < ActiveSupport::TestCase

  test "validaciones" do
    ## unidad de nombre dentro del pais
    p1 = provinces(:asturias2)
    assert !p1.valid?, "Nombre duplicado dentro del pais, deberia fallar"
    
    p2 = provinces(:asturias_de_portugal)
    assert p2.valid?, "Existe otra prov. con el mismo nombre, pero en otro pais, no deberia fallar"
    
  end
  
end
