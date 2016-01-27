require 'test_helper'

class CategoryTest < ActiveSupport::TestCase

def setup

	@category = Category.new(name: "Sport")
	
end

	test "category should be valid" do

		assert @category.valid?
		
	end

	test "category should have name" do

		@category.name = " "
		assert_not @category.valid?

	end

	test "name should be unique" do
		@category.save
		cat = Category.new(name: "Sport")
		assert_not cat.valid?

	end

	test "name should not be too long " do 

		@category.name = "a" * 21
		assert_not @category.valid? 

	end

	test "name should not be too short" do 

		@category.name = "aa"
		assert_not @category.valid?

	end
end
