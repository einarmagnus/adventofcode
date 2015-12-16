"NOT thread safe!"
shared class DoubleLinkedList<T>() satisfies Iterable<T, Null>{
	class Entry<T>(prev, next, item) {
		shared variable Entry<T>? prev;
		shared variable Entry<T>? next;
		shared T item;
	}
	
	
	variable Entry<T>? _head = null;
	variable Entry<T>? _tail = null;
	
	
	shared void insertFirst(T item) {
		if (exists oldHead = _head) {
			_head = Entry(null, oldHead, item);
			oldHead.prev = _head;
		} else {
			_head = _tail = Entry(null, null, item);
		}
	}
	
	shared void insertLast(T item) {
		if (exists tail = _tail) {
			tail.next = Entry(tail, null, item);
			_tail = tail.next;
		} else {
			insertFirst(item);
		}
	}
	shared void add(T item) => insertLast(item);
	
	class ForwardIterator<T>(current) satisfies Iterator<T> {
		variable Entry<T>? current;
		shared actual T|Finished next() {
			if (exists entry = current) {
				value retVal = entry.item;
				current = entry.next;
				return retVal;
			} else {
				return finished;
			}
		}
	}
	class BackwardIterator<T>(current) satisfies Iterator<T> {
		variable Entry<T>? current;
		shared actual T|Finished next() {
			if (exists entry = current) {
				value retVal = entry.item;
				current = entry.prev;
				return retVal;
			} else {
				return finished;
			}
		}
	}
	shared actual Iterator<T> iterator() => ForwardIterator(_head);
	shared Iterator<T> backwardsIterator() => BackwardIterator(_tail);
	
	
}
