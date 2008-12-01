require 'test_helper'
class StatusControllerTest < ActionController::TestCase
  
  def test_should_redirect_to_show_page_when_request_is_html
    u = Unit.new(:name => "test", :code => "a9")
    Unit.any_instance.stubs(:id).returns(1)

    Unit.expects(:find).with("1").returns(u)
    put :update, :unit_id => 1, :value => "off"
    assert_redirected_to unit_path(u)
  end
  
  def test_should_execute_off_method
    Unit.any_instance.expects(:on)
    Unit.any_instance.stubs(:id).returns(1)
    Unit.expects(:find).returns(Unit.new(:code => "a9", :name=>"office"))
    put :update, :unit_id => 1, :value => "on"
  end
  
  def test_should_execute_on_method
    Unit.any_instance.expects(:off)
    Unit.any_instance.stubs(:id).returns(1)
    Unit.expects(:find).returns(Unit.new(:code => "a9", :name=>"office"))
    put :update, :unit_id => 1, :value => "off"
  end
  
 


end
