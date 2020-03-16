@account
Feature: Dynamics 365
	It will verify if the CarlosAccount was created on account section

	Background: Login
	This should login the application
		Given I open the browser to "https://camacho8.crm.dynamics.com/main.aspx?app=d365default"
		And I login with "admin_user"

	# @notExistAccount
	# Scenario: The Dynamic application should not have the CarlosAccont1234
	# 	And I click the "Accounts" context menu option
	# 	And I enter "CarlosAccount1234" in the search bar
	# 	And I click the search button
	# 	Then I should have the "CarlosAccount1234" account created

	@existAccount
	Scenario: The Dynamic application should have the CarlosAccont
		Given I had the "CarlosAccount" account created
		And I click the "Accounts" context menu option
		And I enter "CarlosAccount" in the search bar
		And I click the search button
		Then I should have the "CarlosAccount" account created

	# @notExistAccount
	# Scenario: The Dynamic application should not have the CarlosAccont123
	# 	And I click the "Accounts" context menu option
	# 	And I enter "CarlosAccount123" in the search bar
	# 	And I click the search button
	# 	Then I should have the "CarlosAccount123" account created
