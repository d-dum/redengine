module redengine.interfaces.irenderable;

interface IRenderable
{
	uint getVAOId();
	uint getTextureId();
	ulong getVertexCount();
	bool getHaveTexture();
}