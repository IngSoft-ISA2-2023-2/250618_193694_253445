Feature: ProductEdition
	In order to update product information in my pharmacy
	As a pharmacy employee
	I want to be able to modify them


@mytag
Scenario: Successful Modification
    Given the product "Antiperspirant Roll" is entered into the system of "Pharmacy 123"
    When I select the product
    And I press the "Modify" button
    Then I should be redirected to a modification page
    And I should be able to modify the name to "Antiperspirant Roll Original" and the description to "With 1/4 moisturizing cream for underarm care"
    When I press the "Save" button
    Then I should see a message that says "Product modified successfully"
