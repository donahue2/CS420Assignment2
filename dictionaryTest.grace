import "dictionary" as dict
dialect "minitest"

testSuite{
  var tree := dict.BST
  
  test "Can Tell if BST is Empty" by{
    assert (tree.isEmpty) shouldBe (true)
  }
  
  test "Key Does Not Exist" by{
    assert {tree.searchKey("one")} shouldRaise (NoSuchObject)
  }
  
  test "Can Add to BST" by {
    tree.add("one", 1)
    assert (tree.isEmpty) shouldBe (false)
  }
}