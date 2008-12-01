require 'test_helper'





class UnitsControllerTest < ActionController::TestCase

  test "should display the units on the index page" do
    
    find_all
    Unit.any_instance.expects(:name).times(5)
    get "index"
    
  end
  
  test "should display new form" do
    get :new
    assert_template "new"
  end
  
  test "should display edit page" do
    #find_one
   # get :edit, :id => 1
   # assert_template "edit"
   todo
  end
  
  
  

  
  def find_one
    u = Unit.new(:name => "foo", :code => "a1")
    u.stubs(:id).returns(1)
    Unit.stubs(:find).returns(u)
  end
  
  def find_all
      units = []
      5.times do |t|
       u = Unit.new(:name => "item_#{t}", :code => "a#{t}")
       u.stubs(:id).returns(t)
       units << u  
      end
      Unit.stubs(:find).returns(units)  
  end

  def todo
    puts "#{caller_method_name} not implemented yet"
  end

  def caller_method_name
      parse_caller(caller(2).first).last
  end
  
  def parse_caller(at)
      if /^(.+?):(\d+)(?::in `(.*)')?/ =~ at
          file = Regexp.last_match[1]
  		line = Regexp.last_match[2].to_i
  		method = Regexp.last_match[3]
  		[file, line, method]
  	end
  end
  



end
