module redengine.core.game_objects.mesh_object;

import glfw3.api;
import bindbc.opengl;

import redengine.misc.vertex;

import redengine.interfaces.irenderable;

class MeshObject : IRenderable
{
private:
	// Data needed for rendering
	GLuint vaoId;
	GLint vertexCount;
	bool haveTexture = false;
	GLuint textureId;

	// Data not needed for rendering, need it for cleanup
    GLuint vboID;
    GLuint eboID;
    GLuint tboID;

    void initialize(Vertex[] vertices, ushort[] indices)
    {
		// Upload data to gpu
		this.vertexCount = cast(GLint)indices.length;
		glGenBuffers(1, &vboID);
		glBindBuffer(GL_ARRAY_BUFFER, vboID);
		glBufferData(GL_ARRAY_BUFFER, Vertex.sizeof * vertices.length, vertices.ptr, GL_STATIC_DRAW);

		// Describe layout of data for the shader program
		glGenVertexArrays(1, &vaoId);
		glBindVertexArray(vaoId);

		glEnableVertexAttribArray(0);
		glVertexAttribPointer(
            /*location*/ 0, /*num elements*/ 3, /*base type*/ GL_FLOAT, /*normalized*/ GL_FALSE,
            Vertex.sizeof, cast(void*) Vertex.positions.offsetof
        );
        glEnableVertexAttribArray(1);
        glVertexAttribPointer(
            /*location*/ 1, /*num elements*/ 2, /*base type*/ GL_FLOAT, /*normalized*/ GL_FALSE,
            Vertex.sizeof, cast(void*) Vertex.uv.offsetof
        );

        glGenBuffers(1, &eboID);
        glBindBuffer(GL_ELEMENT_ARRAY_BUFFER, eboID);
        glBufferData(GL_ELEMENT_ARRAY_BUFFER, ushort.sizeof * indices.length, indices.ptr, GL_STATIC_DRAW);

        glBindBuffer(GL_ARRAY_BUFFER, 0);
        glBindBuffer(GL_ARRAY_BUFFER, 0);
        glDisableVertexAttribArray(0);
        glDisableVertexAttribArray(1);
    }

public:

	this(Vertex[] vertices, ushort[] indices)
	{
		this.initialize(vertices, indices);
	}

	~this()
	{
		glDeleteVertexArrays(1, &this.vaoId);
		glDeleteBuffers(1, &this.vboID);
		glDeleteBuffers(1, &this.eboID);
	}
	

	GLuint getVAOId()
	{
		return this.vaoId;		
	}
	
	GLuint getTextureId()
	{
		return this.textureId;
	}
	
	GLint getVertexCount()
	{
		return this.vertexCount;
	}

	bool getHaveTexture()
	{
		return this.haveTexture;
	}
}