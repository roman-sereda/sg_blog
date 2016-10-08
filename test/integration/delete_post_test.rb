def test_delete_post

  click_button "Delete post"
  assert !(page.has_content?"testpost")
  create_post

end
