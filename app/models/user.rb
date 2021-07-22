class User < ApplicationRecord
	has_many :articles
	has_many :comments

	PASS_FORMAT = /\A
		(?=.{8,20})
		(?=.*\d)
		(?=.*[a-z])
		(?=.*[A-Z])
		(?=.*[[:^alnum:]])
	/x

	validates :name, presence: true, length: { minimum: 5 }, uniqueness: true
	validates :pass, presence: true, length: { in: 8..20 }, confirmation: true, format: { with: PASS_FORMAT }
	validates :pass_confirmation, presence: true
end
