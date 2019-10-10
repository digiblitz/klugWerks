/*******************************************************************************
 * Copyright: 2019 digiBlitz Foundation
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
 * Description: Huffman coding algorithm implementation - the  4-th exercise of
 * Algorithm Programming 1 course. The program allows to encode/decode files.
 * @author Pigovat Alexander
 * @version 1.0
 */

/**
 * The exceptions of illegal character got. May be dropped when such character
 * is got in the file.
 */
public class IllegalCharacterException extends Exception
{
  /**
   * Default constructor.
   */
  public IllegalCharacterException()
  {
    super("Illegal character got");
  }

  /**
   * Constructor that generates an exceptions with a message.
   * @param msg Message to drop in exception.
   */
  public IllegalCharacterException(String msg)
  {
    super(msg);
  }
}
