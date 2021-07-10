require "application_system_test_case"

class BankingSystemsTest < ApplicationSystemTestCase
  setup do
    @banking_system = banking_systems(:one)
  end

  test "visiting the index" do
    visit banking_systems_url
    assert_selector "h1", text: "Banking Systems"
  end

  test "creating a Banking system" do
    visit banking_systems_url
    click_on "New Banking System"

    fill_in "Current balance", with: @banking_system.current_balance
    fill_in "Email", with: @banking_system.email
    fill_in "Name", with: @banking_system.name
    click_on "Create Banking system"

    assert_text "Banking system was successfully created"
    click_on "Back"
  end

  test "updating a Banking system" do
    visit banking_systems_url
    click_on "Edit", match: :first

    fill_in "Current balance", with: @banking_system.current_balance
    fill_in "Email", with: @banking_system.email
    fill_in "Name", with: @banking_system.name
    click_on "Update Banking system"

    assert_text "Banking system was successfully updated"
    click_on "Back"
  end

  test "destroying a Banking system" do
    visit banking_systems_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Banking system was successfully destroyed"
  end
end
