require 'minitest_helper'

class Comable::Apartment::UsersControllerTest < ActionController::TestCase
  setup do
    @routes = Comable::Apartment::Engine.routes

    @tenant = create(:tenant)
    @tenant.create
    @tenant.switch!

    # TODO: Create into the "public" schema
    sign_in :root_user, create(:user, role: :root)
  end

  teardown do
    @tenant.reset!
    @tenant.drop
  end

  test 'should get index' do
    user = create(:user)
    get :index, tenant_id: @tenant
    assert_includes assigns(:users), user
  end

  test 'should get new user' do
    get :new, tenant_id: @tenant
    assert_instance_of Comable::User, assigns(:user)
  end

  test 'should create user' do
    assert_difference('@tenant.switch { Comable::User.count }') do
      post :create, tenant_id: @tenant, user: attributes_for(:user)
    end
  end

  test 'should redirect to the user after create user' do
    post :create, tenant_id: @tenant, user: attributes_for(:user)
    assert_redirected_to tenant_user_path(@tenant, assigns(:user))
  end

  test 'should show user' do
    user = create(:user)
    get :show, tenant_id: @tenant, id: user
    assert_response :success
  end

  test 'should get edit' do
    user = create(:user)
    get :edit, tenant_id: @tenant, id: user
    assert_response :success
  end

  test 'should update user' do
    user = create(:user)
    valid_attributes = { email: "new-#{user.email}" }
    patch :update, tenant_id: @tenant, id: user, user: valid_attributes
    assert_have_attributes valid_attributes, @tenant.switch { user.reload.attributes }
  end

  test 'should redirect to the user after update user' do
    user = create(:user)
    valid_attributes = { email: "new-#{user.email}" }
    patch :update, tenant_id: @tenant, id: user, user: valid_attributes
    assert_redirected_to tenant_user_path(@tenant, assigns(:user))
  end

  test 'should destroy user' do
    user = create(:user)
    assert_difference('@tenant.switch { Comable::User.count }', -1) do
      delete :destroy, tenant_id: @tenant, id: user
    end
  end

  test 'should redirect to index after destroy user' do
    user = create(:user)
    delete :destroy, tenant_id: @tenant, id: user
    assert_redirected_to tenant_users_path(@tenant)
  end
end
