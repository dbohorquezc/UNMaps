class DynamicArrayInteger {  
  int[] arr;
  int capacity;
  private int size;

  DynamicArrayInteger() {
      capacity = 1;
      arr = new int[capacity];
      size = 0;
  }
  
  public void PushBack (int key){
      if (capacity == size){
          this.Resize(capacity*2);
      }
      arr[size] = key;
      size++;
  }
  
  public void Resize (int n){
      int[] tempArray = new int[n];
      for (int i = 0; i < capacity; i++){
          tempArray[i] = arr[i];
      }
      arr = tempArray;
      capacity = n;
  }
  
  public int Get (int i){
      if (i < 0 || i > capacity-1){
          System.out.println("Error, fuera de limite.");
          return 0;
      }
      return arr[i];
  }
  
  public void Set (int i, int val){
      if (i < 0 || i > capacity-1){
          return;
      }
      arr[i] = val;
  }
  
  public void Remove (int i){
      if (i < 0 || i > capacity-1){
          return;
      }
      for (int j = i; j < size-1; j++){
          arr[j] = arr[j+1];
      }
      size--;
  }
  
  public int Size (){
      return size;
  }
}
