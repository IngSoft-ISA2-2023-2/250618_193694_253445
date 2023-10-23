Feature: ProductDeletion
In order to stop showing certain products in my pharmacy
	As a pharmacy employee
	I want to be able to delete them

@tag1
Scenario: Delete product correctly
	Given  the product registered in my pharmacy with id 1 
	When press the delete button for that product
	Then the product should be deleted correctly

@tag2
Scenario: Delete product incorrectly
	Given  the product not registered in my pharmacy with id 2 
	When press the delete button for that product
	Then the product should not be deleted
