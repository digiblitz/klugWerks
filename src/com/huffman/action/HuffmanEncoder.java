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

import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.BufferedReader;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.File;

import java.util.StringTokenizer;

import org.jboss.wsf.framework.deployment.ContextRootDeploymentAspect;

import com.binarytree.action.*;

/**
 * Encoder and decoder for files using Huffman compression algorithm.
 */
public class HuffmanEncoder
{

  private int [] chars; // Characters to be encoded/decoded.
  private StringBuffer [] codes; // Codes for characters to be encoded/decoded.

  private HuffmanTree inHuffTree; // Huffman tree for input file to be encoded
  private int codesTableSize = 0; // The last index of the codes table represents
                                // by the codes array.

  private String srcFileName, srcFilePath, destFileName; // Source and destination file for
                                            // encode/decode
  private long srcFileSize, destFileSize; // for statistics usage.

  /**
   * Constructor.
   * @param srcFileName Source file name to be encoded/decoded.
   * @param srcFilePath The full path to the filename (include the filename) to
   *                    be encoded.
   */
  public HuffmanEncoder(String  srcFileName, String srcFilePath)
  {
     inHuffTree = null;
     this.srcFilePath = srcFilePath;
     this.srcFileName = srcFileName;
     this.destFileName = null;
     srcFileSize = 0;
     destFileSize = 0;
  }

  /**
   * Perform encode of the source file and put new encoded file to destination
   * file.
   */
  // Let the method throw all it's exceptions to the caller.
  public void encodeFile() throws Exception
  {
    generateEncodingCodes();
    encode();
  }

  /**
   * Generate a Huffman codes for the given file for encoding, using Huffman
   * binary tree build algorithm.
   * @param encodeFileName File name to be encoded.
   */
  // Let the method throw all it's exceptions to the caller.
  private void generateEncodingCodes() throws Exception
  {
    inHuffTree = new HuffmanTree();
    inHuffTree.buildTreeForFile(srcFilePath);

    chars = new int[inHuffTree.getLeafsCount()];
    codes = new StringBuffer[inHuffTree.getLeafsCount()];
    fillCodesFromTree(inHuffTree.getRoot(), "");
  }

  /**
   * Fill the codes for characters encoding generated from Huffman tree. The
   * method is reqursive.
   * @param HuffmanBinTreeRoot the root of huffman tree the codes should be
   *        generated from.
   * @param currentCode the current code we should start from - it's prefix.
   */
  private void fillCodesFromTree(BinaryTree HuffmanBinTreeRoot, String currentCode)
  {
    if (((HuffmanNodeInfo)(HuffmanBinTreeRoot.getInfo())).getChar()==-1)
    {
      fillCodesFromTree(HuffmanBinTreeRoot.getLeft(), currentCode + "0");
      fillCodesFromTree(HuffmanBinTreeRoot.getRight(), currentCode + "1");
    }
    else
    {
      chars[codesTableSize] = ((HuffmanNodeInfo)(HuffmanBinTreeRoot.getInfo())).getChar();
      codes[codesTableSize] = new StringBuffer(currentCode);
      codesTableSize++;
    }
  }

  /**
   * Encode the file content according to the codes generated from Huffman tree.
   */
  // Let the method throw all it's exceptions to the caller.
  private void encode() throws Exception
  {
    FileReader srcFileReader = new FileReader(srcFilePath);

    // Enter the encoded string to temporary buffer before writing it to
    // destination file.
    StringBuffer encodedBuf = new StringBuffer();

    // In that stage we can be sure that the file contents only the characters
    // that can be encoded. So there is no need to check it again.
    while (srcFileReader.ready())
    {
      int ch = srcFileReader.read();
      int chInd = getCodeInd(ch);

      if (chInd==-1)
        throw new IllegalCharacterException();
      encodedBuf.append(codes[chInd]);
      srcFileSize++;
    }
    srcFileReader.close();

    // Perform the bits vector to write to the file according to the codes. The
    // vector will be construct from bytes array. If the number of bit's to be
    // written (actually the long of the encodedBuf) will not be exactly
    // appropriate bytes number length, additional byte will be allocated and
    // the amount of them will be stored. Lefted bits will be shofted left, and
    // the rest of bits in the byte will be unset (set to zero).
    int sizeInBytes = (int)Math.ceil(encodedBuf.length() / 7.0);
    short restBits = (short)(encodedBuf.length() % 7);

    byte []bitsVector = new byte[sizeInBytes];

    // If there are rest bits, fill the encodedBuf space to zeros.
    if (restBits > 0)
    {
      for (short j=restBits; j<7; j++)
        encodedBuf.append('0');
    }

    // Generate the encoded bits vector.
    for (int i=0; i<sizeInBytes; i++)
      bitsVector[i] = Byte.parseByte(encodedBuf.toString().substring(7*i, 7*(i+1)), 2);

    // Write new encoded file.
    writeToEncodeFile(sizeInBytes, restBits, bitsVector);
  }

  /**
   * Write the encoded content of bits vector that represents the new encoded data
   * to the destination file. File will contain the destination file name, the
   * codes table for decoding and the data of the bits vector.
   * @param sizeInBytes The size in bytes of the bits vector data to be written
   * @param restBits The number of bits in the last byte in the vector which may
   *        be not full at the end.
   * @param bitsVector The vector of bits to be written.
   */
  // Let the method throw all it's exceptions to the caller.
  private void writeToEncodeFile(int sizeInBytes, int restBits,
                                 byte []bitsVector) throws Exception
  {
	  destFileName = getEncodeDestFileName();
	    File filedir = new File("c://ArtifactDocuments//");
	    if(!filedir.exists()){
	    filedir.mkdir();
	    }
	    File file = new File(filedir, destFileName);
	    
	  
	    ObjectOutputStream destStream =
	       new ObjectOutputStream(new FileOutputStream(file));
	    System.out.println("destFileName::::::::::::::"+destFileName);
	    String codesString = generateCodesString();
	   
	    destStream.writeObject(srcFileName);
	    destStream.writeInt(codesTableSize); // Save the number codes table elements.
	    // Save the codes elements string for decoding.
	    destStream.writeObject(codesString);
	    destStream.writeInt(sizeInBytes); // Save the size of bits vector.
	    destStream.writeShort(restBits);
	    destStream.write(bitsVector);
	    
	  
	    
	   
	    
	    // Save the bits vector.
	    destStream.close();
  }

  private String getEncodeDestFileName()
  {
    String newFileName =
      srcFileName.substring(0, srcFileName.lastIndexOf('.')).concat(".enc");
    System.out.println("newFileName:::::::::::::::"+newFileName);
    return newFileName;
  }

  /**
   * Decode the source file encoded using Huffman algorithm to destination file.
   * Destination file will be placed in the current directory.
   */
  // Let the method throw all it's exceptions to the caller.
  public void decodeFile() throws Exception
  {
    ObjectInputStream srcStream = new ObjectInputStream(new FileInputStream(srcFilePath));
    System.out.println("srcFilePath"+srcFilePath);

    destFileName = (String)srcStream.readObject();
    codesTableSize = srcStream.readInt();
    String codesString = (String)srcStream.readObject();

    // Generate codes for decoding.
    fillCodesFromString(codesString);

    // Generate a bits vector.
    int sizeInBytes = srcStream.readInt();
    short restBits = srcStream.readShort();
    byte []bitsVector = new byte[sizeInBytes];
    srcStream.readFully(bitsVector);

    StringBuffer decodedBuf = new StringBuffer();
    for (int i=0; i<sizeInBytes; i++)
    {
      String bitsStr = Integer.toBinaryString(bitsVector[i]);
      for (int j=bitsStr.length(); j<7; j++)
        decodedBuf.append('0');
      decodedBuf.append(bitsStr);
    }
    decodedBuf.setLength(decodedBuf.length() - (restBits==0 ? 0 : 7-restBits));

    FileWriter destFileWriter = new FileWriter(destFileName);
    while (decodedBuf.length()>0)
    {
      int i;
      for (i=0; i<codesTableSize; i++)
      {
        if (decodedBuf.toString().startsWith(codes[i].toString()))
        {
          destFileWriter.write(chars[i]);
          destFileWriter.flush();
          break;
        }
      }
      if (i==codesTableSize)
        throw new IllegalCharacterException("Illegal encoding found, cannot decode");
      decodedBuf = new StringBuffer(decodedBuf.substring(codes[i].length()));

    }
    destFileWriter.close();
  }

  /**
   * Generate the codes table from the string contains the codes for decoding.
   * @param codesString The string with decoding codes.
   */
  private void fillCodesFromString(String codesString)
  {
    chars = new int[codesTableSize];
    codes = new StringBuffer[codesTableSize];

    StringTokenizer codeElem = new StringTokenizer(codesString, "|");
    for (int i=0; codeElem.hasMoreTokens(); i++)
    {
      StringTokenizer codeChar = new StringTokenizer(codeElem.nextToken(), ":");
      chars[i] = Integer.decode(codeChar.nextToken().toString()).intValue();
      codes[i] = new StringBuffer(codeChar.nextToken().toString());
    }
  }

  /**
   * Get the character code index in the codes array.
   * @param codeChar The character whose code index should be returned.
   * @return The index of the character code if found, -1 else.
   */
  private int getCodeInd(int codeChar)
  {
    for (int i=0; i<codesTableSize; i++)
    {
      if (codeChar==chars[i])
        return i;
    }
    return -1;
  }

  /**
   * Generate the code string to be saved in the encoded file for decoding.
   * @return The codes string generated.
   */
  private String generateCodesString()
  {
    StringBuffer codesString = new StringBuffer();

    for (int i=0; i<codesTableSize; i++)
    {
      codesString.append(chars[i]);
      codesString.append(':');
      codesString.append(codes[i]);
      if (i<codesTableSize-1)
        codesString.append('|');
    }
    return codesString.toString();
  }

  /**
   * Show the encoding proportion statistics after encoding is done.
   */
  public String getEncodingProportionMsg()
  {
    srcFileSize = (new File(srcFilePath)).length();
    destFileSize = (new File(destFileName)).length();

    float earnedSize = (destFileSize / (float)srcFileSize) * 100;
    String proportionMsg = "Source file size : " + srcFileSize +
      "\nEncoded file size : " + destFileSize + "\nEncoded file is " +
      (int)earnedSize + "% size of source file";

    if (destFileSize > srcFileSize)
      proportionMsg += "\nEncoding was wastefull!!!";
    return proportionMsg;
  }
}
