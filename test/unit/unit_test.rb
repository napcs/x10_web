require 'test_helper'

class UnitTest < ActiveSupport::TestCase

  test "should be invalid without a name" do
    u = Unit.new
    u.valid?
    assert(u.errors.on(:name).include?("can't be blank"))
  end
  
  test "should be invalid without a code" do
    u = Unit.new
    u.valid?
    assert(u.errors.on(:code).include?("can't be blank"))
  end


  test "should save when name and code are valid" do
    u = Unit.new(:name => "unit", :code=>"a1")
    assert u.save
  end
end
