from heapq import heappush, heappop

class ListNode:
    def __init__(self, val=0, next=None):
        self.val = val
        self.next = next

def mergeKLists(lists):
    heap = []
    
    for i, node in enumerate(lists):
        if node:
            heappush(heap, (node.val, i, node))
    
    dummy = ListNode(0)
    curr = dummy
    
    while heap:
        val, i, node = heappop(heap)
        curr.next = node
        curr = curr.next
        
        if node.next:
            heappush(heap, (node.next.val, i, node.next))
    
    return dummy.next
