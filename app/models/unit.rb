class Unit < ActiveRecord::Base
  # name   :string
  # code   :string

  validates_presence_of :name, :code

  ::AHCMD_PATH = "c:/ahome/ahcmd.exe"

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
