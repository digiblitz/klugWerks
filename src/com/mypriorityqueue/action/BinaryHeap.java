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
 * A heap which is one of most commons implementations of priority queue.
 */
public class BinaryHeap implements PriorityQueue
{
  private static final int DEF_HEAP_SIZE = 100; // The default binary heap size.
  // In order not to perform resize a lot of times, we resize in couple of
  // elements each time.
  private static final int RESIZE_TO_ELEMENTS_NUM = 5;
  private int lastNodeInd; // The index of the last node in the heap.
  private Comparable []heapArray; // Array represents the heap.

  /**
   * Default constructor, allocates a heaSize sized binary heap
   * @param heapSize The size of new heap.
   */
  public BinaryHeap(int heapSize)
  {
    lastNodeInd = -1; // -1 represents that the heap is empty
    heapArray = new Comparable[heapSize];
  }

  /**
   *  Default constructor, allocates a DEF_HEAP_SIZE sized binary heap.
   */
  public BinaryHeap()
  {
    // If the heap generated without specify a size, the default size will be
    // used.
    this(DEF_HEAP_SIZE);
  }

  /**
   * Add a value to the heap. If the heap is full, appropriate exception
   * is throwed.
   * @param value - The value to be added.
   */
  public void add(Comparable value)
  {
    if (isFull()) // If the queue is full, resize it.
      resize();

    int newNodeInd = ++lastNodeInd + 1;
    for (; newNodeInd>1 && value.compareTo(heapArray[newNodeInd / 2 - 1])<0;
         newNodeInd /= 2)
    {
      heapArray[newNodeInd - 1] = heapArray[newNodeInd / 2 -1];
    }
    heapArray[newNodeInd - 1] = value;
  }

  /**
   * Resize the current heap, since it's full by add RESIZE_TO_ELEMENTS_NUM.
   */
  private void resize()
  {
    Comparable []newHeapArray = new Comparable[size()+RESIZE_TO_ELEMENTS_NUM];
    for (int i=0; i<=lastNodeInd; i++)
      newHeapArray[i] = heapArray[i];
    heapArray = newHeapArray;
  }

  /**
   * Returns the minimum value from the heap.
   * @return The minimum value in the heap.
   */
  public java.lang.Comparable remove()
  {
    // Since applications can use the null returned value to be a stop condition
    // in the loops or checks, it's preffered not to throw an exception here.
    if (isEmpty())
      return null;  // If the heap is empty, there is nothing to return.

    // Since the heap always contains the minimum valued node (the node
    // with the highest priority) of the heap, in the root, we should remove it.
    // Then we should rebuid the heap in order to get it's new minimum valued
    // node to be a root.
    java.lang.Comparable minVal = heapArray[0];
    heapArray[0] = heapArray[lastNodeInd--];
    rebuildHeap(0);
    return minVal;
  }

  /**
   * Rebuild the heap after a root node was removed in the heap.
   * When the node is removed from the heap, a heap is rebalanced starting
   * from that node, and it's minimum valued child (the child with a highest
   * priority) takes it's place. The priority is considered by compareTo method
   * implemented in node instance.
   * @param nodeInd The removed index node, from which the heap should
   *        be rebalanced.
   */
  protected void rebuildHeap(int nodeInd)
  {
    int childNodeInd = nodeInd * 2 + 1; // next node which should be rebalanced.
    java.lang.Comparable tmpNode = heapArray[nodeInd];

    for (; childNodeInd<(lastNodeInd + 1); nodeInd = childNodeInd,
         childNodeInd = nodeInd * 2 + 1)
    {
      // First get the smaller child node to be checked
      if (childNodeInd!=lastNodeInd
          && heapArray[childNodeInd].compareTo(heapArray[childNodeInd+1])>0)
      {
        childNodeInd++;
      }
      // If the child is smaller then a node, make him to be a node, else
      // we have a new balanced heap.
      if (heapArray[childNodeInd].compareTo(tmpNode)<0)
        heapArray[nodeInd] = heapArray[childNodeInd];
      else
        break;
    }
    heapArray[nodeInd] = tmpNode;
  }

  /**
   * Remove all the nodes from the queue.
   */
  public void clear()
  {
    while (!isEmpty())
      remove();
  }

  /**
   * Fetch lowest value (highest priority) item from the queue.
   * @return The smallest value from the queue if the queue is not empty, null
   *         otherwise.
   */
  public java.lang.Comparable getFirst()
  {
    // Since applications can use the null returned value to be a stop condition
    // in the loops or checks, it's preffered not to throw an exception here.
    if (isEmpty())
      return null; // If the heap is empty, there is nothing to return.
    return heapArray[0];
  }


  /**
   * Determine if the heap is empty.
   * @return True if the heap is empty, false otherwise.
   */
  public boolean isEmpty()
  {
    return lastNodeInd == -1;
  }

  /**
   * Determine if the heap is full.
   * @return True is the heap is full, false otherwise.
   */
  public boolean isFull()
  {
    return lastNodeInd == heapArray.length-1;
  }

  /**
   * Determine the size of the queue.
   * @return The number if nodes within the heap.
   */
  public int size()
  {
    return lastNodeInd+1;
  }

  /**
   * Get the index of the value if present in the queue.
   * @return The index in the queue if present, -1 else.
   */
  public int getIndexOf(Comparable value)
  {
    for (int i=0; i<=lastNodeInd; i++)
    {
      if (heapArray[i].equals(value))
        return i;
    }
    return -1;
  }
}
