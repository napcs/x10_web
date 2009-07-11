# ActsAsExample
module Acts
  module X10
    
    def self.included(base)
      base.extend Acts::X10::ClassMethods
    end

    module ClassMethods
      # Adds methods to interact with an X10 ActiveHome controller
      #
      #  class Unit < ActiveRecord::Base
      #     acts_as_x10_module
      #  end
      #
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
