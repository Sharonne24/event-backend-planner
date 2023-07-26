class User < ActiveRecord::Base
    has_many :guests
end