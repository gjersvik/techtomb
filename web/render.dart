library render;

import 'dart:html';
import 'dart:math';

class Render{
  CanvasElement element;
  CanvasRenderingContext2D context;
  
  Render(tag){
    var size = min(window.innerHeight,window.innerWidth);
    element = query(tag);
    context = element.getContext('2d');
    
    element.height = size;
    element.width = size;
    
    context.scale(size / 100, size / 100);
  }
}
