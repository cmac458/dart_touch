part of dart_touch;

Element _dragSourceEl;
Element _dropTarget;

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
      dropTarget.classes.remove('over');
    }
  }
  
  void _onTouchStart(TouchEvent event){
    event.preventDefault();
    Element dragTarget = event.target;
    dragTarget.classes.add('moving');
    _dragSourceEl = dragTarget;

  }
  
  void _onTouchEnd(TouchEvent event){
    event.preventDefault();
    
    Element dragTarget = event.target;
    dragTarget.classes.remove('moving');
    var cols = document.queryAll('#columns .column');
    for (var col in cols) {
      col.classes.remove('over');
    }
    
    DivElement dragSource = event.currentTarget;
    var idsrc = dragSource.id;
    
    var targetHTML = dragSource.innerHTML;
    dragSource.innerHTML = _dropTarget.innerHTML;
    _dropTarget.innerHTML = targetHTML;
    
    dragSource.classes.remove('over');

  }
  
  void _onTouchMove(TouchEvent event){
    _dragSourceEl.classes.add('moving');
    event.preventDefault();
    Element dropTarget = event.target;
    dropTarget.classes.add('over');
    _dropTarget = document.elementFromPoint(event.touches[0].pageX,event.touches[0].pageY);
   
  }
  
  void _onTouchLeave(TouchEvent event){
    event.preventDefault();
    event.stopImmediatePropagation();
    _dropTarget.classes.remove('over');
   
  }
  