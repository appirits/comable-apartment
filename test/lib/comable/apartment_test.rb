require 'minitest_helper'

class ApartmentTest < ActiveSupport::TestCase
  test '.config should yield with self' do
    Comable::Apartment.config { |config| assert_equal config, Comable::Apartment }
  end

  test '.excluded_models should be delegated' do
    assert_equal Comable::Apartment.excluded_models, Apartment.excluded_models
  end

  test '.tenant_names should be delegated' do
    assert_equal Comable::Apartment.tenant_names, Apartment.tenant_names
  end

  test '.excluded_models= should set value to Apartment' do
    model_name = 'Test'
    Comable::Apartment.excluded_models = [model_name]
    assert_equal [model_name], Apartment.excluded_models
  end

  test '.tenant_names= should set value to Apartment' do
    tenant_name = 'test'
    Comable::Apartment.tenant_names = [tenant_name]
    assert_equal [tenant_name], Apartment.tenant_names
  end
end
