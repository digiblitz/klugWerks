/*******************************************************************************
 * Copyright: 2018 digiBlitz Foundation
 * 
 * License: digiBlitz Public License 1.0 (DPL) 
 * Administered by digiBlitz Foundation. www.digiblitz.org/dpl/
 * 
 * Inventor: Suresh Kannan (Maya Suresh Kannan Balabisegan ) (www.sureshkannan.org)
 * 
 * Authors: Suresh Kannan (Maya Suresh Kannan Balabisegan )& digiBlitz.
 * 
 * "Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software in accordance to the rules & restrictions of the digiBlitz Public License."
 ******************************************************************************/
package com.binarytree.action;

/**
 * Title: BinaryTree
 * Description: Binary Tree implementation
 * 
 *
 */

/**
 * Class implements a binary tree of Object type nodes. The tree is represented
 * as a parent node with two children nodes - left and right, where each
 * children node is a binary tree by himself. Each node also contains an info
 * that represents him.
 */
public class BinaryTree implements Comparable
{
  protected Comparable info; // A node info.
  protected BinaryTree left, right;

    /**
   * Default construncor.
   */
  public BinaryTree()
  {
    this(null, null, null);
  }

  /**
   * Create new binary tree with single node, which will be a root and contains
   * info.
   * @param info Info value for the root node.
   */
  public BinaryTree(Comparable info)
  {
    this(info, null, null);
  }

  /**
   * Create new binary tree with left and right children nodes, where each
   * of them is a binary tree by himself.
   * @param info Info value for the node.
   * @param left Left child node.
   * @param right Right child node.
   */
  public BinaryTree(Comparable info, BinaryTree left, BinaryTree right)
  {
    this.info = info;
    this.left = left;
    this.right = right;
  }

    /**
   * Get the left child binary sub-tree.
   * @return Left child sub-tree.
   */
  public BinaryTree getLeft()
  {
    return left;
  }

  /**
   * Get the right child binary sub-tree.
   * @return Right child sub-tree.
   */
  public BinaryTree getRight()
  {
    return right;
  }

  /**
   * Get the info of the current tree root node.
   * @return Node info.
   */
  public Comparable getInfo()
  {
    return info;
  }

  /**
   * Compare two root nodes according to their info values.
   * @param o Binary Tree node object that should be compared.
   * @return Information comparison result according to information type.
   */
  public int compareTo(Object o)
  {
    if (o instanceof BinaryTree)
      return info.compareTo(((BinaryTree)o).info);
    return -1;
  }

  /**
   * Get the root node of the tree.
   * @return The root of the tree.
   */
  public BinaryTree getRoot()
  {
    return this;
  }

  /**
   * Show the tree content.
   */
  public void showTree()
  {
    showTree(this, 0, false);
  }

  /**
   * Show the binary sub-tree represents by rootNode, which depth is specified.
   * @param rootNode The root of the sub-tree to be show.
   * @param rootNodeDepth The depth of the root node in the original tree.
   * @param is_left Is the root node a left child of it's parent tree.
   */
  private void showTree(BinaryTree rootNode, int rootNodeDepth, boolean is_left)
  {
    if (rootNode!=null)
    {
      String nodeDepthIdent = " ";

      for (int i=0; i<rootNodeDepth; i++, nodeDepthIdent += "   ");

      System.out.println(nodeDepthIdent + (rootNodeDepth!=0 ? ("== "
                         + (is_left ? "left" : "right") + " ==> ") : "")
                         + rootNode.info);
      showTree(rootNode.getLeft(), rootNodeDepth+1, true);
      showTree(rootNode.getRight(), rootNodeDepth+1, false);
    }
  }

}

