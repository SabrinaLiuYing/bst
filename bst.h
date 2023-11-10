// A simple BST module (see the notes for documentation)

// SEASHELL_READONLY

struct bstnode {
  int item;
  struct bstnode *left;
  struct bstnode *right;
};

struct bst {
  struct bstnode *root;
};

struct bst *bst_create_empty(void);

void bst_insert(int i, struct bst *tree);

void bst_destroy(struct bst *tree);
