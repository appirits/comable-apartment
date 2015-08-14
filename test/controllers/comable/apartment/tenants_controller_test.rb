require 'minitest_helper'

class Comable::Apartment::TenantsControllerTest < ActionController::TestCase
  setup do
    @routes = Comable::Apartment::Engine.routes

    sign_in :root_user, create(:user, role: :root)
  end

  test 'should get index' do
    tenant = create(:tenant)
    tenant.create
    get :index
    assert_includes assigns(:tenants), tenant
  end

  test 'should get new tenant' do
    get :new
    assert_instance_of Comable::Tenant, assigns(:tenant)
  end

  test 'should create tenant' do
    assert_difference('Comable::Tenant.count') do
      post :create, tenant: attributes_for(:tenant)
    end
  end

  test 'should redirect to the tenant after create tenant' do
    post :create, tenant: attributes_for(:tenant)
    assert_redirected_to tenant_path(assigns(:tenant))
  end

  test 'should show tenant' do
    tenant = create(:tenant)
    get :show, id: tenant
    assert_response :success
  end

  test 'should get edit' do
    tenant = create(:tenant)
    get :edit, id: tenant
    assert_response :success
  end

  test 'should update tenant' do
    tenant = create(:tenant)
    valid_attributes = { domain: "new-#{tenant.domain}" }
    patch :update, id: tenant, tenant: valid_attributes
    assert_have_attributes valid_attributes, tenant.reload.attributes
  end

  test 'should redirect to the tenant after update tenant' do
    tenant = create(:tenant)
    valid_attributes = { domain: "new-#{tenant.domain}" }
    patch :update, id: tenant, tenant: valid_attributes
    assert_redirected_to tenant_path(assigns(:tenant))
  end

  test 'should destroy tenant' do
    tenant = create(:tenant)
    assert_difference('Comable::Tenant.count', -1) do
      delete :destroy, id: tenant
    end
  end

  test 'should redirect to index after destroy tenant' do
    tenant = create(:tenant)
    delete :destroy, id: tenant
    assert_redirected_to tenants_path
  end
end
