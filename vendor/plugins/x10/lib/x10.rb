# ActsAsExample
module Acts
  module X10
    
    def self.included(base)
      base.extend Acts::X10::ClassMethods
    end
    
    # this module should contain your code that you want mixed in to the class.
    # it's also a good place to put a macro that invokes your plugin.
    module ClassMethods
      
      # Adds class and instance methods to the model to demonstrate how an ActiveRecord plugin should work
      #
      #  class User < ActiveRecord::Base
      #     acts_as_example
      #  end
      #
      # This will generate the following instance methods
      #  * to_example  : 
      # This also generates the following class methods
      #  * latest_five
      def acts_as_x10_module(options = {})
	    
        class_eval <<-END
		  ::AHCMD_PATH = options[:sdk_path] || "c:/ahome/ahcmd.exe"
          include Acts::X10::InstanceMethods
		  extend Acts::X10::SingletonMethods
        END
      end
      

      
    end
    
	module SingletonMethods

	end
    
    module InstanceMethods
      
	  def on
	    cmd(self.code, "on")
	  end
	  
	  def off
	    cmd(self.code, "off")
	  end
	  
	  def dim(amount)
	  	cmd(self.code, "dim", amount)
	  end
	  
	  def brighten(amount)
	    cmd(self.code, "bright", amount)
	  end
	  
	  private
        def	cmd(code, command, amount = nil)
	      `#{::AHCMD_PATH} sendplc #{code} #{command} #{amount}`
		end
      
    end
    
    
    
  end
end
