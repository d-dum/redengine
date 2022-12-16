module redengine.interfaces.irenderable;

import bindbc.opengl : GLuint, GLint;

interface IRenderable
{
	GLuint getVAOId();
	GLuint getTextureId();
	GLint getVertexCount();
	bool getHaveTexture();
}