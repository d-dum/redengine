import std.stdio;

import redengine;
import bindbc.opengl;
void main()
{
	auto window = new Window(800, 600, "Day");

	auto vert = new Shader(GL_VERTEX_SHADER, "shaders/vert.glsl");
	auto frag = new Shader(GL_FRAGMENT_SHADER, "shaders/frag.glsl");
	IShader[2] shaders;
	shaders[0] = vert;
	shaders[1] = frag;
	auto program = new ShaderProgram(shaders.ptr, shaders.length);

	while(!window.isCloseRequested()){

		program.start();

		program.stop();
		
		window.update();
	}
}
