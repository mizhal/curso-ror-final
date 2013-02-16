require 'test_helper'

class UserTest < ActiveSupport::TestCase

  test "validaciones" do
    ## unicidad del email
    u1 = users(:mail_duplicado1)
    assert !u1.valid?, "El email esta duplicado y la validacion deberia fallar"
  end

end
