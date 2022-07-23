import std.stdio;

import redengine;

void main()
{
	auto window = new Window(800, 600, "Day");
	while(!window.isCloseRequested()){
		
		window.update();
	}
}
