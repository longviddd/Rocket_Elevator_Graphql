require 'test_helper'

class QuotesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @quote = quotes(:one)
  end

  test "should get index" do
    get quotes_url
    assert_response :success
  end

  test "should get new" do
    get new_quote_url
    assert_response :success
  end

  test "should create quote" do
    assert_difference('Quote.count') do
      post quotes_url, params: { quote: { amount_apartments: @quote.amount_apartments, amount_basements: @quote.amount_basements, amount_companies: @quote.amount_companies, amount_corporations: @quote.amount_corporations, amount_elevators: @quote.amount_elevators, amount_floors: @quote.amount_floors, amount_parking_spots: @quote.amount_parking_spots, building_type: @quote.building_type, business_hours: @quote.business_hours, company_name: @quote.company_name, email: @quote.email, full_name: @quote.full_name, installation_fees: @quote.installation_fees, maximum_occupancy: @quote.maximum_occupancy, phone: @quote.phone, product_line: @quote.product_line, total_cost: @quote.total_cost } }
    end

    assert_redirected_to quote_url(Quote.last)
  end

  test "should show quote" do
    get quote_url(@quote)
    assert_response :success
  end

  test "should get edit" do
    get edit_quote_url(@quote)
    assert_response :success
  end

  test "should update quote" do
    patch quote_url(@quote), params: { quote: { amount_apartments: @quote.amount_apartments, amount_basements: @quote.amount_basements, amount_companies: @quote.amount_companies, amount_corporations: @quote.amount_corporations, amount_elevators: @quote.amount_elevators, amount_floors: @quote.amount_floors, amount_parking_spots: @quote.amount_parking_spots, building_type: @quote.building_type, business_hours: @quote.business_hours, company_name: @quote.company_name, email: @quote.email, full_name: @quote.full_name, installation_fees: @quote.installation_fees, maximum_occupancy: @quote.maximum_occupancy, phone: @quote.phone, product_line: @quote.product_line, total_cost: @quote.total_cost } }
    assert_redirected_to quote_url(@quote)
  end

  test "should destroy quote" do
    assert_difference('Quote.count', -1) do
      delete quote_url(@quote)
    end

    assert_redirected_to quotes_url
  end
end
