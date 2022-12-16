module redengine.core.game_objects.mesh_object;

import glfw3.api;
import bindbc.opengl;

import redengine.misc.vertex;

import redengine.interfaces.irenderable;

class MeshObject : IRenderable
{
private:
	// Data needed for rendering
	uint vaoId;
	ulong vertexCount;
	bool haveTexture = false;
	uint textureId;

	// Data not needed for rendering, need it for cleanup
    uint vboID;
    uint eboID;
    uint tboID;

public:

	this()
	{

	}

	~this()
	{
		
	}
	

	uint getVAOId()
	{
		return this.vaoId;		
	}
	
	uint getTextureId()
	{
		return this.textureId;
	}
	
	ulong getVertexCount()
	{
		return this.vertexCount;
	}

	bool getHaveTexture()
	{
		return this.haveTexture;
	}
}