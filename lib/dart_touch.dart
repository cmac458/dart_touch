library dart_touch;

import 'dart:html';

part 'dndEvents.dart';

  setDragNDropDefault(Element el){
    el.on.dragStart.add(_onDragStart);
    el.on.dragEnd.add(_onDragEnd);
    el.on.dragEnter.add(_onDragEnter);
    el.on.dragOver.add(_onDragOver);
    el.on.dragLeave.add(_onDragLeave);
    el.on.drop.add(_onDrop);
  }
  
  setDragNDropTouch(Element el){
    el.on.dragStart.add(_onDragStart);
    el.on.dragEnd.add(_onDragEnd);
    el.on.dragEnter.add(_onDragEnter);
    el.on.dragOver.add(_onDragOver);
    el.on.dragLeave.add(_onDragLeave);
    el.on.drop.add(_onDrop);
    
    
    el.on.touchStart.add(_onTouchStart);
    el.on.touchMove.add(_onTouchMove);
    el.on.touchEnd.add(_onTouchEnd);
    el.on.touchLeave.add(_onTouchLeave);
  }
  


