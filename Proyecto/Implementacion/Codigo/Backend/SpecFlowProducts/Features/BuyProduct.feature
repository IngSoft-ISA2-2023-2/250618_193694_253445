Feature: Buy Product
Can add products to a purchase

@tag1
Scenario: Buy successfully
	Given a product of a pharmacy
	And a positive quantity greater than 0 of it, for example 5
	When  I select add to cart
	Then the product is added to the purchase with that quantity with code 200 
