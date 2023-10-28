Feature: Buy Product
Can add products to a purchase

@tag1
Scenario: Buy successfully
	Given a product of a pharmacy
	And a positive quantity greater than 0 of it, for example 5
	When  I select add to cart
	Then the product is added to the purchase with that quantity with code 200 

@tag2
Scenario: Buy unsuccessfully, invalid quantity
	Given a product of a pharmacy
	And a negative quantity, for example -5
	When  I select add to cart
	Then  it does not add to cart since the quantity is not valid with code 400 

@tag3
Scenario: Buy unsuccessfully, invalid quantity 0
	Given a product of a pharmacy
	And a negative quantity, for example 0
	When  I select add to cart
	Then  it does not add to cart since the quantity is not valid with code 400 