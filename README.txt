-----------------------------------------------------------------------------
// SEASHELL_READONLY

* Your coding style will NOT be graded for this question.
* Your testing methodology will NOT be graded for this question.
* All assignment rules and policies are in place for this question.
* There is no public test. Marmoset only ensures that your code "runs".
-----------------------------------------------------------------------------
* For this and EVERY other question, you may define helper functions
-----------------------------------------------------------------------------

In computer science, there are many different definitions for a balanced BST.

In this question we use a "load balanced" BST, 
which is based on the number of nodes (not the height)
in the left and right subtrees of each node of the BST.

Let count_left_t be the number of nodes in the left subtree of a node t.
Let count_right_t be the number of nodes in the right subtree of a node t.

A BST is called "load balanced" if for every node t in the BST,
one of the following is true:
* t has no children
* t has exactly one child, a left child, and count_left_t is exactly 1
* t has both left and right children where
  count_right_t <= count_left_t <= 2 * count_right_t  

In other words, for every node in the tree, its left subtree contains at least
as many nodes as its right subtree and no more than twice as many nodes as
its right subtree.

Example 1, the following BST is load balanced.

  2
 / \
1   3

Example 2, the following BST is not load balanced

    4
   / \
  2   5
 / \   \
1   3   6

since the right subtree of 5 contains 1 node and the left subtree of 5
contains 0 nodes (i.e. 5 does not have a left child) - if a node has only one 
child, it must be a left child.

In this question, you will write a function is_load_balanced that returns
true if the given BST is load balanced and false otherwise.

You have been provided with a complete implementation of the bst functions
(in bst.ll) necessary to build BSTs for use in your test cases.

Note: If you are unable to meet the time requirement of O(n), there will be
      a deduction of at most 3 marks.

Note: You may NOT modify the bst or bstnode structures.
      For example, you can NOT add a count augmentation (as you did in A9).
