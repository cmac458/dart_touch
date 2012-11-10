import 'dart:html';

part 'dndEvents.dart';

#library('dart_touch');

class dart_touch {
  
  setDragNDropDefault(Element el){
    el.on.dragStart.add(_onDragStart);
    el.on.dragEnd.add(_onDragEnd);
    el.on.dragEnter.add(_onDragEnter);
    el.on.dragOver.add(_onDragOver);
    el.on.dragLeave.add(_onDragLeave);
    el.on.drop.add(_onDrop);
  }
  
  setDragNDropTouch(Element el){
  
  }
  
}

void main(){}