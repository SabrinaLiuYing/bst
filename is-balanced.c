///////////////////////////////////////////////////////////////////////////// 
// INTEGRITY STATEMENT (v3)
//
// By signing your name and ID below you are stating that you have agreed
// to the online academic integrity statement:
// https://student.cs.uwaterloo.ca/~cs136/current/assignments/integrity.shtml
/////////////////////////////////////////////////////////////////////////////
// I received help from and/or collaborated with: 

// NONE
//
// Name: Ying Liu
// login ID: y2862liu
///////////////////////////////////////////////////////////////////////////// 

#include <assert.h>
#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>
#include "bst.h"
#include "is-balanced.h"

// time: O(n)
int recur_balance2(struct bstnode *root, bool *result){
   if(root->left == NULL){
      if(root->right != NULL){
        *result = false;
        return 1 + recur_balance2(root->right, result);
      }else{
        return 1;
      }
    }else if(root->left != NULL){
      if(root->right == NULL){
        if(root->left->left != NULL || root->left->right != NULL){
          *result = false;
        }
        return 1 + recur_balance2(root->left, result);
      }else{
        if(recur_balance2(root->right, result) 
           <= recur_balance2(root->left, result) &&
           recur_balance2(root->left, result)
           <= 2 * recur_balance2(root->right, result)){
          return 1 + recur_balance2(root->left, result) +  
            recur_balance2(root->right, result);
        }else{
          *result = false;
          return 1 + recur_balance2(root->left, result) +  
            recur_balance2(root->right, result);
        }
      }
    }
  return 0;
}

// time: O(n)
bool is_load_balanced(const struct bst *tree) {
  assert(tree);
  struct bstnode *root = tree->root;
  bool result = true;
  recur_balance2(root, &result);
  return result;
}
