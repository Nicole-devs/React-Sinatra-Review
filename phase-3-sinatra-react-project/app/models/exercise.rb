class User < ActiveRecord::Base
    has_many :workouts
  
    before_create :generate_pin
  
    private
  
    def generate_pin
      loop do
        self.pin = rand(1000..9999).to_s
        break unless User.exists?(pin: pin)
      end
    end
end