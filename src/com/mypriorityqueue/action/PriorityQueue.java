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
package com.mypriorityqueue.action;

/**
 * Title: MyPriorityQueue
 * Description: Priority Queue interface implementation, first implemented in
 *  second exercise, and now separated to independent package since shall be
 *  used in other exercises.
 * @author Pigovat Alexander
 * @version 1.0
 */

/**
 * A priority queue interface, defines the functionality that should be implemented.
 */
public interface PriorityQueue
{
  /** Add a value to the priority queue.
   * @param value - The value to be added.
   */
  public void add(java.lang.Comparable value);

  /** Returns the minimum value from the queue.
   * @return The minimum value in the queue.
   */
  public java.lang.Comparable remove();

  /** Remove all the elements from the queue.
   */
  public void clear();

  /** Fetch lowest value (highest priority) item from the queue.
   * @return The smallest value from the queue.
   */
  public java.lang.Comparable getFirst();

  /** Determine if the queue is empty.
   * @return True if the queue is empty.
   */
  public boolean isEmpty();

  /** Determine the size of the queue.
   * @return The number if elements within the queue.
   */
  public int size();
}
