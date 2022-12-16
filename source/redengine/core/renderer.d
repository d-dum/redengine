module redengine.core.renderer;

import redengine.interfaces.irenderer;
import redengine.interfaces.irenderable;

import glfw3.api;
import bindbc.opengl;

class Renderer : IRenderer
{
private:
	float fov, nearPlane, farPlane;
	int width, height;

public:
	this(float FOV, float nearPlane, float farPlane)
	{
		
	}


	void render(IRenderable obj)
	{
		glBindVertexArray(obj.getVAOId());
		glEnableVertexAttribArray(1);
		glEnableVertexAttribArray(0);
		glDrawElements(GL_TRIANGLES, obj.getVertexCount(), GL_UNSIGNED_SHORT, null);
		glDisableVertexAttribArray(0);
        glDisableVertexAttribArray(1);
        glBindVertexArray(0);
	}
}