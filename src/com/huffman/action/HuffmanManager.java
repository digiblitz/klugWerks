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

import javax.swing.*;
import java.awt.*;
import java.awt.event.*;

import java.io.FileNotFoundException;
import java.io.File;


/**
 * Class allows to choose the files for encoding/decoding. Implements GUI
 * enviroment.
 */
public class HuffmanManager extends JFrame
{
  // Action flags.
  private final int ENCODE = 0;
  private final int DECODE = 1;
  private final int NONE = 2;

  private final int width = 600, height = 100, xPos = 300, yPos = 200;
  private Container contents;
  private JButton selectEnc, selectDec;

  private int actionType;
  private String selectedFileName, selectedFilePath;

  /**
   * Default constructor, generates and shows the main arhivator menu.
   */
  public HuffmanManager()
  {
      super("My Huffman Arhivator...");	
      System.out.println("inside the HuffmanManager() constructor::::::::::::::::::::::::::");


      actionType = NONE;
      selectedFileName = null;
      selectedFilePath = null;

//      contents = getContentPane();
//      contents.setLayout(new FlowLayout());
//      setSize(width,height);
//      setLocation(xPos, yPos);
//
//      JPanel buttonPanel = new JPanel();
//      //String htmlButton = "<html><sup>HTML</sup> <sub><em>Button</em></sub><br>"
//    	       // + "<font color=\"#FF0080\"><u>Multi-line</u></font>";
//     selectEnc = new JButton("Choose a File To Encode...");
//      selectDec = new JButton("Choose a File To Decode...");
//
////      SelectFileHandler fileHandler = new SelectFileHandler();
////      selectEnc.addActionListener(fileHandler);
////      selectDec.addActionListener(fileHandler);
//
//      buttonPanel.add(selectEnc);
//      buttonPanel.add(selectDec);
//      contents.add(buttonPanel);
//      show();
  }

  public void setFileNamePath(String filename, String filePath, int ENCODE){
	  
	  this.selectedFileName = filename;
	  this.selectedFilePath = filePath;
	  this.actionType = ENCODE;
	  System.out.println("selectedFileName in set method::::::::::::::::"+selectedFileName);
	  System.out.println("selectedFilePath in set method::::::::::::::::"+selectedFilePath);
	  System.out.println("actionType in set method::::::::::::::::"+actionType);
	  
  }
  public void displayFileChooser()
  {
      // Set up the dialog.
      final JFileChooser chooser = new JFileChooser();

      chooser.setCurrentDirectory(new File("."));

      // Only files may be selected.
      chooser.setFileSelectionMode(JFileChooser.FILES_ONLY);
      // Only allow single selections.
      chooser.setMultiSelectionEnabled(false);

      // Show the file chooser..
      if(chooser.showDialog(this,"Choose a File") == JFileChooser.APPROVE_OPTION)
      {
          File selectedFile = chooser.getSelectedFile();
          selectedFilePath = getSelectedFilePath();
          System.out.println("selectedFilePath   :"+selectedFilePath);
          selectedFileName = getSelectedFileName();
          performAction(); // perform choosed action.
      }
      else
        actionType = NONE;
  }

  /**
   * Get the action type choosen to be done - encode or decode.
   * @return Action type choosen to be done (ENCODE/DECODE), NONE if no action
   *         was choosed.
   */
  public int getActionType()
  {
    return actionType;
  }

  /**
   * Get the file name choosed for action to be done on it.
   * @return File name that was choosed.
   */
  public String getSelectedFileName()
  {
    return selectedFileName;
  }

  /**
   * Get the file full path choosed for action to be done on it.
   * @return File full path that was choosed.
   */
  public String getSelectedFilePath()
  {
    return selectedFilePath;
  }

  /**
   * Inner class for event handling/
   */
  private class SelectFileHandler implements ActionListener
  {
    public void actionPerformed(ActionEvent e)
    {
      if (e.getSource()==selectEnc)
      {
        actionType = ENCODE;
        displayFileChooser();
      }
      else if (e.getSource()==selectDec)
      {
        actionType = DECODE;
        displayFileChooser();
      }
    }
  }

  /**
   * Perform the action according to the actionType flag (ENCODE/DECODE)
   */
  public void performAction()
  {
	  System.out.println("selectedFileName::::::::inside performaction()");
    if (actionType==NONE)
      return;

    HuffmanEncoder encoder = new HuffmanEncoder(selectedFileName, selectedFilePath);
    System.out.println("selectedFileName::::::::inside performaction()::::::"+selectedFileName);
    System.out.println("selectedFilePath::::::::inside performaction()::::::"+selectedFilePath);
    try
    {
      if (actionType==ENCODE)
      {
        encoder.encodeFile();
        showMsg(encoder.getEncodingProportionMsg());
      }
      else if (actionType==DECODE)
      {
        encoder.decodeFile();
        showMsg("Decoding done.");
      }
    }
    catch(IllegalCharacterException chExcp)
    {
      showMsg("File cannot be generated : " + chExcp.getMessage());
    }
    catch(FileNotFoundException fExcp)
    {
      showMsg("Cannot open file : " + fExcp.getMessage());
    }
    catch(Exception anyExcp)
    {
      showMsg("Cannot perform the operation : " + anyExcp.getMessage());
    }
  }

  /**
   * Show message in dialog box.
   * @param Msg Message to show.
   */
  private void showMsg(String Msg)
  {
    JOptionPane.showMessageDialog(null, Msg, (actionType==ENCODE ?
      "Huffman Encoder..." : "Huffman Decoder..."),
      JOptionPane.INFORMATION_MESSAGE);
  }

  //public static void main(String args[])
  //{
   // HuffmanManager testHuffManager = new HuffmanManager();

   // testHuffManager.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
 // }
}
