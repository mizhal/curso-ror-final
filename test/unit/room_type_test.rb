require 'test_helper'

class RoomTypeTest < ActiveSupport::TestCase

  test "validaciones" do
    ## unidad del nombre de habitacion en un mismo establecimiento

    r1 = room_types(:nombre_duplicado1)
    assert !r1.valid?
    r2 = room_types(:individual1_cena)
    assert r2.valid?, r2.errors.full_messages.join("\n")
    
    ## r3 no esta duplicado porque esta en otro establecimiento
    r3 = room_types(:nombre_NO_duplicado1)
    assert r2.valid?, r2.errors.full_messages.join("\n")    
  end

end
