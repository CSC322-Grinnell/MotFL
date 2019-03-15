require 'test_helper'

class ResourceMetadataControllerTest < ActionDispatch::IntegrationTest
  setup do
    @resource_metadatum = resource_metadata(:one)
  end

  test "should get index" do
    get resource_metadata_url
    assert_response :success
  end

  test "should get new" do
    get new_resource_metadatum_url
    assert_response :success
  end

  test "should create resource_metadatum" do
    assert_difference('ResourceMetadatum.count') do
      post resource_metadata_url, params: { resource_metadatum: { Abstract: @resource_metadatum.Abstract, Author: @resource_metadatum.Author, Link: @resource_metadatum.Link, Title: @resource_metadatum.Title, publish_date: @resource_metadatum.publish_date } }
    end

    assert_redirected_to resource_metadatum_url(ResourceMetadatum.last)
  end

  test "should show resource_metadatum" do
    get resource_metadatum_url(@resource_metadatum)
    assert_response :success
  end

  test "should get edit" do
    get edit_resource_metadatum_url(@resource_metadatum)
    assert_response :success
  end

  test "should update resource_metadatum" do
    patch resource_metadatum_url(@resource_metadatum), params: { resource_metadatum: { Abstract: @resource_metadatum.Abstract, Author: @resource_metadatum.Author, Link: @resource_metadatum.Link, Title: @resource_metadatum.Title, publish_date: @resource_metadatum.publish_date } }
    assert_redirected_to resource_metadatum_url(@resource_metadatum)
  end

  test "should destroy resource_metadatum" do
    assert_difference('ResourceMetadatum.count', -1) do
      delete resource_metadatum_url(@resource_metadatum)
    end

    assert_redirected_to resource_metadata_url
  end
end
