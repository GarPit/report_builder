class User < ActiveRecord::Base
  attr_accessible :email, :first_name, :last_name, :age

  scope :older_than, lambda {|age| where("age > ?", age) }

  has_secure_password
end
