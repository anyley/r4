class User < ActiveRecord::Base
  after_initialize :myinit, only: [:new]

    def myinit
      self.email='kobzarvs@gmail.com'
      puts self.email
    end

end
