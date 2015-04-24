import "collectionsPrelude" as collect

factory method BST<K,T>{
  
  def node= object {
    var key:K is public
    var data:T is public
    var left
    var right
    var null:Boolean := true
    
    method isNull {return null}
    
    method setNode (newKey:K,newData:T){
      key := newKey
      data := newData
      left := node
      right := node
      null := false
    }
    
  }
  
  var head := node
  
//  def null= object {
//    method isNull {return true}
//  }
  
  method add(key:K,data:T){
    addNode(key,data,head)
  }
  
  method addNode(key:K,data:T,current:node){
    if(current.isNull)then{
      //current := node
      current.setNode(key,data)
    }
  }
  
  method isEmpty{
    return head.isNull
  }
    
  method searchKey(target:K){
    checkKeyNode(target, head)
  }
  
  method checkKeyNode(target:K, current){
    if(current.isNull)then{
      NoSuchObject.raise "does not contain {target}"
    }
    
    //if(target)
  }
} 
  
factory method dictionary<K,T>{
  inherits collect.collectionFactory.trait<T>
}

