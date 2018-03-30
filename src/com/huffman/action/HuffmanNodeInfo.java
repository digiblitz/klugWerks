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
 * Description: Huffman coding algorithm implementation - the  4-th exercise
 * of Algorithm Programming 1 course. The program allows to encode/decode files.
 * @author Pigovat Alexander
 * @version 1.0
 */

/**
 * The node info of the Huffman Tree nodes.
 */
public class HuffmanNodeInfo implements Comparable
{
  protected int ch; // The character of the node
  protected int frequency; // Frequency of the character in the tree, -1 if none.

  /**
   * Default constructor, generate an empty node info.
   */
  public HuffmanNodeInfo()
  {
    this(0, -1);
  }

  /**
   * Generate new node info for character with specified frequency.
   */
  public HuffmanNodeInfo(int ch, int frequency)
  {
    this.ch = ch;
    this.frequency = frequency;
  }

  /**
   * Get the character frequency.
   * @return Frequency of the character.
   */
  public int getFrequency()
  {
    return frequency;
  }

  /**
   * Raise the frequency value by the value given.
   * @param toRaise The value to raise the frequency to.
   */
  public void raiseFrequency(int toRaise)
  {
    frequency += toRaise;
  }

  /**
   * Compare two huffman nodes by their frequencies.
   * @return Value less than, equal to or bigger than zero whether frequency
   *         is smaller, equal to or bigger to the checked object frequency.
   */
  public int compareTo(Object o)
  {
    if (o instanceof HuffmanNodeInfo)
      return (frequency-((HuffmanNodeInfo)o).frequency);
    return -1;
  }

  /**
   * Represent a Huffman node.
   * @return String that represents a Huffman node.
   */
  public String toString()
  {
    String nodeStr = "[ " + (ch!=-1 ? (ch  + " : ") : "") + frequency + " ]";
    return nodeStr;
  }

  /**
   * Get the character from the Huffman info node.
   * @return Character info node value if contains, -1 else.
   */
  public int getChar()
  {
    return ch;
  }
}
