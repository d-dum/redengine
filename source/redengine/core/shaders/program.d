module redengine.core.shaders.program;

import redengine.core.shaders.shader;
import redengine.interfaces.ishader;
import redengine.interfaces.iprogram;

import bindbc.opengl;

class ShaderProgram : IProgram {
private:
    uint programId;
    IShader* shaders;
    int shaderArrayLength;

public:
    this(IShader* shaders, uint shaderArrayLength){
        this.programId = glCreateProgram();
        for(int i = 0; i < shaderArrayLength; i++){
            glAttachShader(this.programId, shaders[i].getShaderId());
        }
        glLinkProgram(this.programId);
        GLint linked;
		glGetProgramiv(this.programId, GL_LINK_STATUS, &linked);
		if (!linked)
			throw new Exception("Failed to link shader: ");
    }

    ~this(){
        for(int i = 0; i < shaderArrayLength; i++){
            glDetachShader(this.programId, shaders[i].getShaderId());
            glDeleteShader(shaders[i].getShaderId());
        }
        glDeleteProgram(this.programId);
    }

    void start(){
        glUseProgram(this.programId);
    }

    void stop(){
        glUseProgram(0);
    }

    uint getProgram(){
        return this.programId;
    }
}