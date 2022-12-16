module redengine.interfaces.irenderable;

import bindbc.opengl : GLuint;

interface IRenderable
{
	GLuint getVAOId();
	GLuint getTextureId();
	ulong getVertexCount();
	bool getHaveTexture();
}