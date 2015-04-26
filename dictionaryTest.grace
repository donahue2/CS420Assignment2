import "collectionsPrelude" as collect
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
  
  tree.add("one", 1)
  
  test "Can Add to BST" by {
    assert (tree.isEmpty) shouldBe (false)
  }
  
  test "Value Can Be Found By Key" by{
    assert (tree.searchKey("one")) shouldBe (1)
  }
  
  test "Can Print String" by{
    assert (tree.asString) shouldBe ("((one,1))")
  }
  
  test "Can Remove one from BST" by {
    tree.remove("one")
    assert (tree.isEmpty) shouldBe (true)
  }
  
  tree.add("two", 2)
  
  test "Can find second Value By Key" by{
    assert (tree.searchKey("two")) shouldBe (2)
  }
  
  test "Can Remove second Value By Key" by{
    tree.remove("two")
    assert {tree.searchKey("two")} shouldRaise (NoSuchObject)
  }
  
  test "Can Print Out Two Values" by{
    assert (tree.asString) shouldBe ("((one,1)(two,2))")
  }
  
  test "Can Remove head of tree and still find valid leaf" by{
    tree.remove("one")
    assert (tree.searchKey("two")) shouldBe (2)
  }
  
  //The string "a"'s hashcode is less than the string "one"'s.
  tree.add("a", 0)
  
  test "Can add Second Child" by{
    assert (tree.asString) shouldBe ("((a,0)(one,1)(two,2))")
  }
  
  test "Can Remove head with two children" by{
    tree.remove("one")
    assert (tree.asString) shouldBe ("((a,0)(two,2))")
  }
  
  var emptyDict := dict.Dictionary.empty
  var smallDict := dict.Dictionary.with("one"::1, "two"::2, "a"::0)
  
  test "Can find elements in Dictionary" by{
    assert (smallDict.at("a")) shouldBe (0)
  }
  
  test "Can apply action if key does not exist" by{
    var success := false
    emptyDict.at("one")ifAbsent{success := true}
    assert (success) shouldBe (true)
  }

  test "Can detect present key" by{
    assert (smallDict.containsKey("two")) shouldBe (true)
    assert (emptyDict.containsKey("two")) shouldBe (false)
  }
  
  test "Can remove group of keys" by{
    smallDict.removeAllKeys(collect.list.with("a"::0,"one"::1))
    assert (smallDict.containsKey("two")) shouldBe (true)
    assert (smallDict.containsKey("a")) shouldBe (false)
    smallDict.removeKey("two"::2)
    assert (smallDict.containsKey("two")) shouldBe (false)
  }
}