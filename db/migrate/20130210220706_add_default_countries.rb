# encoding: utf-8
class AddDefaultCountries < ActiveRecord::Migration
  def up
    Country.create! :name => "España"
  end
  def down
    Country.find_by_name("España").destroy
  end
end
