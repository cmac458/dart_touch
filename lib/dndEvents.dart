part of dart_touch;

Element _dragSourceEl;
  
  void _onDragStart(MouseEvent event) {
    Element dragTarget = event.target;
    dragTarget.classes.add('moving');
    _dragSourceEl = dragTarget;
    event.dataTransfer.effectAllowed = 'move';
    event.dataTransfer.setData('text/html', dragTarget.innerHTML);
  }
  
  void _onDragEnd(MouseEvent event) {
    Element dragTarget = event.target;
    dragTarget.classes.remove('moving');
    var cols = document.queryAll('#columns .column');
    for (var col in cols) {
      col.classes.remove('over');
    }
  }
  
  void _onDragEnter(MouseEvent event) {
    Element dropTarget = event.target;
    dropTarget.classes.add('over');
  }
  
  void _onDragOver(MouseEvent event) {
    // This is necessary to allow us to drop.
    event.preventDefault();
    event.dataTransfer.dropEffect = 'move';
  }
  
  void _onDragLeave(MouseEvent event) {
    Element dropTarget = event.target;
    dropTarget.classes.remove('over');
  }
  

  void _onDrop(MouseEvent event) {
 
    // Don't do anything if dropping onto the same column we're dragging.
    Element dropTarget = event.target;
    if (_dragSourceEl != dropTarget) {
      // Set the source column's HTML to the HTML of the column we dropped on.
      _dragSourceEl.innerHTML = dropTarget.innerHTML;      
      dropTarget.innerHTML = event.dataTransfer.getData('text/html');
    }
  }
  