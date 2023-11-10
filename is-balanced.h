// This module provides a function to test if a BST is load balanced.

// SEASHELL_READONLY

#include <stdbool.h>

// note: see bst.h for the transparent structure definition
struct bst; 

// is_load_balanced(tree) returns true if tree is load balanced and
//   false otherwise
// note: read the README.TXT for more information
// requires: tree is not NULL
// time: O(n)
bool is_load_balanced(const struct bst *tree);
