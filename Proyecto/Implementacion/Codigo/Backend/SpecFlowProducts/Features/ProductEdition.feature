Feature: ProductEdition
	In order to update product information in my pharmacy
	As a pharmacy employee
	I want to be able to modify them


@tag1
Scenario: Successful Modification
    Given the product with id 1
    And code "12345"
    And name "Antiperspirant Roll" 
    And description "cream for underarm care"
    And price as 70.00
    When I press the "Modify" button for that product, I should be able to modify the name to "Antitranspirante RollOn" and the description to "With moisturizing cream for underarm care"
    And I save the changes
    Then the product should be edited correctly with code 200

@tag2
Scenario: Modification with Incorrect Code
    Given the product with id 1
    And code "12345"
    And name "Antitranspirante RollOn" 
    And description "With moisturizing cream for underarm care"
    And price as 70.00
    When I press the "Modify" button for that product, I should be able to modify the code to "123"
    And I save the changes
    Then the product should be edited correctly with code 400

@tag3
Scenario: Modification with Incorrect Code (Different Product)
    Given the product with id 1
    And code "12345"
    And name "Antitranspirante RollOn" 
    And description "With moisturizing cream for underarm care"
    And price as 70.00
    When I press the "Modify" button for that product, I should be able to modify the code to "45678"
    And I save the changes
    Then the product should be edited correctly with code 500

@tag4
Scenario: Modification with Incorrect Name
    Given the product with id 1
    And code "12345"
    And name "Antitranspirante RollOn" 
    And description "With moisturizing cream for underarm care"
    And price as 70.00
    When I press the "Modify" button for that product, I should be able to modify the name to "The best Antitranspirante RollOn" and the description to "With moisturizing cream for underarm care"
    And I save the changes
    Then the product should be edited correctly with code 400

@tag5
Scenario: Modification with Incorrect Description
    Given the product with id 1
    And code "12345"
    And name "Antitranspirante RollOn" 
    And description "With moisturizing cream for underarm care"
    And price as 70.00
    When I press the "Modify" button for that product, I should be able to modify the name to "Antitranspirante RollOn" and the description to "Dove Original Roll On antiperspirant with moisturizing cream for underarm care"
    And I save the changes
    Then the product should be edited correctly with code 400

@tag6
Scenario: Modification Leaving a Field Blank
    Given the product with id 1
    And code "12345"
    And name "Antitranspirante RollOn" 
    And description "With moisturizing cream for underarm care"
    And price as 70.00
    When I press the "Modify" button for that product, I should be able to modify the name to "" and the description to "With moisturizing cream for underarm care"
    And I save the changes
    Then the product should be edited correctly with code 400
