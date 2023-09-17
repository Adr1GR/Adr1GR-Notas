Feature: As a customer I should be able to edit the contents of my shopping basket, change quantities and then checkout

    Background:
        Given I have the following data:
            | Product | Stock | Basket |
            | 1       | 2     | 0      |
            | 2       | 0     | 0      |
            | 3       | 2     | 1      |


    Scenario Outline: testing functionality of basket
        Given I am on the product detail page of product <Product>
        When I click the Add to Basket button
        Then the quantities are
            | Stock   | Basket   |
            | <Stock> | <Basket> |
        And a message <message> is displayed to the user

        Examples:
            | Description       | Product | Stock | Basket | Message               |
            | In Stock          | 1       | 1     | 1      | 'Added to the basket' |
            | Not In Stock      | 2       | 0     | 0      | 'Not in stock'        |
            | Already in Basket | 3       | 3     | 2      | 'Limited to one only' |

    Scenario: As a customer I can add an item to my shopping basket
        Given I am on the product detail page of product "1"
        When I click the Add to Basket button
        Then product "1" has the following quantities:
            | Stock | Basket |
            | 1     | 1      |
        And a message is displayed to the user

    # product is not in stock and not in the basket
    Scenario: As a customer I am unable to add an item to my shopping basket if not in stock
        Given I am on the product detail page of product "2"
        When I click the Add to Basket button
        Then product "2" has the following quantities:
            | Stock | Basket |
            | 0     | 0      |
        Then a message is displayed to the user

    # product is in stock and in the basket
    Scenario: As a customer I am unable to add an item to my shopping basket if it's already in the basket
        Given I am on the product detail page of product "3"
        When I click the Add to Basket button
        Then a message is displayed to the user
        Then product "3" has the following quantities:
            | Stock | Basket |
            | 3     | 2      |
        Then a message is displayed to the user

    #===========================================================================


    Scenario: As a customer I can remove an item from my shopping basket
        Given I am on the basket page
        When I click the Remove button
        Then The product is removed from the basket

    Scenario: As a customer I can view the items of my shopping basket
        Given I am on the home page
        When I click the shopping basket icon
        Then I see a list of shopping items

    Scenario: As a customer I can checkout from the shopping basket
        Given I am on the basket page
        When I click the Checkout button
        Then I should be taken to the checkout page

    #===========================================================================

    Scenario: As a user I should be able to login to my account using my credentials
        Given the user is already registered on the web
        And the user is in the login page
        And the signin button is displayed
        When the user enters their username
        And the user enters their password
        And the user click the Login button
        And credentials are correct
        Then the user should be logged in
        And the user is on the home page


    #as a customer i can create a new account if i enter my username/password and click the register and i will be sent account page

    Scenario: As a customer i should be able to register my account using new and valid credentials
        Given the customer is in the register page
        And the Register button is displayed
        When the customer enters their new username
        And the customer enters their new password
        And the customer clicks the Register button
        And the new username is valid
        And the new password is valid
        Then the customer should be registered
        And the customer should be logged in
        And the customer is sent to the home page