require 'test_helper'

class PcbBomsControllerTest < ActionController::TestCase
  setup do
    @pcb_bom = pcb_boms(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:pcb_boms)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create pcb_bom" do
    assert_difference('PcbBom.count') do
      post :create, pcb_bom: { comp_id: @pcb_bom.comp_id, count: @pcb_bom.count, info: @pcb_bom.info, mark: @pcb_bom.mark, name: @pcb_bom.name }
    end

    assert_redirected_to pcb_bom_path(assigns(:pcb_bom))
  end

  test "should show pcb_bom" do
    get :show, id: @pcb_bom
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @pcb_bom
    assert_response :success
  end

  test "should update pcb_bom" do
    put :update, id: @pcb_bom, pcb_bom: { comp_id: @pcb_bom.comp_id, count: @pcb_bom.count, info: @pcb_bom.info, mark: @pcb_bom.mark, name: @pcb_bom.name }
    assert_redirected_to pcb_bom_path(assigns(:pcb_bom))
  end

  test "should destroy pcb_bom" do
    assert_difference('PcbBom.count', -1) do
      delete :destroy, id: @pcb_bom
    end

    assert_redirected_to pcb_boms_path
  end
end
