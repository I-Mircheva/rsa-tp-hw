require 'test_helper'

class HiddenNotesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @hidden_note = hidden_notes(:one)
  end

  test "should get index" do
    get hidden_notes_url
    assert_response :success
  end

  test "should get new" do
    get new_hidden_note_url
    assert_response :success
  end

  test "should create hidden_note" do
    assert_difference('HiddenNote.count') do
      post hidden_notes_url, params: { hidden_note: { your_note: @hidden_note.your_note } }
    end

    assert_redirected_to hidden_note_url(HiddenNote.last)
  end

  test "should show hidden_note" do
    get hidden_note_url(@hidden_note)
    assert_response :success
  end

  test "should get edit" do
    get edit_hidden_note_url(@hidden_note)
    assert_response :success
  end

  test "should update hidden_note" do
    patch hidden_note_url(@hidden_note), params: { hidden_note: { your_note: @hidden_note.your_note } }
    assert_redirected_to hidden_note_url(@hidden_note)
  end

  test "should destroy hidden_note" do
    assert_difference('HiddenNote.count', -1) do
      delete hidden_note_url(@hidden_note)
    end

    assert_redirected_to hidden_notes_url
  end
end
