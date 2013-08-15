class User < ActiveRecord::Base
  validates_presence_of :email, :password

  def self.sign_in(params)
    if (user = User.find_by_email params[:email]) and user.password == User.encrypt(params["password"])
      user.id
    else
      false
    end
  end

  def self.encrypt(pass)
    Digest::MD5.hexdigest(pass)
  end
end
