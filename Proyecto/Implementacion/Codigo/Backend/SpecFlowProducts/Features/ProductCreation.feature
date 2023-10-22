Feature: ProductCreation
	In order to register products in my pharmacy
	As a pharmacy employee
	I want to be able to create them



@tag1
Scenario: Create product with correct data
	Given the code "12347"
	And the name "Shampoo Sedal 200 ml"
	And the description  "Dale vida a tu pelo con el nuevo shampoo Sedal"
	And the price 80,00
	And the pharmacy "famacia1234"
	When press the create button
	Then the product should be registered correctly with code 200

@tag2
Scenario: Create product with wrong code length
	Given the code "123478"
	And the name "Shampoo Sedal 200 ml"
	And the description  "Dale vida a tu pelo con el nuevo shampoo Sedal"
	And the price 80,00
	And the pharmacy "famacia1234"
	When press the create button
	Then the product should not be registered with code 400

@tag3
Scenario: Create product with wrong code, no digits
	Given the code "1234A"
	And the name "Shampoo Sedal 200 ml"
	And the description  "Dale vida a tu pelo con el nuevo shampoo Sedal"
	And the price 80,00
	And the pharmacy "famacia1234"
	When press the create button
	Then the product should not be registered with code 400

@tag4
Scenario: Create product with wrong name, no alphanumeric
	Given the code "12345"
	And the name "Shampoo Sedal 200 ml%%$"
	And the description  "Dale vida a tu pelo con el nuevo shampoo Sedal"
	And the price 80,00
	And the pharmacy "famacia1234"
	When press the create button
	Then the product should not be registered with code 400

@tag5
Scenario: Create product with wrong name, length longer than 30 characters
	Given the code "12345"
	And the name "123456789 123456789 123456789 0"
	And the description  "Dale vida a tu pelo con el nuevo shampoo Sedal"
	And the price 80,00
	And the pharmacy "famacia1234"
	When press the create button
	Then the product should not be registered with code 400

@tag7
Scenario: Create product with wrong description, non alphanumeric
	Given the code "12345"
	And the name "Shampoo Sedal 200 ml"
	And the description  "Dale vida a tu pelo con el nuevo shampoo Sedal &"
	And the price 80,00
	And the pharmacy "famacia1234"
	When press the create button
	Then the product should not be registered with code 400

@tag8
Scenario: Create product with wrong description, length longer than 70 characters
	Given the code "12345"
	And the name "Shampoo Sedal 200 ml"
	And the description  "123456789 123456789 123456789 123456789 123456789 123456789 123456789 1"
	And the price 80,00
	And the pharmacy "famacia1234"
	When press the create button
	Then the product should not be registered with code 400

