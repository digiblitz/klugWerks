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
package com.huffman.action;

/**
 * Title: Huffman Coding
 * Description: Huffman codinf algorithm implementation - the 4-th exercise of
 * Algorithm Programming 1 course. The program allows to encode/decode files.
 * @author Pigovat Alexander
 * @version 1.0
 */

import com.binarytree.action.*;
import com.mypriorityqueue.action.*;

import java.io.IOException;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.BufferedReader;

/**
 * Class that build the Huffman Tree and generates a Huffman Alphabet for
 * Encoding.
 */
public class HuffmanTree
{
  protected BinaryTree root; // Huffman tree root.
  protected int leafsCount = 0; // The count of leafs in the tree, equals to the
                                // count of different characters got from the file.
  public HuffmanTree()
  {
    root = null;
  }

  /**
   * Build the Huffman tree for the data that the file contains.
   * @return Generated Huffman binary tree.
   */
  // Let the method throw all it's exceptions to the caller.
  public void buildTreeForFile(String FileName) throws Exception
  {
    FileReader infoFile;
    // According to the instructions only digits and space should be taken care of.
    int knownCharsCount = 256;  // ASCII digits.
    int [][]frequencies = new int[knownCharsCount][2];
    PriorityQueue HuffmanPriorQueue = new BinaryHeap();

    for (int i=0; i<knownCharsCount; i++)
    {
      frequencies[i][0] = i;
      frequencies[i][1] = 0;
    }

    infoFile = new FileReader(FileName);
    // Fill the frequencies array. According to instructions only spaces and
    // digits can appear in the file ot be encoded.
    while (infoFile.ready())
    {
      int ch = infoFile.read();
      if (ch<0 || ch>255)
        throw new IllegalCharacterException("Unknown character got for encoding");
      frequencies[ch][1]++;
    }

    // Build previously Huffman queue. Each element in the queue is a binary
    // tree, that initially contains only a root node with no sub-trees.
    for (int i=0; i<knownCharsCount; i++)
    {
      if (frequencies[i][1]>0) // If character appears.
      {
        HuffmanNodeInfo nodeInfo = new HuffmanNodeInfo(frequencies[i][0],
                                                        frequencies[i][1]);
        BinaryTree newHuffmanQueueElem = new BinaryTree(nodeInfo);
        HuffmanPriorQueue.add(newHuffmanQueueElem);
      }
    }

    leafsCount = HuffmanPriorQueue.size();
    // Rebuild the heap, until there will be only one element in it.
    while (HuffmanPriorQueue.size()>1)
    {
      HuffmanNodeInfo nodeInfo = new HuffmanNodeInfo(-1, 0);
      BinaryTree left = (BinaryTree)HuffmanPriorQueue.remove();
      BinaryTree right = (BinaryTree)HuffmanPriorQueue.remove();
      if (left!=null)
        nodeInfo.raiseFrequency(((HuffmanNodeInfo)(left.getInfo())).getFrequency());
      if (right!=null)
        nodeInfo.raiseFrequency(((HuffmanNodeInfo)(right.getInfo())).getFrequency());
      BinaryTree newHuffmanQueueElem = new BinaryTree(nodeInfo, left, right);
      HuffmanPriorQueue.add(newHuffmanQueueElem);
    }
    // Now the Huffman tree is the single element in the queue.
    root = (BinaryTree)HuffmanPriorQueue.remove();
    infoFile.close();
  }

  /**
   * Show the Huffman binary tree.
   */
  public void ShowHuffmanTree()
  {
    System.out.println("Current Huffman Tree is :");
    root.showTree();
  }

  /**
   * Get the root of the Huffman binary tree.
   * @return Root of Huffman binary tree.
   */
  public BinaryTree getRoot()
  {
    return root;
  }

  /**
   * Return the count of leafs in the Huffman tree which represents the number
   * of different characters in the file to be encoded.
   * @return The number of leafs in the tree, 0 if the tree is empty.
   */
  public int getLeafsCount()
  {
    return leafsCount;
  }
}
