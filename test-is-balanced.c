// This simple test only tests the examples from the README.txt
// you should modify this (or create your own test client) 
// to test your is_load_balanced function 

#include <assert.h>
#include <stdbool.h>
#include "bst.h"
#include "is-balanced.h"

int main(void) {

// Example 1
  struct bst *tree = bst_create_empty();
  bst_insert(2, tree);
  bst_insert(1, tree);
  bst_insert(3, tree);
  assert(is_load_balanced(tree) == true);
  bst_destroy(tree);

// Example 2
  tree = bst_create_empty();
  bst_insert(4, tree);
  bst_insert(2, tree);
  bst_insert(1, tree);
  bst_insert(3, tree);
  bst_insert(5, tree);
  bst_insert(6, tree);
  assert(is_load_balanced(tree) == false);
  bst_destroy(tree);
  
  tree = bst_create_empty();
  bst_insert(4, tree);
  bst_insert(2, tree);
  bst_insert(1, tree);
  bst_insert(3, tree);
  bst_insert(5, tree);
  assert(is_load_balanced(tree) == false);
  bst_destroy(tree);
}
