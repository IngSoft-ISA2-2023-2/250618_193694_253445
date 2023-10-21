﻿Feature: ProductCreation
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


