Feature: ProductEdition
	In order to update product information in my pharmacy
	As a pharmacy employee
	I want to be able to modify them


@mytag
Scenario: Successful Modification
    Given the product with id 1
    And code "123"
    And name "Antiperspirant Roll" 
    And description "cream for underarm care"
    And price as 70.00
    When I press the "Modify" button for that product, I should be able to modify the name to "Antiperspirant Roll Original" and the description to "With 1/4 moisturizing cream for underarm care"
    And I save the changes
    Then the product should be edited correctly with code 200
